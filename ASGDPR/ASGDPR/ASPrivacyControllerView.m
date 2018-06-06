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

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *informLabel;

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

- (void)setupSubviews {
    
    [self addSubview:self.headerView];
    [self addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.privacyTextView];
    [self.contentView  addSubview:self.agreeButton];
    [self.contentView  addSubview:self.rejectButton];
    [self.contentView  addSubview:self.informLabel];
    
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
    
    self.scrollView.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.headerView.asc_bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    });
    
    self.contentView.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.scrollView);
        make.left.equalTo(self.scrollView);
        make.right.equalTo(self.scrollView);
        make.bottom.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    });
    
    self.privacyTextView.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).with.offset(@(16));
        make.right.equalTo(self.contentView).with.offset(@(-16));
    });
    
    self.agreeButton.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.privacyTextView.asc_bottom).with.offset(@10);
        make.left.equalTo(self.contentView).with.offset(@(16));
        make.right.equalTo(self.contentView).with.offset(@(-16));
        make.height.equalTo(@60);
    });
    
    self.rejectButton.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.agreeButton.asc_bottom).with.offset(@40);
        make.left.equalTo(self.contentView).with.offset(@(16));
        make.right.equalTo(self.contentView).with.offset(@(-16));
        make.height.equalTo(@30);
    });
    
    self.informLabel.asc_make(^(ASConstraintMaker *make) {
        make.top.equalTo(self.rejectButton.asc_bottom).with.offset(@0);
        make.left.equalTo(self.contentView).with.offset(@(16));
        make.right.equalTo(self.contentView).with.offset(@(-16));
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@50);
    });
}

#pragma mark - Lazy

- (UILabel *)informLabel {
    if (!_informLabel) {
        _informLabel = UILabel.asg_label(^(NSMutableString *text, NSMutableDictionary * attributes){
            [text appendString:@"I  understand that I will still see ads, but thay may not be as relevant to my interests."];
            attributes[NSFontAttributeName]             = [UIFont systemFontOfSize:14.0];
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
    return _privacyTextView;
}

- (ASHeaderView *)headerView {
    !_headerView ? _headerView = ASHeaderView.new : nil;
    return _headerView;
}

- (UIScrollView *)scrollView {
    !_scrollView ? _scrollView = UIScrollView.new : nil;
    return _scrollView;
}

- (UIView *)contentView {
    !_contentView ? _contentView = UIView.new : nil;
    return _contentView;
}

@end
