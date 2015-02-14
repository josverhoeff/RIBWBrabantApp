//
//  HTTPRequestFactory.m
//  RIBW Brabant
//
//  Created by Marten Tamerius on 12-04-14.
//  Adapted by Jos Verhoeff
//  Copyright (c) 2015 Cerium. All rights reserved.
//

#import "HTTPRequestFactory.h"

static NSArray *_actions, *_pageTypes;


@implementation HTTPRequestFactory






+ (NSString *)urlForPage:(MyPageTypes)pageType
{
    // Assemble the HTTP request string for the kRelPageURL of type "pageType".
    NSString *urlString = [NSString stringWithFormat:@"http://%@/%@?id=%@", kHostname, kRelPageURL,
                           [HTTPRequestFactory pageTypeStringForAction:pageType] ];
    return urlString;
}


+ (NSString *)urlForNewsItemList
{
    // Assemble the HTTP request string
    NSString *urlString = [NSString stringWithFormat:@"http://%@/%@", kHostname, kRelNewsURL];
    return urlString;
}

+ (NSString *)urlForNewsItemWithIdentifier:(NSString *)identifier
{
    // Assemble the HTTP request string
    NSString *urlString = [NSString stringWithFormat:@"http://%@/%@?id=%@", kHostname, kRelPageURL, identifier];
    return urlString;
}


#pragma mark - Helper methods


+ (NSString *)pageTypeStringForAction:(MyPageTypes)pageType
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Dictionary of page types for kRelPageURL.
        // Used when assembling the URL for the HTTP request. The initialization will happen only once.
        _pageTypes = @[ @"overons", @"nieuws" ];
    });
    
    return [_pageTypes objectAtIndex:pageType];
}


@end
