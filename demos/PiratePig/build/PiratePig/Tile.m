//
//  Tile
//  PiratePig
//
//  Source generated by Haxe Objective-C target
//

#import "Tile.h"

@implementation Tile

- (void)animationDidStop:(NSString *)animationID finished:(float)finished context:(id)context {
	
	if ([animationID isEqualToString:@"fade_out"])  {
		[self removeFromSuperview];
	}
	else  {
		if ([animationID isEqualToString:@"move_to"])  {
			self.moving = NO;
		}
	}
}
- (void)remove:(BOOL)animate {
	
	// Optional arguments
	if (!animate) animate = YES;
	
	self.userInteractionEnabled = NO;
	[self.superview insertSubview:self atIndex:0];
	[UIView beginAnimations:@"fade_out" context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	self.alpha = 0;
	CGRect rect = self.frame;
	rect.origin.y = rect.origin.y - rect.size.height / 2;
	self.frame = rect;
	[UIView commitAnimations];
	self.removed = YES;
}
- (void)moveTo:(float)duration targetX:(float)targetX targetY:(float)targetY {
	
	self.moving = YES;
	[UIView beginAnimations:@"move_to" context:nil];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:duration];
	[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	self.alpha = 1;
	CGRect rect = self.frame;
	rect.origin.x = targetX;
	rect.origin.y = targetY;
	self.frame = rect;
	[UIView commitAnimations];
}
- (void)initialize {
	
	self.moving = NO;
	self.removed = NO;
	self.alpha = 1;
}
@synthesize type;
@synthesize row;
@synthesize removed;
@synthesize moving;
@synthesize column;
- (id)init:(NSString *)imagePath {
	
	self = [super init];
	[Log trace:[@"crate new tile " stringByAppendingString:imagePath] infos:@{@"fileName":@"Tile.hx", @"lineNumber":@"15", @"className":@"Tile", @"methodName":@"new"}];
	
	UIImageView  *image = [[UIImageView alloc]  initWithImage:[UIImage imageNamed:imagePath]];
	[self addSubview:image];
	self.frame =  CGRectMake(image.frame.origin.x, image.frame.origin.y, image.frame.size.width, image.frame.size.height);
	self.userInteractionEnabled = YES;
	return self;
}

@end