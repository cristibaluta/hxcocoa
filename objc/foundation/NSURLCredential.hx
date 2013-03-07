package objc.foundation;

@:framework("Foundation")
extern class NSURLCredential implements NSCoding implements NSCopying
{

	//Constants

	//Static Methods
	public  function credentialWithUser( user:String,  password:String,  persistence:NSURLCredentialPersistence):NSURLCredential;
	public  function credentialWithIdentity( identity:SecIdentityRef,  certArray:Array<>,  persistence:NSURLCredentialPersistence):NSURLCredential;
	public  function credentialForTrust( trust:SecTrustRef):NSURLCredential;

	//Properties

	//Methods
	public  function initWithUser( user:String,  password:String,  persistence:NSURLCredentialPersistence):Dynamic;
	public  function persistence():NSURLCredentialPersistence;
	public  function certificates():Array<>;
	public  function identity():SecIdentityRef;
	public  function user():String;
	public  function password():String;
	public  function initWithIdentity( identity:SecIdentityRef,  certArray:Array<>,  persistence:NSURLCredentialPersistence):Dynamic;
	public  function initWithTrust( trust:SecTrustRef):Dynamic;
	public  function hasPassword():Bool;
}

extern enum NSURLCredentialPersistence
{
	NSURLCredentialPersistenceNone;
	NSURLCredentialPersistenceForSession;
	NSURLCredentialPersistencePermanent;
}

