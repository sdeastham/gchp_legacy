 /*  +-======-+ 
  Copyright (c) 2003-2007 United States Government as represented by 
  the Admistrator of the National Aeronautics and Space Administration.  
  All Rights Reserved.
  
  THIS OPEN  SOURCE  AGREEMENT  ("AGREEMENT") DEFINES  THE  RIGHTS  OF USE,
  REPRODUCTION,  DISTRIBUTION,  MODIFICATION AND REDISTRIBUTION OF CERTAIN 
  COMPUTER SOFTWARE ORIGINALLY RELEASED BY THE UNITED STATES GOVERNMENT AS 
  REPRESENTED BY THE GOVERNMENT AGENCY LISTED BELOW ("GOVERNMENT AGENCY").  
  THE UNITED STATES GOVERNMENT, AS REPRESENTED BY GOVERNMENT AGENCY, IS AN 
  INTENDED  THIRD-PARTY  BENEFICIARY  OF  ALL  SUBSEQUENT DISTRIBUTIONS OR 
  REDISTRIBUTIONS  OF THE  SUBJECT  SOFTWARE.  ANYONE WHO USES, REPRODUCES, 
  DISTRIBUTES, MODIFIES  OR REDISTRIBUTES THE SUBJECT SOFTWARE, AS DEFINED 
  HEREIN, OR ANY PART THEREOF,  IS,  BY THAT ACTION, ACCEPTING IN FULL THE 
  RESPONSIBILITIES AND OBLIGATIONS CONTAINED IN THIS AGREEMENT.
  
  Government Agency: National Aeronautics and Space Administration
  Government Agency Original Software Designation: GSC-15354-1
  Government Agency Original Software Title:  GEOS-5 GCM Modeling Software
  User Registration Requested.  Please Visit http://opensource.gsfc.nasa.gov
  Government Agency Point of Contact for Original Software:  
  			Dale Hithon, SRA Assistant, (301) 286-2691
  
 +-======-+   */
// the interface subroutine names MUST be in lower case by ESMF convention

  void c_mapl_locstreamretrieveptr_(void **ptr, long *addr) {
    *addr = (long)(*ptr);
  }

  void c_mapl_locstreamrestoreptr_(void **ptr, long *addr) {
    *ptr = (void *)(*addr);
  }

