PROGRAM LEAST_SQ
IMPLICIT NONE

INTEGER, PARAMETER :: N=100		
INTEGER :: i

REAL :: a,b,X,Y,sumX,sumY,sumX2,sumXY


OPEN(7,FILE='data_exer1_0.txt')

DO i=1,N
   READ(7,*) X,Y 
   sumX = sumX + X
   sumY = sumY + Y
   sumX2 = sumX2 + X*X
   sumXY = sumXY + X*Y

END DO

a=(sumXY*sumX - sumY*sumX2)/(sumX*sumX - N*sumX2)
b=(sumY*sumX - N*sumXY)/(sumX*sumX - N*sumX2)

PRINT *, 'value of a=',a
PRINT *, 'value of b=',b 
			

END PROGRAM LEAST_SQ