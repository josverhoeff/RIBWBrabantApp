//
//  RootViewController.h
//  RIBWBrabantApp
//
//  Created by Jos Verhoeff on 14-02-15.
//  Copyright (c) 2015 CERIUM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITabBarController
- (void)updateNewsItemBadge:(NSInteger)unreadItemCount;
@end
