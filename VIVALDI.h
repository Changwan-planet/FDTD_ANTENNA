INTEGER, PARAMETER :: j_Viv = 62, k_Viv = 134
INTEGER, PARAMETER :: j_Viv_1 = j_Viv+1, k_Viv_1 = k_Viv+1

!     ++++++++++++++++++
!++++++OF CELL_PROPERTY++++++
!     ++++++++++++++++++
INTEGER  :: CELL_Apex     (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)
INTEGER  :: CELL_Property (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)
INTEGER  :: PEC_boundary  (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)
INTEGER  :: PEC_mask_Ex   (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)
INTEGER  :: PEC_mask_Ey   (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)
INTEGER  :: PEC_mask_Ez   (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)


REAL*8 :: f_z  (0:1, -1:1, -j_Viv_1:j_Viv_1, 0:k_Viv_1)
REAL*8 :: df_z (0:1, -1:1, -j_Viv_1:j_Viv_1, 0:k_Viv_1)


!     ++++++++++++++++++
!++++++FIELDS : Tx_aANT++++++
!     ++++++++++++++++++
REAL*8 :: Ex_Tx (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)
REAL*8 :: Ey_Tx (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)
REAL*8 :: Ez_Tx (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)
REAL*8 :: Hx_Tx (-2:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)
REAL*8 :: Hy_Tx (-2:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)
REAL*8 :: Hz_Tx (-2:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1)


!     ++++++++++++++++++
!++++++FIELDS : Rx_aANT++++++
!     ++++++++++++++++++
REAL*8 :: Ex_Rx (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1, 0:5)
REAL*8 :: Ey_Rx (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1, 0:5)
REAL*8 :: Ez_Rx (-1:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1, 0:5)
REAL*8 :: Hx_Rx (-2:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1, 0:5)
REAL*8 :: Hy_Rx (-2:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1, 0:5)
REAL*8 :: Hz_Rx (-2:2, -j_Viv_1:j_Viv_1, -1:k_Viv_1, 0:5)


!     +++++++++++++++++++++++++++++++
!++++++COEFFICIENTS FOR AMPERE'S LAW++++++
!     +++++++++++++++++++++++++++++++
REAL*8 :: Dx_Viv(0:1, -1:2, -j_Viv_1-1:j_Viv_1, -1:Lk_Viv_1)
REAL*8 :: Dy_Viv(0:1, -1:2, -j_Viv_1-1:j_Viv_1, -1:Lk_Viv_1)
REAL*8 :: Dz_Viv(0:1, -1:2, -j_Viv_1-1:j_Viv_1, -1:Lk_Viv_1)
REAL*8 :: Dt_muA_x(-1:2, -j_Viv_1-1:j_Viv_1, -1:Lk_Viv_1)
REAL*8 :: Dt_muA_y(-1:2, -j_Viv_1-1:j_Viv_1, -1:Lk_Viv_1)
REAL*8 :: Dt_muA_z(-1:2, -j_Viv_1-1:j_Viv_1, -1:Lk_Viv_1)
 
!     +++++++++++++++++++++++++++++++
!++++++COEFFICEINTS FOR AMPERE'S LAW++++++
!     +++++++++++++++++++++++++++++++
LOGICAL L_PEC (-j_Viv_1:j_Viv_1, -1:k_Viv_1)










