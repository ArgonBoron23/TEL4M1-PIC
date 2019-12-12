init: 


symbol pinA = B.0
symbol pinB = B.1
symbol pinC = C.7
symbol pinD = C.0
symbol pinE = C.5
symbol pinF = B.2
symbol pinG = B.3
symbol waittime = 500
goto main

main:
gosub n0
pause waittime
gosub n1
pause waittime
gosub n2
pause waittime
gosub n3
pause waittime
gosub n4
pause waittime
gosub n5
pause waittime
gosub n6
pause waittime
gosub n7
pause waittime
gosub n8
pause waittime
gosub n9
pause waittime
goto main

n0:
low pinA
low pinB
low pinC
low pinD
low pinE
low pinF
high pinG
return

n1:
high pinA
low pinB
low pinC
high pinD
high pinE
high pinF
high pinG
return

n2:
low pinA
low pinB
high pinC
low pinD
low pinE
high pinF
low pinG
return

n3:
low pinA
low pinB
low pinC
low pinD
high pinE
high pinF
low pinG
return

n4:
high pinA
low pinB
low pinC
high pinD
high pinE
low pinF
low pinG
return

n5:
low pinA
high pinB
low pinC
low pinD
high pinE
low pinF
low pinG
return


n6:
low pinA
high pinB
low pinC
low pinD
low pinE
low pinF
low pinG
return

n7:
low pinA
low pinB
low pinC
high pinD
high pinE
high pinF
high pinG
return

n8:
low pinA
low pinB
low pinC
low pinD
low pinE
low pinF
low pinG
return

n9:
low pinA
low pinB
low pinC
high pinD
high pinE
low pinF
low pinG
return