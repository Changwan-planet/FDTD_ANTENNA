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



RETURN
END
