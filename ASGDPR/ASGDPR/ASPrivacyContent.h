//
//  ASPrivacyContent.h
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASPrivacyContent : NSObject

+ (NSString *(^)(float))privacyContent;

+ (NSString *(^)(BOOL, float))consentContent;

@end
