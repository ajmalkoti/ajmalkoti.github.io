
!PROGAM TO INTERPOLATE THE DATA BY CUBIC SPLINE METHOD
! INITIALLY WE HAD THE DATA IN FORM:						MAT'* X = Y

PROGRAM CUBIC_SPLINE_INTERPOLATION
 REAL, ALLOCATABLE, DIMENSION(:)	:: X, Y, Y2
 REAL, PARAMETER					:: h = 0.5				! INTERVAL LENGTH FOR CALCULATING YD
 REAL								:: F
 INTEGER, PARAMETER					:: N_MAX=200			! N_MAX=EXPECTED MAX NO OF POINTS IN DATA FILE
																
 INTEGER							:: I, N

!---------------------------CALL FUNCTIOON DPN -------------------------------
 N=DPN(N_MAX)													! RETURNS NO OF DATA POINTS
!-----------------------------------------------------------------------------

ALLOCATE( X(N),Y(N),Y2(N))
		
OPEN(10,FILE='data_exer1_30.txt')
	DO I=1,N
	READ(10,*) X(I),Y(I)
	END DO

!PRINT *, 'WHICH KIND OF INTERPOLATION YOU WANT'
!PRINT *, '1 = NATURAL SPLINE','/','2 = PARABOLIC RUNOUT SPLINE','/', '3 = CUBIC RUNOUT SPLINE' 
!READ *, SELECT

CALL SPLINE(X,Y,N,0.0,0.0,Y2)								!SUBROUTINE spline(x,y,n,yp1,ypn,y2)

VAR = X(1)
OPEN(20,FILE='OUTPUT_SPLINE.TXT')
	DO
	IF (VAR>X(N)) EXIT
	CALL	splint(X,X,Y2,N,VAR,F)								!SUBROUTINE splint(xa,ya,y2a,n,x,y)
	WRITE(20,*) VAR , F
	VAR = VAR + H
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

!***********************************************************************************************

SUBROUTINE spline(x,y,n,yp1,ypn,y2)
INTEGER n,NMAX
REAL yp1,ypn,x(n),y(n),y2(n)
PARAMETER (NMAX=500)
INTEGER i,k
REAL p,qn,sig,un,u(NMAX)
if (yp1.gt..99e30) then 
	y2(1)=0.
	u(1)=0.
else
  	y2(1)=-0.5
	u(1)=(3./(x(2)-x(1)))*((y(2)-y(1))/(x(2)-x(1))-yp1)
	endif

	do i=2,n-1			!This is the decomposition loop of the tridiagonal algorithm. y2 and u are used for temporary storage of the decomposed factors.
	sig=(x(i)-x(i-1))/(x(i+1)-x(i-1))
	p=sig*y2(i-1)+2.
	y2(i)=(sig-1.)/p
	u(i)=(6.*((y(i+1)-y(i))/(x(i+1)-x(i))-(y(i)-y(i-1)) / (x(i)-x(i-1)))/(x(i+1)-x(i-1))-sig*u(i-1))/p
	end do							

	if (ypn.gt..99e30) then		!The upper boundary condition is set either to be \natural"
		qn=0.
		un=0.
	else				!or else to have a specied rst derivative.
		qn=0.5
		un=(3./(x(n)-x(n-1)))*(ypn-(y(n)-y(n-1))/(x(n)-x(n-1)))
	end if
	y2(n)=(un-qn*u(n-1))/(qn*y2(n-1)+1.)
	do k=n-1,1,-1				!This is the backsubstitution loop of the tridiago-nal algorithm. 
		y2(k)=y2(k)*y2(k+1)+u(k)
	end do
return
END SUBROUTINE SPLINE
!*******************************************************************************************

SUBROUTINE splint(xa,ya,y2a,n,x,y)

	INTEGER n
	REAL x,y,xa(n),y2a(n),ya(n)
	INTEGER k,khi,klo
	REAL a,b,h

	klo=1
	khi=n

	1 if (khi-klo.gt.1) then
		k=(khi+klo)/2
		if(xa(k).gt.x)then
		khi=k
		else
		klo=k
		endif
		goto 1
	endif

	h=xa(khi)-xa(klo)

	if (h.eq.0.)  pause 'bad xa input in splint'
	a=(xa(khi)-x)/h 
	b=(x-xa(klo))/h
	y=a*ya(klo)+b*ya(khi)+ ((a**3-a)*y2a(klo)+(b**3-b)*y2a(khi))*(h**2)/6.
	return
END SUBROUTINE SPLINT

END PROGRAM CUBIC_SPLINE_INTERPOLATION