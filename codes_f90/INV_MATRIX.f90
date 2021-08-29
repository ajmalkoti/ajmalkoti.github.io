PROGRAM INV_MATRIX
IMPLICIT NONE

REAL, ALLOCATABLE, DIMENSION(:,:)	:: A, A_INV, TEMP
INTEGER								:: I,J,K,L,M,INDEX_LARGE		! BIG IS THE LARGEST ELEMENT IN A COLOUMN
																! R IS THE ROW NO TRANSFERRED TO SWAPP SUBROUTINE																		
INTEGER, PARAMETER					:: P=3
REAL								:: PIVOT

ALLOCATE(A(P,P),A_INV(P,P),TEMP(P,2*P))

A=RESHAPE((/2,2,1,2,1,3,3,1,5/),(/3,3/))

!PREPARING THE MATRIX FOR INVERSE PROCESS
TEMP=0
DO I=1,P
	DO J=1,2*P
		IF(J<=P) THEN
		TEMP(I,J) = A(I,J)
		ELSEIF(J==P+I) THEN
		TEMP(I,J)= 1
		END IF
	END DO										  
END DO  

DO K=1,P
WRITE(*,*) (TEMP(K,J),J=1,2*P)
END DO

!PRINT *,'TEMP MATRIX IS : ',TEMP 

!GAUSS JORDEN METHOD (WITH PARTIAL PIVOTING) PROCESS STARTS HERE										 
	!FOLLOWING FORMS LOWER TRIANGULAR MATRIX
DO I=1,P
  INDEX_LARGE = FIND_LARGE(I,TEMP)				! Find the largest no index 
  
  IF(INDEX_LARGE/=I)THEN						! swap the two rows if they are different
  CALL SWAPP(I,INDEX_LARGE,TEMP,P)
  END IF

	PRINT *, 'INDEX LARGE= ', INDEX_LARGE

  PRINT *, 'TEST MATRIX AFTER SWAP=  '
	DO K=1,P
	WRITE(*,*) (TEMP(K,L),L=1,2*P)
	END DO


  IF(TEMP(I,I)==0)THEN							  
  PRINT *, ' NOT INVERTIBLE'
  STOP
  ELSE
  
  PIVOT=TEMP(I,I)
	DO J=I,2*P
	TEMP(I,J)= TEMP(I,J)/PIVOT
	END DO


	PRINT *, 'MATRIX / PIVOT IS = '
	DO K=1,P
	WRITE(*,*) (TEMP(K,L),L=1,2*P)
	END DO
	
	DO L=I,P
	PIVOT=TEMP(L+1,I)
	PRINT*, 'PIVOT=' , PIVOT
		IF(L<P)THEN
			DO J=I,2*P
			TEMP(L+1,J)=TEMP(L+1,J)-TEMP(I,J)*PIVOT
			PRINT*, L,J
			END DO	
		END IF
	END DO
  END IF
																				   
  PRINT *,'TEST MATRIX AFTER OPERATION: /PIVOT AND SUBRATRACTION= '
  DO K=1,P
  WRITE(*,*) (TEMP(K,L),L=1,2*P)
	END DO

END DO

	!FOLLOWING FORMS UPPER TRIANGUAL MATRIX
open(10,file='data.text')

PRINT *, 'UPPER TRIANGULAR PART'
DO I=P,1,-1
	DO J=I,1,-1
	PIVOT=TEMP(J-1,I)
	PRINT *,'PIVOT = ', PIVOT
		DO K=J,2*P
		TEMP(J-1,K)= TEMP(J-1,K)-TEMP(J,K)*PIVOT
		PRINT *, I,J,K
		PRINT *, 'UPPER MATRIX AFTER SUBTRACTION IS= '
			DO M=1,P		
			PRINT *,(TEMP(M,L),L=1,2*P)
			END DO												
		END DO

	END DO
END DO


		
! EXTRACTING THE INVERSE PART FROM TEMP MATRIX
DO I=1,P
	DO J=1,P
	A_INV(I,J)=TEMP(I,J+P)
	END DO
END DO

PRINT *,'A INV IS FOLLOWING /'
	DO K=1,P
	WRITE(*,*) (A_INV(K,L),L=1,P)
	END DO

!******************************* SUBFUNCTION ARE DEFINED HERE***************************
	! TO FIND THE LARGE NO INDEX
CONTAINS
  FUNCTION FIND_LARGE(I,TEMP)
	IMPLICIT NONE
	INTEGER  :: I, K,INDEX,T,FIND_LARGE
	REAL	::TEMP(P,2*P)
	
	INDEX=I	
	T=P-I+1
	DO K=1,T
		IF(INDEX < P)THEN
			IF (TEMP(INDEX,I)<TEMP(K+I,I))THEN
			INDEX=K+I
			END IF
		END IF
	END DO
	FIND_LARGE=INDEX
  END FUNCTION FIND_LARGE

	!TO SWAP THE TWO ROWS OF THE MATRIX

  SUBROUTINE SWAPP(P,Q,TEMP,N)
	IMPLICIT NONE
	INTEGER, INTENT(IN)	:: P,Q,N
	REAL, INTENT(INOUT)	:: TEMP(N,2*N)
	INTEGER		:: R 
	REAL		:: SWAP

	DO R=1,2*P
	SWAP= TEMP(P,R)
	TEMP(P,R)= TEMP(Q,R)
	TEMP(Q,R)=SWAP
	END DO
  END SUBROUTINE SWAPP

END PROGRAM INV_MATRIX



!**************************************************************************

!Prepare the matrix
!Call the program FIND _LARGEST								 
!	Pass  the  present index  and matrix
!	find out the largest one element and its index
!	return the index
!check if it returns the same row no
!check it the row pivot element is zero
!call the program SWAP
!	Pass the matrix and the rows no to be swapped
!Make the element =1
!Make the other element in the column =0 and respective changes in row
!Reduce the matrix to lower triangle
!Find the values
