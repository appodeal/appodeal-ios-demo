//
//  ASPrivacyController.h
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASPrivacyController : UIViewController

+ (ASPrivacyController *)controllerWitConsent:(void(^)(BOOL))consentBlock;

@end
