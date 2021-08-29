PROGRAM	smooth_mod
IMPLICIT NONE

INTEGER nx, nz, nsmoothx, nsmoothz
!INTEGER, PARAMETER :: nz = 481
!INTEGER, PARAMETER :: nz = 241
!INTEGER, PARAMETER :: nsmoothz = 2000
!INTEGER, PARAMETER :: nsmoothx = 2000

INTEGER :: ix,iz
REAL :: x, z

REAL, DIMENSION(:,:),allocatable :: vp
REAL, DIMENSION(:),allocatable :: vpz
REAL, DIMENSION(:),allocatable :: vpx


write(*,*)'nx ??'
read(*,*)nx
write(*,*)'nz ??'
read(*,*)nz
write(*,*)'nsmoothx??'
read(*,*)nsmoothx
write(*,*)'nsmoothz ?'
read(*,*)nsmoothz

open(10,file='v481.bin',form='unformatted',access='direct',recl=4*nz)
open(20,file='v481_smooth.bin',form='unformatted',access='direct',recl=4*nz)

allocate(vp(nz,nx))
allocate(vpz(nz),vpx(nx))

do ix=1,nx
   write(*,*)ix
   read(10,rec=ix)(vp(iz,ix),iz=1,nz)
enddo

do ix=1,nx
	do iz=1,nz
  	 vpz(iz)=vp(iz,ix)
	enddo
	call smooth_vp(vpz,nz,nsmoothz)
	do iz=1,nz
          vp(iz,ix)=vpz(iz)
	enddo
enddo

do iz=1,nz
	do ix=1,nx
  	 vpx(ix)=vp(iz,ix)
	enddo
	call smooth_vp(vpx,nx,nsmoothx)
	do ix=1,nz
          vp(iz,ix)=vpx(ix)
	enddo
enddo

do ix=1,nx
   write(20,rec=ix)(vp(iz,ix),iz=1,nz)
enddo

deallocate(vp,vpx,vpz)

stop

END PROGRAM 

SUBROUTINE smooth_vp(vp,np,ns)
IMPLICIT NONE
INTEGER :: np,ns,i,j
REAL, DIMENSION(np) :: vp,vpt

do j=1,ns
	vpt=vp
        do i=2,np-1
           vpt(i)=0.25*(vp(i-1)+vp(i+1))+0.5*vp(i)
	enddo
	vp=vpt
enddo
return

end subroutine




