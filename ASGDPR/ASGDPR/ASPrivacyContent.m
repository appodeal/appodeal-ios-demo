//
//  ASPrivacyContent.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASPrivacyContent.h"

#define ASK_PRIVACY_URL @"http://www.mocky.io/v2/5af178583000000e00ba7ff5"
#define ASK_IS_CONSENT_URL @"http://www.mocky.io/v2/5af1a56c3000006c00ba8114"
#define ASK_NOT_CONSENT_URL @"http://www.mocky.io/v2/5af1a8503000002b00ba8132"
#define ASK_APPNAME_MAC @"%APP_NAME%"

@implementation ASPrivacyContent

+ (NSString *)privacyContent {
    NSString *content = [NSString stringWithContentsOfURL:[NSURL URLWithString:ASK_PRIVACY_URL] encoding:NSUTF8StringEncoding error:nil];
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    
    appName = appName ?: @"This app";
    content = [content stringByReplacingOccurrencesOfString:ASK_APPNAME_MAC withString:appName];
    return content;
}

+ (NSString *)consentContent:(BOOL)consent {
    NSString *consentURL = consent ? ASK_IS_CONSENT_URL : ASK_NOT_CONSENT_URL;
    NSString *content = [NSString stringWithContentsOfURL:[NSURL URLWithString:consentURL] encoding:NSUTF8StringEncoding error:nil];
    return content ?: @"";
}

@end
