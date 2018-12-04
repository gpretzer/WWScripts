pauseoverlap = function(annotations, pausedur) {
	
	# Initializations prior to upcoming for loop
	event1 = data.frame(start=annotations[1,]$start,
				end=annotations[1,]$end,
				SpkrCode=annotations[1,]$SpkrCode,
				stringsAsFactors=FALSE)
	
	# Write the first event to newannotations
	newannotations = data.frame(start=event1$start,
				end=event1$end,
				SpkrCode=event1$SpkrCode,
				stringsAsFactors=FALSE)
			
	# For loop to turn annotations int a single sequential event series, newannotations, containing pauses
	for (crow in 2:nrow(annotations)) {
		
		# Set event2 to the next event in annotations
		event2 = data.frame(start=annotations[crow,]$start,
					end=annotations[crow,]$end,
					SpkrCode=annotations[crow,]$SpkrCode,
					stringsAsFactors=FALSE)
		
		# Find the time difference between the start of event2 and the end of event1
		timediff = event2[1,]$start - event1[1,]$end
	
		# If the time difference is negative, there is overlap between event1 and event2 
		if (timediff < 0){
			
			# If event1 continues for > pausedur after the end of event2, create a copy of event1 and make it the third event in the sequence
			if ((event1[1,]$end - event2[1,]$end) >= pausedur){
				newannotations[nrow(newannotations),]$end = event2[1,]$end # Make the end time of the first event be the end of the overlapping portion
				newannotations = rbind(newannotations,c(event2[1,]$start,
									event2[1,]$end,event2[1,]$SpkrCode)) # Put the second event into newannotations
				event3 = data.frame(start=event2[1,]$end + .001, # Make the start time of the third event be 1 ms after the end of the overlapping portion
							end=event1[1,]$end,
							SpkrCode=event1[1,]$SpkrCode,
							stringsAsFactors=FALSE)
				event2 = event3 # Event 3 is the new event 2, which will get written to newannotations below, at the end of the current for loop.
			}
			
		}
	
		# If the time differences is greater than the pause duration, insert as many pauses as needed
		if (timediff >= pausedur) {
			for (pausenum in 1:(timediff %/% pausedur)) {
				event1[1,]$start = event1[1,]$end + ((pausenum-1)*pausedur + .001)
				event1[1,]$end = event1[1,]$end + (pausenum*pausedur)
				event1[1,]$SpkrCode = "P"
				newannotations = 
					rbind(newannotations,c(event1[1,]$start,event1[1,]$end,event1[1,]$SpkrCode))
			}
		}
	
		# It is time to write event2 to newannotations and make it the new event1
		event1 = event2
		newannotations = rbind(newannotations,c(event1[1,]$start,event1[1,]$end,event1[1,]$SpkrCode))			
	}

	return(newannotations)
	
}
