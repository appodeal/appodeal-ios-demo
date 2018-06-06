//
//  ASPrivacyController.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASPrivacyController.h"
#import "ASConsentController.h"
#import "ASPrivacyContent.h"
#import "Extensions.h"
#import "ASPrivacyControllerView.h"

@implementation ASPrivacyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureContentView];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Private

- (void)configureContentView {
    ASPrivacyControllerView *contentView = [ASPrivacyControllerView new];
    self.view = contentView;
    
    NSData *data = [ASPrivacyContent.privacyContent dataUsingEncoding:NSUTF8StringEncoding];
    contentView.privacyTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    contentView.privacyTextView.attributedText    = NSAttributedString.asg_attributedFromData(data);
    
    contentView.agreeButton.asg_tap(^{
        [self openConsentController:YES];
    });
    
    contentView.rejectButton.asg_tap(^{
        [self openConsentController:NO];
    });
}

- (void)openConsentController:(BOOL)hasConsent {
    ASConsentController *controller = [ASConsentController new];
    controller.hasConsent = hasConsent;
    controller.consentBlock = self.consentBlock;

    [self presentViewController:controller animated:NO completion:nil];
}

@end
