package objc.foundation;


@:framework("Foundation")
extern class NSCache {

	public function name():String;
	public function objectForKey( key:Dynamic):Dynamic;
	public function removeAllObjects():Void;
	public function setEvictsObjectsWithDiscardedContent( b:Bool):Void;
	public function setName( n:String):Void;
	public function setObject( obj:Dynamic,  key:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public function setObject1( obj:Dynamic,  key:Dynamic,  g:Int):Void;
	public function setTotalCostLimit( lim:Int):Void;
	public function totalCostLimit():Int;
	public function setCountLimit( lim:Int):Void;
	public function setDelegate( d:id<NSCacheDelegate>):Void;
	public function delegate():id<NSCacheDelegate>;
	public function countLimit():Int;
	public function evictsObjectsWithDiscardedContent():Bool;
	public function removeObjectForKey( key:Dynamic):Void;
	public function cache( cache:NSCache,  obj:Dynamic):Void;
}

public function setName:(NSString *)n;
- (NSString *)name;

public function setDelegate:(id <NSCacheDelegate>)d;
- (id <NSCacheDelegate>)delegate;

- (id)objectForKey:(id)key;
public function setObject:(id)obj forKey:(id)key; // 0 cost
public function setObject:(id)obj forKey:(id)key cost:(NSUInteger)g;
public function removeObjectForKey:(id)key;

public function removeAllObjects;

public function setTotalCostLimit:(NSUInteger)lim;
- (NSUInteger)totalCostLimit;	// limits are imprecise/not strict

public function setCountLimit:(NSUInteger)lim;
- (NSUInteger)countLimit;	// limits are imprecise/not strict

- (Bool)evictsObjectsWithDiscardedContent;
public function setEvictsObjectsWithDiscardedContent:(Bool)b;

}

@protocol NSCacheDelegate <NSObject>
@optional
public function cache:(NSCache *)cache willEvictObject:(id)obj;
}
