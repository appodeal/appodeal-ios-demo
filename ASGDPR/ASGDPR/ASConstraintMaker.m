//
//  ASConstraintMaker.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 6/4/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASConstraintMaker.h"

@interface ASConstraintMaker ()

@property (nonatomic,   weak) UIView *item;
@property (nonatomic, strong) NSArray <ASConstraint *>* constraints;

@end

// attribute NSLayoutAttribute
// reloadtion NSLayoutRelation
// constant CGFloat

@implementation ASConstraintMaker

- (instancetype)initWithView:(UIView *)view {
    if (self = [super init]) {
        _item = view;
    }
    return self;
}

- (void)installConstraints {
    self.item.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint deactivateConstraints:[self.item constraints]];
    
    NSMutableArray<NSLayoutConstraint *> * constraints = [NSMutableArray array];
    for (ASConstraint *constraint in self.constraints) {
        [constraints addObject:self.systemContraint(constraint)];
    }
    [NSLayoutConstraint activateConstraints:constraints];
}

#pragma mark - Set constraints

- (ASConstraint *)top {
    return self.addContraint(NSLayoutAttributeTop);
}

- (ASConstraint *)left {
    return self.addContraint(NSLayoutAttributeLeft);
}

- (ASConstraint *)bottom {
    return self.addContraint(NSLayoutAttributeBottom);
}

- (ASConstraint *)right {
    return self.addContraint(NSLayoutAttributeRight);
}

- (ASConstraint *)width {
    return self.addContraint(NSLayoutAttributeWidth);
}

- (ASConstraint *)height {
    return self.addContraint(NSLayoutAttributeHeight);
}

- (ASConstraint *)centerX {
    return self.addContraint(NSLayoutAttributeCenterX);
}

- (ASConstraint *)centerY {
    return self.addContraint(NSLayoutAttributeCenterY);
}

- (ASConstraint *(^)(NSLayoutAttribute))addContraint {
    return ^ASConstraint *(NSLayoutAttribute attribute) {
        ASConstraint *constraint = [ASConstraint new];
        [constraint setItem:self.item];
        [constraint setAttribute:attribute];
        
        NSMutableArray *mutableCopy = [self.constraints mutableCopy];
        if (!mutableCopy) {
            mutableCopy = [NSMutableArray array];
        }
        [mutableCopy addObject:constraint];
        self.constraints = mutableCopy;
        return constraint;
    };
}

- (NSLayoutConstraint * (^)(ASConstraint *))systemContraint {
    return ^NSLayoutConstraint *(ASConstraint *constraint) {
        NSLayoutConstraint *systemConstraint = nil;
        systemConstraint = [NSLayoutConstraint constraintWithItem:constraint.item
                                                        attribute:constraint.attribute
                                                        relatedBy:constraint.relation
                                                           toItem:constraint.relationItem
                                                        attribute:constraint.relationAttribute
                                                       multiplier:1.0f
                                                         constant:constraint.constraint];
        return systemConstraint;
    };
}

@end
