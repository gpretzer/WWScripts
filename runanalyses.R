txtpath = "WWSegmentOutput"

source("spkrcode.R")
source("pauseoverlap.R")
source("sequenceevents.R")

# Set metadata for file names.
metadata = read.csv("fivemin_info.csv", header=T) 

# Set how long should be counted as a pause
for (pausedur in c(1,2,5)){
  
  # For loop to do the recoding and event sequencing for all 5 minute segments.
  for (fiveminnum in 1:nrow(metadata)){ 
    
    # Recode the child and adult vocalization transcriptions into single-character codes.
    annotations = spkrcode(txtpath,as.character(metadata$TxtFileName[fiveminnum]))
    
    # Turn the multi-speaker time series into a single event series, which requires dealing with pauses and overlaps.
    newannotations = pauseoverlap(annotations, pausedur)
    
    # Prepare metadata variables to be included in data frame for analysis.
    InfantID = as.character(metadata$InfantID[fiveminnum])
    SegmentID = metadata$SegmentID[fiveminnum]
    FileName = as.character(metadata$TxtFileName[fiveminnum])
    
    # Get the 2-event sequences for subsequent contingency analyses.
    sequencecodes = sequenceevents(newannotations, InfantID, SegmentID, FileName)
    
  }
  
  write.csv(sequencecodes, file = paste("sequencecodes",pausedur,"sec.csv",sep="")
  
}
