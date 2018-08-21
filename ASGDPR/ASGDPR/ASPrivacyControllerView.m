//
//  ASPrivacyControllerView.m
//  ASGDPR
//
//  Created by Stas Kochkin on 04/06/2018.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASPrivacyControllerView.h"
#import "UIView+ASGConstraint.h"
#import "Extensions.h"
#import "ASHeaderView.h"

@interface ASPrivacyControllerView ()

@property (strong, nonatomic) ASHeaderView *headerView;
@property (nonatomic, strong) UILabel *informLabel;

@property (nonatomic, strong) UIView *bottomContainer;

@end

@implementation ASPrivacyControllerView

#pragma mark - Overriding

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    self.agreeButton.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.bottomContainer);
        make.left.equalTo(self.bottomContainer);
        make.right.equalTo(self.bottomContainer);
        if (UIApplication.sharedApplication.statusBarOrientation == UIInterfaceOrientationPortrait) {
            make.height.equalTo(@ASG_SIZE(20));
        } else {
            make.height.equalTo(@ASG_SIZE(15));
        }
        
    });
}

- (void)setupSubviews {
    self.bottomContainer = UIView.new;
    UIView *topContainer = UIView.new;
    UIView *bottomContainer = self.bottomContainer;
    
    [self addSubview:self.headerView];
    [self addSubview:topContainer];
    [self addSubview:bottomContainer];
    
    [topContainer addSubview:self.privacyTextView];
    [bottomContainer  addSubview:self.agreeButton];
    [bottomContainer  addSubview:self.rejectButton];
    [bottomContainer  addSubview:self.informLabel];
    
    self.headerView.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);

        if (UIDevice.asg_isIphoneX) {
            make.height.equalTo(self).with.multiPlier(@0.1);
        } else {
            make.height.equalTo(@ASG_SIZE(20));
        }
    });
    
    topContainer.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.headerView.asc_bottom);
        make.width.equalTo(self).with.multiPlier(ASG_TABLETE_CHOICE(@0.6, @0.9));
        make.height.equalTo(self).with.multiPlier(ASG_TABLETE_CHOICE(@0.6, @0.6));
        make.centerX.equalTo(self);
    });
    
    bottomContainer.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(topContainer.asc_bottom);
        make.width.equalTo(topContainer);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
    });
    
    self.privacyTextView.asc_make(^(ASConstraintMaker *make) {
        make.left.equalTo(topContainer);
        make.right.equalTo(topContainer);
        make.centerY.equalTo(topContainer);
    });
    
    self.rejectButton.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.agreeButton.asc_bottom).with.offset(@ASG_SIZE(4));
        make.left.equalTo(bottomContainer);
        make.right.equalTo(bottomContainer);
    });
    
    self.informLabel.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.rejectButton.asc_bottom).with.offset(@ASG_SIZE(1));
        make.left.equalTo(bottomContainer);
        make.right.equalTo(bottomContainer);
    });
}

#pragma mark - Lazy

- (UILabel *)informLabel {
    if (!_informLabel) {
        _informLabel = UILabel.asg_label(^(NSMutableString *text, NSMutableDictionary * attributes){
            [text appendString:@"I  understand that I will still see ads, but they may not be as relevant to my interests."];
            attributes[NSFontAttributeName]             = [UIFont systemFontOfSize:ASG_SIZE(4)];
            attributes[NSForegroundColorAttributeName]  = UIColor.grayColor;
            attributes[NSParagraphStyleAttributeName]   = NSParagraphStyle.asg_style(^(NSMutableParagraphStyle *paragraph){
                paragraph.alignment = NSTextAlignmentCenter;
            });
        }).asg_lines(0);
    }
    return _informLabel;
}

- (UIButton *)agreeButton {
    !_agreeButton ? _agreeButton = UIButton.asg_customRedButton(@"yes, i agree".uppercaseString) : nil;
    return _agreeButton;
}

- (UIButton *)rejectButton {
    !_rejectButton ? _rejectButton = UIButton.asg_customUnderlineButton(@"no, thank you".uppercaseString) : nil;
    return _rejectButton;
}

- (UITextView *)privacyTextView {
    !_privacyTextView ? _privacyTextView = UITextView.new.asg_scrollable(NO).asg_editable(NO) : nil;
    _privacyTextView.tintColor = UIColor.asg_redColor;
    _privacyTextView.backgroundColor = UIColor.clearColor;
    return _privacyTextView;
}

- (ASHeaderView *)headerView {
    !_headerView ? _headerView = ASHeaderView.new : nil;
    return _headerView;
}

@end
