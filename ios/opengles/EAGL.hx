package ios.opengles;

import objc.foundation.NSObject;

/*ifdef __cplusplus
define EAGL_EXTERNextern "C" __attribute__((visibility ("default")))
else
define EAGL_EXTERNextern __attribute__((visibility ("default")))
endif

define EAGL_EXTERN_CLASS __attribute__((visibility("default")))*/

/************************************************************************/
/* EAGL API Version                                                     */
/************************************************************************/
//#define EAGL_MAJOR_VERSION   1
//#define EAGL_MINOR_VERSION   0


/************************************************************************/
/* EAGL Enumerated values                                               */
/************************************************************************/

/* EAGL rendering API */
enum
{
	kEAGLRenderingAPIOpenGLES1 = 1,
	kEAGLRenderingAPIOpenGLES2 = 2
}
typedef EAGLRenderingAPI = Int;

/************************************************************************/
/* EAGL Functions                                                       */
/************************************************************************/

//EAGL_EXTERN void EAGLGetVersion(unsigned int* major, unsigned int* minor);

/************************************************************************/
/* EAGL Sharegroup                                                      */
/************************************************************************/

extern class EAGLSharegroup extends NSObject {

	@:require(ios_6_0) public var debugLabel :String;

}

/************************************************************************/
/* EAGL Context                                                         */
/************************************************************************/

extern class EAGLContext extends NSObject {

	public function initWithAPI (api:EAGLRenderingAPI) :EAGLContext;
	public function initWithAPI (api:EAGLRenderingAPI, sharegroup:EAGLSharegroup) :EAGLContext;

	public static function setCurrentContext (context:EAGLContext*) :Bool;
	public static function currentContext () :EAGLContext;

	public var API :EAGLRenderingAPI;
	public var sharegroup :EAGLSharegroup;

	@:require(ios_6_0) public var debugLabel :String;

}

