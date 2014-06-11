//
//  AppDelegate
//  HelloWorld
//
//  Source generated by Haxe Swift target
//

import AppDelegate

#import <UIKit/UIKit.h>



class AppDelegate : UIResponder UIApplicationDelegate{
	
	
	func applicationWillResignActive (application application :UIApplication?) {
		
	}
	func applicationDidBecomeActive (application application :UIApplication?) {
		
	}
	func locateLondon () {
		
		self.map.locateLondon)
	}
	func application (application application :UIApplication?, didFinishLaunchingWithOptions didFinishLaunchingWithOptions :NSDictionary?) -> Bool? {
		
		self.window = UIWindow()
		var screen :UIScreen?
		self.window.frame = screen.bounds
		self.view = UIView()
		self.view.frame = CGRect(0,0,self.window.frame.size.width,self.window.frame.size.height)
		self.view.autoresizesSubviews = true
		self.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
		self.view.backgroundColor = UIColor.darkGrayColor)
		self.label = UILabel()
		self.label.frame = CGRect(0,350,self.view.frame.size.width,50)
		self.label.textColor = UIColor.yellowColor)
		self.label.backgroundColor = UIColor.clearColor)
		self.label.textAlignment = NSTextAlignmentCenter
		self.label.font = UIFont.boldSystemFontOfSize(fontSize:30)
		self.label.text = "Hello world!"
		self.view.addSubview(view:self.label)
		self.map = CustomMapView()
		self.map.frame = CGRect(10,10,300,300)
		self.view.addSubview(view:self.map)
		self.map.locateLondon)
		self.but = UIButton()
		self.but.frame = .CGRectMake(0, 430, 320, 30)
		self.but.setTitle(title:"Locate London", forState:UIControlStateNormal)
		self.but.setTitle(title:"...Locate London...", forState:UIControlStateHighlighted)
		self.view.addSubview(view:self.but)
		self.viewController = UIViewController()
		self.viewController.view = self.view
		self.window.rootViewController = self.viewController
		self.window.makeKeyAndVisible)
		Log.trace(v:"Great, it works!", infos:["fileName":"AppDelegate.hx", "lineNumber":"67", "className":"AppDelegate", "methodName":"application"])
		var o_0 :String?
		var o_1 :String?
		var o_2 :String?
		Log.trace(v:o_1, infos:["fileName":"AppDelegate.hx", "lineNumber":"70", "className":"AppDelegate", "methodName":"application"])
		return true
	}
	var but :UIButton?
	var map :CustomMapView?
	var label :UILabel?
	var view :UIView?
	var viewController :UIViewController?
	var window :UIWindow?
}
