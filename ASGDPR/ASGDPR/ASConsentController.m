//
//  ASConsentController.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASConsentController.h"
#import "ASPrivacyContent.h"
#import "NSAttributedString+ASGDPR.h"

@interface ASConsentController ()

@property (weak, nonatomic) IBOutlet UITextView *privacyTextView;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *closeView;
@property (strong, nonatomic) IBOutlet UIView *header;

@end

@implementation ASConsentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureNavigationBar];
    
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction:)];
    [self.closeView addGestureRecognizer:gesture];
    
    NSData *data = [[ASPrivacyContent consentContent:self.hasConsent] dataUsingEncoding:NSUTF8StringEncoding];

    self.privacyTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.privacyTextView.attributedText = [NSAttributedString asgAttributedStringFromData:data];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)configureNavigationBar {
    self.navigationItem.titleView = self.header;
    [self.navigationItem setHidesBackButton:YES];
}

#pragma mark - Action

- (IBAction)closeAction:(id)sender {
    self.consentBlock(self.hasConsent);
}

@end
