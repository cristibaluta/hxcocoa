package objc.foundation;


@:framework("Foundation")
extern class NSCache {

	public  function name():String;
	public  function objectForKey( key:Dynamic):Dynamic;
	public  function removeAllObjects():Void;
	public  function setEvictsObjectsWithDiscardedContent( b:Bool):Void;
	public  function setName( n:String):Void;
	public  function setObject( obj:Dynamic,  key:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function setObject1( obj:Dynamic,  key:Dynamic,  g:Int):Void;
	public  function setTotalCostLimit( lim:Int):Void;
	public  function totalCostLimit():Int;
	public  function setCountLimit( lim:Int):Void;
	public  function setDelegate( d:id<NSCacheDelegate>):Void;
	public  function delegate():id<NSCacheDelegate>;
	public  function countLimit():Int;
	public  function evictsObjectsWithDiscardedContent():Bool;
	public  function removeObjectForKey( key:Dynamic):Void;
	public  function cache( cache:NSCache,  obj:Dynamic):Void;
}

- (void)setName:(NSString *)n;
- (NSString *)name;

- (void)setDelegate:(id <NSCacheDelegate>)d;
- (id <NSCacheDelegate>)delegate;

- (id)objectForKey:(id)key;
- (void)setObject:(id)obj forKey:(id)key; // 0 cost
- (void)setObject:(id)obj forKey:(id)key cost:(NSUInteger)g;
- (void)removeObjectForKey:(id)key;

- (void)removeAllObjects;

- (void)setTotalCostLimit:(NSUInteger)lim;
- (NSUInteger)totalCostLimit;	// limits are imprecise/not strict

- (void)setCountLimit:(NSUInteger)lim;
- (NSUInteger)countLimit;	// limits are imprecise/not strict

- (Bool)evictsObjectsWithDiscardedContent;
- (void)setEvictsObjectsWithDiscardedContent:(Bool)b;

}

@protocol NSCacheDelegate <NSObject>
@optional
- (void)cache:(NSCache *)cache willEvictObject:(id)obj;
}
