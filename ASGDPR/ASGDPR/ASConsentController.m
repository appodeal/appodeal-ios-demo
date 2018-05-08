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

@property (nonatomic, copy  ) dispatch_block_t completionBlock;
@property (nonatomic, assign) BOOL hasConsent;

@end

@implementation ASConsentController

+ (ASConsentController *)controllerWithConsent:(BOOL)hasConsent
                                    completion:(dispatch_block_t)completion
{
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"GDPRBoard" bundle: NSBundle.mainBundle];
    ASConsentController * controller = [storyBoard instantiateViewControllerWithIdentifier:@"ASConsent"];
    
    controller.completionBlock  = completion;
    controller.hasConsent       = hasConsent;
    
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSData *data = [[ASPrivacyContent consentContent:self.hasConsent] dataUsingEncoding:NSUTF8StringEncoding];

    
    self.privacyTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.privacyTextView.attributedText = [NSAttributedString asgAttributedStringFromData:data];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Action

- (IBAction)closeAction:(id)sender {
    self.completionBlock();
}

@end
