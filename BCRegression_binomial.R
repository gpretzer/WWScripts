# setwd("/Volumes/Research/WWTranscription/WWScripts/Regression/")

library(lme4)
library(lmerTest)
library(car)

eventcodes <- read.csv("eventcodes1sec06292017.csv", header = TRUE)
# eventcodes <- read.csv("eventcodes2sec06292017.csv", header = TRUE)
# eventcodes <- read.csv("eventcodes5sec06292017.csv", header = TRUE)


# Regression Models with IDS or ODS as Event 2
IDSfollow <- glmer(Event2T ~ (1|InfantID) + Event1C + Event1X + Event1R, dat=eventcodes, family=binomial())
summary(IDSfollow)
confint(IDSfollow, level=0.999)

ODSfollow <- glmer(Event2N ~ (1|InfantID) + Event1C + Event1X + Event1R, dat=eventcodes, family=binomial())
summary(ODSfollow)
confint(ODSfollow, level=0.999)


# Regression Models with IDS or ODS as Event 1
IDSled <- glmer(Event1T ~ (1|InfantID) + Event2C + Event2X + Event2R, dat=eventcodes, family=binomial())
summary(IDSled)
confint(IDSled, level=0.999)

ODSled <- glmer(Event1N ~ (1|InfantID) + Event2C + Event2X + Event2R, dat=eventcodes, family=binomial())
summary(ODSled)
confint(ODSled, level=0.999)


# Regression models that compare infant codes

# # 1s 
TEvent1CvXReg <- glmer(Event2T ~ (1|InfantID) + Event1CvX, dat=eventcodes, family=binomial())
summary(TEvent1CvXReg)

TEvent1RvXReg <- glmer(Event2T ~ (1|InfantID) + Event1RvX, dat=eventcodes, family=binomial())
summary(TEvent1RvXReg)

TEvent1RvCReg <- glmer(Event2T ~ (1|InfantID) + Event1RvC, dat=eventcodes, family=binomial())
summary(TEvent1RvCReg)

TEvent2CvXReg <- glmer(Event1T ~ (1|InfantID) + Event2CvX, dat=eventcodes, family=binomial())
summary(TEvent2CvXReg)

TEvent2RvXReg <- glmer(Event1T ~ (1|InfantID) + Event2RvX, dat=eventcodes, family=binomial())
summary(TEvent2RvXReg)

TEvent2RvCReg <- glmer(Event1T ~ (1|InfantID) + Event2RvC, dat=eventcodes, family=binomial())
summary(TEvent2RvCReg)

# # 2s
# TEvent1CvXReg <- glmer(Event2T ~ (1|InfantID) + Event1CvX, dat=eventcodes, family=binomial())
# summary(TEvent1CvXReg)

# TEvent1RvXReg <- glmer(Event2T ~ (1|InfantID) + Event1RvX, dat=eventcodes, family=binomial())
# summary(TEvent1RvXReg)

# TEvent1RvCReg <- glmer(Event2T ~ (1|InfantID) + Event1RvC, dat=eventcodes, family=binomial())
# summary(TEvent1RvCReg)

# NEvent1RvXReg <- glmer(Event2N ~ (1|InfantID) + Event1RvX, dat=eventcodes, family=binomial())
# summary(NEvent1RvXReg)

# NEvent1CvXReg <- glmer(Event2N ~ (1|InfantID) + Event1CvX, dat=eventcodes, family=binomial())
# summary(NEvent1CvXReg)

# TEvent2RvXReg <- glmer(Event1T ~ (1|InfantID) + Event2RvX, dat=eventcodes, family=binomial())
# summary(TEvent2RvXReg)

# TEvent2RvCReg <- glmer(Event1T ~ (1|InfantID) + Event2RvC, dat=eventcodes, family=binomial())
# summary(TEvent2RvCReg)

# NEvent2RvXReg <- glmer(Event1N ~ (1|InfantID) + Event2RvX, dat=eventcodes, family=binomial())
# summary(NEvent2RvXReg)

# NEvent2CvXReg <- glmer(Event1N ~ (1|InfantID) + Event2CvX, dat=eventcodes, family=binomial())
# summary(NEvent2CvXReg)



# 5s
# TEvent1RvXReg <- glmer(Event2T ~ (1|InfantID) + Event1RvX, dat=eventcodes, family=binomial())
# summary(TEvent1RvXReg)
# 
# TEvent1RvCReg <- glmer(Event2T ~ (1|InfantID) + Event1RvC, dat=eventcodes, family=binomial())
# summary(TEvent1RvCReg)
# 
# NEvent1CvXReg <- glmer(Event2N ~ (1|InfantID) + Event1CvX, dat=eventcodes, family=binomial())
# summary(NEvent1CvXReg)
# 
# NEvent1RvXReg <- glmer(Event2N ~ (1|InfantID) + Event1RvX, dat=eventcodes, family=binomial())
# summary(NEvent1RvXReg)
# 
# NEvent1RvCReg <- glmer(Event2N ~ (1|InfantID) + Event1RvC, dat=eventcodes, family=binomial())
# summary(NEvent1RvCReg)
# 
# TEvent2RvXReg <- glmer(Event1T ~ (1|InfantID) + Event2RvX, dat=eventcodes, family=binomial())
# summary(TEvent2RvXReg)
# 
# TEvent2RvCReg <- glmer(Event1T ~ (1|InfantID) + Event2RvC, dat=eventcodes, family=binomial())
# summary(TEvent2RvCReg)
# 
# NEvent2CvXReg <- glmer(Event1N ~ (1|InfantID) + Event2CvX, dat=eventcodes, family=binomial())
# summary(NEvent2CvXReg)
# 
# NEvent2RvXReg <- glmer(Event1N ~ (1|InfantID) + Event2RvX, dat=eventcodes, family=binomial())
# summary(NEvent2RvXReg)
# 
# NEvent2RvCReg <- glmer(Event1N ~ (1|InfantID) + Event2RvC, dat=eventcodes, family=binomial())
# summary(NEvent2RvCReg)
