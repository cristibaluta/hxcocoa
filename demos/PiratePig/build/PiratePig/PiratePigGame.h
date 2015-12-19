//
//  PiratePigGame
//  PiratePig
//
//  Source generated by Haxe Objective-C target
//


#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Array.h"
#import "Tile.h"
#import "haxe/Log.h"
#import "Math.h"
#import "PiratePigGame.h"
#import "Std.h"

@interface PiratePigGame : UIView 

+ (int)NUM_COLUMNS;
+ (void) setNUM_COLUMNS:(int)val;
+ (int)NUM_ROWS;
+ (void) setNUM_ROWS:(int)val;
+ (NSMutableArray<id> *)tileImages;
+ (void) setTileImages:(NSMutableArray<id> *)val;
- (void)resize:(int)newWidth newHeight:(int)newHeight;
- (void)loop:(NSTimer *)aTimer;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)withEvent;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)withEvent;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)withEvent;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)withEvent;
- (void)dropTiles;
- (void)swapTile:(Tile *)tile targetRow:(int)targetRow targetColumn:(int)targetColumn;
- (void)removeTile:(int)row column:(int)column animate:(BOOL)animate;
- (void)addTile:(int)row column:(int)column animate:(BOOL)animate;
- (CGPoint)getPosition:(int)row column:(int)column;
- (NSMutableArray<id> *)findMatches:(BOOL)byRow accumulateScore:(BOOL)accumulateScore;
- (void)newGame;
- (void)construct;
- (void)initialize;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<Tile *> *>  *usedTiles;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<Tile *> *>  *tiles;
@property (nonatomic, strong) Tile  *selectedTile;
@property (nonatomic) BOOL needToCheckMatches;
@property (nonatomic) CGPoint cacheMouse;
@property (nonatomic) int currentScore;
@property (nonatomic) float currentScale;
@property (nonatomic, strong) UIView  *TileContainer;
@property (nonatomic, strong) UILabel  *Score;
@property (nonatomic, strong) UIImageView  *Logo;
@property (nonatomic, strong) UIView  *Background;
- (id)init;

@end
