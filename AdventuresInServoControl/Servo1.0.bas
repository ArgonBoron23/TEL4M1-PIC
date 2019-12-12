servo B.7, 168	; Set the servo to its starting position
pause 500
symbol vertPos1 = b1
symbol vertPos2 = b5
symbol horiPos = b0
symbol vertOut = b2
symbol vertChange = b3

vertOut = 168

main: 
	
	
	readadc B.2, vertPos1
	debug vertPos1
	
	readadc B.0, horiPos
	debug horiPos
	gosub changePos
	
	if vertPos1 > 140 then
		vertChange = vertPos1 - 135
		vertChange = vertChange / 8
		vertOut = vertOut + vertChange

	elseif vertPos1 < 110 then
		vertChange = 115 - vertPos1
		vertChange = vertChange / 8
		vertOut = vertOut - vertChange
	
      else
		vertChange = 0
		
	end if

	debug vertOut
		;vertChange = vertPos2 / 5
	
	;limit output to values between 81 and 240
	if vertOut >240 then
		vertOut = 239
	elseif vertOut < 76 then
		vertOut = 77
	end if
		
	gosub changePos



goto main		; Repeat from start position

changePos:

	for b6 = 1 to 20
	SERVOPOS B.7,vertOut
	next b6

	pause 2
return