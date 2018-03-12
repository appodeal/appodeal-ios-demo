//
//  UIView+ASExtentions.m
//
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "UIView+ASExtentions.h"

@implementation UIView (ASExtentions)

- (void)asxRound {
    self.layer.masksToBounds = YES;
    self.layer.borderColor = UIColor.lightGrayColor.CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = 20;
}

- (void)asxEdgesEqualView:(UIView *)view {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[[NSLayoutConstraint constraintWithItem:self
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:view
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:self
                                                                           attribute:NSLayoutAttributeLeading
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:view
                                                                           attribute:NSLayoutAttributeLeading
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:view
                                                                           attribute:NSLayoutAttributeBottom
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0
                                                                            constant:0],
                                              [NSLayoutConstraint constraintWithItem:self
                                                                           attribute:NSLayoutAttributeTrailing
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:view
                                                                           attribute:NSLayoutAttributeTrailing
                                                                          multiplier:1.0
                                                                            constant:0]]];
}

@end
