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
@property (nonatomic, copy) dispatch_block_t completionBlock;

@property (weak, nonatomic) IBOutlet UITextView *privacyTextView;

@property (weak, nonatomic) IBOutlet UIButton *agreeButton;
@property (weak, nonatomic) IBOutlet UIButton *rejectButton;

@end

@implementation ASPrivacyController

+ (ASPrivacyController *)controllerWitnConsent:(void (^)(BOOL))consent
                                    completion:(dispatch_block_t)completion
{
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"GDPRBoard" bundle: NSBundle.mainBundle];
    ASPrivacyController * controller = [storyBoard instantiateViewControllerWithIdentifier:@"ASPrivacy"];
    
    controller.completionBlock = completion;
    controller.consentBlock = consent;
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
    self.consentBlock(hasConsent);
    ASConsentController *controller = [ASConsentController controllerWithConsent:hasConsent completion:self.completionBlock];
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
