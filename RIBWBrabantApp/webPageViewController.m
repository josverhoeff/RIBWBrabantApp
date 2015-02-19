//
//  webPageViewController.m
//  RIBWBrabantApp
//
//  Created by Jos Verhoeff on 19-02-15.
//  Copyright (c) 2015 CERIUM. All rights reserved.
//

#import "webPageViewController.h"
#import "AppDelegate.h"
#import "HTTPRequestFactory.h"
#import <MBProgressHUD.h>
#import <TSMessage.h>

@interface webPageViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) BOOL didLoadPage;
@property (nonatomic) BOOL didLoadLocalContent;
@end

@implementation webPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.didLoadPage = NO;
    self.didLoadLocalContent = NO;
    
    [self refreshContent];
}

- (void)viewWillAppear:(BOOL)animated
{
    if (!self.didLoadPage)
        [self refreshContent];
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Refresh content

- (void)refreshContent
{
    // Refresh webview content
    NSURL *urlAbout = [NSURL URLWithString:[HTTPRequestFactory urlForPage:MyPage_About]];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:urlAbout];

    [self.webView loadRequest:urlRequest];
}


#pragma mark - UIWebView delegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    if ([[MBProgressHUD allHUDsForView:self.view] count]==0)
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.didLoadPage = YES;
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    // Sometimes error code -999 pops up. This is a "NSURLErrorCancelled".
    // Triggered for example by double-clicking a link. Just ignore this error.
    if (error.code != -999) {
        
        // Dismiss HUD
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        // Log error
        DLog(@"Error downloading About page: %@, %@. Trying to load local version.", [error localizedDescription], [error userInfo]);
        
        if (!self.didLoadLocalContent) {
            // Show static local (old) version of about page if it hasn't already been loaded
            NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"app_overons" ofType:@"html"];
            NSURL *localURL = [NSURL fileURLWithPath:htmlPath isDirectory:NO];
            NSURLRequest *request = [NSURLRequest requestWithURL:localURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5];
            [webView loadRequest:request];
            
            self.didLoadLocalContent = YES;
        }
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // The webview wants to load a URL. Determine if this action should be allowed.
    BOOL shouldStart = NO;
    
    NSString *hostname = request.URL.host;
    if (hostname && [hostname isEqualToString:kHostname]) {
        
        // Only allow requests directed at the webserver or Google Maps
        shouldStart = YES;
        
    } else if ([request.URL.absoluteString rangeOfString:@"file:///"].location == 0) {
        
        // .. or if the request has a local URL (static HTML page on disk)
        shouldStart = YES;
        
    } else {
        
        // Redirect user to external app for external links
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate openExternalURL:request.URL];
    }
    
    return shouldStart;
}

@end
