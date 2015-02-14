//
//  NieuwsItem.h
//
//
//  Created by Marten Tamerius on 21-05-14.
//  Adapted by Jos Verhoeff
//  Copyright (c) 2015 Cerium. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface NieuwsItem : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSURL *fullPageURL;

@property (nonatomic) BOOL hasReadItem;
@property (nonatomic) BOOL isNewPostedNewsItem;
@end
