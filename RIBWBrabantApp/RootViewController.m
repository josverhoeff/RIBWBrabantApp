//
//  RootViewController.m
//  RIBWBrabantApp
//
//  Created by Jos Verhoeff on 14-02-15.
//  Copyright (c) 2015 CERIUM. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"

#define kNewsItemTabBarIndex        0
#define kDefaultAnimationDuration   0.5

@implementation RootViewController

- (void)viewWillAppear:(BOOL)animated
{
    // Application-wide tint color (the yellow background from the AVN logo.)
    UIColor *defaultAppTintColor = [UIColor colorWithRed:(231.0f/255) green:(180.0f/255) blue:(43.0f/255) alpha:1.0f];
    
    // Set UITabBar selected image tint color independent of iOS version;
    // this does not seem to work propertly from storyboard editor.
    [[UITabBar appearance] setSelectedImageTintColor:defaultAppTintColor];
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    // Don't forget to unregister for all notifications!
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Badge count for News Items tab bar item

- (void)updateNewsItemBadge:(NSInteger)unreadItemCount
{
    UITabBarItem *newsTabBarItem;
    
    // Save the new specified value into the UserDefaults
    [[NSUserDefaults standardUserDefaults] setInteger:unreadItemCount forKey:kSetting_UnreadNewsItemsCount];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSInteger blockUnreadItemCount = unreadItemCount;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate checkPermissionsForLocalNotificationOfType:UIUserNotificationTypeBadge thenScheduleBlock:^{
        // Set the application's badge to include the unread news items count
        [[UIApplication sharedApplication] setApplicationIconBadgeNumber:blockUnreadItemCount];
    }];
    
    if ([self.tabBar.items count]>=kNewsItemTabBarIndex) {
        newsTabBarItem = self.tabBar.items[kNewsItemTabBarIndex];
        newsTabBarItem.badgeValue = (unreadItemCount<=0)?nil:[NSString stringWithFormat:@"%ld", (long)unreadItemCount];
    } else {
        DLog(@"Error: could not find the news tab bar index to update the badge count!");
    }
}

@end
