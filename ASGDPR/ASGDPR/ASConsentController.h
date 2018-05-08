//
//  ASConsentController.h
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASConsentController : UIViewController

+ (ASConsentController *)controllerWithConsent:(BOOL)hasConsent consentBlock:(void (^)(BOOL))consentBlock;

@end
