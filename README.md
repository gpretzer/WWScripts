# WWScripts
R Code for the WWTranscription project.

runanalyses.R: Run this to recode the transcriptions into categories for analysis, construct an event series based on the utterance time series (dealing with pauses and overlaps), and then create pairs of consecutive events. Outputs a sequencecodesXsec.csv file, calling the following functions:

1. spkrcode.R: Recodes more detailed transcriptions (exported from ELAN) into single-character codes particular to the analyses for this project. Transcription instructions are available here: https://drive.google.com/folderview?id=0B7TInaKaaLhcflBDeEMyc3Z4bklMdW1nNUJmQzVlVnl5LUxyaEVPZl8tSHMyY0gzWTI3Q2c&usp=sharing

2. pauseoverlap.R: Converts the ordered annotations to a sequence of non-overlapping events, with pause events inserted.

3. sequenceevents.R: Converts the sequence of non-overlapping events that was output by pauseOverlap.R into a series of two-event sequences. For example, C,C,P,X,T,X,N would be converted to CC,CP,PX,XT,TX,XN.

recodeSeqCodes.R: Adds columns to the output runanalyses.R that make it easier to do the binomial regression analyses.

BCRegression_binomial.R: Runs binomial regressions to test for sequential contingencies.

BCOddsRatio.R: Has code for odds ratio analyses used in previous stages of the project but not included in the paper.

getPitchStats.R: Does pitch analyses of the adult vocalizations.

(There is also code for calculating descriptive and reliability statistics that should be added.)
