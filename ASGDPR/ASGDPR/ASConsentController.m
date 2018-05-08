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

@property (nonatomic, copy) void (^consentBlock)(BOOL);
@property (nonatomic, assign) BOOL hasConsent;

@end

@implementation ASConsentController

+ (ASConsentController *)controllerWithConsent:(BOOL)hasConsent consentBlock:(void (^)(BOOL))consentBlock
{
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"GDPRBoard" bundle: NSBundle.mainBundle];
    ASConsentController * controller = [storyBoard instantiateViewControllerWithIdentifier:@"ASConsent"];
    
    controller.consentBlock     = consentBlock;
    controller.hasConsent       = hasConsent;
    
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction:)];
    [self.closeView addGestureRecognizer:gesture];
    
    NSData *data = [[ASPrivacyContent consentContent:self.hasConsent] dataUsingEncoding:NSUTF8StringEncoding];

    
    self.privacyTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.privacyTextView.attributedText = [NSAttributedString asgAttributedStringFromData:data];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Action

- (IBAction)closeAction:(id)sender {
    self.consentBlock(self.hasConsent);
}

@end
