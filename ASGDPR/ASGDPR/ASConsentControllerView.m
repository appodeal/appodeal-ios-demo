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
    
    [self addSubview:self.privacyTextView];
    [self addSubview:self.closeView];
    [self addSubview:self.closeButton];
    [self addSubview:self.headerView];
    
    self.headerView.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        if (UIDevice.asg_isIphoneX) {
            make.height.equalTo(@(80));
        } else {
            make.height.equalTo(@(50));
        }
    });
    
    self.privacyTextView.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.headerView.asc_bottom);
        make.left.equalTo(self).with.offset(@(16));
        make.right.equalTo(self).with.offset(@(-16));
        make.bottom.equalTo(self.closeView).with.offset(@(-10));
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
