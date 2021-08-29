PROGRAM TEST
IMPLICIT NONE

REAL, ALLOCATABLE,DIMENSION(:)		::	X, Y 
INTEGER								::	I,N
INTEGER, PARAMETER					::	N_MAX=200
REAL, PARAMETER						::	H=0.5

!---------------------------CALL FUNCTIOON DPN -------------------------------
 N=DPN(N_MAX)
!-----------------------------------------------------------------------------
ALLOCATE( X(N),Y(N))
		
OPEN(10,FILE='data_exer1_30.txt')
	DO I=1,N
	READ(10,*) X(I),Y(I)
	END DO
CLOSE(10)
CALL LIN_INTERPOL(X,Y,N,H)

 CONTAINS

 !********************FUNC TO COUNT NO DO DATA POINTS*************************
 	FUNCTION DPN(N_MAX)
	IMPLICIT NONE
		
	INTEGER		::	I,IO, N_MAX, DPN
	REAL		::  X(N_MAX),Y(N_MAX)
	
	OPEN(10,FILE='data_exer1_30.txt')
	READ(10, *, IOSTAT = IO ) ( X(I),Y(I), I = 1, N_MAX )
		IF (IO < 0) THEN
			  DPN = I - 1
		ELSE 
		DPN = N_MAX	
		END IF
	CLOSE(10)
	PRINT *, 'NO OF THE DATA POINTS ARE = ',DPN
	END FUNCTION DPN

!*************************************************************************************
							
 SUBROUTINE LIN_INTERPOL(X,Y,N,H)				! X = x data,	Y= y data, N = no of data points,	H= step size,	F= interpolated function
  IMPLICIT NONE

  REAL, INTENT(IN)		:: X(N),Y(N),H
  INTEGER, INTENT (IN)	:: N

  INTEGER				:: I  
  REAL					:: M(N-1), C(N-1)
  REAL					:: F,VAR
  
	  DO I=1,N-1
		M(I) = ( Y(I+1)- Y(I) )/ (X(I+1) - X(I))
		C(I) =  Y(I) - X(I)*M(I)
	  END DO

	I=1
PRINT *, 'RED FLAG M,C', M, C
	  VAR=X(I)
PRINT *, 'RED FLAG VAR', VAR 
	OPEN(20,FILE='OUT_LIN.TXT')

	  DO 
		IF (I==N)THEN
        EXIT
	  	END IF   
	  F= M(I)*VAR + C(I)
	  VAR = VAR + H
	  IF ( VAR > X(I+1) ) THEN 
	  I = I+1
	  END IF
      PRINT *, VAR, F
	  WRITE(20,*) VAR, F
	
      END DO
	CLOSE(20)
    
	END SUBROUTINE LIN_INTERPOL


END PROGRAM TEST