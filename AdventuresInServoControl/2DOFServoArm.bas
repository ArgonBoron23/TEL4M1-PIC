;2DOFServoArm
;A program to operate two servos (in a robotic arm) using a PIC 20x2 and a 2-axis joystick
;By: Arjun Bhatia


init: ;variable initialisation 

	;Input, change, output, and in/out pin variables for up-down motion
	symbol inY = b0
	symbol dY = b2
	symbol outY = b4
	symbol inPinY = B.2
	symbol outPinY = B.7 

	;Input, change, output, and in/out pin variables for horizontal plane motion
	symbol inX = b1
	symbol dX = b3
	symbol outX = b5
	symbol inPinX = B.1
	symbol outPinX = B.6

	;Initialises servos
	servo B.7, 168	; Set the servo to its starting position
	servo B.6, 168	; Set the servo to its starting position
	pause 500

	;other variables for timing, speed, and input value threshold 
	symbol inDiv = b6
	inDiv = 20
	symbol loopDelay = b7
	loopDelay = 7
	symbol inHigh = b8
	symbol inLow = b9
	inHigh = 140
	inLow = 110

goto main:



main: ;main program loop

	;reset change variables to 0
	dY = 0
	dX = 0
	
	;take analog input from joysticks
	readadc inPinY, inY
	readadc inPinX, inX
	
	;use gosub methods
	gosub modInput
	gosub correctValues
	gosub changePos
	
	;loop pause
	pause loopDelay

goto main



modInput: ;use input values from joystick and calculate an output value for the servos

	;for vertical
	if inY > inHigh then
		dY = inY - inHigh
		dY = dY / inDiv
		outY = outY + dY
	elseif inY < inLow then
		dY = inLow - inY
		dY = dY / inDiv
		outY = outY - dY		
	end if

	;for horizontal 
	if inX > inHigh then
		dX = inX - inHigh
		dX = dX / inDiv
		outX = outX + dY
	elseif inX < inLow then
		dX = inLow - inX
		dX = dX / inDiv
		outY = outY - dX		
	end if

return



correctValues: ;limit output to values between 76 and 250

	;corrects vertical values
	if outY >250 then
		outY = 249
	elseif outY < 76 then
		outY = 77
	end if

	;corrects horizontal values
	if outX >250 then
		outX = 249
	elseif outX < 76 then
		outX = 77
	end if

return



changePos: ;outputs values to servos

	servopos outPinY,outY
	servopos outPinX,outX
	
return