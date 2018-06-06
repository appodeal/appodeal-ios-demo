//
//  ASGDPR.h
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for ASGDPR.
FOUNDATION_EXPORT double ASGDPRVersionNumber;

//! Project version string for ASGDPR.
FOUNDATION_EXPORT const unsigned char ASGDPRVersionString[];


/**
 User consent status

 - ASConsentStatusNotRequired: User is not locate in EEA
 - ASConsentStatusPersonalized: User gives consent on personalized ads
 - ASConsentStatusNotPersonalized: User doesn't give consent on personalized ads
 */
typedef NS_ENUM(NSInteger, ASConsentStatus) {
    ASConsentStatusNotRequired = 0,
    ASConsentStatusPersonalized,
    ASConsentStatusNotPersonalized
};

typedef void(^ASConsentBlock)(ASConsentStatus);

@interface ASGDPR : NSObject

/**
 Check that user in European Economic Area by usage PersonalizedAdConsent.framework
 ( https://github.com/googleads/googleads-consent-sdk-ios ) and
 show consent dialog if it's needed

 @param publisherIds All publishers identifiers that from Google Mobile Ads
 @param consentBlock Consent action
 */
+ (void)presentConsentDialogForPublisherIds:(NSArray <NSString *> *)publisherIds
                               consentBlock:(ASConsentBlock)consentBlock;

@end

