//
//  NSAttributedString+ASGDPR.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "NSAttributedString+ASGDPR.h"

@implementation NSAttributedString (ASGDPR)

+ (NSAttributedString *)asgAttributedStringFromData:(NSData *)data {
    return [[NSAttributedString alloc] initWithData:data
                                            options:@{
                                                      NSDocumentTypeDocumentAttribute       : NSHTMLTextDocumentType,
                                                      NSCharacterEncodingDocumentAttribute  : @(NSUTF8StringEncoding)
                                                      }
                                 documentAttributes:nil
                                              error:nil];
}

@end
