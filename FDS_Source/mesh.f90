MODULE MESH_VARIABLES
 
! Data structure for mesh-dependent variables
 
USE PRECISION_PARAMETERS
USE TYPES
IMPLICIT NONE

TYPE MESH_TYPE

   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:) :: &
            U,V,W,US,VS,WS,DDDT,D,DS,H,HS,KRES,FVX,FVY,FVZ,RHO,RHOS, &
            MU,MU_DNS,TMP,Q,Q_H_CORR,FRHO,KAPPA,QR,QR_W,UII,RSUM,D_LAGRANGIAN,D_REACTION,D_GEOMETRY, &
            CSD2,CHEM_SUBIT,MIX_TIME,STRAIN_RATE,D_Z_MAX,ZETA_SOURCE_TERM

   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:,:) :: ZZ,ZZS,REAC_SOURCE_TERM,DEL_RHO_D_DEL_Z,FX,FY,FZ, &
                                                SCALAR_WORK1,SCALAR_WORK2,SCALAR_WORK3,SCALAR_WORK4
   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:,:) :: AVG_DROP_DEN,AVG_DROP_TMP,AVG_DROP_RAD,AVG_DROP_AREA
   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:) :: AVG_DROP_DEN_ALL
   REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: UVW_GHOST

   REAL(EB) :: POIS_PTB,POIS_ERR
   REAL(EB), ALLOCATABLE, DIMENSION(:) :: SAVE1,SAVE2,WORK
   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:) :: PRHS
   REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: BXS,BXF,BYS,BYF,BZS,BZF, BXST,BXFT,BYST,BYFT,BZST,BZFT
   INTEGER :: LSAVE,LWORK,LBC,MBC,NBC,ITRN,JTRN,KTRN,IPS
   REAL(EB), ALLOCATABLE, DIMENSION(:) :: P_0,RHO_0,TMP_0,D_PBAR_DT,D_PBAR_DT_S,U_LEAK,U_DUCT
   REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: PBAR,PBAR_S,R_PBAR
   INTEGER, ALLOCATABLE, DIMENSION(:,:,:) :: PRESSURE_ZONE 
   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:) :: WORK1,WORK2,WORK3,WORK4,WORK5,WORK6,WORK7,WORK8,WORK9
   INTEGER, ALLOCATABLE, DIMENSION(:,:,:) :: IWORK1

   !! Laplace solve, sparse LU

   !INTEGER :: A_N_ROWS,A_N_COLS,A_N_ELEMENTS
   !INTEGER, ALLOCATABLE, DIMENSION(:) :: A_ROW_INDEX,A_COLUMNS
   !REAL(EB), ALLOCATABLE, DIMENSION(:) :: A_VALUES

   REAL(EB),     ALLOCATABLE, DIMENSION(:,:,:) :: PWORK1,PWORK2,PWORK3,PWORK4
   COMPLEX(DPC), ALLOCATABLE, DIMENSION(:,:,:) :: PWORK5,PWORK6,PWORK7,PWORK8

   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:) :: TURB_WORK1,TURB_WORK2,TURB_WORK3,TURB_WORK4
   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:) :: TURB_WORK5,TURB_WORK6,TURB_WORK7,TURB_WORK8
   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:) :: TURB_WORK9,TURB_WORK10

   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:) :: IBM_SAVE1,IBM_SAVE2,IBM_SAVE3,IBM_SAVE4,IBM_SAVE5,IBM_SAVE6
   INTEGER, ALLOCATABLE, DIMENSION(:,:,:) :: U_MASK,V_MASK,W_MASK,P_MASK

   REAL(EB), ALLOCATABLE, DIMENSION(:) :: WALL_WORK1,WALL_WORK2
   REAL(FB), ALLOCATABLE, DIMENSION(:,:,:,:) :: QQ
   REAL(FB), ALLOCATABLE, DIMENSION(:,:) :: PP,PPN,BNDF_TIME_INTEGRAL
   INTEGER, ALLOCATABLE, DIMENSION(:,:) :: IBK
   INTEGER, ALLOCATABLE, DIMENSION(:,:,:) :: IBLK
 
   REAL(EB) :: DT,DT_PREV,DT_NEXT,DT_INIT
   REAL(EB) :: CFL,DIVMX,DIVMN,VN,RESMAX,PART_UVWMAX,Q_MAX,Q_UPPER
   INTEGER  :: ICFL,JCFL,KCFL,IMX,JMX,KMX,IMN,JMN,KMN, I_VN,J_VN,K_VN,IRM,JRM,KRM
   INTEGER  :: IUVW=1

   INTEGER :: N_EDGES
   INTEGER, ALLOCATABLE, DIMENSION(:,:) :: IJKE,EDGE_INDEX
   REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: TAU_E,OME_E
   INTEGER, ALLOCATABLE, DIMENSION(:,:) :: EDGE_TYPE

   INTEGER :: MESH_LEVEL,LBC_EMB,MBC_EMB,NBC_EMB
   INTEGER :: IBAR,JBAR,KBAR,IBM1,JBM1,KBM1,IBP1,JBP1,KBP1
   INTEGER, ALLOCATABLE, DIMENSION(:) :: RGB
   REAL(EB) :: DXI,DETA,DZETA,RDXI,RDETA,RDZETA, &
      DXMIN,DXMAX,DYMIN,DYMAX,DZMIN,DZMAX, &
      XS,XF,YS,YF,ZS,ZF,RDXINT,RDYINT,RDZINT,CELL_SIZE
   REAL(EB), ALLOCATABLE, DIMENSION(:) :: R,RC,X,Y,Z,XC,YC,ZC,HX,HY,HZ, &
            DX,RDX,DXN,RDXN,DY,RDY,DYN,RDYN,DZ,RDZ,DZN,RDZN, &
            CELLSI,CELLSJ,CELLSK,RRN
   REAL(FB), ALLOCATABLE, DIMENSION(:) :: XPLT,YPLT,ZPLT

   INTEGER :: N_OBST
   TYPE(OBSTRUCTION_TYPE), ALLOCATABLE, DIMENSION(:) :: OBSTRUCTION

   INTEGER :: N_VENT
   TYPE(VENTS_TYPE), ALLOCATABLE, DIMENSION(:) :: VENTS

   INTEGER, ALLOCATABLE, DIMENSION(:,:,:) :: CELL_INDEX,CUTCELL_INDEX
   INTEGER, ALLOCATABLE, DIMENSION(:) :: I_CELL,J_CELL,K_CELL,OBST_INDEX_C
   INTEGER, ALLOCATABLE, DIMENSION(:) :: I_CUTCELL,J_CUTCELL,K_CUTCELL
   TYPE(CUTCELL_TYPE), ALLOCATABLE, DIMENSION(:) :: CUTCELL
   INTEGER, ALLOCATABLE, DIMENSION(:,:) :: WALL_INDEX
   LOGICAL, ALLOCATABLE, DIMENSION(:) :: SOLID,EXTERIOR
   LOGICAL, ALLOCATABLE, DIMENSION(:,:,:) :: MEAN_FORCING_CELL
   
   INTEGER :: N_CUTCELLS=0 ! for debugging/visualization
   INTEGER, ALLOCATABLE, DIMENSION(:) :: CUTCELL_LIST ! for debugging/visualization

   INTEGER :: N_WALL_CELLS,N_WALL_CELLS_DIM,N_INTERNAL_WALL_CELLS,N_EXTERNAL_WALL_CELLS,WALL_COUNTER
   REAL(EB) :: BC_CLOCK
   REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: EDGE_INTERPOLATION_FACTOR
   REAL(EB), ALLOCATABLE, DIMENSION(:)   :: D_CORR,DS_CORR,UVW_SAVE,U_GHOST,V_GHOST,W_GHOST
   TYPE(WALL_TYPE), ALLOCATABLE, DIMENSION(:) :: WALL
   TYPE(OMESH_TYPE), ALLOCATABLE, DIMENSION(:) :: OMESH
   TYPE(LAGRANGIAN_PARTICLE_TYPE), ALLOCATABLE, DIMENSION(:) :: LAGRANGIAN_PARTICLE
   TYPE(STORAGE_TYPE), ALLOCATABLE, DIMENSION(:) :: PARTICLE_STORAGE,WALL_STORAGE
   INTEGER :: NLP,NLPDIM
   TYPE(HUMAN_TYPE), ALLOCATABLE, DIMENSION(:) :: HUMAN
   INTEGER :: N_HUMANS,N_HUMANS_DIM
   TYPE(HUMAN_GRID_TYPE), ALLOCATABLE, DIMENSION(:,:) :: HUMAN_GRID

   INTEGER :: N_SLCF
   TYPE(SLICE_TYPE), ALLOCATABLE, DIMENSION(:) :: SLICE

   INTEGER, ALLOCATABLE, DIMENSION(:,:) :: INC
   INTEGER :: N_PATCH
   TYPE(PATCH_TYPE), ALLOCATABLE, DIMENSION(:) :: PATCH

   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:,:) :: UIID
   INTEGER :: RAD_CALL_COUNTER,ANGLE_INC_COUNTER

   INTEGER, ALLOCATABLE, DIMENSION(:,:,:) :: INTERPOLATED_MESH
 
   CHARACTER(80), ALLOCATABLE, DIMENSION(:) :: STRING
   INTEGER :: N_STRINGS,N_STRINGS_MAX

