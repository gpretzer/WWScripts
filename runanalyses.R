#setwd("/Volumes/Research/WWTranscription/WWScripts")

#txtpath = "/Volumes/Research/WWTranscription/WWtxtFiles"
#outputpath = "/Volumes/Research/WWTranscription/BidirectionalContingencies/"
txtpath = "/Users/awarlau/Documents/Box Sync/Gina/WWtxtFiles/"

source("spkrcode.R")
source("pauseoverlap.R")
source("sequenceevents.R")

# Set metadata for file names.
metadata = read.csv("direction_analysis.csv", header=T) 

# Set how long should be counted as a pause
pausedur = 1

# For loop to do the recoding and event sequencing for all 5 minute segments.
for (fiveminnum in 1:nrow(metadata)){ 
	# Recode the child and adult vocalization transcriptions into single-character codes.
	annotations = spkrcode(txtpath,as.character(metadata$FileName[fiveminnum])) # ASW: Put the /Volumes/Research/WWTranscription/WWtxtFiles in a variable that's set at the top of the program, and indicate that users will need to set this to the correct path for their filesystem.	
	
	# Turn the multi-speaker time series into a single event series, which requires dealing with pauses and overlaps.
	newannotations = pauseoverlap(annotations, pausedur)
	
	# Prepare metadata variables to be included in data frame for analysis.
	InfantID = as.character(metadata$InfantID[fiveminnum])
	SegmentID = metadata$SegmentID[fiveminnum]
	FileName = as.character(metadata$FileName[fiveminnum])
	
	# Get the 2-event sequences for subsequent contingency analyses.
	sequencecodes = sequenceevents(newannotations, InfantID, SegmentID, FileName)
	
}

write.csv(sequencecodes, file = "sequencecodes1sec11302018.csv")

# write.csv(sequencecodes, file = "/Volumes/Research/WWTranscription/WWScripts/Regression/sequencecodes5secsplit12052017.csv")

# write.csv(sequencecodes, file = "/Volumes/Research/WWTranscription/BidirectionalContingencies/sequencecodes06192017.csv")

# write.csv(sequencecodes, file = paste(outputpath,"sequencecodes06152017.csv")) # ASW: It would be good to put the path in a variable that is set toward the top of this file and indicate that the user should set it to where they want their sequencecodes.csv to be written.

