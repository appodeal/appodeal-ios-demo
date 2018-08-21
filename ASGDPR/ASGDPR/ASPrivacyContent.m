//
//  ASPrivacyContent.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASPrivacyContent.h"
#import "Extensions.h"

static inline NSString *privacy(NSString *appName,float titleSize,float bodySize) {
    return [NSString stringWithFormat:@"<div style=\"font-family: 'Arial'; font-size: %f; text-align:left;\"><b> \
            Personalize Your Ad Experience \
            </b></div><br><br> \
            <div style=\"font-family:'Arial'; font-size:%f;\"> \
            %@ personalizes your advertising experience using Appodeal. Appodeal and its partners may collect and process personal data such as device identifiers, location data, and other demographic and interest data to provide advertising experience tailored to you. By consenting to this improved ad experience, you'll see ads that Appodeal and its partners believe are more relevant to you. <a href=\"https://www.appodeal.com/privacy-policy\" style=\"color:red\">Learn more</a>. \
            <br><br> \
            By agreeing, you confirm that you are over the age of 16 and would like a personalized ad experience. \
            </div>",titleSize, bodySize, appName];
}


static inline NSString *hasConsent(float titleSize,float bodySize) {
    return [NSString stringWithFormat:@"<div style=\"font-family:'Arial'; font-size: %f; text-align:left;\"><b>\
            Personalize Your Ad Experience \
            </b></div><br><br> \
            <div style=\"font-family:'Arial'; font-size: %f;\"> \
            Great. We hope you enjoy your personalized ad experience. If you ever change your mind, you can withdraw your consent by enabling \"Limit Ad Tracking\" under Settings/Privacy/Advertising on your iOS device and then restarting this  app. \
            </div>",titleSize, bodySize];
}

static inline NSString *hasNotConsent(float titleSize,float bodySize) {
    return [NSString stringWithFormat:@"<div style=\"font-family:'Arial'; font-size: %f; text-align:left;\"><b> \
            Personalize Your Ad Experience \
            </b></div><br><br> \
            <div style=\"font-family:'Arial'; font-size: %f;\"> \
            Appodeal won’t collect your data for personalized advertising in this app. However, if you authorize Appodeal to personalize your advertising experience in a different app, we will collect your data in that other app. \
            </div>",titleSize, bodySize];
}


//#define ASK_PRIVACY_URL  @"https://s3-us-west-1.amazonaws.com/appodeal-ios/docs/GDPRPrivacy.html"
//#define ASK_IS_CONSENT_URL @"https://s3-us-west-1.amazonaws.com/appodeal-ios/docs/GDPRHasConsent.html"
//#define ASK_NOT_CONSENT_URL @"https://s3-us-west-1.amazonaws.com/appodeal-ios/docs/GDPRNoConsent.html"

@implementation ASPrivacyContent

+ (NSString *(^)(float))privacyContent {
    return ^NSString *(float scale){
        NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
        appName = appName ?: @"This app";
        return privacy(appName, scale * 7, scale * 5);
    };
}

+ (NSString *(^)(BOOL, float))consentContent {
    return ^NSString *(BOOL consent, float scale){
        return consent ? hasConsent(scale * 7, scale * 5) : hasNotConsent(scale * 7, scale * 5);
    };
}

@end
