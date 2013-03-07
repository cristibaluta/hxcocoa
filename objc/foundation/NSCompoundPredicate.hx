package objc.foundation;
//typedef NSCompoundPredicateType = Int;

extern class NSCompoundPredicate extends NSPredicate {

	public static function notPredicateWithSubpredicate( predicate:NSPredicate) :NSPredicate;
	public static function andPredicateWithSubpredicates( subpredicates:Array<>) :NSPredicate;
	public static function orPredicateWithSubpredicates( subpredicates:Array<>) :NSPredicate;
	
	public function subpredicates () :Array<NSPredicate>;
	public function compoundPredicateType () :NSCompoundPredicateType;
	public function initWithType (type:NSCompoundPredicateType, subpredicates:Array<NSPredicate>) :Dynamic;
}

extern enum NSCompoundPredicateType {
	NSNotPredicateType;
	NSAndPredicateType;
	NSOrPredicateType;
}
