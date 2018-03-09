setwd("/Volumes/Research/WWTranscription/")
#sequencedata = read.csv("/Volumes/Research/WWTranscription/BidirectionalContingencies/sequencecodes.csv",header=TRUE)
#sequencedata = read.csv("/Volumes/Research/WWTranscription/WWScripts/Regression/sequencecodes1sec06262017.csv",header=TRUE)
#sequencedata = read.csv("/Volumes/Research/WWTranscription/WWScripts/Regression/sequencecodes2sec06262017.csv",header=TRUE)
sequencedata = read.csv("/Volumes/Research/WWTranscription/WWScripts/Regression/sequencecodes5sec.csv",header=TRUE)




## Variables for Section II
InfantVoc_NotToChild = length(which(sequencedata$seqcode=="CN" | sequencedata$seqcode=="XN" | sequencedata$seqcode=="RN"))
InfantVoc_NNotToChild = length(which(sequencedata$seqcode=="CT" | sequencedata$seqcode=="CU" | sequencedata$seqcode=="CP" | sequencedata$seqcode=="CC" | sequencedata$seqcode=="CX" | sequencedata$seqcode=="CR" | sequencedata$seqcode=="XT" | sequencedata$seqcode=="XU" | sequencedata$seqcode=="XP" | sequencedata$seqcode=="XC" | sequencedata$seqcode=="XX" | sequencedata$seqcode=="XR" | sequencedata$seqcode=="RT" | sequencedata$seqcode=="RU" | sequencedata$seqcode=="RP" | sequencedata$seqcode=="RC" | sequencedata$seqcode=="RX" | sequencedata$seqcode=="RR"))
InfantVoc_ToChild = length(which(sequencedata$seqcode=="CT"| sequencedata$seqcode=="XT" | sequencedata$seqcode=="RT"))
InfantVoc_NToChild = length(which(sequencedata$seqcode=="CN" | sequencedata$seqcode=="CU" | sequencedata$seqcode=="CP" | sequencedata$seqcode=="CC" | sequencedata$seqcode=="CR" | sequencedata$seqcode=="CX" | sequencedata$seqcode=="XN" | sequencedata$seqcode=="XU" | sequencedata$seqcode=="XP" | sequencedata$seqcode=="XC" | sequencedata$seqcode=="XR" | sequencedata$seqcode=="XX"))
NInfantVoc_NotToChild = length(which(sequencedata$seqcode=="NN" | sequencedata$seqcode=="TN" | sequencedata$seqcode=="UN" | sequencedata$seqcode=="PN"))
NInfantVoc_NNotToChild = length(which(sequencedata$seqcode!="CN" | sequencedata$seqcode!="XN" | sequencedata$seqcode!="RN"))
NInfantVoc_ToChild = length(which(sequencedata$seqcode=="PT" | sequencedata$seqcode=="TT" | sequencedata$seqcode=="NT" | sequencedata$seqcode=="UT"))
NInfantVoc_NToChild = length(which(sequencedata$seqcode=="PN" | sequencedata$seqcode=="PU" | sequencedata$seqcode=="PP" | sequencedata$seqcode=="PC" | sequencedata$seqcode=="PR" | sequencedata$seqcode=="PX" | sequencedata$seqcode=="TN" | sequencedata$seqcode=="TU" | sequencedata$seqcode=="TP" | sequencedata$seqcode=="TC" | sequencedata$seqcode=="TR" | sequencedata$seqcode=="TU" | sequencedata$seqcode=="UN" | sequencedata$seqcode=="UU"| sequencedata$seqcode=="UP" | sequencedata$seqcode=="UC" | sequencedata$seqcode=="UR" | sequencedata$seqcode=="UX" | sequencedata$seqcode== "NN" | sequencedata$seqcode=="NU" | sequencedata$seqcode=="NP" | sequencedata$seqcode=="NC" | sequencedata$seqcode=="NR" | sequencedata$seqcode=="NX"))
NotToChild_InfantVoc = length(which(sequencedata$seqcode=="NR" | sequencedata$seqcode=="NX" | sequencedata$seqcode=="NC"))
NotToChild_NInfantVoc = length(which(sequencedata$seqcode=="NN" | sequencedata$seqcode=="NT" | sequencedata$seqcode== "NU" | sequencedata$seqcode=="NP"))
ToChild_InfantVoc = length(which(sequencedata$seqcode=="TC" | sequencedata$seqcode=="TX" | sequencedata$seqcode=="TR"))
ToChild_NInfantVoc = length(which(sequencedata$seqcode=="TT" | sequencedata$seqcode=="TN" | sequencedata$seqcode=="TU" | sequencedata$seqcode=="TP"))
NNotToChild_NInfantVoc =  length(which(sequencedata$seqcode!="NR" | sequencedata$seqcode!="NX" | sequencedata$seqcode!="NC"))
NNotToChild_InfantVoc = length(which(sequencedata$seqcode=="TR" | sequencedata$seqcode=="TC" | sequencedata$seqcode=="TX" | sequencedata$seqcode=="UR" | sequencedata$seqcode=="UC" | sequencedata$seqcode=="UX" | sequencedata$seqcode=="PR" | sequencedata$seqcode=="PC" | sequencedata$seqcode=="PC" | sequencedata$seqcode=="CR" | sequencedata$seqcode=="CX" | sequencedata$seqcode=="CC" | sequencedata$seqcode=="RR" | sequencedata$seqcode=="RC" | sequencedata$seqcode=="RX" | sequencedata$seqcode=="XR" | sequencedata$seqcode=="XX"))
NToChild_InfantVoc = length(which(sequencedata$seqcode=="NC" | sequencedata$seqcode=="NX" | sequencedata$seqcode=="NR" | sequencedata$seqcode=="UC" | sequencedata$seqcode=="UX" | sequencedata$seqcode=="UR"| sequencedata$seqcode=="PC" | sequencedata$seqcode=="PX" | sequencedata$seqcode=="PR" | sequencedata$seqcode=="CC" | sequencedata$seqcode=="CX" | sequencedata$seqcode=="CR" | sequencedata$seqcode=="XC" | sequencedata$seqcode=="XX" | sequencedata$seqcode=="XR" | sequencedata$seqcode=="RC" | sequencedata$seqcode=="RX" | sequencedata$seqcode=="RR"))
NToChild_NInfantVoc = length(which(sequencedata$seqcode=="NT" | sequencedata$seqcode=="NN" | sequencedata$seqcode=="NU" | sequencedata$seqcode=="NP" | sequencedata$seqcode=="UT" | sequencedata$seqcode=="UN"| sequencedata$seqcode=="UU" | sequencedata$seqcode=="UP" | sequencedata$seqcode=="TT" | sequencedata$seqcode=="TN" | sequencedata$seqcode=="TU" | sequencedata$seqcode=="TP" | sequencedata$seqcode=="PP" | sequencedata$seqcode== "PN" | sequencedata$seqcode=="PU" | sequencedata$seqcode=="PP" | sequencedata$seqcode=="CT" | sequencedata$seqcode=="CN" | sequencedata$seqcode=="CU" | sequencedata$seqcode=="CP" | sequencedata$seqcode=="XT" | sequencedata$seqcode=="XN" | sequencedata$seqcode=="XU" | sequencedata$seqcode=="XP" | sequencedata$seqcode=="RT" | sequencedata$seqcode=="RN" | sequencedata$seqcode=="RU" | sequencedata$seqcode=="RP"))


