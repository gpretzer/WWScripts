rm(list=ls()); graphics.off()

# setwd('/Users/awarlau/LENAInteraction/GinaWW/')

# seglength = 300
seglength = 30

if (seglength==300){
	mydata = read.csv('/users/ginapretzer/desktop/Gina/direction_analysis.csv')
	# mydata = read.csv('direction_analysis.csv')	
} else if (seglength==30){
	mydata = read.csv('/Users/ginapretzer/Desktop/Gina/FYPAnalysis/countdata02242016.csv')
}

library(lme4)
library(lmerTest)
library(lattice)

if (seglength==300){
	
	# mydata$p[is.na(mydata$p)]=0
	# mydata$b[is.na(mydata$b)]=0
	# mydata$m[is.na(mydata$m)]=0
	# mydata$w[is.na(mydata$w)]=0
	# mydata$f[is.na(mydata$f)]=0
	# mydata$v[is.na(mydata$v)]=0
	# mydata$T[is.na(mydata$T)]=0
	# mydata$D[is.na(mydata$D)]=0
	# mydata$t[is.na(mydata$t)]=0
	# mydata$d[is.na(mydata$d)]=0
	# mydata$s[is.na(mydata$s)]=0
	# mydata$z[is.na(mydata$z)]=0
	# mydata$n[is.na(mydata$n)]=0
	# mydata$l[is.na(mydata$l)]=0
	# mydata$S[is.na(mydata$S)]=0
	# mydata$Z[is.na(mydata$Z)]=0
	# mydata$tS[is.na(mydata$tS)]=0
	# mydata$dZ[is.na(mydata$dZ)]=0
	# mydata$N[is.na(mydata$N)]=0
	# mydata$r[is.na(mydata$r)]=0
	# mydata$j[is.na(mydata$j)]=0 
	# mydata$k[is.na(mydata$k)]=0
	# mydata$g[is.na(mydata$g)]=0
	# mydata$h[is.na(mydata$h)]=0
	# mydata$i[is.na(mydata$i)]=0
	# mydata$E[is.na(mydata$E)]=0
	# mydata$I[is.na(mydata$I)]=0
	# mydata$Brac[is.na(mydata$Brac)]=0
	# mydata$V[is.na(mydata$V)]=0
	# mydata$at[is.na(mydata$at)]=0
	# mydata$u[is.na(mydata$u)]=0
	# mydata$U[is.na(mydata$U)]=0
	# mydata$O[is.na(mydata$O)]=0
	# mydata$A[is.na(mydata$A)]=0
	# mydata$aI[is.na(mydata$aI)]=0
	# mydata$OI[is.na(mydata$OI)]=0
	# mydata$aU[is.na(mydata$aU)]=0
	# mydata$eI[is.na(mydata$eI)]=0
	# mydata$oU[is.na(mydata$oU)]=0
	# mydata$star[is.na(mydata$star)]=0
	# # mydata$Brac[is.na(mydata$Brac)]=0
	# mydata$Intelligible[is.na(mydata$Intelligible)]=0
	
	# Create summary variables
	mydata$TotalAdult = mydata$to_child + mydata$not_to_child
	mydata$ToChildProp = mydata$to_child/mydata$TotalAdult
	mydata$TotalChildUtt = mydata$canonical_utterances + mydata$noncanonical_nonreflexive + mydata$reflexive
	mydata$TotalChildNonReflexive = mydata$canonical_utterances + mydata$noncanonical_nonreflexive
	mydata$CanonUtt = mydata$canonical_utterances
	mydata$CanonUttProp = mydata$CanonUtt/mydata$TotalChildUtt
	mydata$VoicedCons = mydata$b + mydata$m + mydata$w + mydata$v + mydata$D + mydata$d + mydata$z + mydata$n + mydata$l + mydata$Z + mydata$dZ + mydata$N + mydata$r + mydata$j + mydata$g 
	mydata$VoicelessCons = mydata$p + mydata$f + mydata$T + mydata$t + mydata$s + mydata$S + mydata$tS + mydata$k + mydata$h
	mydata$Consonants = mydata$VoicelessCons + mydata$VoicedCons
	mydata$Vowels = mydata$i + mydata$I + mydata$E + mydata$Brac + mydata$V + mydata$at + mydata$u + mydata$U + mydata$O + mydata$A
	mydata$Diphthongs = mydata$aI + mydata$OI + mydata$aU + mydata$eI + mydata$oU
	mydata$Intelligible = mydata$VoicelessCons + mydata$VoicedCons + mydata$Vowels + mydata$Diphthongs
	mydata$TotalSounds = mydata$Intelligible + mydata$star
	mydata$StopCons = mydata$b + mydata$p + mydata$t + mydata$d + mydata$k + mydata$g
	mydata$NasalCons = mydata$m + mydata$n + mydata$N
	mydata$GlideCons = mydata$w + mydata$j
	mydata$FricCons = mydata$f + mydata$v + mydata$T + mydata$D + mydata$s + mydata$z + mydata$h
	mydata$ConsProp = mydata$Consonants/mydata$TotalSounds
	mydata$VowelsProp = mydata$Vowels/mydata$TotalSounds
	mydata$DiphthongsProp = mydata$Diphthongs/mydata$TotalSounds
	mydata$StopConsProp = mydata$StopCons/mydata$TotalSounds
	mydata$NasalConsProp = mydata$NasalCons/mydata$TotalSounds
	mydata$GlideConsProp = mydata$GlideCons/mydata$TotalSounds
	mydata$FricConsProp = mydata$FricCons/mydata$TotalSounds
	
} else if (seglength==30){
	# Create summary variables
	mydata$TotalAdult = mydata$ToChild + mydata$NotToChild + mydata$Unknown
	mydata$ToChildProp = mydata$ToChild/mydata$TotalAdult
	mydata$TotalChildUtt = mydata$Canonical + mydata$NonCanonNonReflex + mydata$Reflexive
	mydata$TotalChildNonReflexive = mydata$Canonical + mydata$NonCanonNonReflex
	mydata$CanonicalProp = mydata$Canonical/mydata$TotalChildUtt
}

