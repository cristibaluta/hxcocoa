import ios.ui.UIImageView;
import ios.ui.UIImage;
import ios.ui.UILabel;
import ios.ui.UIFont;
import ios.ui.UIView;
import ios.ui.UIColor;
import ios.ui.NSText;
import ios.ui.UIEvent;
import objc.foundation.NSDictionary;
import objc.foundation.NSSet;
import objc.foundation.NSValue;
import objc.foundation.NSTimer;
import objc.foundation.NSRunLoop;
import objc.graphics.CGGeometry;
import objc.graphics.CGAffineTransform;

class PiratePigGame extends UIView {
	
	
	private static var NUM_COLUMNS:Int = 8;
	private static var NUM_ROWS:Int = 8;
	
	private static var tileImages:Array <String> = ["game_bear.png", "game_bunny_02.png", "game_carrot.png", "game_lemon.png", "game_panda.png", "game_piratePig.png" ];
	
	private var Background :UIView;
/*	private var introSound :Sound;*/
	private var Logo :UIImageView;
	private var Score :UILabel;
/*	private var Sound3:Sound;
	private var Sound4:Sound;
	private var Sound5:Sound;*/
	private var TileContainer :UIView;
	
	public var currentScale :Float;
	public var currentScore :Int;
	
	private var cacheMouse :CGPoint;
	private var needToCheckMatches :Bool;
	private var selectedTile :Tile;
	private var tiles :Array<Array<Tile>>;
	private var usedTiles :Array<Tile>;
	
	
	public function new () {
		trace("start");
		super ();
		initialize ();
		construct ();
		newGame ();
	}
	private function initialize ():Void {
		trace("initialize");
		currentScale = 1;
		currentScore = 0;
		
		tiles = new Array<Array<Tile>>();
		usedTiles = new Array<Tile>();
		
		for (row in 0...NUM_ROWS) {
			//tiles[row] = new Array<Tile>();
			tiles.push ( new Array<Tile>());
			
			for (column in 0...NUM_COLUMNS) {
				var t = tiles[row];
				t[column] = null;
			}
		}
		
		Background = new UIView();
		
		Logo = new UIImageView().initWithImage ( UIImage.imageNamed("logo.png") );
		var bs = Logo.frame;
		bs.origin.x = 640/2 - bs.size.width/2;
		Logo.frame = bs;
		
		Score = new UILabel();
		Score.frame = new CGRect (0, 0, 100, 50);
		Score.textColor = UIColor.redColor();
		Score.backgroundColor = UIColor.clearColor();
		Score.textAlignment = NSTextAlignmentLeft;
		Score.font = UIFont.boldSystemFontOfSize(30);
		
		TileContainer = new UIView();
	}
	private function construct ():Void {
		trace("Construct");
		addSubview (Logo);
		
/*		var font = Assets.getFont ("fonts/FreebooterUpdated.ttf");
		var defaultFormat = new TextFormat (font.fontName, 60, 0x000000);
		defaultFormat.align = TextFormatAlign.RIGHT;*/
		
/*		#if js
		// Right-aligned text is not supported in HTML5 yet
		defaultFormat.align = TextFormatAlign.LEFT;
		#end*/
		
		var contentWidth = 75 * NUM_COLUMNS;
		
		var rect:CGRect = Score.frame;
		rect.origin.x = 0;//contentWidth - 200;
		rect.origin.y = 12;
		rect.size.width = 200;
		Score.frame = rect;
		
		
/*		#if !js
		Score.filters = [ new BlurFilter (1.5, 1.5), new DropShadowFilter (1, 45, 0, 0.2, 5, 5) ];
		#else
		Score.y = 0;
		Score.x += 90;
		#end*/
		
		addSubview (Score);
		
		//Background.y = 85;
		//Background.graphics.beginFill (0xFFFFFF, 0.4);
		//Background.graphics.drawRect (0, 0, contentWidth, 75 * NUM_ROWS);
		
/*		#if !js
		Background.filters = [ new BlurFilter (10, 10) ];
		addChild (Background);
		#end*/
		addSubview (Background);
		
		var rect:CGRect = TileContainer.frame;
		rect.origin.x = 14;
		rect.origin.y = 85 + 14;
		TileContainer.frame = rect;
		//TileContainer.addEventListener (MouseEvent.MOUSE_DOWN, TileContainer_onMouseDown);
		//Lib.current.stage.addEventListener (MouseEvent.MOUSE_UP, stage_onMouseUp);
		addSubview (TileContainer);
		
/*		IntroSound = Assets.getSound ("soundTheme");
		Sound3 = Assets.getSound ("sound3");
		Sound4 = Assets.getSound ("sound4");
		Sound5 = Assets.getSound ("sound5");*/
	}
	public function newGame ():Void {
		
		currentScore = 0;
		Score.text = "0";
		
		for (row in 0...NUM_ROWS) {
			for (column in 0...NUM_COLUMNS) {
				removeTile (row, column, false);
			}
		}
		
		for (row in 0...NUM_ROWS) {
			for (column in 0...NUM_COLUMNS) {
				addTile (row, column, false);
			}
		}
		
/*		IntroSound.play ();*/
		
		var timer :NSTimer = NSTimer.timerWithTimeInterval (0.2, this, new SEL(loop), null, true);
		var runner = NSRunLoop.currentRunLoop();
		runner.addTimer (timer, NSDefaultRunLoopMode);
	}
	
	
	private function findMatches (byRow:Bool, accumulateScore:Bool = true) :Array<Tile> {
		//trace("find matches");
		var matchedTiles = new Array<Tile>();
		
		var max:Int;
		var secondMax:Int;
		
		if (byRow) {
			max = NUM_ROWS;
			secondMax = NUM_COLUMNS;
		} else {
			max = NUM_COLUMNS;
			secondMax = NUM_ROWS;
		}
		
		for (index in 0...max) {
			
			var matches = 0;
			var foundTiles = new Array<Tile>();
			var previousType = -1;
			
			for (secondIndex in 0...secondMax) {
				//trace("analize");
				var tile:Tile;
				
				if (byRow) {
					var t = tiles[index];
					tile = t[secondIndex];
				} else {
					var t = tiles[secondIndex];
					tile = t[index];
				}
				
				if (tile != null && !tile.moving) {
					
					if (previousType == -1) {
						previousType = tile.type;
						foundTiles.push (tile);
						continue;
						
					} else if (tile.type == previousType) {
						foundTiles.push (tile);
						matches++;
					}
				}
				
				if (tile == null || tile.moving || tile.type != previousType || secondIndex == secondMax - 1) {
					
					if (matches >= 2 && previousType != -1) {
						if (accumulateScore) {
							
/*							if (matches > 3) {
								Sound5.play ();
							} else if (matches > 2) {
								Sound4.play ();
							} else {
								Sound3.play ();
							}*/
							
							currentScore += Std.int (Math.pow (matches, 2) * 50);
						}
						//trace("foundTiles");
						//trace(foundTiles);
						matchedTiles = matchedTiles.concat ( foundTiles );
					}
					
					matches = 0;
					foundTiles = new Array<Tile>();
					
					if (tile == null || tile.moving) {
						needToCheckMatches = true;
						previousType = -1;
					} else {
						previousType = tile.type;
						foundTiles.push ( tile );
					}
				}
			}
		}
		//trace("matchedTiles");
		//trace(matchedTiles);
		return matchedTiles;
	}
	
	
	private function getPosition (row:Int, column:Int) :CGPoint {
		return CGGeometry.CGPointMake (column * (57 + 16), row * (57 + 16));
	}
	
	
	
