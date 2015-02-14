//
//  NieuwslijstTableViewCell.h
//  RIBWBrabantApp
//
//  Created by Jos Verhoeff on 12-02-15.
//  Copyright (c) 2015 CERIUM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NieuwslijstTableViewCell : UITableViewCell
- (void)setUnread:(BOOL)unread;
- (void)setThumbnail:(UIImage *)thumbnail;
- (void)setTitle:(NSString *)title;
- (void)setSubtitle:(NSString *)subtitle;
@end