!rm ->
!  REAL(EB), ALLOCATABLE, DIMENSION(:,:,:,:) :: DMPVDT_FM_VEG
   INTEGER, ALLOCATABLE, DIMENSION(:,:,:) :: K_AGL_SLICE
   REAL(EB),ALLOCATABLE, DIMENSION(:,:) :: LS_Z_TERRAIN,VEG_DRAG
   INTEGER :: N_TERRAIN_SLCF
   REAL(EB) :: VEG_CLOCK_BC !surf veg
!rm <-

   ! Embedded Mesh

   REAL(EB), ALLOCATABLE, DIMENSION(:,:,:,:) :: SCALAR_SAVE1,SCALAR_SAVE2,SCALAR_SAVE3
 
END TYPE MESH_TYPE
 
TYPE (MESH_TYPE), SAVE, DIMENSION(:), ALLOCATABLE, TARGET :: MESHES
 
END MODULE MESH_VARIABLES
 
 
MODULE MESH_POINTERS
 
USE PRECISION_PARAMETERS
USE MESH_VARIABLES
IMPLICIT NONE
 
REAL(EB), POINTER, DIMENSION(:,:,:) :: &
   U,V,W,US,VS,WS,DDDT,D,DS,H,HS,KRES,FVX,FVY,FVZ,RHO,RHOS, &
   MU,MU_DNS,TMP,Q,Q_H_CORR,FRHO,KAPPA,QR,QR_W,UII,RSUM,D_LAGRANGIAN,D_REACTION,D_GEOMETRY, &
   CSD2,MTR,MSR,WEM,MIX_TIME,CHEM_SUBIT,STRAIN_RATE,D_Z_MAX,ZETA_SOURCE_TERM