if (seglength==300){
	# Run mixed effects models to see how adult behavior is predicted by child behavior

	mylm=lmer(to_child~(1|InfantID)+canonical_utterances+noncanonical_nonreflexive+reflexive,data=mydata)
	summary(mylm)
	
	mylm=lmer(not_to_child~(1|InfantID)+canonical_utterances+noncanonical_nonreflexive+reflexive,data=mydata)
	summary(mylm)
	
	mylm=lmer(ToChildProp~(1|InfantID)+canonical_utterances+noncanonical_nonreflexive+reflexive,data=mydata)
	summary(mylm)
	
	mylm=lmer(to_child~(1|InfantID)+TotalChildUtt,data=mydata)
	summary(mylm)
	
	mylm=lmer(not_to_child~(1|InfantID)+TotalChildUtt,data=mydata)
	summary(mylm)
	
	mylm=lmer(to_child~(1|InfantID)+CanonUttProp,data=mydata)
	summary(mylm)
	
	mylm=lmer(not_to_child~(1|InfantID)+CanonUttProp,data=mydata)
	summary(mylm)	
	
	mylm=lmer(ToChildProp~(1|InfantID)+CanonUttProp,data=mydata)
	summary(mylm)
	
	conslm=lmer(ToChildProp~(1|InfantID)+Consonants,data=mydata)
	summary(conslm)
	
	vowlm=lmer(ToChildProp~(1|InfantID)+Vowels,data=mydata)
	summary(vowlm)
	
	consproplm=lmer(ToChildProp~(1|InfantID)+ConsProp,data=mydata)
	summary(consproplm)
	
	vconslm=lmer(ToChildProp~(1|InfantID)+VoicedCons,data=mydata)
	summary(vconslm)
	
	vlconslm=lmer(ToChildProp~(1|InfantID)+VoicelessCons,data=mydata)
	summary(vlconslm)
	
	vlconstotallm=lmer(to_child~(1|InfantID)+VoicelessCons,data=mydata)
	summary(vlconstotallm)
	
	vlconsnclm=lmer(not_to_child~(1|InfantID)+VoicelessCons,data=mydata)
	summary(vlconsnclm)
	
	mylm=lmer(adult_words~(1|InfantID)+CanonUttProp,data=mydata)
	summary(mylm)
	
	mylm=lmer(adult_words~(1|InfantID)+ConsProp,data=mydata)
	summary(mylm)
	
	mylm=lmer(adult_words~(1|InfantID)+VoicelessCons,data=mydata)
	summary(mylm)
	
	mylm=lmer(adult_words~(1|InfantID)+TotalChildUtt,data=mydata)
	summary(mylm)
	
	mylm=lmer(adult_words~(1|InfantID)+Consonants,data=mydata)
	summary(mylm)
	
	mylm=lmer(adult_words~(1|InfantID)+CanonUttProp,data=mydata)
	summary(mylm)
	
	plot(mydata$TotalChildUtt, mydata$adult_words) 
	
	plot(mydata$VoicelessCons, mydata$ToChildProp)
	
	mylm=lmer(adult_words~(1|InfantID)+TotalChildNonReflexive,data=mydata)
	summary(mylm)
	
	mylm=lmer(not_to_child~(1|InfantID)+TotalChildNonReflexive,data=mydata)
	summary(mylm)
	
	mylm=lmer(to_child~(1|InfantID)+TotalChildNonReflexive,data=mydata)
	summary(mylm)
	
	
	# Run statistical tests to see how child behavior differs between locomotor groups
	
	mylm = glmer(Locomotor~(1|InfantID)+canonical_utterances+noncanonical_nonreflexive+reflexive+to_child+not_to_child,dat=mydata,family=binomial)
	summary(mylm)
	
	mylm = glmer(Locomotor~(1|InfantID)+canonical_utterances+noncanonical_nonreflexive+reflexive,dat=mydata,family=binomial)
	summary(mylm)
	
	mylm = glmer(Locomotor~(1|InfantID)+to_child+not_to_child,dat=mydata,family=binomial)
	summary(mylm)
	
} else if (seglength==30){
	
	# Test whether child vocalization categories predict child directed adult utterances
	mylm = glmer(ToChild~(1|InfantID)+scale(Canonical)+scale(NonCanonNonReflex)+scale(Reflexive),dat=mydata,family=poisson)
	print(summary(mylm))
	myplot = xyplot(ToChild~Canonical | InfantID,groups = InfantID,data=mydata,type=c('p','r'))
	print(myplot)
	quartz.save("ToChild_vs_Canonical.pdf",type="pdf")
	myplot = xyplot(ToChild~NonCanonNonReflex | InfantID,groups = InfantID,data=mydata,type=c('p','r'))
	print(myplot)
	quartz.save("ToChild_vs_NonCanonNonReflex.pdf",type="pdf")
	myplot = xyplot(ToChild~Reflexive | InfantID,groups = InfantID,data=mydata,type=c('p','r'))
	print(myplot)
	quartz.save("ToChild_vs_Reflexive.pdf",type="pdf")
	
	# Test whether child vocalization categories predict not child directed adult utterances
	mylm = glmer(NotToChild~(1|InfantID)+scale(Canonical)+scale(NonCanonNonReflex)+scale(Reflexive),dat=mydata,family=poisson)
	print(summary(mylm))
	myplot = xyplot(NotToChild~Canonical | InfantID,groups = InfantID,data=mydata,type=c('p','r'))
	print(myplot)
	quartz.save("NotToChild_vs_Canonical.pdf",type="pdf")
	myplot = xyplot(NotToChild~NonCanonNonReflex | InfantID,groups = InfantID,data=mydata,type=c('p','r'))
	print(myplot)
	quartz.save("NotToChild_vs_NonCanonNonReflex.pdf",type="pdf")
	myplot = xyplot(NotToChild~Reflexive | InfantID,groups = InfantID,data=mydata,type=c('p','r'))
	print(myplot)
	quartz.save("NotToChild_vs_Reflexive.pdf",type="pdf")
	
	
	# Including random slope for total child utterances:
	mylm = glmer(ToChild~(TotalChildUtt|InfantID)+scale(Canonical)+scale(NonCanonNonReflex)+scale(Reflexive),dat=mydata,family=poisson)
	print(summary(mylm))
	mylm = glmer(NotToChild~(TotalChildUtt|InfantID)+scale(Canonical)+scale(NonCanonNonReflex)+scale(Reflexive),dat=mydata,family=poisson)
	print(summary(mylm))
	
	# Test for interactions between locomotor status and relationship between infant vocal types and adult utterance types
	mylm = glmer(ToChild~(1|InfantID)+scale(Canonical)*Locomotor+scale(NonCanonNonReflex)*Locomotor+scale(Reflexive)*Locomotor,dat=mydata,family=poisson)
	print(summary(mylm))
	mylm = glmer(NotToChild~(1|InfantID)+scale(Canonical)*Locomotor+scale(NonCanonNonReflex)*Locomotor+scale(Reflexive)*Locomotor,dat=mydata,family=poisson)
	print(summary(mylm))
	# Follow ups:
	mylm = glmer(ToChild~(1|InfantID)+(Canonical)+(NonCanonNonReflex)+(Reflexive),dat=subset(mydata,Locomotor=="walker"),family=poisson)
	print(summary(mylm))
	mylm = glmer(ToChild~(1|InfantID)+(Canonical)+(NonCanonNonReflex)+(Reflexive),dat=subset(mydata,Locomotor=="crawler"),family=poisson)
	print(summary(mylm))
	mylm = glmer(NotToChild~(1|InfantID)+(Canonical)+(NonCanonNonReflex)+(Reflexive),dat=subset(mydata,Locomotor=="walker"),family=poisson)
	print(summary(mylm))
	mylm = glmer(NotToChild~(1|InfantID)+(Canonical)+(NonCanonNonReflex)+(Reflexive),dat=subset(mydata,Locomotor=="crawler"),family=poisson)
	print(summary(mylm))
	
	# Aggregate data for each subject
	sumdata = aggregate(cbind(Canonical,NonCanonNonReflex,Reflexive,ToChild,NotToChild,CDIR,CDIP)~InfantID,mydata,FUN=sum)
	sumdata$Locomotor = aggregate(Locomotor~InfantID,mydata,head,1)$Locomotor
	
	# Test for differences between locomotor groups
	mylm = glm(Locomotor~scale(Canonical)+scale(NonCanonNonReflex)+scale(Reflexive)+scale(ToChild)+scale(NotToChild),dat=sumdata,family=binomial)
	summary(mylm)
	
	# Test for interactions between locomotor status and adult vocalization direction on CDI scores 
	mylm = lm(scale(CDIR)~scale(ToChild)*Locomotor+scale(NotToChild)*Locomotor,dat=sumdata)
	summary(mylm)
	mylm = lm(scale(CDIP)~scale(ToChild)*Locomotor+scale(NotToChild)*Locomotor,dat=sumdata)
	summary(mylm)
		
	# Test for interactions between locomotor status and child vocalization types on CDI scores
	mylm = lm(scale(CDIR)~scale(Canonical)*Locomotor+scale(NonCanonNonReflex)*Locomotor+scale(Reflexive)*Locomotor,dat=sumdata)
	summary(mylm)
	mylm = lm(scale(CDIP)~scale(Canonical)*Locomotor+scale(NonCanonNonReflex)*Locomotor+scale(Reflexive)*Locomotor,dat=sumdata)
	summary(mylm)
	
}

graphics.off()


