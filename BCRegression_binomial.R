library(lme4)
library(lmerTest)
library(car)

for (pausedur in c(1,2,5)){
  
  sink(paste("BCRegression_binomial_output_",pausedur,"sec.txt",sep=""))
  
  eventcodes <- read.csv(paste("eventcodes",pausedur,"sec.csv",sep=""), header = TRUE)
  
  
  # Regression Models with IDS or ODS as Event 2
  IDSfollow <- glmer(Event2T ~ (1|InfantID) + Event1C + Event1X + Event1R, dat=eventcodes, family=binomial())
  print(summary(IDSfollow))
  print(confint(IDSfollow, level=0.999))
  
  ODSfollow <- glmer(Event2N ~ (1|InfantID) + Event1C + Event1X + Event1R, dat=eventcodes, family=binomial())
  print(summary(ODSfollow))
  print(confint(ODSfollow, level=0.999))
  
  
  # Regression Models with IDS or ODS as Event 1
  IDSled <- glmer(Event1T ~ (1|InfantID) + Event2C + Event2X + Event2R, dat=eventcodes, family=binomial())
  print(summary(IDSled))
  print(confint(IDSled, level=0.999))
  
  ODSled <- glmer(Event1N ~ (1|InfantID) + Event2C + Event2X + Event2R, dat=eventcodes, family=binomial())
  print(summary(ODSled))
  print(confint(ODSled, level=0.999))
  
  
  # Regression models that compare infant codes
  
  if (pausedur == 1){
    
    TEvent1CvXReg <- glmer(Event2T ~ (1|InfantID) + Event1CvX, dat=eventcodes, family=binomial())
    print(summary(TEvent1CvXReg))
    
    TEvent1RvXReg <- glmer(Event2T ~ (1|InfantID) + Event1RvX, dat=eventcodes, family=binomial())
    print(summary(TEvent1RvXReg))
    
    TEvent1RvCReg <- glmer(Event2T ~ (1|InfantID) + Event1RvC, dat=eventcodes, family=binomial())
    print(summary(TEvent1RvCReg))
    
    TEvent2CvXReg <- glmer(Event1T ~ (1|InfantID) + Event2CvX, dat=eventcodes, family=binomial())
    print(summary(TEvent2CvXReg))
    
    TEvent2RvXReg <- glmer(Event1T ~ (1|InfantID) + Event2RvX, dat=eventcodes, family=binomial())
    print(summary(TEvent2RvXReg))
    
    TEvent2RvCReg <- glmer(Event1T ~ (1|InfantID) + Event2RvC, dat=eventcodes, family=binomial())
    print(summary(TEvent2RvCReg))
    
  } else if (pausedur == 2){
    
    TEvent1CvXReg <- glmer(Event2T ~ (1|InfantID) + Event1CvX, dat=eventcodes, family=binomial())
    print(summary(TEvent1CvXReg))
    
    TEvent1RvXReg <- glmer(Event2T ~ (1|InfantID) + Event1RvX, dat=eventcodes, family=binomial())
    print(summary(TEvent1RvXReg))
    
    TEvent1RvCReg <- glmer(Event2T ~ (1|InfantID) + Event1RvC, dat=eventcodes, family=binomial())
    print(summary(TEvent1RvCReg))
    
    NEvent1RvXReg <- glmer(Event2N ~ (1|InfantID) + Event1RvX, dat=eventcodes, family=binomial())
    print(summary(NEvent1RvXReg))
    
    NEvent1CvXReg <- glmer(Event2N ~ (1|InfantID) + Event1CvX, dat=eventcodes, family=binomial())
    print(summary(NEvent1CvXReg))
    
    TEvent2RvXReg <- glmer(Event1T ~ (1|InfantID) + Event2RvX, dat=eventcodes, family=binomial())
    print(summary(TEvent2RvXReg))
    
    TEvent2RvCReg <- glmer(Event1T ~ (1|InfantID) + Event2RvC, dat=eventcodes, family=binomial())
    print(summary(TEvent2RvCReg))
    
    NEvent2RvXReg <- glmer(Event1N ~ (1|InfantID) + Event2RvX, dat=eventcodes, family=binomial())
    print(summary(NEvent2RvXReg))
    
    NEvent2CvXReg <- glmer(Event1N ~ (1|InfantID) + Event2CvX, dat=eventcodes, family=binomial())
    print(summary(NEvent2CvXReg))
    
  } else if (pausedur == 5){
    
    TEvent1RvXReg <- glmer(Event2T ~ (1|InfantID) + Event1RvX, dat=eventcodes, family=binomial())
    print(summary(TEvent1RvXReg))
    
    TEvent1RvCReg <- glmer(Event2T ~ (1|InfantID) + Event1RvC, dat=eventcodes, family=binomial())
    print(summary(TEvent1RvCReg))
    
    NEvent1CvXReg <- glmer(Event2N ~ (1|InfantID) + Event1CvX, dat=eventcodes, family=binomial())
    print(summary(NEvent1CvXReg))
    
    NEvent1RvXReg <- glmer(Event2N ~ (1|InfantID) + Event1RvX, dat=eventcodes, family=binomial())
    print(summary(NEvent1RvXReg))

    NEvent1RvCReg <- glmer(Event2N ~ (1|InfantID) + Event1RvC, dat=eventcodes, family=binomial())
    print(summary(NEvent1RvCReg))

    TEvent2RvXReg <- glmer(Event1T ~ (1|InfantID) + Event2RvX, dat=eventcodes, family=binomial())
    print(summary(TEvent2RvXReg))

    TEvent2RvCReg <- glmer(Event1T ~ (1|InfantID) + Event2RvC, dat=eventcodes, family=binomial())
    print(summary(TEvent2RvCReg))

    NEvent2CvXReg <- glmer(Event1N ~ (1|InfantID) + Event2CvX, dat=eventcodes, family=binomial())
    print(summary(NEvent2CvXReg))

    NEvent2RvXReg <- glmer(Event1N ~ (1|InfantID) + Event2RvX, dat=eventcodes, family=binomial())
    print(summary(NEvent2RvXReg))

    NEvent2RvCReg <- glmer(Event1N ~ (1|InfantID) + Event2RvC, dat=eventcodes, family=binomial())
    print(summary(NEvent2RvCReg))
    
  }
  
  sink()
  
}
