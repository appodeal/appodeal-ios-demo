//
//  ASConsentControllerView.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 6/5/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASConsentControllerView.h"
#import "UIView+ASGConstraint.h"
#import "Extensions.h"
#import "ASHeaderView.h"

@interface ASConsentControllerView ()

@property (strong, nonatomic) ASHeaderView *headerView;

@end

@implementation ASConsentControllerView

#pragma mark - Overriding

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    UIView *topContainer = UIView.new;
    
    [self addSubview:self.headerView];
    [self addSubview:topContainer];
    
    [self addSubview:self.privacyTextView];
    [self addSubview:self.closeView];
    [self addSubview:self.closeButton];
    [self addSubview:self.headerView];
    
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
    
    self.privacyTextView.asc_make(^(ASConstraintMaker *make) {
        make.left.equalTo(topContainer);
        make.right.equalTo(topContainer);
        make.centerY.equalTo(topContainer);
    });
    
    self.closeView.asc_make(^(ASConstraintMaker *make) {
        make.width.equalTo(@30);
        make.height.equalTo(@30);
        make.centerX.equalTo(self.closeButton);
    });
    
    self.closeButton.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.closeView.asc_bottom).with.offset(@10);
        make.left.equalTo(self).with.offset(@(16));
        make.right.equalTo(self).with.offset(@(-16));
        make.bottom.equalTo(self).with.offset(@(-30));
    });
}

#pragma mark - Lazy

- (UIButton *)closeButton {
    !_closeButton ? _closeButton =  UIButton.asg_customUnderlineButton(@"close window".uppercaseString) : nil;
    return _closeButton;
}

- (UIImageView *)closeView {
    !_closeView ? _closeView = [[UIImageView alloc] initWithImage:UIImage.asg_closeImage] : nil;
    return _closeView;
}

- (ASHeaderView *)headerView {
    !_headerView ? _headerView = ASHeaderView.new : nil;
    return _headerView;
}

- (UITextView *)privacyTextView {
    !_privacyTextView ? _privacyTextView = UITextView.new.asg_scrollable(NO).asg_editable(NO) : nil;
    return _privacyTextView;
}

@end
