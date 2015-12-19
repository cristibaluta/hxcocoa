//
//  AlbumPickerController
//  Wwx
//
//  Source generated by Haxe Objective-C target
//

#import "AlbumPickerController.h"

@implementation AlbumPickerController

- (BOOL)canSwipeRight {
	
	return NO;
}
- (BOOL)canSwipeLeft {
	
	return NO;
}
- (void)update {
	
	
	AlbumPickerController  *_g = self;
	
	FBRequest  *req = [FBRequest requestForGraphPath:@"me/albums"];
	[req startWithCompletionHandler:^(FBRequestConnection  *connection, id result, NSError  *error) {
		
		if (result != nil)  {
			
			_g.fb_albums = [[NSMutableArray alloc] init];
			
			NSMutableArray  *a = [result objectForKey:@"data"];
			 {
				
				int _g1 = 0;
				while (_g1 < a.length)  {
					
					id obj = ((id)[a hx_objectAtIndex:_g1]);
					++_g1;
					if ([obj objectForKey:@"count"] == nil)  {
						continue;
					}
					
					FBAlbum  *album = [[FBAlbum alloc] init];
					album.name = [obj objectForKey:@"name"];
					album.nr = [obj objectForKey:@"count"];
					album.coverPhoto = [obj objectForKey:@"cover_photo"];
					album.albumId = [obj objectForKey:@"id"];
					[_g.fb_albums push:album];
				}
			}
			[_g.tableView reloadData];
			[_g.activityView stopAnimating];
			[_g.activityView removeFromSuperview];
			_g.activityView = nil;
		}
	}];
}
- (void)loginToFacebook {
	
	
	AlbumPickerController  *_g = self;
	self.loadingFacebook = YES;
	
	NSMutableArray  *permissions = [@[@"user_photos"] mutableCopy];
	[FBSession openActiveSessionWithReadPermissions:permissions allowLoginUI:YES completionHandler:^(FBSession  *session, FBSessionState status, NSError  *error) {
		
		if (error == nil && status == FBSessionStateOpen)  {
			[_g update];
		}
		else  {
			 {
				
				[Log trace:@"error" infos:@{@"fileName":@"AlbumPickerController.hx", @"lineNumber":@"272", @"className":@"AlbumPickerController", @"methodName":@"loginToFacebook"}];
				_g.loadingFacebook = NO;
			}
		}
	}];
}
- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(int)section {
	
	return 35;
}
- (UIView *)tableView:(UITableView *)tableView_ viewForHeaderInSection:(int)section {
	
	
	UIView  *v = [[UIView alloc] init];
	v.frame = CGRectMake(0,0,tableView_.frame.size.width,35);
	v.layer.cornerRadius = 4;
	v.backgroundColor = [UIColor colorWithWhite:0.65 alpha:1];
	
	NSString  *symbol = @"";
	
	NSString  *title = @"";
	if (self.movies.length > 0)  {
		switch (section) {
			case 0: {
				
				symbol = @"SymbolVideo";
				title = @"My Videos";
			}
			break;
			case 1: {
				
				symbol = @"SymbolFolder";
				title = @"Local Albums";
			}
			break;
			case 2: {
				
				symbol = @"ButFb";
				title = @"Facebook Albums";
			}
			break;
		}
	}
	else  {
		switch (section) {
			case 0: {
				
				symbol = @"SymbolFolder";
				title = @"Local Albums";
			}
			break;
			case 1: {
				
				symbol = @"ButFb";
				title = @"Facebook Albums";
			}
			break;
		}
	}
	
	UIImageView  *img = [[UIImageView alloc]  initWithImage:[UIImage imageNamed:symbol]];
	[v addSubview:img];
	
	UILabel  *label = [[UILabel alloc] init];
	label.frame = CGRectMake(40,10,200,13);
	label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor whiteColor];
	label.font = [UIFont boldSystemFontOfSize:13];
	label.text = title;
	[v addSubview:label];
	return v;
}
- (int)numberOfSectionsInTableView:(UITableView *)tableView {
	
	if (self.movies.length > 0)  {
		return 3;
	}
	else  {
		return 2;
	}
	return 0;
}
- (void)tableView:(UITableView *)tableView_ didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[Log trace:@"Row touched" infos:@{@"fileName":@"AlbumPickerController.hx", @"lineNumber":@"175", @"className":@"AlbumPickerController", @"methodName":@"didSelectRowAtIndexPath"}];
	int row = indexPath.row;
	int section = indexPath.section;
	int shift;
	if (self.movies.length > 0)  {
		shift = 1;
	}
	else  {
		shift = 0;
	}
	if (section == 0 && shift > 0)  {
		
	}
	else  {
		if (section == shift)  {
			
			
			ALAssetsGroup  *group = ((ALAssetsGroup*)[self.groups hx_objectAtIndex:row]);
			[self localAlbumPicked:group];
		}
		else  {
			if (self.fb_albums != nil)  {
				[self facebookAlbumPicked:((FBAlbum*)[self.fb_albums hx_objectAtIndex:row])];
			}
			else  {
				if (!self.loadingFacebook)  {
					
					self.activityView = [[UIActivityIndicatorView alloc]  initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
					CGRect rect = self.activityView.frame;
					rect.origin.x = 20;
					rect.origin.y = 30;
					self.activityView.frame = rect;
					[[self.tableView cellForRowAtIndexPath:indexPath] addSubview:self.activityView];
					[self.activityView startAnimating];
					[self loginToFacebook];
				}
			}
		}
	}
}
- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView_ cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	NSString  *identif = @"AlbumCellIdentifier";
	
	AlbumTableViewCell  *cell;
	cell = (AlbumTableViewCell *)[tableView_ dequeueReusableCellWithIdentifier:identif];
	if (cell == nil)  {
		
		cell = [[AlbumTableViewCell alloc] init];
		[cell _initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
	}
	int row = indexPath.row;
	cell.customImageView.image = nil;
	int shift;
	if (self.movies.length > 0)  {
		shift = 1;
	}
	else  {
		shift = 0;
	}
	if (indexPath.section == 0 && shift > 0)  {
		
		cell.customTextLabel.text = ((NSString*)[self.movies hx_objectAtIndex:row]);
		cell.customImageView.image = [UIImage imageNamed:@"SymbolCamera"];
	}
	else  {
		if (indexPath.section == shift)  {
			
			
			ALAssetsGroup  *group = ((ALAssetsGroup*)[self.groups hx_objectAtIndex:row]);
			cell.customTextLabel.text = [group valueForProperty:ALAssetsGroupPropertyName];
			[cell setLocalImage:[UIImage imageWithCGImage:[group posterImage]]];
		}
		else  {
			if (indexPath.section == 1 + shift)  {
				
				if (self.fb_albums == nil)  {
					
					cell.customTextLabel.text = @"Login to Facebook";
					cell.customImageView.image = nil;
				}
				else  {
					 {
						
						
						FBAlbum  *album = ((FBAlbum*)[self.fb_albums hx_objectAtIndex:row]);
						cell.customTextLabel.text = [[[album.name stringByAppendingString:@" ( "] stringByAppendingString:album.albumId] stringByAppendingString:@" )"];
						
						NSString  *url = [[[@"https://graph.facebook.com/" stringByAppendingString:album.albumId] stringByAppendingString:@"/picture?type=album&access_token="] stringByAppendingString:[FBSession activeSession].accessToken];
						[cell loadFacebookImage:url];
					}
				}
			}
		}
	}
	return cell;
}
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(int)section {
	
	if (self.movies.length > 0)  {
		switch (section) {
			case 0: {
				return self.movies.length;
			}
			break;
			case 1: {
				return self.groups.length;
			}
			break;
			case 2: {
				if (self.fb_albums != nil)  {
					return self.fb_albums.length;
				}
				else  {
					return 1;
				}
			}
			break;
		}
	}
	else  {
		switch (section) {
			case 0: {
				return self.groups.length;
			}
			break;
			case 1: {
				if (self.fb_albums != nil)  {
					return self.fb_albums.length;
				}
				else  {
					return 1;
				}
			}
			break;
		}
	}
	return 0;
}
- (void)viewDidAppear:(BOOL)animated {
	
}
- (void)viewDidLoad {
	
	
	AlbumPickerController  *_g = self;
	[Log trace:@"album picker did load" infos:@{@"fileName":@"AlbumPickerController.hx", @"lineNumber":@"43", @"className":@"AlbumPickerController", @"methodName":@"viewDidLoad"}];
	[super viewDidLoad];
	self.groups = [[NSMutableArray alloc] init];
	self.movies = [@[@"Movie 1", @"movie 2"] mutableCopy];
	self.tableView = [[UITableView alloc] init];
	self.tableView.frame = CGRectMake(20,80,self.view.frame.size.width - 40,self.view.frame.size.height - 80);
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.backgroundColor = [UIColor clearColor];
	self.tableView.separatorColor = [UIColor darkGrayColor];
	self.tableView.autoresizingMask = (((UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight) | UIViewAutoresizingFlexibleRightMargin) | UIViewAutoresizingFlexibleLeftMargin);
	[self.view addSubview:self.tableView];
	id failHandler = ^(NSError  *error) {
		
		[Log trace:@"assets enumaeration failed" infos:@{@"fileName":@"AlbumPickerController.hx", @"lineNumber":@"60", @"className":@"AlbumPickerController", @"methodName":@"viewDidLoad"}];
	};
	id groupsEnumerator = ^(ALAssetsGroup  *group, BOOL stop) {
		
		if (group != nil)  {
			
			[Log trace:@"storing asset" infos:@{@"fileName":@"AlbumPickerController.hx", @"lineNumber":@"66", @"className":@"AlbumPickerController", @"methodName":@"viewDidLoad"}];
			[_g.groups push:group];
		}
		else  {
			 {
				
				[Log trace:@"reload table" infos:@{@"fileName":@"AlbumPickerController.hx", @"lineNumber":@"70", @"className":@"AlbumPickerController", @"methodName":@"viewDidLoad"}];
				[_g.tableView reloadData];
			}
		}
	};
	self.library = [[ALAssetsLibrary alloc] init];
	[self.library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:groupsEnumerator failureBlock:failHandler];
}
- (void)loadView {
	
	CGRect frame = [UIScreen mainScreen].bounds;
	self.view = [[UIView alloc] init];
	self.view.frame = frame;
}
// Dynamic method defined with an objc method and a block property
- (void)selectMovieAtPath:(NSString *)path {
	if ( hx_dyn_selectMovieAtPath ) { hx_dyn_selectMovieAtPath(path); return; }
}
@synthesize hx_dyn_selectMovieAtPath;

// Dynamic method defined with an objc method and a block property
- (void)facebookAlbumPicked:(FBAlbum *)album {
	if ( hx_dyn_facebookAlbumPicked ) { hx_dyn_facebookAlbumPicked(album); return; }
}
@synthesize hx_dyn_facebookAlbumPicked;

// Dynamic method defined with an objc method and a block property
- (void)localAlbumPicked:(ALAssetsGroup *)album {
	if ( hx_dyn_localAlbumPicked ) { hx_dyn_localAlbumPicked(album); return; }
	int x = 0;
}
@synthesize hx_dyn_localAlbumPicked;

@synthesize delegate;
@synthesize loadingFacebook;
@synthesize activityView;
@synthesize movies;
@synthesize fb_albums;
@synthesize groups;
@synthesize library;
@synthesize tableView;

@end