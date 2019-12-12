init:
symbol redEW = B.0
symbol yellowEW = B.2
symbol greenEW = B.3
symbol handEW = B.1
symbol walkEW = B.4

symbol redNS = C.4
symbol yellowNS = C.2
symbol greenNS = C.1
symbol handNS = C.3
symbol walkNS = C.0

goto main


main:
gosub ewstop
gosub nsstop
pause 3000

gosub ewgo
pause 5000

gosub ewslow

gosub ewstop
pause 3000

gosub nsgo
pause 5000

gosub nsslow

goto main



;red traffic light, pedestrian stop (east-west)
ewstop:

high redEW 
low yellowEW
low greenEW

high handEW 
low walkEW 

return


;red traffic light, pedestrian stop (north-south)
nsstop:

high redNS 
low yellowNS 
low greenNS

high handNS 
low walkNS

return


;green traffic light, pedestrian go (east-west)
ewgo:

low redEW 
low yellowEW
high greenEW

low handEW 
high walkEW 

return


;green traffic light, pedestrian go (north-south)
nsgo:

low redNS
low yellowNS
high greenNS

low handNS
high walkNS

return


;yellow traffic light, blinking pedestrian hand (east-west)
ewslow:

low redEW 
high yellowEW
low greenEW

low walkEW 

for b0 = 1 to 15	
if b0 > 20 then exit
toggle handEW 
pause 300			
next b0		

return

;Yellow traffic light , blinking pedestrial light
nsslow:

low redNS
high yellowNS
low greenNS

low walkNS 

for b1 = 1 to 15
if b1 > 20 then exit
toggle handNS 
pause 300			
next b1		

return