	private function addTile (row:Int, column:Int, animate:Bool = true) :Void {
/*		trace("add tile");
		trace(NSNumber.numberWithInt(row));
		trace(NSNumber.numberWithInt(column));*/
		
		var tile :Tile = null;
		var type = Math.round (Math.random () % (untyped tileImages.count() - 1));
		//trace("type");trace(NSNumber.numberWithInt(type));
		var i = 0;
		var usedTile :Tile = null;
		
		while (i < usedTiles.length) {
			usedTile = usedTiles[i];
			//trace("search for an used tile "+usedTile);
			//if(usedTile.removed)trace("usedTile.removed");
			//if(usedTile.superview==null)trace("usedTile.superview==null");
			//if(usedTile.type)trace("usedTile.type==type");
/*			if (usedTile.removed && usedTile.superview == null && usedTile.type == type) {
				tile = usedTile;
			}*/
			i++;
		}
		
		if (tile == null) {
			tile = new Tile ( tileImages[type] );
		}
		tile.initialize();
		tile.type = type;
		tile.row = row;
		tile.column = column;
		var t = tiles[row];
		t[column] = tile;
		
		var position = getPosition (row, column);
		
		if (animate) {
			
			var firstPosition = getPosition (-1, column);
			
			tile.alpha = 0;
			
			var rect:CGRect = tile.frame;
			rect.origin.x = firstPosition.x;
			rect.origin.y = firstPosition.y;
			tile.frame = rect;
			
			tile.moveTo (0.15 * (row + 1), position.x, position.y);
			#if !js
			//Actuate.tween (tile, 0.3, { alpha: 1 } ).delay (0.15 * (row - 2)).ease (Quad.easeOut);
			#end
			
		} else {
			
			//tile.x = position.x;
			//tile.y = position.y;
			var rect:CGRect = tile.frame;
			rect.origin.x = position.x;
			rect.origin.y = position.y;
			tile.frame = rect;
		}
		TileContainer.addSubview ( tile );
		needToCheckMatches = true;
	}
	public function removeTile (row:Int, column:Int, animate:Bool = true):Void {
		//trace("remove tile"+NSNumber.numberWithInt(row)+NSNumber.numberWithInt(column));
		
		var t = tiles[row];
		var tile = t[column];
		//trace(tile);
		
		if (tile != null) {
			tile.remove ( animate );
			usedTiles.push ( tile );
		}
		
		t[column] = null;
	}
	private function swapTile (tile:Tile, targetRow:Int, targetColumn:Int):Void {
		trace("swipe tile "+tile);
		if (targetColumn >= 0 && targetColumn < NUM_COLUMNS && targetRow >= 0 && targetRow < NUM_ROWS) {
			trace("ok");
			var targetTile = tiles[targetRow][targetColumn];
			trace("to tile "+targetTile);
			if (targetTile != null && !targetTile.moving) {
				trace("ok");
				var t = tiles[targetRow];
				t[targetColumn] = tile;
				t = tiles[tile.row];
				t[tile.column] = targetTile;
				trace("CHECK FOR MATCHES");
				if (untyped findMatches(true,false).count() > 0 || untyped findMatches(false,false).count() > 0) {
					trace("found matches");
					targetTile.row = tile.row;
					targetTile.column = tile.column;
					tile.row = targetRow;
					tile.column = targetColumn;
					var targetTilePosition = getPosition (targetTile.row, targetTile.column);
					var tilePosition = getPosition (tile.row, tile.column);
					
					targetTile.moveTo (0.3, targetTilePosition.x, targetTilePosition.y);
					tile.moveTo (0.3, tilePosition.x, tilePosition.y);
					
					needToCheckMatches = true;
					
				} else {
					trace("matches not found");
					var t = tiles[targetRow];
					t[targetColumn] = targetTile;
					t = tiles[tile.row];
					t[tile.column] = tile;
				}
			}
		}
	}
	private function dropTiles ():Void {
		//trace("---------------------------------drop tiles");
		for (column in 0...NUM_COLUMNS) {
			
			var spaces = 0;

			//trace("begin row----------------");
			for (row in 0...NUM_ROWS) {
				
				var index = (NUM_ROWS - 1) - row;
				var tile = tiles[index][column];
				//trace(tile);
				if (tile == null) {
					//trace("FOUND <null>, increase spaces");
					spaces++;
				} else {
					if (spaces > 0) {
						
						var position = getPosition (index + spaces, column);
						tile.moveTo (0.15 * spaces, position.x,position.y);
						
						tile.row = index + spaces;
						var t = tiles[index + spaces];
						t[column] = tile;
						t = tiles[index];
						t[column] = null;
						
						needToCheckMatches = true;
					}
				}
			}
			//trace("fin one row---------------- add new tiles");
			
			for (i in 0...spaces) {
				var row = (spaces - 1) - i;
				addTile (row, column, true);
			}
		}
		//trace("fin drop tiles");
	}
	
	
	// Event Handlers
	