REAL(EB), POINTER, DIMENSION(:,:,:,:) :: ZZ,ZZS,REAC_SOURCE_TERM,DEL_RHO_D_DEL_Z,FX,FY,FZ, &
                                         SCALAR_WORK1,SCALAR_WORK2,SCALAR_WORK3,SCALAR_WORK4
REAL(EB), POINTER, DIMENSION(:,:,:,:) :: AVG_DROP_DEN,AVG_DROP_TMP,AVG_DROP_RAD,AVG_DROP_AREA
REAL(EB), POINTER, DIMENSION(:,:,:)   :: AVG_DROP_DEN_ALL
REAL(EB), POINTER, DIMENSION(:,:) :: UVW_GHOST
REAL(EB), POINTER :: POIS_PTB,POIS_ERR
REAL(EB), POINTER, DIMENSION(:) :: SAVE1,SAVE2,WORK
REAL(EB), POINTER, DIMENSION(:,:,:) :: PRHS
REAL(EB), POINTER, DIMENSION(:,:) :: BXS,BXF,BYS,BYF,BZS,BZF, BXST,BXFT,BYST,BYFT,BZST,BZFT
INTEGER, POINTER :: LSAVE,LWORK,LBC,MBC,NBC,ITRN,JTRN,KTRN,IPS
REAL(EB), POINTER, DIMENSION(:) :: P_0,RHO_0,TMP_0,D_PBAR_DT,D_PBAR_DT_S,U_LEAK,U_DUCT
REAL(EB), POINTER, DIMENSION(:,:) :: PBAR,PBAR_S,R_PBAR
INTEGER, POINTER, DIMENSION(:,:,:) :: PRESSURE_ZONE
REAL(EB), POINTER, DIMENSION(:,:,:) :: WORK1,WORK2,WORK3,WORK4,WORK5,WORK6,WORK7,WORK8,WORK9
INTEGER, POINTER, DIMENSION(:,:,:) :: IWORK1

