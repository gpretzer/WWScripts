spkrcode = function(path, file) {
	
	annotations = read.table(paste(path,file,sep=""),sep="\t",quote="",header=TRUE,col.names=c("start","end","InfantVoc","AdultDirection"),colClasses = c("numeric", "numeric", "character", "character"))

	annotations$Spkr = annotations$InfantVoc!=""
	annotations$Spkr[annotations$Spkr==TRUE] = "I"
	annotations$Spkr[annotations$Spkr=="FALSE"] = "A"
	
	# change annotations$Spkr to have the vocal type, putting the results in annotations$SpkrCode
	for (crow in 1:nrow(annotations)) {
		if (annotations$Spkr[crow] == "A") {
			if (annotations$AdultDirection[crow] == "N") {
				annotations$SpkrCode[crow] = "N"
			} else if (annotations$AdultDirection[crow] == "T") {
				annotations$SpkrCode[crow] = "T"
			} else if (annotations$AdultDirection[crow] == "U") {
				annotations$SpkrCode[crow] = "U"	
			} 
		}
		else if (annotations$Spkr[crow] == "I") {
			 if (annotations$InfantVoc[crow] == "x" | annotations$InfantVoc[crow] == "X" | annotations$InfantVoc[crow] == "fuss" | annotations$InfantVoc[crow] == "yell" | annotations$InfantVoc[crow] == "scream" | annotations$InfantVoc[crow] == "squeal" | annotations$InfantVoc[crow] == "whisper" | annotations$InfantVoc[crow] == "grunt" | (grepl("/", annotations$InfantVoc[crow]) && !grepl("[bcdfghjklmnpqrstvwxyz]", annotations$InfantVoc[crow]))){
				annotations$SpkrCode[crow] = "X"
			} else if (annotations$InfantVoc[crow] == "cry" | annotations$InfantVoc[crow] == "laugh" | annotations$InfantVoc[crow] == "R" | annotations$InfantVoc[crow] == "r") {
				annotations$SpkrCode[crow] = "R" 	
			} else if (annotations$InfantVoc[crow] == "sneeze" | annotations$InfantVoc[crow] == "cough" | annotations$InfantVoc[crow] == "burp" | annotations$InfantVoc[crow] == "hiccup" | annotations$InfantVoc[crow] == "breathing" | annotations$InfantVoc[crow] == "breath" | annotations$InfantVoc[crow] == "gasp" | annotations$InfantVoc[crow] == "sigh" | annotations$InfantVoc[crow] == "wheeze" | annotations$InfantVoc[crow] == "wheezing" | annotations$InfantVoc[crow] == "snort" | annotations$InfantVoc[crow] == "suck" | annotations$InfantVoc[crow] == "inhalation" | annotations$InfantVoc[crow] == "V") {
			  annotations$SpkrCode[crow] = "NA"	
			} else if (annotations$InfantVoc[crow] == "C" | (grepl("/", annotations$InfantVoc[crow]) && grepl("[bcdfghjklmnpqrstvwxyz]", annotations$InfantVoc[crow]))){
			  annotations$SpkrCode[crow] = "C"
			} else { 
			  annotations$SpkrCode[crow] = "Z" # To flag any cases that don't fall into the above
			}
		  
		}
		
	}
	
	annotations=subset(annotations,SpkrCode!="NA")
	rownames(annotations)=1:nrow(annotations)	
	return(annotations)
	
}


				
			