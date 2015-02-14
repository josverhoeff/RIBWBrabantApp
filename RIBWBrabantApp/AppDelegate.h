//
//  AppDelegate.h
//  RIBWBrabantApp
//
//  Created by Jos Verhoeff on 10-02-15.
//  Copyright (c) 2015 CERIUM. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSetting_ResetApp                        @"reset_app"
#define kSetting_ReadNewsItems                   @"read_news_items"
#define kSetting_DownloadedNewsItems             @"downloaded_news_items"
#define kSetting_UnreadNewsItemsCount            @"unread_news_items_count"
#define kSetting_MapViewType                     @"mapview_type"
#define kSetting_HideAlertForExternalURL         @"hide_alert_for_external_url"
#define kSetting_TimestampForLastNewsDownload    @"timestamp_for_last_news_download"
#define kSetting_ShowNewsItemsAsNotifications    @"show_news_items_as_notifications"


@class NieuwslijstTableViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSError *backgroundFetchError;

- (void)openExternalURL:(NSURL *)url;
- (void)refreshNewsItemListForController:(NieuwslijstTableViewController *)newsItemListController withCompletionHandler:(void (^)())completionHandler;

- (void)checkPermissionsForLocalNotificationOfType:(UIUserNotificationType)type thenScheduleBlock:(void (^)())notificationBlock;

@end