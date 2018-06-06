//
//  UIView+ASGConstraint.h
//  ASGDPR
//
//  Created by Lozhkin Ilya on 6/4/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASConstraintMaker.h"

@interface UIView (ASConstraintMaker)

@property (nonatomic, readonly) void(^asc_make)(void(^)(ASConstraintMaker *make));

@end

@interface UIView (ASConstraint)

//@property (nonatomic, readonly) ASConstraint *asc_edges;
@property (nonatomic, readonly) ASConstraint *asc_top;
@property (nonatomic, readonly) ASConstraint *asc_left;
@property (nonatomic, readonly) ASConstraint *asc_bottom;
@property (nonatomic, readonly) ASConstraint *asc_right;
@property (nonatomic, readonly) ASConstraint *asc_width;
@property (nonatomic, readonly) ASConstraint *asc_height;
@property (nonatomic, readonly) ASConstraint *asc_centerX;
@property (nonatomic, readonly) ASConstraint *asc_centerY;

@end