!! Laplace solve, sparse LU
!
!INTEGER, POINTER :: A_N_ROWS,A_N_COLS,A_N_ELEMENTS
!INTEGER, POINTER, DIMENSION(:) :: A_ROW_INDEX,A_COLUMNS
!REAL(EB), POINTER, DIMENSION(:) :: A_VALUES

REAL(EB),     POINTER, DIMENSION(:,:,:) :: PWORK1,PWORK2,PWORK3,PWORK4
COMPLEX(DPC), POINTER, DIMENSION(:,:,:) :: PWORK5,PWORK6,PWORK7,PWORK8

REAL(EB), POINTER, DIMENSION(:,:,:) :: TURB_WORK1,TURB_WORK2,TURB_WORK3,TURB_WORK4
REAL(EB), POINTER, DIMENSION(:,:,:) :: TURB_WORK5,TURB_WORK6,TURB_WORK7,TURB_WORK8
REAL(EB), POINTER, DIMENSION(:,:,:) :: TURB_WORK9,TURB_WORK10

REAL(EB), POINTER, DIMENSION(:,:,:) :: IBM_SAVE1,IBM_SAVE2,IBM_SAVE3,IBM_SAVE4,IBM_SAVE5,IBM_SAVE6
INTEGER, POINTER, DIMENSION(:,:,:) :: U_MASK,V_MASK,W_MASK,P_MASK

REAL(EB), POINTER, DIMENSION(:) :: WALL_WORK1,WALL_WORK2
REAL(FB), POINTER, DIMENSION(:,:,:,:) :: QQ
REAL(FB), POINTER, DIMENSION(:,:) :: PP,PPN,BNDF_TIME_INTEGRAL
INTEGER, POINTER, DIMENSION(:,:) :: IBK
INTEGER, POINTER, DIMENSION(:,:,:) :: IBLK
REAL(EB), POINTER :: DT,DT_PREV,DT_NEXT,DT_INIT
REAL(EB), POINTER :: CFL,DIVMX,DIVMN,VN,RESMAX,PART_UVWMAX,Q_MAX,Q_UPPER
INTEGER, POINTER :: ICFL,JCFL,KCFL,IMX,JMX,KMX,IMN,JMN,KMN,I_VN,J_VN,K_VN,IRM,JRM,KRM,IUVW
INTEGER, POINTER :: N_EDGES
INTEGER, POINTER, DIMENSION(:,:) :: IJKE,EDGE_INDEX
REAL(EB), POINTER, DIMENSION(:,:) :: TAU_E,OME_E
INTEGER, POINTER, DIMENSION(:,:) :: EDGE_TYPE

INTEGER, POINTER :: MESH_LEVEL,LBC_EMB,MBC_EMB,NBC_EMB
INTEGER, POINTER :: IBAR,JBAR,KBAR,IBM1,JBM1,KBM1,IBP1,JBP1,KBP1
INTEGER, POINTER, DIMENSION(:) :: RGB
REAL(EB), POINTER :: DXI,DETA,DZETA,RDXI,RDETA,RDZETA, &
   DXMIN,DXMAX,DYMIN,DYMAX,DZMIN,DZMAX, &
   XS,XF,YS,YF,ZS,ZF,RDXINT,RDYINT,RDZINT,CELL_SIZE
REAL(EB), POINTER, DIMENSION(:) :: R,RC,X,Y,Z,XC,YC,ZC,HX,HY,HZ, &
   DX,RDX,DXN,RDXN,DY,RDY,DYN,RDYN,DZ,RDZ,DZN,RDZN, &
   CELLSI,CELLSJ,CELLSK,RRN
