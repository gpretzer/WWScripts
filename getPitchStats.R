library(tuneR)
setwd('/Users/awarlau/Google Drive/Work/GitRepos/WWScripts/')
uttWav = readWave('exampleUtt.wav')

praatOutput = system2('/Applications/Praat.app/Contents/MacOS/Praat',args = "--run getPitchStats.Praat '/Users/awarlau/Google Drive/Work/GitRepos/WWScripts/exampleUtt.wav'",stdout = TRUE)

# Audio files are in WWwavFiles in our Gina Box folder
# ELAN export files are in WWtxtFiles in Gina Box folder