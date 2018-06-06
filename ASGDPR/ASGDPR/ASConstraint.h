//
//  ASConstraint.h
//  ASGDPR
//
//  Created by Lozhkin Ilya on 6/5/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASConstraint;

@protocol ASConstraint <NSObject>

@property (nonatomic, readonly) ASConstraint *(^lessThanOrEqualTo)(id);
@property (nonatomic, readonly) ASConstraint *(^equalTo)(id);
@property (nonatomic, readonly) ASConstraint *(^greaterThanOrEqualTo)(id);

@property (nonatomic, readonly) ASConstraint *(^offset)(NSNumber *);

@property (nonatomic, readonly) ASConstraint *with;

@end

@interface ASConstraint : NSObject <ASConstraint>

@property (nonatomic,   weak) UIView *item;
@property (nonatomic,   weak) UIView *relationItem;

@property (nonatomic, assign) NSLayoutAttribute attribute;
@property (nonatomic, assign) NSLayoutAttribute relationAttribute;

@property (nonatomic, assign) CGFloat constraint;
@property (nonatomic, assign) NSLayoutRelation relation;

@end
