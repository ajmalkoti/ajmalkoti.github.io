
!PROGAM TO INTERPOLATE THE DATA BY CUBIC SPLINE METHOD
! INITIALLY WE HAD THE DATA IN FORM:						MAT'* X = Y
! WHEN WE MODIFIY THE DATA THE MATRIX BECOMES IN THE FORM:	MAT * M	= YD
!	STEP1:	READ THE DATA POINTS IN THE GIVEN DATA FILE
!	STEP2:  SELECT THE TYPE OF METHOD, AND PREPARE MATRICES( i.e. MAT,YD) ACCORDINGLY [CALL MATRIX SELECTION]
!   STEP3:  FIND THE SOL OF THE MATRIX FOR THE M  [CALL TRIDIAG_SOL ]
!	STEP4:  CALCULATE THE "h" AND WRITE THE INTERPOLATED FUNC "F" IN THE FILE

PROGRAM CUBIC_SPLINE_INTERPOLATION
 REAL, ALLOCATABLE, DIMENSION(:)	:: X, Y, M, YD
 REAL, ALLOCATABLE, DIMENSION(:,:)	:: MAT
 REAL, PARAMETER					:: h = 0.5				! INTERVAL LENGHT FOR CALCULATING YD
 REAL								:: F
 INTEGER, PARAMETER					:: N_MAX=200, P = 1			! N_MAX=EXPACTED MAX NO OF POINTS IN DATA FILE
																! P = NO OF POINTS TO INTERPOLATE FOR
 INTEGER							:: I, N, SELECT

!---------------------------CALL FUNCTIOON DPN -------------------------------
 N=DPN(N_MAX)
!-----------------------------------------------------------------------------

ALLOCATE( X(N),Y(N), M(N), YD(N-2), MAT(N-2,N-2))
		
OPEN(10,FILE='data_exer1_0.txt')
	DO I=1,N
	READ(10,*) X(I),Y(I)
	END DO

PRINT *, 'WHICH KIND OF INTERPOLATION YOU WANT'
PRINT *, '1 = NATURAL SPLINE','/','2 = PARABOLIC RUNOUT SPLINE','/', '3 = CUBIC RUNOUT SPLINE' 
READ *, SELECT

!--------------------------CALL FUNC MAT PREP-----------------------------------
MAT = PREP_MAT(SELECT,N-2)						! PREPARE MATRIX - MAT
!-------------------------------------------------------------------------------

DO I=1,N-2												!PREPARE MATRIX - YD
YD(I)=(Y(I)-2*Y(I+1)+Y(I+2))*6 / (h**2)
END DO

!-------------------------CALL SUBROUTINE TRIDIAGONAL MATRIX SOLVER ------------------
CALL TRIDIAG_SOL( MAT, N, M, YD )
!-----------------------------------------------------------------------------------

PRINT *,M

OPEN(20,FILE='OUTPUT.TXT')
	DO I=1,N-1
	VAR = X(I)
		DO J = 1,P+1
		VAR = VAR + h
		F =    ( M(I)*(X(I+1) - VAR)**3  + M(I+1)*(VAR - X(I))**3 )/(6*h) +			&
			   ( X(I+1) - VAR)*(Y(I) - M(I)*(h**2)/6) / h	+						 &
			   ( VAR - X(I))*(Y(I+1) - M(I+1)*(h**2)/6) / h
		PRINT *,VAR, F
		WRITE(20,*) VAR, F
!		 70 FORMAT (F10.3, F10.5) 
		
		END DO
	END DO

PRINT *, 'PROGRAM END'


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!*********************************SUBROUTINE AND FUNCTIONS*************************************************************
 
 CONTAINS
 !********************FUNC TO COUNT NO DO DATA POINTS*************************
 	FUNCTION DPN(N_MAX)
	IMPLICIT NONE
		
	INTEGER		::	I,IO, N_MAX, DPN
	REAL		::  X(N_MAX),Y(N_MAX)
	
	OPEN(10,FILE='data_exer1_0.txt')
	READ(10, *, IOSTAT = IO ) ( X(I),Y(I), I = 1, N_MAX )
		IF (IO < 0) THEN
			  DPN = I - 1
		ELSE 
		DPN = N_MAX	
		END IF
	CLOSE(10)
	PRINT *, 'NO OF THE DATA POINTS ARE = ',DPN
	END FUNCTION DPN

!********************* FUNC FOR PREPARATION OF MATRIX************************************
	
	FUNCTION PREP_MAT(SELECT,P)
	IMPLICIT NONE

	INTEGER		:: I,SELECT,P
	REAL		:: X(P,P),PREP_MAT(P,P) 
	
	X=0		
		DO I = 1,P
		X(I,I)=4
		END DO		
        
		DO I = 1,P-1
        X(I,I+1)=1
		END DO
	
		DO I = 1,P-1				
		X(I+1,I)=1
        END DO
        
		IF (SELECT==1) THEN
		PRINT *, 'YOU HAVE SELECTED NATURAL SPLINE' 

		ELSE IF (SELECT==2) THEN
		PRINT *, 'YOU HAVE SELECTED PARABOLIC RUN OUT SPLINE'
		X(1,1)=5
		X(P,P)=5
		
		ELSE IF	(SELECT ==3) THEN
		PRINT *, 'YOU HAVE SELECTED CUBIC RUNOUT SPLINE'
		X(1,1)=6
		X(P,P)=6
		X(1,2)=0
		X(P,P-1)=0
					
		ELSE 
		PRINT *, 'WRONG SELECTION'
		STOP

		END IF
				 
	PREP_MAT=X			 

	END FUNCTION PREP_MAT

!********************* SUBROUTINE TO CALCULATE THE SOL OF TRIDIGONAL MATRIX ***************
												
												! CALL TRIDIAG_SOL( MAT, N, M, YD )

	 SUBROUTINE TRIDIAG_SOL(MAT, N, M, D)			! MAT=MATRIX, DIM=DIMENSION OF MAT, D=DATA
	 IMPLICIT NONE
	 
	 INTEGER				::  P 
	 INTEGER, INTENT(IN)	::	N
	 REAL, INTENT(IN)		::	MAT(N-2,N-2), D(N-2)
	 REAL, INTENT(OUT)		::  M(N)
	 REAL,DIMENSION(N-2)	::  A,B,C, CD,DD
	
	 A=0
	 B=0
	 C=0
	 M=0
	 P = N-2

		DO I=1,P-1		!LOWER DIAGONAL
		A(I)=MAT(I+1,I)
		END DO
	    DO I=1,P    	!PRINCIPLE DIAGONAL
		B(I)=MAT(I,I)
        END DO
		DO I=1,P-1		!UPPER DIAGOAL
		C(I)=MAT(I,I+1)
		END DO

	 CD(1)=C(1)/B(1)
	 DD(1)=D(1)/B(1)
		 DO I=2,P
		 CD(I) =   C(I) / ( B(I)-CD(I-1)*A(I))
		 DD(I) = ( D(I)-DD(I-1)*A(I) ) / ( B(I)-CD(I-1)*A(I))
		 END DO

	 M(P+1)=DD(P)
		 DO I=P,2,-1
		 M(I-1) = DD(I)-CD(I) * M(I)
		 END DO

	 END SUBROUTINE TRIDIAG_SOL


END PROGRAM CUBIC_SPLINE_INTERPOLATION
