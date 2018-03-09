setwd("/Volumes/Research/WWTranscription/")
source("spkrcode.R")
metadata = read.csv("direction_analysis.csv")

for (fiveminnum in 1:60){
# for (fiveminnum in 1:nrow(metadata)){

	#setting the file called for annotations	
	annotations = spkrcode("/Volumes/Research/WWTranscription/WWtxtFiles", as.character(metadata$FileName[fiveminnum]))	

	#Set interval length
	int = 30

	#For loop for interval
	for (section in 1:(300/int)) {
		print(section)

		#collecting the subset
		intdata <- subset(annotations, start >= (metadata$ElapsedTime[fiveminnum] + ((section-1)*int)) & start < (metadata$ElapsedTime[fiveminnum] + (section*int)))
	
		#These are the counts I need
		Canon = length(which(intdata$SpkrCode=="C"))
		NonCanon =	length(which(intdata$SpkrCode=="X"))
		Reflex = length(which(intdata$SpkrCode=="R"))
		ToChld = length(which(intdata$SpkrCode=="T"))
		NotToChld = length(which(intdata$SpkrCode=="N"))
		Unknwn = length(which(intdata$SpkrCode=="U"))
		
		#Also, variables for dataframe
		InfantID = as.character(metadata$InfantID[fiveminnum])
		SegmentID = metadata$SegmentID[fiveminnum]
		FileName = as.character(metadata$FileName[fiveminnum])
		StartTime = metadata$ElapsedTime[fiveminnum]
		CDIR = metadata$CDI.R[fiveminnum]
		CDIP = metadata$CDI.P[fiveminnum]
		Locomotor = as.character(metadata$Locomotor[fiveminnum])
		
		#Write the first event to countdata
		##This worked for all columns!
		if (fiveminnum == 1 & section == 1) {
			countdata = data.frame(InfantID=InfantID,
						SegmentID=SegmentID,
						FileName=FileName,
						StartTime=StartTime,
						CDIR=CDIR,
						CDIP=CDIP,
						Locomotor=Locomotor,
						Canonical=Canon,
						NonCanonNonReflex=NonCanon,
						Reflexive=Reflex,
						ToChild=ToChld,
						NotToChild=NotToChld,
						Unknown=Unknwn,
						stringsAsFactors=FALSE)
		} else { 
			#Append remaining events to countdata
			countdata = rbind(countdata,c(InfantID,SegmentID,FileName,StartTime,CDIR,CDIP,Locomotor,Canon,NonCanon,Reflex,ToChld,NotToChld,Unknwn))
			
		}
	}
} 

#Write to CSV
write.csv(countdata, file = "/Volumes/Research/WWTranscription/countdata.csv")