## Variables for Section III
Proto_ToChild = length(which(sequencedata$seqcode =="CT" | sequencedata$seqcode =="XT" ))
Reflex_ToChild = length(which(sequencedata$seqcode =="RT"))
Proto_NToChild = length(which(sequencedata$seqcode == "CN" | sequencedata$seqcode =="CU" | sequencedata$seqcode =="CP" | sequencedata$seqcode =="XN" | sequencedata$seqcode =="XU" | sequencedata$seqcode =="XP" | sequencedata$seqcode =="CC" | sequencedata$seqcode =="CX" | sequencedata$seqcode =="CR" | sequencedata$seqcode =="XC" | sequencedata$seqcode =="XX" | sequencedata$seqcode =="XR"))
Reflex_NToChild = length(which(sequencedata$seqcode =="RN" | sequencedata$seqcode =="RU" | sequencedata$seqcode =="RP" | sequencedata$seqcode =="RC" | sequencedata$seqcode =="RR" | sequencedata$seqcode =="RX"))
ToChild_Proto = length(which(sequencedata$seqcode =="TC" | sequencedata$seqcode =="TX"))
ToChild_Reflex = length(which(sequencedata$seqcode =="TR"))
NToChild_Proto = length(which(sequencedata$seqcode =="TR" | sequencedata$seqcode =="TT" | sequencedata$seqcode =="TU" | sequencedata$seqcode == "TP" | sequencedata$seqcode =="TN"))
NToChild_Reflex = length(which(sequencedata$seqcode =="NR" | sequencedata$seqcode =="UR" | sequencedata$seqcode =="PR" | sequencedata$seqcode =="CR" | sequencedata$seqcode =="XR" | sequencedata$seqcode =="RR"))
Proto_NotToChild = length(which(sequencedata$seqcode =="CN" | sequencedata$seqcode =="XN" ))
Reflex_NotToChild = length(which(sequencedata$seqcode =="RN"))
Proto_NNotToChild = length(which(sequencedata$seqcode =="CT" | sequencedata$seqcode =="CU" | sequencedata$seqcode =="CP" | sequencedata$seqcode =="XT" | sequencedata$seqcode =="XU" | sequencedata$seqcode =="XP" | sequencedata$seqcode =="CC" | sequencedata$seqcode =="CX" | sequencedata$seqcode =="CR" | sequencedata$seqcode =="XC" | sequencedata$seqcode =="XX" | sequencedata$seqcode =="XR"))
Reflex_NNotToChild = length(which(sequencedata$seqcode =="RT" | sequencedata$seqcode =="RU" | sequencedata$seqcode =="RP" | sequencedata$seqcode =="RC" | sequencedata$seqcode =="RR" | sequencedata$seqcode =="RX"))
NotToChild_Proto = length(which(sequencedata$seqcode =="NC" | sequencedata$seqcode =="NX"))
NotToChild_Reflex = length(which(sequencedata$seqcode =="NR"))
NNotToChild_Proto = length(which(sequencedata$seqcode =="NR" | sequencedata$seqcode =="NT" | sequencedata$seqcode =="NU" | sequencedata$seqcode == "NP" | sequencedata$seqcode =="NN"))
NNotToChild_Reflex = length(which(sequencedata$seqcode =="TR" | sequencedata$seqcode =="UR" | sequencedata$seqcode =="PR" | sequencedata$seqcode =="CR" | sequencedata$seqcode =="XR" | sequencedata$seqcode =="RR"))


