#
# Earth System Modeling Applications (ESMA) base makefile fragment.
# This fragment defines MAO specific macros associated with basic, shared 
# packages. This file must be included after ESMA_base.mk and ESMA_arch.mk.
#
# REVISION HISTORY:
#
# 13oct04  da Silva  First Crack
# 04apr05  Todling   Commented out REAL4 definition
# 25jun10  Thompson	Add additional aliases needed for PGI build
# 26jul10  Todling   add libGSI_Util.a
#
#--------------------------------------------------------------------------

#                       ----------------
#                        Shared Packages
#                       ----------------

# GEOS-5 Build environment
# ------------------------

DOING_GEOS5 = TRUE

THIS_MPEU = GMAO_mpeu
INC_MPEU = $(ESMAINC)/GMAO_mpeu
LIB_MPEU = $(ESMALIB)/libGMAO_mpeu.a
LIB_EU   = $(ESMALIB)/libGMAO_eu.a

INC_ODS = $(ESMAINC)/GMAO_ods
LIB_ODS = $(ESMALIB)/libGMAO_ods.a

ifeq ($(ESMA_SDF),hdf)
   INC_MFHDF3 = $(ESMAINC)/GMAO_mfhdf3
   LIB_MFHDF3 = $(ESMALIB)/libGMAO_mfhdf3.a
else
   INC_MFHDF3 = $(INC_NETCDF)
   LIB_MFHDF3 = 
endif

THIS_GFIO = GMAO_gfio
INC_GFIO = $(ESMAINC)/$(THIS_GFIO)
LIB_GFIO = $(ESMALIB)/lib$(THIS_GFIO).a

THIS_CFIO = MAPL_cfio
INC_CFIO = $(ESMAINC)/$(THIS_CFIO)
LIB_CFIO = $(ESMALIB)/lib$(THIS_CFIO).a

THIS_CFIO_EOS = MAPL_cfio_eos
INC_CFIO_EOS = $(ESMAINC)/$(THIS_CFIO_EOS)
LIB_CFIO_EOS = $(ESMALIB)/lib$(THIS_CFIO_EOS).a

INC_GFIOEOS = $(ESMAINC)/GMAO_gfioeos
LIB_GFIOEOS = $(ESMALIB)/libGMAO_gfioeos.a $(LIB_EOS)

THIS_HERMES = GMAO_hermes
INC_HERMES = $(ESMAINC)/GMAO_hermes
LIB_HERMES = $(ESMALIB)/libGMAO_hermes.a

INC_CHEM_BASE = $(ESMAINC)/Chem_Base
LIB_CHEM_BASE = $(ESMALIB)/libChem_Base.a

# Comment out for GCHP
#INC_CHEM_SHARED = $(ESMAINC)/Chem_Shared
#LIB_CHEM_SHARED = $(ESMALIB)/libChem_Shared.a

INC_CHEM = $(ESMAINC)/GEOSchem_GridComp
LIB_CHEM = $(ESMALIB)/libGEOSchem_GridComp.a

INC_GEOS_BASE = $(ESMAINC)/GEOS_Base
LIB_GEOS_BASE = $(ESMALIB)/libGEOS_Base.a

# Comment out for GCHP
#INC_GEOS_SHARED = $(ESMAINC)/GEOS_Shared
#LIB_GEOS_SHARED = $(ESMALIB)/libGEOS_Shared.a

# Comment out for GCHP
#INC_PILGRIM = $(ESMAINC)/GMAO_pilgrim
#LIB_PILGRIM = $(ESMALIB)/libGMAO_pilgrim.a

THIS_GFDL_FMS = GFDL_fms
INC_GFDL_FMS = $(ESMAINC)/$(THIS_GFDL_FMS)
LIB_GFDL_FMS = $(ESMALIB)/lib$(THIS_GFDL_FMS).a

# Comment out for GCHP
#INC_TRANSF = $(ESMAINC)/GMAO_transf
#LIB_TRANSF = $(ESMALIB)/libGMAO_transf.a

