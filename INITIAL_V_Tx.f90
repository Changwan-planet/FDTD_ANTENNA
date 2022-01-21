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

i_Tx_ANT(1) = Nx/2 - (60)
j_Tx_ANT(1) = j_Tx_ANT
k_Tx_ANT(1) = k_Tx_ANT

i_Tx_ANT(2) = Nx/2 + (60)
j_Tx_ANT(2) = j_Tx_ANT
k_Tx_ANT(2) = k_Tx_ANT

i_Tx_ANT(3) = Nx/2 - (100)
j_Tx_ANT(3) = j_Tx_ANT
k_Tx_ANT(3) = k_Tx_ANT

i_Tx_ANT(4) = Nx/2 + (100)
j_Tx_ANT(4) = j_Tx_ANT
k_Tx_ANT(4) = k_Tx_ANT

READ



RETURN
END
