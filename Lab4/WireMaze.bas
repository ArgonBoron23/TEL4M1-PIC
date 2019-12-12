res:
symbol counter = b2
counter = 0

goto init

init:

symbol led1 = C.4
symbol led2 = C.3
symbol led3 = C.2
symbol led4 = C.1
symbol led5 = C.0
symbol speaker = C.5

symbol in = B.7
symbol win = B.4

symbol multiplier = 20

symbol t1 = multiplier * 1
symbol t2 = multiplier * 2
symbol t3 = multiplier * 3
symbol t4 = multiplier * 4
symbol t5 = multiplier * 5

gosub failinit

main:
inc b2

if b2 >= t1 then
gosub add1
end if

if b2 >= t2 then
gosub add2
end if

if b2 >= t3 then
gosub add3
end if

if b2 >= t4 then
gosub add4
end if

if b2 >= t5 then
gosub add5
end if

if b2 > t5 then
goto finalfailure
end if

button in,1,200,100,b5,1,failure

button win,1,200,100,b6,1,winning

pause 100

goto main


add1:
low led1
return


add2:
low led2
return


add3:
low led3
return


add4:
low led4
return


add5:
low led5
return


failinit:
high led1
high led2
high led3
high led4
high led5

return


failure:
gosub failinit

gosub faillights

goto main


finalfailure:
gosub faillights
tune C.5, 8, ($20,$2,$36,$55,$20)
stop


faillights:

toggle led1
pause 5
toggle led4
pause 2
toggle led5
pause 2
toggle led2
pause 7
toggle led4
toggle led5
pause 10
toggle led2
toggle led3
pause 16
toggle led1
pause 12
toggle led2
toggle led3
pause 5
toggle led1
pause 5
toggle led2
tune C.5, 5, ($20,$2,$36)
pause 20
toggle led5
pause 1
toggle led2
pause 7
toggle led4
toggle led2
pause 1
toggle led5
toggle led3
pause 16
toggle led1
pause 1
toggle led1
toggle led3
pause 7

gosub failinit

return


winning:

low led1
low led2
low led3
low led4
low led5

toggle led1
pause 5
toggle led2
pause 5
toggle led3
pause 5
toggle led4
pause 5
toggle led5
pause 50

toggle led5
pause 5
toggle led4
pause 5
toggle led3
pause 5
toggle led2
pause 5
toggle led1
pause 5

tune C.5, 3, ($20,$22,$E4,$E7,$E4,$22,$A0,$24,$27,$E9,$C0,$EB,$27,$E4,$65,$64,$E2,$20,$22,$E4,$E7,$E4,$22,$A0,$24,$27,$A9,$29,$27,$24,$A2,$CC,$A0)

stop