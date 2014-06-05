/*	CFPlugIn.h
	Copyright (c) 1999-2012, Apple Inc.  All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFPLUGIN__)
#define __COREFOUNDATION_CFPLUGIN__ 1

#if !defined(COREFOUNDATION_CFPLUGINCOM_SEPARATE)
#define COREFOUNDATION_CFPLUGINCOM_SEPARATE 1
#endif

#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFArray.h>
#include <CoreFoundation/CFBundle.h>
#include <CoreFoundation/CFString.h>
#include <CoreFoundation/CFURL.h>
#include <CoreFoundation/CFUUID.h>

CF_EXTERN_C_BEGIN

/* ================ Standard Info.plist keys for plugIns ================ */

	@:c public static function 
const CFStringRef kCFPlugInDynamicRegistrationKey;
	@:c public static function 
const CFStringRef kCFPlugInDynamicRegisterFunctionKey;
	@:c public static function 
const CFStringRef kCFPlugInUnloadFunctionKey;
	@:c public static function 
const CFStringRef kCFPlugInFactoriesKey;
	@:c public static function 
const CFStringRef kCFPlugInTypesKey;

/* ================= Function prototypes for various callbacks ================= */
/* Function types that plugIn authors can implement for various purposes. */

typedef void (*CFPlugInDynamicRegisterFunction)(CFPlugInRef plugIn);
typedef void (*CFPlugInUnloadFunction)(CFPlugInRef plugIn);
typedef void *(*CFPlugInFactoryFunction)(CFAllocatorRef allocator, CFUUIDRef typeUUID);

/* ================= Creating PlugIns ================= */

	@:c public static function 
CFTypeID CFPlugInGetTypeID(void);

	@:c public static function 
CFPlugInRef CFPlugInCreate(CFAllocatorRef allocator, CFURLRef plugInURL);
    /* Might return an existing instance with the ref-count bumped. */

	@:c public static function 
CFBundleRef CFPlugInGetBundle(CFPlugInRef plugIn);

/* ================= Controlling load on demand ================= */
/* For plugIns. */
/* PlugIns that do static registration are load on demand by default. */
/* PlugIns that do dynamic registration are not load on demand by default. */
/* A dynamic registration function can call CFPlugInSetLoadOnDemand(). */

	@:c public static function 
void CFPlugInSetLoadOnDemand(CFPlugInRef plugIn, Boolean flag);

	@:c public static function 
Boolean CFPlugInIsLoadOnDemand(CFPlugInRef plugIn);

/* ================= Finding factories and creating instances ================= */
/* For plugIn hosts. */
/* Functions for finding factories to create specific types and actually creating instances of a type. */

	@:c public static function 
CFArrayRef CFPlugInFindFactoriesForPlugInType(CFUUIDRef typeUUID);
    /* This function finds all the factories from any plugin for the given type.  Returns an array that the caller must release. */
    
	@:c public static function 
CFArrayRef CFPlugInFindFactoriesForPlugInTypeInPlugIn(CFUUIDRef typeUUID, CFPlugInRef plugIn);
    /* This function restricts the result to factories from the given plug-in that can create the given type.  Returns an array that the caller must release. */

	@:c public static function 
void *CFPlugInInstanceCreate(CFAllocatorRef allocator, CFUUIDRef factoryUUID, CFUUIDRef typeUUID);
    /* This function returns the IUnknown interface for the new instance. */

/* ================= Registering factories and types ================= */
/* For plugIn writers who must dynamically register things. */
/* Functions to register factory functions and to associate factories with types. */

	@:c public static function 
Boolean CFPlugInRegisterFactoryFunction(CFUUIDRef factoryUUID, CFPlugInFactoryFunction func);

	@:c public static function 
Boolean CFPlugInRegisterFactoryFunctionByName(CFUUIDRef factoryUUID, CFPlugInRef plugIn, CFStringRef functionName);

	@:c public static function 
Boolean CFPlugInUnregisterFactory(CFUUIDRef factoryUUID);

	@:c public static function 
Boolean CFPlugInRegisterPlugInType(CFUUIDRef factoryUUID, CFUUIDRef typeUUID);

	@:c public static function 
Boolean CFPlugInUnregisterPlugInType(CFUUIDRef factoryUUID, CFUUIDRef typeUUID);

/* ================= Registering instances ================= */
/* When a new instance of a type is created, the instance is responsible for registering itself with the factory that created it and unregistering when it deallocates. */
/* This means that an instance must keep track of the CFUUIDRef of the factory that created it so it can unregister when it goes away. */

	@:c public static function 
void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID);

	@:c public static function 
void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID);


/* Obsolete API */

typedef struct __CFPlugInInstance *CFPlugInInstanceRef;

typedef Boolean (*CFPlugInInstanceGetInterfaceFunction)(CFPlugInInstanceRef instance, CFStringRef interfaceName, void **ftbl);
typedef void (*CFPlugInInstanceDeallocateInstanceDataFunction)(void *instanceData);

	@:c public static function 
Boolean CFPlugInInstanceGetInterfaceFunctionTable(CFPlugInInstanceRef instance, CFStringRef interfaceName, void **ftbl);
	@:c public static function 
CFStringRef CFPlugInInstanceGetFactoryName(CFPlugInInstanceRef instance);
	@:c public static function 
void *CFPlugInInstanceGetInstanceData(CFPlugInInstanceRef instance);
	@:c public static function 
CFTypeID CFPlugInInstanceGetTypeID(void);
	@:c public static function 
CFPlugInInstanceRef CFPlugInInstanceCreateWithInstanceDataSize(CFAllocatorRef allocator, CFIndex instanceDataSize, CFPlugInInstanceDeallocateInstanceDataFunction deallocateInstanceFunction, CFStringRef factoryName, CFPlugInInstanceGetInterfaceFunction getInterfaceFunction);

CF_EXTERN_C_END

#if !COREFOUNDATION_CFPLUGINCOM_SEPARATE
#include <CoreFoundation/CFPlugInCOM.h>
#endif /* !COREFOUNDATION_CFPLUGINCOM_SEPARATE */

#endif /* ! __COREFOUNDATION_CFPLUGIN__ */

