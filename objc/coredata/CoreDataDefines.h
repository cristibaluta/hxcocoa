/*
	CoreDataDefines.h
    Core Data
    Copyright (c) 2004-2012 Apple Inc.
	All rights reserved.
*/
#ifndef _COREDATADEFINES_H
#define _COREDATADEFINES_H

#import <AvailabilityMacros.h>
#import <Availability.h>

//
//  Platform specific defs forexterns
//

//
// For MACH
//

#if defined(__MACH__)

#ifdef __cplusplus
#define COREDATA_EXTERN		extern "C"
#define COREDATA_PRIVATE_EXTERN	__private_extern__
#else
#define COREDATA_EXTERN		extern
#define COREDATA_PRIVATE_EXTERN	__private_extern__
#endif

//
// For Windows
//

#elif defined(WIN32)

#ifndef _NSBUILDING_COREDATA_DLL
#define _NSWINDOWS_DLL_GOOP	__declspec(dllimport)
#else
#define _NSWINDOWS_DLL_GOOP	__declspec(dllexport)
#endif

#ifdef __cplusplus
#define COREDATA_EXTERN		extern "C" _NSWINDOWS_DLL_GOOP
#define COREDATA_PRIVATE_EXTERN	extern
#else
#define COREDATA_EXTERN		_NSWINDOWS_DLL_GOOPextern
#define COREDATA_PRIVATE_EXTERN	extern
#endif

//
//  For Solaris
//

#elif defined(SOLARIS)

#ifdef __cplusplus
#define COREDATA_EXTERN		extern "C"
#define COREDATA_PRIVATE_EXTERN	extern "C"
#else
#define COREDATA_EXTERN		extern
#define COREDATA_PRIVATE_EXTERN	extern
#endif

#endif

//
//  Framework version
//

COREDATA_EXTERN double NSCoreDataVersionNumber;

#define NSCoreDataVersionNumber10_4       46.0
#define NSCoreDataVersionNumber10_4_3     77.0
#define NSCoreDataVersionNumber10_5       185.0
#define NSCoreDataVersionNumber10_5_3     186.0
#define NSCoreDataVersionNumber10_6		  246.0
#define NSCoreDataVersionNumber10_6_2	  250.0
#define NSCoreDataVersionNumber10_6_3	  251.0
#define NSCoreDataVersionNumber10_7     358.4
#define NSCoreDataVersionNumber10_7_2   358.12
#define NSCoreDataVersionNumber10_7_3   358.13

#define NSCoreDataVersionNumber_iPhoneOS_3_0		241.0
#define NSCoreDataVersionNumber_iPhoneOS_3_1		248.0
#define NSCoreDataVersionNumber_iPhoneOS_3_2		310.2
#define NSCoreDataVersionNumber_iPhoneOS_4_0		320.5
#define NSCoreDataVersionNumber_iPhoneOS_4_1		320.11
#define NSCoreDataVersionNumber_iPhoneOS_4_2		320.15
#define NSCoreDataVersionNumber_iPhoneOS_4_3		320.17
#define NSCoreDataVersionNumber_iPhoneOS_5_0		386.1
#define NSCoreDataVersionNumber_iPhoneOS_5_1		386.5

#endif // _COREDATADEFINES_H
