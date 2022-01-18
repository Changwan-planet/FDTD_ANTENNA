!     ++++++++++++++++++++++++++
!++++++ADJUSCENT TO THE ELEMENT++++++
!     ++++++++++++++++++++++++++

REAL*8 V_Tx(0:2000), CURRENT_Tx(0:2000)
REAL*8 V_Rx(0:2000), CURRENT_Rx(0:2000,0:5)

!     ++++++++++++++++++
!++++++FOR ABC TERMINAL++++++
!     ++++++++++++++++++
REAL*8 V_Tx_ABC(0:100)
REAL*8 V_Rx_ABC(0:100,0:44)

!     +++++++++++++++++++++++++++++++++
!++++++ANTENNA CHRACTERISTIC IMPEDANCE++++++
!     +++++++++++++++++++++++++++++++++
REAL*8 Z

!     ++++++++++++++++++++++++++++++++
!++++++SPATIAL INCREMENT OF 1D SYSTEM+++++
!     ++++++++++++++++++++++++++++++++
REAL*8 DS

!     +++++++++++++++
!++++++SOURCE SIGNAL++++++
!     +++++++++++++++
REAL*8 V_SOURCE

!     ++++++++++++++++++
!++++++SOURCE FREQUENCY++++++
!     ++++++++++++++++++
REAL*8 F_SOURCE

!     +++++++++++++
!++++++COEFFICIENT++++++
!     +++++++++++++
REAL*8 CT_S

!     ++++++++++++++
!++++++SOURCE POINT++++++
!     ++++++++++++++
INTEGER K_SOURCE

!     +++++++++++++++++++++
!++++++END (FEEDING) POINT++++++ 
!     +++++++++++++++++++++
INTEGER K_END

!     +++++++++++++++
!++++++FEEDING POINT++++++
!     +++++++++++++++
INTEGER I_ANT, J_ANT, K_ANT
INTEGER I_Tx_ANT, J_Tx_ANT, K_Tx_ANT
INTEGER I_Rx_ANT(0:5), J_Rx_ANT(0:5), K_Rx_ANT(0:5)







 
