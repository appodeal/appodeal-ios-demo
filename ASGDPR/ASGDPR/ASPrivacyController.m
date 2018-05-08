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

@property (nonatomic, copy) void (^consentBlock)(BOOL);

@property (weak, nonatomic) IBOutlet UITextView *privacyTextView;

@property (weak, nonatomic) IBOutlet UIButton *agreeButton;
@property (weak, nonatomic) IBOutlet UIButton *rejectButton;

@end

@implementation ASPrivacyController

+ (ASPrivacyController *)controllerWitConsent:(void (^)(BOOL))consentBlock
{
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"GDPRBoard" bundle: NSBundle.mainBundle];
    ASPrivacyController * controller = [storyBoard instantiateViewControllerWithIdentifier:@"ASPrivacy"];
    
    controller.consentBlock = consentBlock;
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSData *data = [[ASPrivacyContent privacyContent] dataUsingEncoding:NSUTF8StringEncoding];
    
    self.privacyTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.privacyTextView.attributedText = [NSAttributedString asgAttributedStringFromData:data];
}

#pragma mark - Private

- (void)openConsentController:(BOOL)hasConsent {
    ASConsentController *controller = [ASConsentController controllerWithConsent:hasConsent consentBlock:self.consentBlock];
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - Action

- (IBAction)agreeAction:(id)sender {
    [self openConsentController:YES];
}
- (IBAction)rejectAction:(id)sender {
    [self openConsentController:NO];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}



@end