## Variables for Section IV
Canon_ToChild = length(which(sequencedata$seqcode=="CT"))
Canon_NToChild = length(which(sequencedata$seqcode=="CN" | sequencedata$seqcode=="CU" | sequencedata$seqcode=="CP" | sequencedata$seqcode=="CC" | sequencedata$seqcode=="CR" | sequencedata$seqcode=="CX"))
NonCanon_ToChild = length(which(sequencedata$seqcode=="XT"))
NonCanon_NToChild = length(which(sequencedata$seqcode== "XN" | sequencedata$seqcode== "XU" | sequencedata$seqcode== "XP" | sequencedata$seqcode== "XC" | sequencedata$seqcode== "XX" | sequencedata$seqcode== "XR"))
ToChild_Canon = length(which(sequencedata$seqcode=="TC"))
NToChild_Canon = length(which(sequencedata$seqcode=="NC" | sequencedata$seqcode=="UC" | sequencedata$seqcode=="PC" | sequencedata$seqcode=="CC" | sequencedata$seqcode=="RC" | sequencedata$seqcode=="XC"))
ToChild_NonCanon = length(which(sequencedata$seqcode=="TX"))
NToChild_NonCanon = length(which(sequencedata$seqcode== "NX" | sequencedata$seqcode== "UX" | sequencedata$seqcode== "PX" | sequencedata$seqcode== "CX" | sequencedata$seqcode== "XX" | sequencedata$seqcode== "RX"))
Canon_NotToChild = length(which(sequencedata$seqcode=="CN"))
Canon_NNotToChild = length(which(sequencedata$seqcode =="CT" | sequencedata$seqcode =="CU" | sequencedata$seqcode =="CP" | sequencedata$seqcode =="CC" | sequencedata$seqcode =="CX" | sequencedata$seqcode =="CR"))
NonCanon_NotToChild = length(which(sequencedata$seqcode=="XN"))
NonCanon_NNotToChild = length(which(sequencedata$seqcode =="XT" | sequencedata$seqcode =="XU" | sequencedata$seqcode =="XP" | sequencedata$seqcode =="XC" | sequencedata$seqcode =="XX" | sequencedata$seqcode =="XR"))
NotToChild_Canon = length(which(sequencedata$seqcode=="NC"))
	NNotToChild_Canon = length(which(sequencedata$seqcode =="TC" | sequencedata$seqcode =="UC" | sequencedata$seqcode =="PC" | sequencedata$seqcode =="CC" | sequencedata$seqcode =="XC" | sequencedata$seqcode =="RC"))
NotToChild_NonCanon = length(which(sequencedata$seqcode=="NX"))
NNotToChild_NonCanon = length(which(sequencedata$seqcode =="TX" | sequencedata$seqcode =="UX" | sequencedata$seqcode =="PX" | sequencedata$seqcode =="CX" | sequencedata$seqcode =="XX" | sequencedata$seqcode =="RX"))


##  Matrices for Section I

#matrix for InfantVoc, NInfantVoc, ToChild, NToChild
matrix1 <- matrix(c(InfantVoc_ToChild, InfantVoc_NToChild, NInfantVoc_ToChild, NInfantVoc_NToChild), nrow=2, byrow=TRUE)
colnames(matrix1) <- c("ToChild", "NToChild")
rownames(matrix1) <- c("InfantVoc", "NInfantVoc")
print(matrix1)

chisq.test(matrix1)

