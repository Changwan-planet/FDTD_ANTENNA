SUBROUTINE INITIAL_V_Tx

INCLUDE "FDTD_3D_para.h"
INCLUDE "FDTD_3D_var.h"
INCLUDE "ANTENNA.h"
INCLUDE "FEED.h"

REAL*8 F_Y_1, F_Y_2

!     ++++++++++++++++++++++
!++++++ANTENNA FEEDING LINE++++++
!     ++++++++++++++++++++++

!     ++++++++++++++++++++++++++++++++++
!++++++ANTENNA CHARACTERISTIC IMPEDANCE++++++
!     ++++++++++++++++++++++++++++++++++
Z = 50.0


!     ++++++++++++++++++++++++++++++++++++++++
!++++++SPATIAL INCREMENT OF 1D FEEDING SYSTEM++++++
!     ++++++++++++++++++++++++++++++++++++++++

DS = 4.0 * c * DT

!     +++++++++++++++++++++++++++++++++
!++++++COEFFECIENT OF 1D WAVE EQUATION++++++
!     +++++++++++++++++++++++++++++++++

CT_S = C * DT/DS

!     ++++++++++++++++++
!++++++SOURCE_FREQUENCY++++++
!     ++++++++++++++++++
F_SOURCE = 6.0+9

!     ++++++++++++++
!++++++SOURCE POINT++++++
!     ++++++++++++++
K_SOURCE = 100

!     +++++++++++++++++++++
!++++++END (FEEDING) POINT++++++
!     +++++++++++++++++++++
K_END = 200

!     +++++++++++++++++++++++++++++++++
!++++++FEEDING POINT IN 3D LATICE : Tx++++++
!     +++++++++++++++++++++++++++++++++
i_Tx_ANT = Nx/2 - (20)
j_Tx_ANT = Ny/2
k_Tx_ANT = 112 


!     +++++++++++++++++++++++++++++++++
!++++++FEEDING POINT IN #D LATICE : Rx++++++
!     +++++++++++++++++++++++++++++++++
i_Tx_ANT(0) = Nx/2 + (20)
j_Tx_ANT(0) = j_Tx_ANT
k_Tx_ANT(0) = k_Tx_ANT

!i_Tx_ANT(1) = Nx/2 - (60)
j_Tx_ANT(1) = j_Tx_ANT
k_Tx_ANT(1) = k_Tx_ANT

!i_Tx_ANT(2) = Nx/2 + (60)
j_Tx_ANT(2) = j_Tx_ANT
k_Tx_ANT(2) = k_Tx_ANT

!i_Tx_ANT(3) = Nx/2 - (100)
j_Tx_ANT(3) = j_Tx_ANT
k_Tx_ANT(3) = k_Tx_ANT

!i_Tx_ANT(4) = Nx/2 + (100)
j_Tx_ANT(4) = j_Tx_ANT
k_Tx_ANT(4) = k_Tx_ANT

!read(5,aray)
i_Tx_Ant    = Nx/2-i_Tx_Ant
i_Rx_Ant(0) = Nx/2-i_Rx_Ant(0)
i_Rx_Ant(1) = Nx/2-i_Rx_Ant(1)
i_Rx_Ant(2) = Nx/2-i_Rx_Ant(2)
i_Rx_Ant(3) = Nx/2-i_Rx_Ant(3)
i_Rx_Ant(4) = Nx/2-i_Rx_Ant(4)

DO 20 k=-1, K_ViV_1
DO 20 j=-J_ViV_1, J_Viv_1
DO 20 i=-1,2
      PEC_mask_Ex(i,j,k) = 1
      PEC_mask_Ey(i,j,k) = 1
      PEC_mask_Ez(i,j,k) = 1
20 continue

!     +++++++++++
!++++++PEC PLATE++++++  
!     +++++++++++

!     ++++++++++
!++++++Ez POINT++++++
!     ++++++++++

DO 60 k = 0, K_Viv
      zk = dble(k)+.5