REAL(FB), POINTER, DIMENSION(:) :: XPLT,YPLT,ZPLT
INTEGER, POINTER :: N_OBST
TYPE(OBSTRUCTION_TYPE), POINTER, DIMENSION(:) :: OBSTRUCTION
INTEGER, POINTER :: N_VENT
TYPE(VENTS_TYPE), POINTER, DIMENSION(:) :: VENTS
INTEGER, POINTER, DIMENSION(:,:,:) :: CELL_INDEX,CUTCELL_INDEX
INTEGER, POINTER, DIMENSION(:) :: I_CELL,J_CELL,K_CELL,OBST_INDEX_C,I_CUTCELL,J_CUTCELL,K_CUTCELL
TYPE(CUTCELL_TYPE), POINTER, DIMENSION(:) :: CUTCELL
INTEGER, POINTER, DIMENSION(:,:) :: WALL_INDEX
LOGICAL, POINTER, DIMENSION(:) :: SOLID,EXTERIOR
LOGICAL, POINTER, DIMENSION(:,:,:) :: MEAN_FORCING_CELL
INTEGER, POINTER :: N_WALL_CELLS,N_WALL_CELLS_DIM,N_INTERNAL_WALL_CELLS,N_EXTERNAL_WALL_CELLS,WALL_COUNTER
REAL(EB),POINTER :: BC_CLOCK
REAL(EB), POINTER, DIMENSION(:,:) :: EDGE_INTERPOLATION_FACTOR
REAL(EB), POINTER, DIMENSION(:)   :: D_CORR,DS_CORR,UVW_SAVE,U_GHOST,V_GHOST,W_GHOST
TYPE(WALL_TYPE), POINTER, DIMENSION(:) :: WALL
TYPE(OMESH_TYPE), POINTER, DIMENSION(:) :: OMESH
TYPE(LAGRANGIAN_PARTICLE_TYPE), POINTER, DIMENSION(:) :: LAGRANGIAN_PARTICLE
TYPE(STORAGE_TYPE), POINTER, DIMENSION(:) :: WALL_STORAGE,PARTICLE_STORAGE
INTEGER, POINTER :: NLP,NLPDIM
TYPE(HUMAN_TYPE), POINTER, DIMENSION(:) :: HUMAN
INTEGER, POINTER :: N_HUMANS,N_HUMANS_DIM
TYPE(HUMAN_GRID_TYPE), POINTER, DIMENSION(:,:) :: HUMAN_GRID
INTEGER, POINTER :: N_SLCF
TYPE(SLICE_TYPE), POINTER, DIMENSION(:) :: SLICE
INTEGER, POINTER, DIMENSION(:,:) :: INC
INTEGER, POINTER :: N_PATCH
TYPE(PATCH_TYPE), POINTER, DIMENSION(:) :: PATCH
REAL(EB), POINTER, DIMENSION(:,:,:,:) :: UIID
INTEGER,  POINTER :: RAD_CALL_COUNTER,ANGLE_INC_COUNTER
INTEGER, POINTER, DIMENSION(:,:,:) :: INTERPOLATED_MESH
CHARACTER(80), POINTER, DIMENSION(:) :: STRING
INTEGER, POINTER :: N_STRINGS,N_STRINGS_MAX
!rm ->
!REAL(EB), POINTER, DIMENSION(:,:,:,:) :: DMPVDT_FM_VEG
INTEGER, POINTER, DIMENSION(:,:,:) :: K_AGL_SLICE
REAL(EB), POINTER,DIMENSION(:,:) :: LS_Z_TERRAIN,VEG_DRAG
INTEGER, POINTER :: N_TERRAIN_SLCF
REAL(EB), POINTER :: VEG_CLOCK_BC  !surf veg
!rm <-

! Embedded Mesh

REAL(EB), POINTER, DIMENSION(:,:,:,:) :: SCALAR_SAVE1,SCALAR_SAVE2,SCALAR_SAVE3


CONTAINS


SUBROUTINE POINT_TO_MESH(NM)

! Local names for MESH variables point to Global names
 
INTEGER, INTENT(IN) ::  NM
TYPE (MESH_TYPE), POINTER :: M
 
