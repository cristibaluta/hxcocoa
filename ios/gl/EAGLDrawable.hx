package ios.opengles;

import objc.foundation.NSDictionary;

/************************************************************************/
/* Keys for EAGLDrawable drawableProperties dictionary                  */
/*                                                                      */
/* kEAGLDrawablePropertyRetainedBacking:                                */
/*  Type: NSNumber (boolean)                                            */
/*  Legal Values: True/False                                            */
/*  Default Value: False                                                */
/*  Description: True if EAGLDrawable contents are retained after a     */
/*               call to presentRenderbuffer.  False, if they are not   */
/*                                                                      */
/* kEAGLDrawablePropertyColorFormat:                                    */
/*  Type: NSString                                                      */
/*  Legal Values: kEAGLColorFormat*                                     */
/*  Default Value: kEAGLColorFormatRGBA8                                */
/*  Description: Format of pixels in renderbuffer                       */
/************************************************************************/
//EAGL_EXTERN NSString * const kEAGLDrawablePropertyRetainedBacking;
//EAGL_EXTERN NSString * const kEAGLDrawablePropertyColorFormat;

/************************************************************************/
/* Values for kEAGLDrawablePropertyColorFormat key                      */
/************************************************************************/
//EAGL_EXTERN NSString * const kEAGLColorFormatRGBA8;
//EAGL_EXTERN NSString * const kEAGLColorFormatRGB565;

/************************************************************************/
/* EAGLDrawable Interface                                               */
/************************************************************************/
@:framework("OpenGLES")
external interface EAGLDrawable {

/* Contains keys from kEAGLDrawableProperty* above */
	public var drawableProperties :NSDictionary;

}

/* Extends EAGLContext interface */
@:framework("OpenGLES")
extern class EAGLContext (EAGLContextDrawableAdditions)

/* Attaches an EAGLDrawable as storage for the OpenGL ES renderbuffer object bound to <target> */
	public function renderbufferStorage (target:Int, fromDrawable:EAGLDrawable) :Bool;

/* Request the native window system display the OpenGL ES renderbuffer bound to <target> */
	public function presentRenderbuffer (target:Int) :Bool;

} /* EAGLDrawable protocol */


