//
//  ASConstraintMaker.h
//  ASGDPR
//
//  Created by Lozhkin Ilya on 6/4/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASConstraint.h"

@interface ASConstraintMaker : NSObject

//@property (nonatomic, readonly) ASConstraint *edges;
@property (nonatomic, readonly) ASConstraint *top;
@property (nonatomic, readonly) ASConstraint *left;
@property (nonatomic, readonly) ASConstraint *bottom;
@property (nonatomic, readonly) ASConstraint *right;
@property (nonatomic, readonly) ASConstraint *width;
@property (nonatomic, readonly) ASConstraint *height;
@property (nonatomic, readonly) ASConstraint *centerX;
@property (nonatomic, readonly) ASConstraint *centerY;

//private

- (instancetype)initWithView:(UIView *)view;

- (void)installConstraints;

@end