	override public function touchesBegan (touches:NSSet, withEvent:UIEvent) :Void {
		var touchesForView = withEvent.touchesForView(this);
		var aTouch = touchesForView.anyObject();
		cacheMouse = aTouch.locationInView(this);
		cacheMouse = CGGeometry.CGPointMake ( cacheMouse.x - 10, cacheMouse.y - 73 - 20);
		trace(aTouch);
		untyped __objc__("NSLog(@\"cacheMouse %.2fx%.2f\", cacheMouse.x, cacheMouse.y)");
		
		if (touches.count() == 1) {
			for (i in 0...NUM_ROWS) {
				for (j in 0...NUM_COLUMNS) {
					var tile = tiles[i][j];
					
					if (CGGeometry.CGRectContainsPoint(tile.frame, cacheMouse)) {
						trace("------------------touched something");
						untyped __objc__("NSLog(@\"%ix%i %.2f,%.2f %.2fx%.2f\", i, j, tile.frame.origin.x, tile.frame.origin.y, tile.frame.size.width, tile.frame.size.height)");
						selectedTile = tile;
						//selectedTile.alpha = 0.5;
						selectedTile.transform = CGAffineTransform.CGAffineTransformScale(selectedTile.transform, 1.4, 1.4);
						//trace(selectedTile);
						return;
					} else {
						selectedTile = null;
					}
				}
			}
			if (selectedTile == null) {
				cacheMouse = new CGPoint(0,0);
			}
			//trace(selectedTile);
		}
	}
	override public function touchesMoved (touches:NSSet, withEvent:UIEvent) :Void {
		
	}
	override public function touchesEnded (touches:NSSet, withEvent:UIEvent) :Void {
		trace("release finger");
/*		if (!CGGeometry.CGPointEqualToPoint(cacheMouse, new CGPoint(0,0))) trace("-- collision");
		if (selectedTile != null) trace("-- selectedTile != null");
		if (!selectedTile.moving) trace("-- !selectedTile.moving");*/
		//selectedTile.alpha = 1;
		selectedTile.transform = CGAffineTransform.CGAffineTransformScale(selectedTile.transform, 0.7, 0.7);
		
		if (!CGGeometry.CGPointEqualToPoint(cacheMouse, new CGPoint(0,0)) && selectedTile != null && !selectedTile.moving) {
			
			var aTouch = touches.anyObject();
			var pos :CGPoint = aTouch.locationInView(this);
			var differenceX = pos.x - cacheMouse.x - 10;
			var differenceY = pos.y - cacheMouse.y - 73 - 20;
			
			if (Math.abs (differenceX) > 10 || Math.abs (differenceY) > 10) {
				
				var swapToRow = selectedTile.row;
				var swapToColumn = selectedTile.column;
				
				if (Math.abs (differenceX) > Math.abs (differenceY)) {
					if (differenceX < 0) {
						swapToColumn --;
					} else {
						swapToColumn ++;
					}
				} else {
					if (differenceY < 0) {
						swapToRow --;
					} else {
						swapToRow ++;
					}
				}
				swapTile (selectedTile, swapToRow, swapToColumn);
			}
		}
		
		selectedTile = null;
		cacheMouse = new CGPoint(0,0);
	}
	override public function touchesCancelled (touches:NSSet, withEvent:UIEvent) :Void {
	
	}
	
	
	private function loop (aTimer:NSTimer) :Void {
		
		if (needToCheckMatches) {
			
			var matchedTiles = new Array<Tile>();
			matchedTiles = matchedTiles.concat ( findMatches (true) );
			matchedTiles = matchedTiles.concat ( findMatches (false) );
			
			//trace(" / "+NSNumber.numberWithInt(matchedTiles.length) + " / "+NSNumber.numberWithInt(untyped matchedTiles.count()));
			///for (tile in matchedTiles) { TODO: .length not working properly
			var tile :Tile = null;
			var i = 0;
			while (i < matchedTiles.length) {
				//trace("iter matchedTiles");
				tile = matchedTiles[i];
				removeTile (tile.row, tile.column);
				i++;
			}
			
			if (matchedTiles.length > 0) {
				untyped __objc__("self.Score.text = [NSString stringWithFormat:@\"%i\", currentScore]");
				//Score.text = untyped NSNumber.numberWithInt(currentScore).description();//Std.string (currentScore);
				dropTiles();
			}
		}
	}
	
	public function resize (newWidth:Int, newHeight:Int):Void {
		
		var maxWidth = newWidth * 0.90;
		var maxHeight = newHeight * 0.86;
		
		currentScale = 1;
		//scaleX = 1;
		//scaleY = 1;
		
		#if js
		
		// looking up the total width and height is not working, so we'll calculate it ourselves
		
		var currentWidth = 75 * NUM_COLUMNS;
		var currentHeight = 75 * NUM_ROWS + 85;
		
		#else
		
		var currentWidth = this.frame.size.width;
		var currentHeight = this.frame.size.height;
		
		#end
		
		if (currentWidth > maxWidth || currentHeight > maxHeight) {
			
			var maxScaleX = maxWidth / currentWidth;
			var maxScaleY = maxHeight / currentHeight;
			
			if (maxScaleX < maxScaleY) {
				currentScale = maxScaleX;
			} else {
				currentScale = maxScaleY;
			}
			
			//scaleX = currentScale;
			//scaleY = currentScale;
		}
		
		var rect:CGRect = this.frame;
		rect.origin.x = newWidth / 2 - (currentWidth * currentScale) / 2;
		this.frame = rect;
	}
	
}