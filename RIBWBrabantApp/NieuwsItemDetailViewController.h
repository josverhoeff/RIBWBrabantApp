//
//  NieuwsItemDetailViewController.h
//  RIBWBrabantApp
//
//  Created by Jos Verhoeff on 14-02-15.
//  Copyright (c) 2015 CERIUM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NieuwsItem.h"


@interface NieuwsItemDetailViewController : UIViewController
@property (strong, nonatomic) NieuwsItem *selectedNewsItem;
@end