#odds ratio for matrix 1
calcOddsRatio <- function(matrix1,alpha=0.5,referencerow=2,quiet=FALSE) {
	numrow <- nrow(matrix1)
	myrownames <- rownames(matrix1)
	
	for (i in 1:numrow) {
		rowname <- myrownames[i]
		ToChildNInfantVoc <- matrix1[referencerow,1]
		NToChildNInfantVoc <- matrix1[referencerow,2]
		
		if (i != referencerow) {
			ToChildInfantVoc <- matrix1[i,1]
			NToChildInfantVoc <- matrix1[i,2]
			
			totInfantVoc <- ToChildInfantVoc + NToChildInfantVoc
			totNInfantVoc <- ToChildNInfantVoc + NToChildNInfantVoc
			
			probToChildGivenInfantVoc <- ToChildInfantVoc/totInfantVoc
			probToChildGivenNInfantVoc <- ToChildNInfantVoc/totNInfantVoc
			probNToChildGivenInfantVoc <- NToChildInfantVoc/totInfantVoc
			probNToChildGivenNInfantVoc <- NToChildNInfantVoc/totNInfantVoc
			
			#calculate the odds ratio
			oddsRatio <- (probToChildGivenInfantVoc*probNToChildGivenNInfantVoc)/(probNToChildGivenInfantVoc*probToChildGivenNInfantVoc)
			
			if (quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/ToChildInfantVoc) + (1/NToChildInfantVoc) + (1/ToChildNInfantVoc) + (1/NToChildNInfantVoc))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if (quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow ==2) {
		return(oddsRatio)
	}
}
calcOddsRatio(matrix1,alpha=0.05)

#matrix for ToChild, NToChild, InfantVoc, NInfantVoc
matrix2 <- matrix(c(ToChild_InfantVoc, ToChild_NInfantVoc, NToChild_InfantVoc, NToChild_NInfantVoc), nrow=2, byrow=TRUE)
colnames(matrix2) <- c("InfantVoc", "NInfantVoc")
rownames(matrix2) <- c("ToChild", "NToChild")
print(matrix2)

chisq.test(matrix2)

#odds ratio for matrix 2
calcOddsRatio <- function(matrix2,alpha=0.5,referencerow=2,quiet=FALSE) {
	numrow <- nrow(matrix2)
	myrownames <- rownames(matrix2)
	
	for (i in 1:numrow) {
		rowname <- myrownames[i]
		InfantVocNToChild <- matrix2[referencerow,1]
		NInfantVocNToChild <- matrix2[referencerow,2]
		
		if (i != referencerow) {
			InfantVocToChild <- matrix2[i,1]
			NInfantVocToChild <- matrix2[i,2]
			
			totToChild <- InfantVocToChild + NInfantVocToChild
			totNToChild <- InfantVocNToChild + NInfantVocNToChild
			
			probInfantVocGivenToChild <- InfantVocToChild/totToChild
			probInfantVocGivenNToChild <- InfantVocNToChild/totNToChild
			probNInfantVocGivenToChild <- NInfantVocToChild/totToChild
			probNInfantVocGivenNToChild <- NInfantVocNToChild/totNToChild
			
			#calculate the odds ratio
			# oddsRatio <- (probInfantVocGivenToChild*probNInfantVocGivenNToChild)/(probNInfantVocGivenToChild*probNInfantVocGivenNToChild)
			oddsRatio <- (probInfantVocGivenToChild*probNInfantVocGivenNToChild)/(probNInfantVocGivenToChild*probInfantVocGivenNToChild)
			
			if (quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/InfantVocToChild) + (1/NInfantVocToChild) + (1/InfantVocNToChild) + (1/NInfantVocNToChild))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if (quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow ==2) {
		return(oddsRatio)
	}
}
calcOddsRatio(matrix2,alpha=0.05)

#matrix for InfantVoc, NInfantVoc, NotToChild, NNotToChild
matrix3 <- matrix(c(InfantVoc_NotToChild, InfantVoc_NNotToChild, NInfantVoc_NotToChild, NInfantVoc_NNotToChild), nrow=2, byrow=TRUE)
colnames(matrix3) <- c("NotToChild", "NNotToChild")
rownames(matrix3) <- c("InfantVoc", "NInfantVoc")
print(matrix3)

chisq.test(matrix3)

#odds ratio for matrix3
calcOddsRatio <- function(matrix3,alpha=0.5,referencerow=2,quiet=FALSE) {
	numrow <- nrow(matrix3)
	myrownames <- rownames(matrix3)
	
	for (i in 1:numrow) {
		rowname <- myrownames[i]
		NotToChildNInfantVoc <- matrix3[referencerow,1]
		NNotToChildNInfantVoc <- matrix3[referencerow,2]
		
		if (i != referencerow) {
			NotToChildInfantVoc <- matrix3[i,1]
			NNotToChildInfantVoc <- matrix3[i,2]
			
			totInfantVoc <- NotToChildInfantVoc + NNotToChildInfantVoc
			totNInfantVoc <- NotToChildNInfantVoc + NNotToChildNInfantVoc
			
			probNotToChildGivenInfantVoc <- NotToChildInfantVoc/totInfantVoc
			probNotToChildGivenNInfantVoc <- NotToChildNInfantVoc/totNInfantVoc
			probNNotToChildGivenInfantVoc <- NNotToChildInfantVoc/totInfantVoc
			probNNotToChildGivenNInfantVoc <- NNotToChildNInfantVoc/totNInfantVoc
			
			#calculate the odds ratio
			oddsRatio <- (probNotToChildGivenInfantVoc*probNNotToChildGivenNInfantVoc)/(probNNotToChildGivenInfantVoc*probNotToChildGivenNInfantVoc)
			
			if (quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/NotToChildInfantVoc) + (1/NNotToChildInfantVoc) + (1/NotToChildNInfantVoc) + (1/NNotToChildNInfantVoc))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if (quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow ==2) {
		return(oddsRatio)
	}
}
calcOddsRatio(matrix3,alpha=0.05)


#matrix for NotToChild, NNotToChild, InfantVoc, NInfantVoc
matrix4 <- matrix(c(NotToChild_InfantVoc, NotToChild_NInfantVoc, NNotToChild_InfantVoc, NNotToChild_NInfantVoc), nrow=2, byrow=TRUE)
colnames(matrix4) <- c("InfantVoc", "NInfantVoc")
rownames(matrix4) <- c("NotToChild", "NNotToChild")
print(matrix4)

chisq.test(matrix4)

#odds ratio for matrix4
calcOddsRatio <- function(matrix4,alpha=0.5,referencerow=2,quiet=FALSE) {
	numrow <- nrow(matrix4)
	myrownames <- rownames(matrix4)
	
	for (i in 1:numrow) {
		rowname <- myrownames[i]
		InfantVocNNotToChild <- matrix4[referencerow,1]
		NInfantVocNNotToChild <- matrix4[referencerow,2]
		
		if (i != referencerow) {
			InfantVocNotToChild <- matrix4[i,1]
			NInfantVocNotToChild <- matrix4[i,2]
			
			totNotToChild <- InfantVocNotToChild + NInfantVocNotToChild
			totNNotToChild <- InfantVocNNotToChild + NInfantVocNNotToChild
			
			probInfantVocGivenNotToChild <- InfantVocNotToChild/totNotToChild
			probInfantVocGivenNNotToChild <- InfantVocNNotToChild/totNNotToChild
			probNInfantVocGivenNotToChild <- NInfantVocNotToChild/totNotToChild
			probNInfantVocGivenNNotToChild <- NInfantVocNNotToChild/totNNotToChild
			
			#calculate the odds ratio
			oddsRatio <- (probInfantVocGivenNotToChild*probNInfantVocGivenNNotToChild)/(probNInfantVocGivenNotToChild*probInfantVocGivenNNotToChild)
			
			if (quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/InfantVocNotToChild) + (1/NInfantVocNotToChild) + (1/InfantVocNNotToChild) + (1/NInfantVocNNotToChild))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if (quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow ==2) {
		return(oddsRatio)
	}
}
calcOddsRatio(matrix4,alpha=0.05)



## Matrices for Section III

matrix5 <- matrix(c(Proto_ToChild, Proto_NToChild, Reflex_ToChild, Reflex_NToChild), nrow=2, byrow=TRUE)
colnames(matrix5) <- c("ToChild", "NToChild")
rownames(matrix5) <- c("Proto","Reflex")
print(matrix5)

chisq.test(matrix5)

#odds ratio for matrix5
calcOddsRatio <- function(matrix5,alpha=0.05,referencerow=2,quiet=FALSE){
	numrow <- nrow(matrix5)
	myrownames <-rownames(matrix5)
	
	for (i in 1:numrow){
		rowname <- myrownames[i]
		ToChildReflex <- matrix5[referencerow,1]
		NToChildReflex <- matrix5[referencerow,2]
		if(i != referencerow) {
			ToChildProto <- matrix5[i,1]
			NToChildProto <- matrix5[i,2]
			
			totProto <- ToChildProto + NToChildProto
			totReflex <-ToChildReflex + NToChildReflex
			
			probToChildGivenProto <- ToChildProto/totProto
			probToChildGivenReflex <- ToChildReflex/totReflex
			probNToChildGivenProto <-NToChildProto/totProto
			probNToChildGivenReflex <-NToChildReflex/totReflex
			
			#calculate the odds ratio
			oddsRatio <- (probToChildGivenProto*probNToChildGivenReflex)/(probNToChildGivenProto*probToChildGivenReflex)
			if(quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/ToChildProto)+(1/NToChildProto)+(1/ToChildReflex)+(1/NToChildReflex))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if(quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow == 2) {
		return(oddsRatio)
		}
		
}
calcOddsRatio(matrix5,alpha=0.05)

matrix6 <- matrix(c(ToChild_Proto, NToChild_Proto, ToChild_Reflex, NToChild_Reflex), nrow=2, byrow=TRUE)
colnames(matrix6) <- c("Proto","Reflex")
rownames(matrix6) <- c("ToChild", "NToChild")
print(matrix6)

chisq.test(matrix6)

#odds ratio for matrix6
calcOddsRatio <- function(matrix6,alpha=0.05,referencerow=2,quiet=FALSE){
	numrow <- nrow(matrix6)
	myrownames <-rownames(matrix6)
	
	for (i in 1:numrow){
		rowname <- myrownames[i]
		ProtoNToChild <- matrix6[referencerow,1]
		ReflexNToChild <- matrix6[referencerow,2]
		if(i != referencerow) {
			ProtoToChild <- matrix6[i,1]
			ReflexToChild <- matrix6[i,2]
			
			totToChild <- ProtoToChild + ReflexToChild
			totNToChild <-ProtoNToChild + ReflexNToChild
			
			probProtoGivenToChild <- ProtoToChild/totToChild
			probProtoGivenNToChild <- ProtoNToChild/totNToChild
			probReflexGivenToChild <-ReflexToChild/totToChild
			probReflexGivenNToChild <-ReflexNToChild/totNToChild
			
			#calculate the odds ratio
			oddsRatio <- (probProtoGivenToChild*probReflexGivenNToChild)/(probReflexGivenToChild*probProtoGivenNToChild)
			if(quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/ProtoToChild)+(1/ReflexToChild)+(1/ProtoNToChild)+(1/ReflexNToChild))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if(quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow == 2) {
		return(oddsRatio)
		}
		
}
calcOddsRatio(matrix6,alpha=0.05)

matrix7 <- matrix(c(Proto_NotToChild, Proto_NNotToChild, Reflex_NotToChild, Reflex_NNotToChild), nrow=2, byrow=TRUE)
colnames(matrix7) <- c("NotToChild", "NNotToChild")
rownames(matrix7) <- c("Proto","Reflex")
print(matrix7)

chisq.test(matrix7)

#odds ratio for matrix7
calcOddsRatio <- function(matrix7,alpha=0.05,referencerow=2,quiet=FALSE){
	numrow <- nrow(matrix7)
	myrownames <-rownames(matrix7)
	
	for (i in 1:numrow){
		rowname <- myrownames[i]
		NotToChildReflex <- matrix7[referencerow,1]
		NNotToChildReflex <- matrix7[referencerow,2]
		if(i != referencerow) {
			NotToChildProto <- matrix7[i,1]
			NNotToChildProto <- matrix7[i,2]
			
			totProto <- NotToChildProto + NNotToChildProto
			totReflex <-NotToChildReflex + NNotToChildReflex
			
			probNotToChildGivenProto <- NotToChildProto/totProto
			probNotToChildGivenReflex <- NotToChildReflex/totReflex
			probNNotToChildGivenProto <-NNotToChildProto/totProto
			probNNotToChildGivenReflex <-NNotToChildReflex/totReflex
			
			#calculate the odds ratio
			oddsRatio <- (probNotToChildGivenProto*probNNotToChildGivenReflex)/(probNNotToChildGivenProto*probNotToChildGivenReflex)
			if(quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/NotToChildProto)+(1/NNotToChildProto)+(1/NotToChildReflex)+(1/NNotToChildReflex))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if(quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow == 2) {
		return(oddsRatio)
		}
		
}
calcOddsRatio(matrix7,alpha=0.05)

matrix8 <- matrix(c(NotToChild_Proto, NNotToChild_Proto, NotToChild_Reflex, NNotToChild_Reflex), nrow=2, byrow=TRUE)
colnames(matrix8) <- c("Proto","Reflex")
rownames(matrix8) <- c("NotToChild", "NNotToChild")
print(matrix8)

chisq.test(matrix8)

#odds ratio for matrix8
calcOddsRatio <- function(matrix8,alpha=0.05,referencerow=2,quiet=FALSE){
	numrow <- nrow(matrix8)
	myrownames <-rownames(matrix8)
	
	for (i in 1:numrow){
		rowname <- myrownames[i]
		ProtoNNotToChild <- matrix8[referencerow,1]
		ReflexNNotToChild <- matrix8[referencerow,2]
		if(i != referencerow) {
			ProtoNotToChild <- matrix8[i,1]
			ReflexNotToChild <- matrix8[i,2]
			
			totNotToChild <- ProtoNotToChild + ReflexNotToChild
			totNNotToChild <-ProtoNNotToChild + ReflexNNotToChild
			
			probProtoGivenNotToChild <- ProtoNotToChild/totNotToChild
			probProtoGivenNNotToChild <- ProtoNNotToChild/totNNotToChild
			probReflexGivenNotToChild <-ReflexNotToChild/totNotToChild
			probReflexGivenNNotToChild <-ReflexNNotToChild/totNNotToChild
			
			#calculate the odds ratio
			oddsRatio <- (probProtoGivenNotToChild*probReflexGivenNNotToChild)/(probReflexGivenNotToChild*probProtoGivenNNotToChild)
			if(quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/ProtoNotToChild)+(1/ReflexNotToChild)+(1/ProtoNNotToChild)+(1/ReflexNNotToChild))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if(quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow == 2) {
		return(oddsRatio)
		}
		
}
calcOddsRatio(matrix8,alpha=0.05)


## Matrices for Section IV

matrix9 <- matrix(c(Canon_ToChild, NonCanon_ToChild, Canon_NToChild, NonCanon_NToChild), nrow=2, byrow=TRUE)
colnames(matrix9) <- c("ToChild","NToChild")
rownames(matrix9) <- c("Canon", "NonCanon")
print(matrix9)

chisq.test(matrix9)

#odds ratio for matrix9
calcOddsRatio <- function(matrix9,alpha=0.05,referencerow=2,quiet=FALSE){
	numrow <- nrow(matrix9)
	myrownames <-rownames(matrix9)
	
	for (i in 1:numrow){
		rowname <- myrownames[i]
		ToChildNonCanonical <- matrix9[referencerow,1]
		NToChildNonCanonical <- matrix9[referencerow,2]
		if(i != referencerow) {
			ToChildCanonical <- matrix9[i,1]
			NToChildCanonical <- matrix9[i,2]
			
			totCanonical <- ToChildCanonical + NToChildCanonical
			totNonCanonical <-ToChildNonCanonical + NToChildNonCanonical
			
			probToChildGivenCanonical <- ToChildCanonical/totCanonical
			probToChildGivenNonCanonical <- ToChildNonCanonical/totNonCanonical
			probNToChildGivenCanonical <-NToChildCanonical/totCanonical
			probNToChildGivenNonCanonical <-NToChildNonCanonical/totNonCanonical
			
			#calculate the odds ratio
			oddsRatio <- (probToChildGivenCanonical*probNToChildGivenNonCanonical)/(probNToChildGivenCanonical*probToChildGivenNonCanonical)
			if(quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/ToChildCanonical)+(1/NToChildCanonical)+(1/ToChildNonCanonical)+(1/NToChildNonCanonical))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if(quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow == 2) {
		return(oddsRatio)
		}
		
}
calcOddsRatio(matrix9,alpha=0.05)

matrix10 <- matrix(c(ToChild_Canon, NToChild_Canon, ToChild_NonCanon, NToChild_NonCanon), nrow=2, byrow=TRUE)
colnames(matrix10) <- c("Canon","NonCanon")
rownames(matrix10) <- c("ToChild", "NToChild")
print(matrix10)

chisq.test(matrix10)

#odds ratio for matrix10
calcOddsRatio <- function(matrix10,alpha=0.05,referencerow=2,quiet=FALSE){
	numrow <- nrow(matrix10)
	myrownames <-rownames(matrix10)
	
	for (i in 1:numrow){
		rowname <- myrownames[i]
		CanonicalNToChild <- matrix10[referencerow,1]
		NonCanonicalNToChild <- matrix10[referencerow,2]
		if(i != referencerow) {
			CanonicalToChild <- matrix10[i,1]
			NonCanonicalToChild <- matrix10[i,2]
			
			totToChild <- CanonicalToChild + NonCanonicalToChild
			totNToChild <-CanonicalNToChild + NonCanonicalNToChild
			
			probCanonicalGivenToChild <- CanonicalToChild/totToChild
			probCanonicalGivenNToChild <- CanonicalNToChild/totNToChild
			probNonCanonicalGivenToChild <-NonCanonicalToChild/totToChild
			probNonCanonicalGivenNToChild <-NonCanonicalNToChild/totNToChild
			
			#calculate the odds ratio
			oddsRatio <- (probCanonicalGivenToChild*probNonCanonicalGivenNToChild)/(probNonCanonicalGivenToChild*probCanonicalGivenNToChild)
			if(quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/CanonicalToChild)+(1/NonCanonicalToChild)+(1/CanonicalNToChild)+(1/NonCanonicalNToChild))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if(quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow == 2) {
		return(oddsRatio)
		}
		
}
calcOddsRatio(matrix10,alpha=0.05)

matrix11 <- matrix(c(Canon_NotToChild, Canon_NNotToChild, NonCanon_NotToChild, NonCanon_NNotToChild), nrow=2, byrow=TRUE)
colnames(matrix11) <- c("NotToChild", "NNotToChild")
rownames(matrix11) <- c("Canon","NonCanon")
print(matrix11)

chisq.test(matrix11)

#odds ratio for matrix11
calcOddsRatio <- function(matrix11,alpha=0.05,referencerow=2,quiet=FALSE){
	numrow <- nrow(matrix11)
	myrownames <-rownames(matrix11)
	
	for (i in 1:numrow){
		rowname <- myrownames[i]
		NotToChildNonCanonical <- matrix11[referencerow,1]
		NNotToChildNonCanonical <- matrix11[referencerow,2]
		if(i != referencerow) {
			NotToChildCanonical <- matrix11[i,1]
			NNotToChildCanonical <- matrix11[i,2]
			
			totCanonical <- NotToChildCanonical + NNotToChildCanonical
			totNonCanonical <-NotToChildNonCanonical + NNotToChildNonCanonical
			
			probNotToChildGivenCanonical <- NotToChildCanonical/totCanonical
			probNotToChildGivenNonCanonical <- NotToChildNonCanonical/totNonCanonical
			probNNotToChildGivenCanonical <-NNotToChildCanonical/totCanonical
			probNNotToChildGivenNonCanonical <-NNotToChildNonCanonical/totNonCanonical
			
			#calculate the odds ratio
			oddsRatio <- (probNotToChildGivenCanonical*probNNotToChildGivenNonCanonical)/(probNNotToChildGivenCanonical*probNotToChildGivenNonCanonical)
			if(quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/NotToChildCanonical)+(1/NNotToChildCanonical)+(1/NotToChildNonCanonical)+(1/NNotToChildNonCanonical))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if(quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow == 2) {
		return(oddsRatio)
		}
		
}
calcOddsRatio(matrix11,alpha=0.05)	

matrix12 <- matrix(c(NotToChild_Canon, NNotToChild_Canon, NotToChild_NonCanon, NNotToChild_NonCanon), nrow=2, byrow=TRUE)
colnames(matrix12) <- c("Canon","NonCanon")
rownames(matrix12) <- c("NotToChild", "NNotToChild")
print(matrix12)

chisq.test(matrix12)

#odds ratio for matrix12
calcOddsRatio <- function(matrix12,alpha=0.05,referencerow=2,quiet=FALSE){
	numrow <- nrow(matrix12)
	myrownames <-rownames(matrix12)
	
	for (i in 1:numrow){
		rowname <- myrownames[i]
		CanonicalNNotToChild <- matrix12[referencerow,1]
		NonCanonicalNNotToChild <- matrix12[referencerow,2]
		if(i != referencerow) {
			CanonicalNotToChild <- matrix12[i,1]
			NonCanonicalNotToChild <- matrix12[i,2]
			
			totNotToChild <- CanonicalNotToChild + NonCanonicalNotToChild
			totNNotToChild <-CanonicalNNotToChild + NonCanonicalNNotToChild
			
			probCanonicalGivenNotToChild <- CanonicalNotToChild/totNotToChild
			probCanonicalGivenNNotToChild <- CanonicalNNotToChild/totNNotToChild
			probNonCanonicalGivenNotToChild <-NonCanonicalNotToChild/totNotToChild
			probNonCanonicalGivenNNotToChild <-NonCanonicalNNotToChild/totNNotToChild
			
			#calculate the odds ratio
			oddsRatio <- (probCanonicalGivenNotToChild*probNonCanonicalGivenNNotToChild)/(probNonCanonicalGivenNotToChild*probCanonicalGivenNNotToChild)
			
			pp=oddsRatio
			
			if(quiet == FALSE) {
				print(paste("category =", rowname, ", odds ratio =",oddsRatio))
			}
			
			#calculate a confidence interval
			confidenceLevel <- (1 - alpha)*100
			sigma <- sqrt((1/CanonicalNotToChild)+(1/NonCanonicalNotToChild)+(1/CanonicalNNotToChild)+(1/NonCanonicalNNotToChild))
			
			#sigma is the standard error of our estimate of the Log of the odds ratio
			z <- qnorm(1-(alpha/2))
			lowervalue <- oddsRatio * exp(-z * sigma)
			uppervalue <- oddsRatio * exp(z * sigma)
			
			if(quiet == FALSE) {
				print(paste("category = ", rowname, ", ", confidenceLevel, "% confidence interval = [",lowervalue,",",uppervalue,"]"))
			}
		}
	} 
	if (quiet == TRUE && numrow == 2) {
		return(oddsRatio)
		}
		
}


calcOddsRatio(matrix12,alpha=0.05)