# Comment out for GCHP
#INC_LANL_CICE = $(ESMAINC)/LANL_cice
#LIB_LANL_CICE = $(ESMALIB)/libLANL_cice.a

INC_GMAO_pFIO = $(ESMAINC)/GMAO_pFIO
LIB_GMAO_pFIO = $(ESMALIB)/libGMAO_pFIO.a

# This should be renamed MAPL_BASE
INC_MAPL_BASE = $(ESMAINC)/MAPL_Base
LIB_MAPL_BASE = $(ESMALIB)/libMAPL_Base.a $(LIB_GMAO_pFIO)

# Remove unused libraries from INC_GMAO_SHARED for GCHP. Also remove
# GFDL_FMS to avoid nonexistent include directory messages when compiling with gfortran.
#INC_GMAO_SHARED = $(INC_MPEU) $(INC_PILGRIM) $(INC_MFHDF3) $(INC_GFIO) \
#                  $(INC_CFIO) $(INC_MAPL_BASE) $(INC_GEOS_SHARED) $(INC_HERMES) \
#                  $(INC_CHEM_BASE) $(INC_CHEM_SHARED) $(INC_GFDL_FMS) $(INC_LANL_CICE) \
#                  $(INC_GMAO_pFIO)
INC_GMAO_SHARED = $(INC_MPEU)   $(INC_MFHDF3)  $(INC_GFIO) \
                  $(INC_CFIO)   $(INC_MAPL_BASE)                           \
                  $(INC_HERMES) $(INC_GMAO_pFIO)

# NOTE: most of the rest of this is not used in GCHP, but leave as is for now:

INC_PSAS = $(ESMAINC)/GMAO_psas
LIB_PSAS = $(ESMALIB)/libGMAO_psas.a

THIS_GSI = GSI_GridComp
INC_GSI = $(ESMAINC)/$(THIS_GSI)
LIB_GSI = $(ESMALIB)/lib$(THIS_GSI).a
LIB_GSI_OBSERVER = $(ESMALIB)/libGSI_Observer.a
LIB_GSI_OTHER = $(ESMALIB)/libGSI_Other.a
LIB_GSI_SOLVER = $(ESMALIB)/libGSI_Solver.a
LIB_GSI_UTIL = $(ESMALIB)/libGSI_Util.a

THIS_GEOSGSI_COUPLER = GEOSgsi_Coupler
THIS_GEOSGSI_UTIL    = GEOSgsi_Util
INC_GEOSGSI_COUPLER = $(ESMAINC)/$(THIS_GEOSGSI_COUPLER)
LIB_GEOSGSI_COUPLER = $(ESMALIB)/lib$(THIS_GEOSGSI_COUPLER).a
LIB_GEOSGSI_UTIL    = $(ESMALIB)/lib$(THIS_GEOSGSI_UTIL).a

THIS_BACIO = NCEP_bacio
INC_BACIO  = $(ESMAINC)/$(THIS_BACIO)
LIB_BACIO  = $(ESMALIB)/lib$(THIS_BACIO).a

THIS_BUFR = NCEP_bufr
INC_BUFR  = $(ESMAINC)/$(THIS_BUFR)
LIB_BUFR  = $(ESMALIB)/lib$(THIS_BUFR).a

THIS_NCDIAG_WRITE = nc_diag_write
INC_NCDIAG_WRITE  = $(ESMAINC)/$(THIS_NCDIAG_WRITE)
LIB_NCDIAG_WRITE  = $(ESMALIB)/lib$(THIS_NCDIAG_WRITE).a

THIS_NCDIAG_READ = nc_diag_read
INC_NCDIAG_READ  = $(ESMAINC)/$(THIS_NCDIAG_READ)
LIB_NCDIAG_READ  = $(ESMALIB)/lib$(THIS_NCDIAG_READ).a

THIS_CRTM = NCEP_crtm
INC_CRTM  = $(ESMAINC)/$(THIS_CRTM)
LIB_CRTM  = $(ESMALIB)/lib$(THIS_CRTM).a

