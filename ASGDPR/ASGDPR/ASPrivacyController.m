//
//  ASPrivacyController.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 5/8/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASPrivacyController.h"
#import "NSAttributedString+ASGDPR.h"
#import "ASPrivacyContent.h"
#import "ASConsentController.h"

@interface ASPrivacyController ()

@property (weak, nonatomic) IBOutlet UITextView *privacyTextView;

@property (weak, nonatomic) IBOutlet UIButton *agreeButton;
@property (weak, nonatomic) IBOutlet UIButton *rejectButton;
@property (assign, nonatomic) BOOL consent;
@property (strong, nonatomic) IBOutlet UIView *header;

@end

@implementation ASPrivacyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureNavigationBar];
    NSData *data = [[ASPrivacyContent privacyContent] dataUsingEncoding:NSUTF8StringEncoding];
    
    self.privacyTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.privacyTextView.attributedText = [NSAttributedString asgAttributedStringFromData:data];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Private

- (void)configureNavigationBar {
    self.navigationItem.titleView = self.header;
    [self.navigationItem setHidesBackButton:YES];
}

- (void)openConsentController:(BOOL)hasConsent {
    self.consent = hasConsent;
    [self performSegueWithIdentifier:@"ConsentControllerSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ConsentControllerSegue"]) {
        ASConsentController * controller = (ASConsentController *)segue.destinationViewController;
        controller.hasConsent = self.consent;
        controller.consentBlock = self.consentBlock;
    }
}
     
#pragma mark - Action

- (IBAction)agreeAction:(id)sender {
    [self openConsentController:YES];
}
- (IBAction)rejectAction:(id)sender {
    [self openConsentController:NO];
}

@end