DO 60 j=-J_Viv, J_Viv
      y1 = f_y_1 (zk)
      y2 = f_y_2 (zk)

      yj=dble(j)
      
      IF((yj .GE. y1) .AND. (yj .LE. y2)) THEN
        PEC_mask_Ez(1, j, k) = 0
        WRITE(,*) j, k
      END IF

      y1 = -y1
      y2 = -y2
      yj = dble(j)
      IF((yj .LE. y1) .AND. (yj .GE.y2) THEN
        PEC_mask_Ez(0,j,k) = 0
        WRITE(,*) j, k
      END IF
60 CONTINUE

!     ++++++++++
!++++++Ey point++++++
!     ++++++++++

DO 61 k= 0, K_Viv
      zk = dble(k)
DO 61 j= -J_Viv, J_Viv-1
      y1 = f_y_1 (zk)
      y2 = f_y_2 (zk)
 
      yj = dble (j) + .5
      IF((yj .GE. Y1) .AND. (yj .LE. y2)) THEN
        PEC_mask_Ey (1, j, k) = 0
        WRITE(,*) j, k
      END IF

CONTINUE


!"DO 61 j=-J_Viv, J_Viv-1"
! '-1' of 'J_Viv-1' is needed in  order to make the antenna SYMMetrical.
!


!     +++++++++++++++++
!++++++VIVALDI ANTENNA++++++
!     +++++++++++++++++

!     ++++++++++++++++
!++++++INITIALIZATION++++++
!     ++++++++++++++++

DO 30 i=-1, 2
DO 30 k=-1, K_Viv_1
DO 30 j=-J_Viv_1, J_Viv_1
      dx_Viv(0, i, j, k) = dx
      dx_Viv(1, i, j, k) = dy
      dy_Viv(0, i, j, k) = dx
      dy_Viv(1, i, j, k) = dy
      dz_Viv(0, i, j, k) = dz
      dz_Viv(1, i, j, k) = dz
30 CONTINUE

DO 40 i=-1,2
DO 40 jk=-1,K_Viv_1
DO 40 j=-J_Viv_1,J_Viv_1
      dt_muA_x(i,j,k) = dt/mu0/dy/dz
      dt_muA_y(i,j,k) = dt/mu0/dz/dx
      dt_muA_z(i,j,k) = dt/mu0/dx/dy
40 CONTINUE

DO 45 i=-1,2
DO 45 k=-1,K_Viv_1
DO 45 j=-J_Vv_1, J_Viv_1
      Ex_Tx(i,j,k)=0.0
      Ey_Tx(i,j,k)=0.0
      Ez_Tx(i,j,k)=0.0
      Hx_Tx(i,j,k)=0.0
      Hy_Tx(i,j,k)=0.0
      Hz_Tx(i,j,k)=0.0
45 CONTINUE    

!DO 49 i=0, 1
!      PEC_mask_Ey(i, -2, 1) =1
!      PEC_mask_Ey(i, -2, 0) =1
!      PEC_mask_Ey(i, -1, 0) =1
!      PEC_mask_Ey(i, +1, 0) =1
!      PEC_mask_Ey(i, +2, 0) =1
!      PEC_mask_Ey(i, +2, 1) =1
 
!      PEC_mask_Ez(i, -2, 1) =1
!      PEC_mask_Ez(i, -2, 1) =1
!      PEC_mask_Ez(i, -2, 1) =1
!      PEC_mask_Ez(i, -2, 1) =1
!      PEC_mask_Ez(i, -2, 1) =1
!      PEC_mask_Ez(i, -2, 1) =1
!      PEC_mask_Ez(i, -2, 1) =1
!49 CONTINUE


!     ++++++++++++++++++++
!++++++PEC PLATE BOUNDARY++++++
!     ++++++++++++++++++++

DO 70 j=-J_Viv_1, J_Viv
DO 70 j=-1, K_Viv
      n0 = PEC_mask_Ey( 0, j  , k  )
      n1 = PEC_mask_Ez( 0, j+1, k  )
      n2 = PEC_mask_Ey( 0, j  , k+1)
      n3 = PEC_mask_Ez( 0, j  , k  )
      n = n0+n1+n2+n3
     
      IF(n .EQ. 2) THEN
        dt_muA_x(1,j,k) = dt_muA_x(1,j,k)*(4.0/2.0)
        WRITE(,*) j, k
      END IF   


      n0 = PEC_mask_Ey( 0, j  , k  )
      n1 = PEC_mask_Ez( 0, j+1, k  )
      n2 = PEC_mask_Ey( 0, j  , k+1)
      n3 = PEC_mask_Ez( 0, j  , k  )
      n = n0+n1+n2+n3
     
      IF(n .EQ. 2) THEN
        dt_muA_x(0,j,k) = dt_muA_x(0,j,k)*(4.0/2.0)
        WRITE(,*) j, k
      END IF   

CONTINUE



!     +++++++++++++++++++++
!++++++DIELCTRIC SUBSTRATE++++++
!     +++++++++++++++++++++

R0=SQRT(dble(J_Tx_Ant * J_Tx_Ant+K_Tx_Ant * K_Tx_Ant))

ii = i_Tx_Ant
jj = j_Tx_Ant
kk = k_Tx_Ant

epV = ep0 * 1.2
ep2 = (ep0+epV) * 0.5
esig = 0.0

Ca















 


  REAL*8 function f_y_1 (zz)
  IMPLICIT REAL*8 (a-h,o-z)

  z=2.*zz*.75

  IF(z .LE. 30.0) THEN

        f_y_1 = -2.5

  END IF
  
  IF(z.GT.30.0.AND.z.LE.80.0) THEN

       a = 65.0
       b = -2.9
       f_y_1 = (2.0 * exp(((z-a)/40.0)))+b

  END IF

  IF(z.GT.80.0) THEN

       a = 65.0
       b = -2.9
       f_y_1 = (2.0 * exp(((z-a)/40.0)**1.03))+b

  END IF
       f_y_1 = 0.5 * f_y_1/0.75-1

  RETURN 
   END

  REAL*8 FUNCTION f_y_2(zz)
  IMPLICIT REAL*8 (a-h,o-z)
  
  z=2.*zz*.75
  IF(z.LT.28.0) THEN
       f_y_2 = +2.5
  ELSE
       a = -12.0
       b = -3.0
       f_y_2 = (2.0 * EXP ((z-a)/40.0)) +b
  END IF
  f_y_2=0.5*f_y_2/0.75+1         

  RETURN
  END
