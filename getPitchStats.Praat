form Get pitch statistics for file
	sentence File_path_and_name
endform

Read from file: file_path_and_name$
intensity = Get intensity (dB)
To Pitch... 0 75 1000
meanf0Hz = Get mean... 0 0 Hertz
meanf0mel = Get mean... 0 0 mel
stdf0mel = Get standard deviation... 0 0 mel

writeInfoLine: intensity, ",", meanf0Hz, ",", meanf0mel, ",", stdf0mel
