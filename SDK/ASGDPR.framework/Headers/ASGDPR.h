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


typedef void(^ASConsentBlock)(BOOL);

@interface ASGDPR : NSObject

+ (void)present:(ASConsentBlock)consentBlock;

@end

