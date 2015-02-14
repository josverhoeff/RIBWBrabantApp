//
//  NieuwslijstTableViewController.h
//  RIBWBrabantApp
//
//  Created by Jos Verhoeff on 12-02-15.
//  Copyright (c) 2015 CERIUM. All rights reserved.
//



#import <UIKit/UIKit.h>
@interface NieuwslijstTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *newsItemsList;

- (void)pushNewsItemWithIdentifier:(NSString *)identifier;


@end
