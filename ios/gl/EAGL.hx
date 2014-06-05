package ios.opengles;

import swift.foundation.NSObject;


/************************************************************************/
/* EAGL API Version                                                     */
/************************************************************************/
//#define EAGL_MAJOR_VERSION   1
//#define EAGL_MINOR_VERSION   0


/************************************************************************/
/* EAGL Enumerated values                                               */
/************************************************************************/

/* EAGL rendering API */
@:framework("OpenGLES")
extern enum EAGLRenderingAPI {
	kEAGLRenderingAPIOpenGLES1;
	kEAGLRenderingAPIOpenGLES2;
}

/************************************************************************/
/* EAGL Functions                                                       */
/************************************************************************/

//EAGL_EXTERN void EAGLGetVersion(unsigned int* major, unsigned int* minor);

/************************************************************************/
/* EAGL Sharegroup                                                      */
/************************************************************************/

@:framework("OpenGLES")
extern class EAGLSharegroup extends NSObject {

	@:require(ios6) public var debugLabel :String;

}

/************************************************************************/
/* EAGL Context                                                         */
/************************************************************************/

@:framework("OpenGLES")
extern class EAGLContext extends NSObject {

	@:overload(function(api:EAGLRenderingAPI, sharegroup:EAGLSharegroup):EAGLContext{})
	public function initWithAPI (api:EAGLRenderingAPI) :EAGLContext;

	public static function setCurrentContext (context:EAGLContext) :Bool;
	public static function currentContext () :EAGLContext;

	public var API :EAGLRenderingAPI;
	public var sharegroup :EAGLSharegroup;

	@:require(ios6) public var debugLabel :String;

}

