package ios.ui;

extern enum UIWebViewNavigationType {
    UIWebViewNavigationTypeLinkClicked;
    UIWebViewNavigationTypeFormSubmitted;
    UIWebViewNavigationTypeBackForward;
    UIWebViewNavigationTypeReload;
    UIWebViewNavigationTypeFormResubmitted;
    UIWebViewNavigationTypeOther;
}

@:framework("UIKit")
extern class UIWebView extends UIView {
	
	function new () : Void;
	public var delegate :UIWebViewDelegate;
	
	public var scrollView :UIScrollView;
	
/*	public function loadRequest (request:NSURLRequest) :Void;
	public function loadHTMLString (string:String, baseURL:NSURL) :Void;
	public function loadData (data:NSData, MIMEType:String, textEncodingName:String, baseURL:NSURL) :Void;
	
	public var request :NSURLRequest;*/
	
	public function reload () :Void;
	public function stopLoading () :Void;
	public function goBack () :Void;
	public function goForward () :Void;
	
	public var canGoBack :Bool;
	public var canGoForward :Bool;
	public var isLoading :Bool;
	
	public function stringByEvaluatingJavaScriptFromString (script:String) :String;
	
	public var scalesPageToFit :Bool;
	public var detectsPhoneNumbers :Bool;
	public var allowsInlineMediaPlayback :Bool;
	public var mediaPlaybackRequiresUserAction :Bool;
	public var mediaPlaybackAllowsAirPlay :Bool;
	public var suppressesIncrementalRendering :Bool;
	public var keyboardDisplayRequiresUserAction :Bool;
}


extern interface UIWebViewDelegate {

#if display
/*- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
	public function webViewDidStartLoad:(UIWebView *)webView;
	public function webViewDidFinishLoad:(UIWebView *)webView;
	public function webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;*/
#end
}