THIS_IRSSE = NCEP_irsse
INC_IRSSE  = $(ESMAINC)/$(THIS_IRSSE)
LIB_IRSSE  = $(ESMALIB)/lib$(THIS_IRSSE).a

THIS_NEMSIO = NCEP_nemsio
INC_NEMSIO  = $(ESMAINC)/$(THIS_NEMSIO)
LIB_NEMSIO  = $(ESMALIB)/lib$(THIS_NEMSIO).a

THIS_SFCIO = NCEP_sfcio
INC_SFCIO  = $(ESMAINC)/$(THIS_SFCIO)
LIB_SFCIO  = $(ESMALIB)/lib$(THIS_SFCIO).a

THIS_SIGIO = NCEP_sigio
INC_SIGIO  = $(ESMAINC)/$(THIS_SIGIO)
LIB_SIGIO  = $(ESMALIB)/lib$(THIS_SIGIO).a

THIS_SP = NCEP_sp
INC_SP  = $(ESMAINC)/$(THIS_SP)
LIB_SP  = $(ESMALIB)/lib$(THIS_SP).a

THIS_W3 = NCEP_w3
INC_W3  = $(ESMAINC)/$(THIS_W3)
LIB_W3  = $(ESMALIB)/lib$(THIS_W3).a

INC_AIRS = $(ESMAINC)/GMAO_iret--airs
LIB_AIRS = $(ESMALIB)/libGMAO_iret--airs.a

INC_FASTEM = $(ESMAINC)/GMAO_iret--fastem
LIB_FASTEM = $(ESMALIB)/libGMAO_iret--fastem.a

INC_GLATOVS = $(ESMAINC)/GMAO_iret--glatovs
LIB_GLATOVS = $(ESMALIB)/libGMAO_iret--glatovs.a

INC_HFFP = $(ESMAINC)/GMAO_iret--hffp
LIB_HFFP = $(ESMALIB)/libGMAO_iret--hffp.a

INC_IDL = $(ESMAINC)/GMAO_iret--idl
LIB_IDL = $(ESMALIB)/libGMAO_iret--idl.a

INC_IRUTIL = $(ESMAINC)/GMAO_iret--irutil
LIB_IRUTIL = $(ESMALIB)/libGMAO_iret--irutil.a

INC_MIT = $(ESMAINC)/GMAO_iret--mit
LIB_MIT = $(ESMALIB)/libGMAO_iret--mit.a

INC_OPTRAN = $(ESMAINC)/GMAO_iret--optran
LIB_OPTRAN = $(ESMALIB)/libGMAO_iret--optran.a

INC_RADTRANS = $(ESMAINC)/GMAO_iret--radtrans
LIB_RADTRANS = $(ESMALIB)/libGMAO_iret--radtrans.a

INC_SARTA = $(ESMAINC)/GMAO_iret--sarta
LIB_SARTA = $(ESMALIB)/libGMAO_iret--sarta.a

#
# CTM related vars
#
INC_CTM_pTracers= $(ESMAINC)/CTMpTracers_GridComp
INC_CTM_DIFF    = $(ESMAINC)/CTMdiffusion_GridComp
INC_CTM_CONV    = $(ESMAINC)/CTMconvection_GridComp

INC_CTM_VARS    = $(INC_CTM_pTracers) $(INC_CTM_DIFF) $(INC_CTM_CONV)

#
# GCM related vars
#
INC_CHEM_GOCART  = $(INC_CHEM)
INC_CHEM_PCHEM   = $(ESMAINC)/GEOSpchem_GridComp
INC_CHEM_ACHEM   = $(ESMAINC)/GEOSachem_GridComp
INC_CHEM_GMI     = $(ESMAINC)/GMIchem_GridComp
INC_CHEM_GEOSCHEM = $(ESMAINC)/GEOSCHEMchem_GridComp
INC_CHEM_CARMA   = $(ESMAINC)/CARMAchem_GridComp
INC_CHEM_GAAS    = $(ESMAINC)/GAAS_GridComp
INC_CHEM_MATRIX  = $(ESMAINC)/MATRIXchem_GridComp
INC_CHEM_MAM     = $(ESMAINC)/MAMchem_GridComp
INC_CHEM_TR      = $(ESMAINC)/TR_GridComp
INC_CHEM_H2O     = $(ESMAINC)/H2O_GridComp
INC_CHEM_DNA     = $(ESMAINC)/DNA_GridComp
INC_CHEM_HEMCO   = $(ESMAINC)/HEMCO_GridComp
INC_CHEM_STRAT   = $(INC_CHEM)

