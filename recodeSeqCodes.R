setwd("/Volumes/Research/WWTranscription/WWScripts/Regression/")
# setwd("/Users/ginapretzer/Desktop/WWScripts/Regression/")

### Read in csv ###
seqcodes <- read.csv("sequencecodes5sec.csv", header = TRUE)

### create new dataframe ###
eventcodes <- data.frame(InfantID=seqcodes$InfantID,
						 Event1=seqcodes$code1,
						 Event2=seqcodes$code2,
						 stringsAsFactors=FALSE)

						 
### set up new columns with variables based on Event 1 and 2 to go into new dataframe ###
eventcodes["Event1T"] <- rep(NA, times=nrow(eventcodes)) # what goes here? 
eventcodes["Event1N"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event1C"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event1X"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event1R"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event2T"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event2N"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event2C"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event2X"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event2R"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event1Adult"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event2Adult"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event1Infant"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event2Infant"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event1CvX"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event1RvX"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event1RvC"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event2CvX"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event2RvX"] <- rep(NA, times=nrow(eventcodes))
eventcodes["Event2RvC"] <- rep(NA, times=nrow(eventcodes))

### add data into new columns ###

for (i in 1:nrow(eventcodes)) {

	### Infant led; adult follow
	if (eventcodes$Event2[i] == "T") {
		eventcodes$Event2T[i] = 1 
	} else {eventcodes$Event2T[i] = 0}
	if (eventcodes$Event2[i] == "N") {
		eventcodes$Event2N[i] = 1
	} else {eventcodes$Event2N[i] = 0}
	if (eventcodes$Event1[i] == "C") {
		eventcodes$Event1C[i] = 1 
	} else {eventcodes$Event1C[i] = 0}
	if (eventcodes$Event1[i] == "X") {
		eventcodes$Event1X[i] = 1
	} else {eventcodes$Event1X[i] = 0}
	if (eventcodes$Event1[i] == "R") {
		eventcodes$Event1R[i] = 1
	} else {eventcodes$Event1R[i] = 0}
			
	### Adult led; infant follow
	if (eventcodes$Event1[i] == "T") {
		eventcodes$Event1T[i] = 1
	} else {eventcodes$Event1T[i] = 0}
	if (eventcodes$Event1[i] == "N") {
		eventcodes$Event1N[i] = 1
	} else {eventcodes$Event1N[i] = 0}
	if (eventcodes$Event2[i] == "C") {
		eventcodes$Event2C[i] = 1
	} else {eventcodes$Event2C[i] = 0}
	if (eventcodes$Event2[i] == "X") {
		eventcodes$Event2X[i] = 1
	} else {eventcodes$Event2X[i] = 0}
	if (eventcodes$Event2[i] == "R") {
		eventcodes$Event2R[i] = 1
	} else {eventcodes$Event2R[i] = 0}
	
	### Combine all Adult codes and all Infant codes ###
	if (eventcodes$Event1[i] == "T" | eventcodes$Event1[i] == "N") {
		eventcodes$Event1Adult[i] = 1
	} else {eventcodes$Event1Adult[i] = 0}
	if (eventcodes$Event1[i] == "C" | eventcodes$Event1[i] == "X" | eventcodes$Event1[i] == "R") {
		eventcodes$Event1Infant[i] = 1
	} else {eventcodes$Event1Infant[i] = 0}
	if (eventcodes$Event2[i] == "T" | eventcodes$Event2[i] == "N") {
		eventcodes$Event2Adult[i] = 1
	} else {eventcodes$Event2Adult[i] = 0}
	if (eventcodes$Event2[i] == "C" | eventcodes$Event2[i] == "X" | eventcodes$Event2[i] == "R") {
		eventcodes$Event2Infant[i] = 1
	} else {eventcodes$Event2Infant[i] = 0}
	
	###Compare Infant codes against each other
	if (eventcodes$Event1[i] == "C") {
		eventcodes$Event1CvX[i] = 1
	} else if (eventcodes$Event1[i] == "X") {
		eventcodes$Event1CvX[i] = 0
	} else {eventcodes$Event1CvX[i] = "NA"}
	if (eventcodes$Event1[i] == "R") {
		eventcodes$Event1RvX[i] = 1
	} else if (eventcodes$Event1[i] == "X") {
		eventcodes$Event1RvX[i] = 0
	} else {eventcodes$Event1RvX[i] = "NA"}
	if (eventcodes$Event1[i] == "R") {
		eventcodes$Event1RvC[i] = 1
	} else if (eventcodes$Event1[i] == "C") {
		eventcodes$Event1RvC[i] = 0
	} else {eventcodes$Event1RvC[i] = "NA"}
	
	if (eventcodes$Event2[i] == "C") {
		eventcodes$Event2CvX[i] = 1
	} else if (eventcodes$Event2[i] == "X") {
		eventcodes$Event2CvX[i] = 0
	} else {eventcodes$Event2CvX[i] = "NA"}
	if (eventcodes$Event2[i] == "R") {
		eventcodes$Event2RvX[i] = 1
	} else if (eventcodes$Event2[i] == "X") {
		eventcodes$Event2RvX[i] = 0
	} else {eventcodes$Event2RvX[i] = "NA"}
	if (eventcodes$Event2[i] == "R") {
		eventcodes$Event2RvC[i] = 1
	} else if (eventcodes$Event2[i] == "C") {
		eventcodes$Event2RvC[i] = 0
	} else {eventcodes$Event2RvC[i] = "NA"}
		
}	

### Write to .csv file ###
write.csv(eventcodes, "eventcodes5sec06292017.csv")

