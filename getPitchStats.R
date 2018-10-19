library(tuneR) # We'll be using tuneR to do audio reading and writing

# Set working directory to the one containing this script
setwd('/Users/awarlau/Google Drive/Work/GitRepos/WWScripts/')

# Load in metadata about the 5 min. sample annotations
fivemin_info = read.csv("fivemin_info.csv")

# Initialize data frame that will have info. about each adult utterance in the dataset
adultUttInfo = data.frame(
                          InfantID = character(),
                          startsec = numeric(),
                          endsec = numeric(),
                          addressee = character(),
                          intensity = numeric(),
                          meanf0Hz = numeric(),
                          meanf0mel = numeric(),
                          stdf0mel = numeric()
                          )

# Get the utterance data out of the annotation txt files and into adultUttInfo
for (fiveminnum in 1:nrow(fivemin_info)){
  
  # Path and name of the txt file containing listener annotations exported from ELAN
  txtfile = paste("/Users/awarlau/Documents/Box Sync/Gina/WWtxtFiles/",toString(fivemin_info$TxtFileName[fiveminnum]),sep="")
  
  # Read the annotations in from the txt file
  annotations = read.table(txtfile,sep="\t",quote="",header=TRUE,col.names=c("start","end","InfIPA","AdultIPA","ortho","dir"),colClasses = c("numeric", "numeric", "character", "character","character", "character"))
  
  # Delete irrelevant columns
  annotations = subset(annotations, select = c(start,end,dir))
  
  # Create a data frame containing only the adult which utterances
  annotations = subset(annotations,dir!="")
  
  # Add these data to adultUttInfo
  if (nrow(annotations) > 0){
    for (uttnum in 1:nrow(annotations)){
      newRow = data.frame(
                          InfantID = fivemin_info$InfantID[fiveminnum],
                          startsec = annotations$start[uttnum],
                          endsec = annotations$end[uttnum],
                          addressee = annotations$dir[uttnum],
                          intensity = NA,
                          meanf0Hz = NA,
                          meanf0mel = NA,
                          stdf0mel = NA
                          )
      adultUttInfo = rbind(adultUttInfo,newRow)
    }
  }
  
}


for (uttnum in 1:nrow(adultUttInfo)){
  
  bigWavFile = paste("/Users/awarlau/Documents/Box Sync/Gina/WWwavFiles/",toString(adultUttInfo$InfantID[uttnum]),".wav",sep="")
  uttWav = readWave(bigWavFile, from = adultUttInfo$startsec[uttnum], to = adultUttInfo$endsec[uttnum], units = "seconds")
  uttWavFile = paste("/Users/awarlau/Documents/Box Sync/Gina/WWuttWavFiles/",toString(adultUttInfo$InfantID[uttnum]),"_",gsub("[.]","",toString(adultUttInfo$startsec[uttnum])),"_",toString(adultUttInfo$addressee[uttnum]),".wav",sep="")
  writeWave(uttWav,uttWavFile,extensible = FALSE)
  
  if (adultUttInfo$endsec[uttnum] - adultUttInfo$startsec[uttnum] < .05){
    adultUttInfo$intensity[uttnum] = NA
    adultUttInfo$meanf0Hz[uttnum] = NA
    adultUttInfo$meanf0mel[uttnum] = NA
    adultUttInfo$stdf0mel[uttnum] = NA
  } else{
    
    argstext = paste("--run getPitchStats.Praat \'",uttWavFile,"\'",sep="")
    praatOutput = system2('/Applications/Praat.app/Contents/MacOS/Praat',args = argstext,stdout = TRUE)
    splitPraatOutput = strsplit(praatOutput,split=",")
    
    if (splitPraatOutput[[1]][1]=="--undefined--"){
      adultUttInfo$intensity[uttnum] = NA
    } else{
      adultUttInfo$intensity[uttnum] = as.numeric(splitPraatOutput[[1]][1])
    }
    
    if (splitPraatOutput[[1]][2]=="--undefined--"){
      adultUttInfo$meanf0Hz[uttnum] = NA
    } else{
      adultUttInfo$meanf0Hz[uttnum] = as.numeric(splitPraatOutput[[1]][2])
    }
    
    if (splitPraatOutput[[1]][3]=="--undefined--"){
      adultUttInfo$meanf0mel[uttnum] = NA
    } else{
      adultUttInfo$meanf0mel[uttnum] = as.numeric(splitPraatOutput[[1]][3])
    }
    
    if (splitPraatOutput[[1]][4]=="--undefined--"){
      adultUttInfo$stdf0mel[uttnum] = NA
    } else{
      adultUttInfo$stdf0mel[uttnum] = as.numeric(splitPraatOutput[[1]][4])
    }
    
  }
  
}

write.csv(adultUttInfo,file="adultUttInfo.csv")

adultUttInfo = read.csv("adultUttInfo.csv")

library(lme4)
library(lmerTest)

sink("pitch_results.txt")

meanf0mel_test = lmer(meanf0mel ~ (1|InfantID) + addressee, dat = subset(adultUttInfo,addressee=="N"|addressee=="T"))
summary(meanf0mel_test)

stdf0mel_test = lmer(stdf0mel ~ (1|InfantID) + addressee, dat = subset(adultUttInfo,addressee=="N"|addressee=="T"))
summary(stdf0mel_test)

intensity_test = lmer(intensity ~ (1|InfantID) + addressee, dat = subset(adultUttInfo,addressee=="N"|addressee=="T"))
summary(intensity_test)

sink()