INC_GEOS_CHEM    = $(INC_CHEM) $(INC_CHEM_GOCART) $(INC_CHEM_PCHEM) \
                   $(INC_CHEM_ACHEM) $(INC_CHEM_GMI) \
                   $(INC_CHEM_GEOSCHEM) $(INC_CHEM_STRAT) $(INC_CHEM_CARMA) \
                   $(INC_CHEM_GAAS) $(INC_CHEM_MATRIX) \
                   $(INC_CHEM_MAM) $(INC_CHEM_H2O) $(INC_CHEM_TR) $(INC_CHEM_DNA) \
                   $(INC_CHEM_HEMCO) $(INC_CTM_VARS) 

INC_GEOS_GWD     = $(ESMAINC)/GEOSgwd_GridComp
INC_GEOS_MOIST   = $(ESMAINC)/GEOSmoist_GridComp
INC_GEOS_RADSHR  = $(ESMAINC)/GEOS_RadiationShared
INC_GEOS_SATSIM  = $(ESMAINC)/GEOSsatsim_GridComp
INC_GEOS_RRTMG   = $(ESMAINC)/RRTMG
INC_GEOS_RRTMG_SW= $(ESMAINC)/RRTMG_SW
INC_GEOS_SOLAR   = $(ESMAINC)/GEOSsolar_GridComp $(INC_GEOS_RADSHR)
INC_GEOS_IRRAD   = $(ESMAINC)/GEOSirrad_GridComp $(INC_GEOS_RADSHR)
INC_GEOS_RAD     = $(ESMAINC)/GEOSradiation_GridComp $(INC_GEOS_SOLAR) $(INC_GEOS_IRRAD) $(INC_GEOS_SATSIM) $(INC_GEOS_RRTMG) $(INC_GEOS_RRTMG_SW)

INC_GEOS_LANDSHR = $(ESMAINC)/GEOS_LandShared
LIB_GEOS_LANDSHR = $(ESMALIB)/libGEOS_LandShared.a

INC_GEOS_ROUTE   = $(ESMAINC)/GEOSroute_GridComp
LIB_GEOS_ROUTE   = $(ESMALIB)/libGEOSroute_GridComp.a

INC_GEOS_SURFSHR = $(ESMAINC)/GEOS_SurfaceShared
INC_GEOS_LAKE    = $(ESMAINC)/GEOSlake_GridComp
INC_GEOS_LAND    = $(ESMAINC)/GEOSland_GridComp $(INC_GEOS_LANDSHR) $(ESMAINC)/GEOScatch_GridComp $(ESMAINC)/GEOScatchCN_GridComp $(ESMAINC)/GEOSvegdyn_GridComp
INC_GEOS_LANDICE = $(ESMAINC)/GEOSlandice_GridComp $(INC_GEOS_SURFSHR)
INC_GEOS_SALT    = $(ESMAINC)/GEOSsaltwater_GridComp
INC_GEOS_SURF    = $(ESMAINC)/GEOSsurface_GridComp $(INC_GEOS_LAKE) $(INC_GEOS_LAND) $(INC_GEOS_LANDICE) $(INC_GEOS_SALT)

INC_GEOS_TURB    = $(ESMAINC)/GEOSturbulence_GridComp
INC_GEOS_PHYS    = $(ESMAINC)/GEOSphysics_GridComp $(INC_GEOS_CHEM) $(INC_GEOS_GWD) $(INC_GEOS_MOIST) $(INC_GEOS_RAD) $(INC_GEOS_SURF) $(INC_GEOS_TURB)

