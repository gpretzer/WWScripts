sequenceevents = function(events, InfantID, SegmentID, FileName) {	

	for (crow in 1:(nrow(events)-1)) {
		if (fiveminnum == 1 & crow == 1 ) { #set first sequence
			sequencecodes = data.frame(InfantID=InfantID,
									   SegmentID=SegmentID,
	   								   FileName=FileName,
									   code1=events[1,]$SpkrCode,
									   code2=events[2,]$SpkrCode, 
									   seqcode=paste(events[1,]$SpkrCode,events[2,]$SpkrCode, sep = "", collapse = NULL),
									   stringsAsFactors=FALSE)
		} else { #write the remaining sequences
			sequencecodes = rbind(sequencecodes,c(InfantID, SegmentID, FileName, events[crow,]$SpkrCode, events[crow+1,]$SpkrCode, paste(events[crow,]$SpkrCode,events[crow+1,]$SpkrCode, sep = "", collapse = NULL)))	
		}	
	}	
	
	return(sequencecodes)
		
}
