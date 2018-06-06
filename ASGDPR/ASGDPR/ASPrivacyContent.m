//
//  ASPrivacyContent.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASPrivacyContent.h"

#define ASK_PRIVACY_URL  @"https://s3-us-west-1.amazonaws.com/appodeal-ios/docs/GDPRPrivacy.html"
#define ASK_IS_CONSENT_URL @"https://s3-us-west-1.amazonaws.com/appodeal-ios/docs/GDPRHasConsent.html"
#define ASK_NOT_CONSENT_URL @"https://s3-us-west-1.amazonaws.com/appodeal-ios/docs/GDPRNoConsent.html"
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
