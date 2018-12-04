sequenceevents = function(events, InfantID, FileName) {	

	for (crow in 1:(nrow(events)-1)) {
		if (fiveminnum == 1 & crow == 1 ) { #set first sequence
			sequencecodes = data.frame(InfantID=InfantID,
	   								  FileName=FileName,
									    code1=events[1,]$SpkrCode,
									    code2=events[2,]$SpkrCode, 
									    seqcode=paste(events[1,]$SpkrCode,events[2,]$SpkrCode, sep = "", collapse = NULL),
									    stringsAsFactors=FALSE)
		} else { #write the remaining sequences
			sequencecodes = rbind(sequencecodes,c(InfantID, FileName, events[crow,]$SpkrCode, events[crow+1,]$SpkrCode, paste(events[crow,]$SpkrCode,events[crow+1,]$SpkrCode, sep = "", collapse = NULL)))	
		}	
	}	
	
	return(sequencecodes)
		
}
