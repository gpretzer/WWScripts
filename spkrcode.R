spkrcode = function(path, file) {
	
	setwd(path)
	annotations = read.table(file,sep="\t",quote="",header=TRUE,col.names=c("start","end","InfIPA","AdultIPA","ortho","dir"),colClasses = c("numeric", "numeric", "character", "character","character", "character"))

	annotations$Spkr = annotations$InfIPA!=""
	annotations$Spkr[annotations$Spkr==TRUE] = "I"
	annotations$Spkr[annotations$Spkr=="FALSE"] = "A"
	annotations$Spkr[annotations$Spkr=="I"] # ASW: This line doesn't do anything, just displays info.
	annotations$SpkrCode # ASW: This line also doesn't do anything. I'm also not sure that annotations$SpkrCode is defined.
	
	# change annotations$Spkr to have the vocal type, putting the results in annotations$SpkrCode
	for (crow in 1:nrow(annotations)) {
		if (annotations$Spkr[crow] == "A") {
			if (annotations$dir[crow] == "N") {
				annotations$SpkrCode[crow] = "N"
			} else if (annotations$dir[crow] == "T") {
				annotations$SpkrCode[crow] = "T"
			} else if (annotations$dir[crow] == "U") {
				annotations$SpkrCode[crow] = "U"	
			} 
		}
		else if (annotations$Spkr[crow] == "I") { # ASW: What would happen if the infant utterance contains a combination of the types below? It looks like if an utterance happened to contain both "x" and "cry" for example, the utterance would be tagged as "C" (canonical). That's definitely not the intention. And my understanding of the human annotation protocol is that it was possible for an utterance to be labeled as both "x" and "cry" or any other combination. It would be better not to use a blanket else for "C", but instead to look for instances of "/". Then there could be a final else that lets us know when the annotation didn't match any of the above criteria. That'll let us know if updates to the rules are needed or if there were errors in the annotation format that need correcting in the original .eaf files.
			 if (annotations$InfIPA[crow] == "x" | annotations$InfIPA[crow] == "X" | annotations$InfIPA[crow] == "fuss" | annotations$InfIPA[crow] == "yell" | annotations$InfIPA[crow] == "scream" | annotations$InfIPA[crow] == "squeal" | annotations$InfIPA[crow] == "grunt" | (grepl("/", annotations$InfIPA[crow]) && !grepl("[wrtypasdfghjklzcvbnm]", annotations$InfIPA[crow]))){
				annotations$SpkrCode[crow] = "X"
			} else if (annotations$InfIPA[crow] == "cry" ) {
				annotations$SpkrCode[crow] = "R" 	
				} else if (annotations$InfIPA[crow] == "laugh") {
				# annotations$SpkrCode[crow] = "L" 
				annotations$SpkrCode[crow] = "R" 
			} else if (annotations$InfIPA[crow] == "sneeze" | annotations$InfIPA[crow] == "cough" | annotations$InfIPA[crow] == "burp" | annotations$InfIPA[crow] == "hiccup" | annotations$InfIPA[crow] == "breathing" | annotations$InfIPA[crow] == "breath" | annotations$InfIPA[crow] == "gasp" | annotations$InfIPA[crow] == "sigh" | annotations$InfIPA[crow] == "wheeze" | annotations$InfIPA[crow] == "wheezing" | annotations$InfIPA[crow] == "snort" | annotations$InfIPA[crow] == "suck" | annotations$InfIPA[crow] == "V" | annotations$InfIPA[crow] == "R") {
			annotations$SpkrCode[crow] = "NA"	
			# } else if (annotations$SpkrCode[crow] == "C") {
			# annotations$SpkrCode[crow] = "C"
			} else { 
				annotations$SpkrCode[crow] = "C"	
			}
		}
		
	}
	
	annotations=subset(annotations,SpkrCode!="NA")
	rownames(annotations)=1:nrow(annotations)	
	return(annotations)
}


				
			