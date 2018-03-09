# WWScripts
R Code for the WWTranscription project.

runanalyses.R: Run this to recode the transcriptions into categories for analysis, construct an event series based on the utterance time series (dealing with pauses and overlaps), and then create pairs of consecutive events.

spkrcode.R: Recodes more detailed transcriptions (exported from ELAN) into single-character codes particular to the analyses for this project. Transcription instructions are available here: https://drive.google.com/folderview?id=0B7TInaKaaLhcflBDeEMyc3Z4bklMdW1nNUJmQzVlVnl5LUxyaEVPZl8tSHMyY0gzWTI3Q2c&usp=sharing

pauseoverlap.R: Converts the ordered annotations to a sequence of non-overlapping events, with pause events inserted.

sequenceevents.R: Converts the sequence of non-overlapping events that was output by pauseOverlap.R into a series of two-event sequences. For example, C,C,P,X,T,X,N would be converted to CC,CP,PX,XT,TX,XN.

Regression folder: Contains R code for the regression-based inferential stats for this project, as well as the sequencecodes.csv data file on which those analyses are based. (Needs to be updated)

Reliability folder: Contains R and Python code for calculating the reliability of the human judgments for this project. (Needs to be cleaned up and/or updated)

(There is also code for calculating descriptive statistics, doing odds ratio analyses, making plots, etc. that should be added.)
