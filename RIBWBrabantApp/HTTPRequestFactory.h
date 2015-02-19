//
//  HTTPRequestFactory.h
//  RIBW Brabant
//
//  Created by Marten Tamerius on 12-04-14.
//  Adapted by Jos Verhoeff
//  Copyright (c) 2015 Cerium. All rights reserved.
//

#import <Foundation/Foundation.h>

// URL stuff
#define kHostname            @"www.ribwbrabant.nl"
#define kRelPageURL          @"app.pagina.aspx"
#define kRelNewsURL          @"app.nieuwsinfo.aspx"


// Define possible types of pages for kRelPageURL
typedef NS_ENUM(NSInteger, MyPageTypes) {
    MyPage_About = 0,
    MyPage_News = 1
};



@interface HTTPRequestFactory : NSObject

+ (NSString *)urlForPage:(MyPageTypes)pageType;

+ (NSString *)urlForNewsItemList;
+ (NSString *)urlForNewsItemWithIdentifier:(NSString *)identifier;
@end
