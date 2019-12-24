//
//  ASRoundButton.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "ASRoundButton.h"

@implementation ASRoundButton

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self setTitleColor:UIColor.systemRedColor forState:UIControlStateNormal];
    
    self.layer.borderColor = self.titleLabel.textColor.CGColor;
    self.layer.borderWidth = 1.0;
    self.layer.cornerRadius = 3.0;
}

@end