M=>MESHES(NM)
U=>M%U
V=>M%V
W=>M%W
US=>M%US
VS=>M%VS
WS=>M%WS
DDDT=>M%DDDT
D=>M%D
DS=>M%DS
H=>M%H 
HS=>M%HS
KRES=>M%KRES
FVX=>M%FVX
FVY=>M%FVY
FVZ=>M%FVZ  
RHO=>M%RHO
RHOS=>M%RHOS
TMP=>M%TMP
CHEM_SUBIT=>M%CHEM_SUBIT
FRHO=>M%FRHO
MU=>M%MU
MU_DNS=>M%MU_DNS
D_Z_MAX=>M%D_Z_MAX
CSD2=>M%CSD2
STRAIN_RATE=>M%STRAIN_RATE
MIX_TIME=>M%MIX_TIME
Q=>M%Q
Q_H_CORR=>M%Q_H_CORR
QR=>M%QR
QR_W=>M%QR_W
KAPPA=>M%KAPPA 
UII=>M%UII 
AVG_DROP_DEN=>M%AVG_DROP_DEN
AVG_DROP_AREA=>M%AVG_DROP_AREA
AVG_DROP_TMP=>M%AVG_DROP_TMP
AVG_DROP_RAD=>M%AVG_DROP_RAD
AVG_DROP_DEN_ALL=>M%AVG_DROP_DEN_ALL
D_LAGRANGIAN=>M%D_LAGRANGIAN
D_GEOMETRY=>M%D_GEOMETRY
D_REACTION=>M%D_REACTION
RSUM=>M%RSUM
ZZ=>M%ZZ
ZZS=>M%ZZS
REAC_SOURCE_TERM=>M%REAC_SOURCE_TERM
ZETA_SOURCE_TERM=>M%ZETA_SOURCE_TERM
DEL_RHO_D_DEL_Z=>M%DEL_RHO_D_DEL_Z
FX=>M%FX
FY=>M%FY
FZ=>M%FZ
UVW_GHOST=>M%UVW_GHOST
POIS_PTB=>M%POIS_PTB
POIS_ERR=>M%POIS_ERR
SAVE1=>M%SAVE1
SAVE2=>M%SAVE2
!! Laplace solve
!A_N_ROWS=>M%A_N_ROWS
!A_N_COLS=>M%A_N_COLS
!A_N_ELEMENTS=>M%A_N_ELEMENTS
!A_ROW_INDEX=>M%A_ROW_INDEX
!A_COLUMNS=>M%A_COLUMNS
!A_VALUES=>M%A_VALUES
!! -------------
SCALAR_SAVE1=>M%SCALAR_SAVE1
SCALAR_SAVE2=>M%SCALAR_SAVE2
SCALAR_SAVE3=>M%SCALAR_SAVE3
SCALAR_WORK1=>M%SCALAR_WORK1
SCALAR_WORK2=>M%SCALAR_WORK2
SCALAR_WORK3=>M%SCALAR_WORK3
SCALAR_WORK4=>M%SCALAR_WORK4
WORK=>M%WORK
LSAVE=>M%LSAVE
LWORK=>M%LWORK
PRHS=>M%PRHS
BXS=>M%BXS
BXF=>M%BXF 
BYS=>M%BYS
BYF=>M%BYF 
BZS=>M%BZS
BZF=>M%BZF 
BXST=>M%BXST
BXFT=>M%BXFT 
BYST=>M%BYST
BYFT=>M%BYFT 
BZST=>M%BZST
BZFT=>M%BZFT 
LBC=>M%LBC
MBC=>M%MBC
NBC=>M%NBC 
ITRN=>M%ITRN
JTRN=>M%JTRN
KTRN=>M%KTRN
IPS=>M%IPS
LBC_EMB=>M%LBC_EMB
MBC_EMB=>M%MBC_EMB
NBC_EMB=>M%NBC_EMB 
U_LEAK=>M%U_LEAK
U_DUCT=>M%U_DUCT
D_PBAR_DT=>M%D_PBAR_DT
D_PBAR_DT_S=>M%D_PBAR_DT_S
PBAR=>M%PBAR
PBAR_S=>M%PBAR_S
R_PBAR=>M%R_PBAR
P_0=>M%P_0
RHO_0=>M%RHO_0
TMP_0=>M%TMP_0
PRESSURE_ZONE=>M%PRESSURE_ZONE
WORK1=>M%WORK1
WORK2=>M%WORK2
WORK3=>M%WORK3 
WORK4=>M%WORK4
WORK5=>M%WORK5
WORK6=>M%WORK6 
WORK7=>M%WORK7
WORK8=>M%WORK8
WORK9=>M%WORK9
IWORK1=>M%IWORK1
PWORK1=>M%PWORK1
PWORK2=>M%PWORK2
PWORK3=>M%PWORK3 
PWORK4=>M%PWORK4
PWORK5=>M%PWORK5
PWORK6=>M%PWORK6 
PWORK7=>M%PWORK7
PWORK8=>M%PWORK8
TURB_WORK1=>M%TURB_WORK1
TURB_WORK2=>M%TURB_WORK2
TURB_WORK3=>M%TURB_WORK3 
TURB_WORK4=>M%TURB_WORK4
TURB_WORK5=>M%TURB_WORK5
TURB_WORK6=>M%TURB_WORK6
TURB_WORK7=>M%TURB_WORK7
TURB_WORK8=>M%TURB_WORK8
TURB_WORK9=>M%TURB_WORK9
TURB_WORK10=>M%TURB_WORK10
IBM_SAVE1=>M%IBM_SAVE1
IBM_SAVE2=>M%IBM_SAVE2
IBM_SAVE3=>M%IBM_SAVE3
IBM_SAVE4=>M%IBM_SAVE4
IBM_SAVE5=>M%IBM_SAVE5
IBM_SAVE6=>M%IBM_SAVE6
U_MASK=>M%U_MASK
V_MASK=>M%V_MASK
W_MASK=>M%W_MASK
P_MASK=>M%P_MASK
MESH_LEVEL=>M%MESH_LEVEL
WALL_WORK1=>M%WALL_WORK1
WALL_WORK2=>M%WALL_WORK2
QQ=>M%QQ
PP=>M%PP
PPN=>M%PPN
BNDF_TIME_INTEGRAL=>M%BNDF_TIME_INTEGRAL
IBK=>M%IBK
IBLK=>M%IBLK
DT=>M%DT
DT_PREV=>M%DT_PREV
DT_NEXT=>M%DT_NEXT
DT_INIT=>M%DT_INIT
CFL=>M%CFL
DIVMX=>M%DIVMX
Q_MAX=>M%Q_MAX
Q_UPPER=>M%Q_UPPER
VN=>M%VN
RESMAX=>M%RESMAX
DIVMN=>M%DIVMN
PART_UVWMAX=>M%PART_UVWMAX
ICFL=>M%ICFL
JCFL=>M%JCFL
KCFL=>M%KCFL 
IMX=>M%IMX
JMX=>M%JMX
KMX=>M%KMX
IMN=>M%IMN
JMN=>M%JMN
KMN=>M%KMN
IRM=>M%IRM
JRM=>M%JRM
KRM=>M%KRM
IUVW=>M%IUVW
I_VN=>M%I_VN
J_VN=>M%J_VN
K_VN=>M%K_VN
N_EDGES=>M%N_EDGES
IJKE=>M%IJKE
EDGE_INDEX=>M%EDGE_INDEX
TAU_E=>M%TAU_E
OME_E=>M%OME_E
EDGE_TYPE=>M%EDGE_TYPE
IBAR=>M%IBAR
JBAR=>M%JBAR
KBAR=>M%KBAR 
IBM1=>M%IBM1
JBM1=>M%JBM1
KBM1=>M%KBM1 
IBP1=>M%IBP1
JBP1=>M%JBP1
KBP1=>M%KBP1 
RGB=>M%RGB
DXI=>M%DXI
DETA=>M%DETA
DZETA=>M%DZETA 
RDXI=>M%RDXI
RDETA=>M%RDETA
RDZETA=>M%RDZETA 
DXMIN=>M%DXMIN
DXMAX=>M%DXMAX 
DYMIN=>M%DYMIN
DYMAX=>M%DYMAX 
DZMIN=>M%DZMIN
DZMAX=>M%DZMAX 
CELL_SIZE=>M%CELL_SIZE
XS=>M%XS 
XF=>M%XF 
YS=>M%YS
YF=>M%YF 
ZS=>M%ZS 
ZF=>M%ZF 
RDXINT=>M%RDXINT
RDYINT=>M%RDYINT
RDZINT=>M%RDZINT 
R=>M%R
RC=>M%RC
X=>M%X
Y=>M%Y
Z=>M%Z 
XC=>M%XC
YC=>M%YC
ZC=>M%ZC
HX=>M%HX
HY=>M%HY
HZ=>M%HZ
DX=>M%DX
DY=>M%DY
DZ=>M%DZ 
DXN=>M%DXN
DYN=>M%DYN
DZN=>M%DZN
RDX=>M%RDX
RDY=>M%RDY
RDZ=>M%RDZ 
RDXN=>M%RDXN
RDYN=>M%RDYN
RDZN=>M%RDZN
CELLSI=>M%CELLSI
CELLSJ=>M%CELLSJ
CELLSK=>M%CELLSK 
RRN=>M%RRN
XPLT=>M%XPLT
YPLT=>M%YPLT
ZPLT=>M%ZPLT 
N_OBST=>M%N_OBST
OBSTRUCTION=>M%OBSTRUCTION
N_VENT=>M%N_VENT
VENTS=>M%VENTS
CELL_INDEX=>M%CELL_INDEX
I_CELL=>M%I_CELL
J_CELL=>M%J_CELL
K_CELL=>M%K_CELL
CUTCELL_INDEX=>M%CUTCELL_INDEX
I_CUTCELL=>M%I_CUTCELL
J_CUTCELL=>M%J_CUTCELL
K_CUTCELL=>M%K_CUTCELL
CUTCELL=>M%CUTCELL
OBST_INDEX_C=>M%OBST_INDEX_C
WALL_INDEX=>M%WALL_INDEX
SOLID=>M%SOLID 
EXTERIOR=>M%EXTERIOR
MEAN_FORCING_CELL=>M%MEAN_FORCING_CELL
N_WALL_CELLS=>M%N_WALL_CELLS
N_WALL_CELLS_DIM=>M%N_WALL_CELLS_DIM
N_INTERNAL_WALL_CELLS=>M%N_INTERNAL_WALL_CELLS
N_EXTERNAL_WALL_CELLS=>M%N_EXTERNAL_WALL_CELLS
WALL_COUNTER=>M%WALL_COUNTER
BC_CLOCK=>M%BC_CLOCK
UVW_SAVE=>M%UVW_SAVE
D_CORR=>M%D_CORR
DS_CORR=>M%DS_CORR
U_GHOST=>M%U_GHOST
V_GHOST=>M%V_GHOST
W_GHOST=>M%W_GHOST
EDGE_INTERPOLATION_FACTOR=>M%EDGE_INTERPOLATION_FACTOR
WALL=>M%WALL
OMESH=>M%OMESH
LAGRANGIAN_PARTICLE =>M%LAGRANGIAN_PARTICLE  
PARTICLE_STORAGE =>M%PARTICLE_STORAGE
WALL_STORAGE =>M%WALL_STORAGE
NLP=>M%NLP 
NLPDIM=>M%NLPDIM
HUMAN =>M%HUMAN  
N_HUMANS=>M%N_HUMANS  
N_HUMANS_DIM=>M%N_HUMANS_DIM
HUMAN_GRID =>M%HUMAN_GRID
N_SLCF=>M%N_SLCF
SLICE=>M%SLICE
INC=>M%INC
N_PATCH=>M%N_PATCH
PATCH=>M%PATCH
UIID=>M%UIID 
RAD_CALL_COUNTER=>M%RAD_CALL_COUNTER
ANGLE_INC_COUNTER=>M%ANGLE_INC_COUNTER
INTERPOLATED_MESH => M%INTERPOLATED_MESH
STRING=>M%STRING 
N_STRINGS=>M%N_STRINGS 
N_STRINGS_MAX=>M%N_STRINGS_MAX
!rm ->
!DMPVDT_FM_VEG => M%DMPVDT_FM_VEG
K_AGL_SLICE   => M%K_AGL_SLICE
N_TERRAIN_SLCF=>M%N_TERRAIN_SLCF
VEG_CLOCK_BC  =>M%VEG_CLOCK_BC !surf veg
VEG_DRAG      =>M%VEG_DRAG !bndry fuel momentum drag
LS_Z_TERRAIN  =>M%LS_Z_TERRAIN !terrain height for level set fire spread
!rm <-
 
END SUBROUTINE POINT_TO_MESH

END MODULE MESH_POINTERS

