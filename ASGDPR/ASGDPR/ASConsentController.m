//
//  ASConsentController.m
//
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASConsentController.h"
#import "ASPrivacyContent.h"
#import "Extensions.h"
#import "ASConsentControllerView.h"

@implementation ASConsentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureContentView];
}

#pragma mark - Private

- (void)configureContentView {
    ASConsentControllerView *contentView = [ASConsentControllerView new];
    self.view = contentView;
    
    NSData *data = [ASPrivacyContent.consentContent(self.hasConsent, ASGCurrentSize().scale) dataUsingEncoding:NSUTF8StringEncoding];
    contentView.privacyTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    contentView.privacyTextView.attributedText    = NSAttributedString.asg_attributedFromData(data);
    
    dispatch_block_t action = ^{
        self.consentBlock(self.hasConsent);
    };
    
    contentView.closeButton.asg_tap(action);
    contentView.closeView.asg_tap(action);
}


@end
