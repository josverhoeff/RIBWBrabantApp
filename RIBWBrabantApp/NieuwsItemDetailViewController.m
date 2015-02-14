//
//  NieuwsItemDetailViewController.m
//  RIBWBrabantApp
//
//  Created by Jos Verhoeff on 14-02-15.
//  Copyright (c) 2015 CERIUM. All rights reserved.
//

#import "NieuwsItemDetailViewController.h"
#import "AppDelegate.h"
#import "HTTPRequestFactory.h"
#import <MBProgressHUD.h>
#import <TSMessage.h>

@interface NieuwsItemDetailViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) BOOL didLoadPage;
@end

@implementation NieuwsItemDetailViewController

#pragma mark - Managing the selected news item

- (void)setSelectedNewsItem:(NieuwsItem *)newSelectedNewsItem
{
    if (_selectedNewsItem != newSelectedNewsItem) {
        _selectedNewsItem = newSelectedNewsItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.selectedNewsItem) {
        // Set page title
        self.title = self.selectedNewsItem.title;
        
        // Refresh webview content
        NSString *newsItemString = [HTTPRequestFactory urlForNewsItemWithIdentifier:self.selectedNewsItem.identifier];
        NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:newsItemString]];
        [self.webView loadRequest:urlRequest];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        DLog(@"Error downloading AVN news item detail page: %@, %@", [error localizedDescription], [error userInfo]);
        
        // Show error message to user
        [TSMessage showNotificationInViewController:self title:@"Laden van pagina mislukt."
                                           subtitle:[error localizedDescription]
                                               type:TSMessageNotificationTypeError
                                           duration:5
                               canBeDismissedByUser:YES];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // The webview wants to load a URL. Determine if this action should be allowed.
    BOOL shouldStart = NO;
    
    NSString *hostname = request.URL.host;
    if (hostname && [hostname isEqualToString:kHostname]) {
        
        // Only allow requests directed at the AVN webserver or Google Maps
        shouldStart = YES;
        
    } else {
        
        // Redirect user to external app for external links
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate openExternalURL:request.URL];
    }
    
    return shouldStart;
}

@end