INC_GEOS_FV      = $(ESMAINC)/FVdycore_GridComp
INC_GEOS_FV1     = $(ESMAINC)/fvdycore
INC_GEOS_FV3     = $(ESMAINC)/FVdycoreCubed_GridComp
INC_GEOS_FV2     = $(ESMAINC)/FVdycoreCubed_v2_GridComp
INC_GEOS_ARIES   = $(ESMAINC)/ARIESg3_GridComp
INC_GEOS_DATMO   = $(ESMAINC)/GEOSdatmodyn_GridComp
INC_GEOS_TOPO    = $(ESMAINC)/GEOStopo_GridComp
INC_GEOS_SDYN    = $(ESMAINC)/GEOSsuperdyn_GridComp $(INC_GEOS_FV) $(INC_GEOS_FV1) $(INC_GEOS_FV3) $(INC_GEOS_FV2) $(INC_GEOS_ARIES) $(INC_GEOS_DATMO)

INC_GEOS_AGCM    = $(ESMAINC)/GEOSagcm_GridComp $(INC_GEOS_SDYN) $(INC_GEOS_PHYS)

INC_GEOS_MKIAU   = $(ESMAINC)/GEOSmkiau_GridComp

INC_GEOS_OBGC    = $(ESMAINC)/GEOSoceanbiogeochem_GridComp
INC_GEOS_DATASEA = $(ESMAINC)/GEOSdatasea_GridComp
INC_GEOS_OCEAN   = $(ESMAINC)/GEOSocean_GridComp $(INC_GEOS_DATASEA)
INC_GEOS_ORAD    = $(ESMAINC)/GEOSorad_GridComp
INC_GEOS_DATASICE= $(ESMAINC)/GEOSdataseaice_GridComp
INC_GEOS_DYNASICE= $(ESMAINC)/GEOSCICEDyna_GridComp
INC_GEOS_SICE    = $(ESMAINC)/GEOSseaice_GridComp $(INC_GEOS_DATASICE) $(INC_GEOS_DYNASICE)
INC_GEOS_OGCM    = $(ESMAINC)/GEOSogcm_GridComp $(INC_GEOS_OBGC) $(INC_GEOS_OCEAN) $(INC_GEOS_ORAD) $(INC_GEOS_SICE)

INC_GEOS_GCM     = $(ESMAINC)/GEOSgcm_GridComp $(INC_GEOS_AGCM) $(INC_GEOS_OGCM) $(INC_GEOS_MKIAU)
INC_GEOS_GCS     = $(ESMAINC)/GEOSgcs_GridComp $(INC_GEOS_GCM)

#
# PSAS-based AOD analysis
#

INC_OBS_AOD = $(ESMAINC)/obs_aod
LIB_OBS_AOD = $(ESMALIB)/libobs_aod.a

INC_ANA_AOD = $(ESMAINC)/ana_aod
LIB_ANA_AOD = $(ESMALIB)/libana_aod.a

#
# LIDORT Family
#

INC_LIDORT  = $(ESMAINC)/LIDORT
LIB_LIDORT  = $(ESMALIB)/libLIDORT.a
INC_VLIDORT = $(ESMAINC)/VLIDORT
LIB_VLIDORT = $(ESMALIB)/libVLIDORT.a
INC_2STREAM = $(ESMAINC)/2STREAM
LIB_2STREAM = $(ESMALIB)/lib2STREAM.a

#
# Older PSAS-based Modules
#

INC_OBS = $(ESMAINC)/obs
LIB_OBS = $(ESMALIB)/libobs.a

INC_ANA = $(ESMAINC)/ana
LIB_ANA = $(ESMALIB)/libana.a

INC_FVGCM = $(ESMAINC)/fvgcm
LIB_FVGCM = $(ESMALIB)/libfvgcm.a

INC_GEOS_LDASSHR = $(ESMAINC)/GEOS_LdasShared
INC_GEOS_LDAS    = $(INC_GEOS_LDASSHR) $(ESMAINC)/GEOSmetforce_GridComp $(ESMAINC)/GEOSlandpert_GridComp $(ESMAINC)/GEOSens_GridComp

