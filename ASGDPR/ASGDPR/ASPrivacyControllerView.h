//
//  ASPrivacyControllerView.h
//  ASGDPR
//
//  Created by Stas Kochkin on 04/06/2018.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASPrivacyControllerView : UIView

@property (nonatomic, strong) UITextView *privacyTextView;

@property (nonatomic, strong) UIButton *agreeButton;
@property (nonatomic, strong) UIButton *rejectButton;

@end
