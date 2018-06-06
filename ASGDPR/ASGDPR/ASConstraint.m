//
//  ASConstraint.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 6/5/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASConstraint.h"

@implementation ASConstraint

- (instancetype)init {
    if (self = [super init]) {
        _attribute          = NSLayoutAttributeNotAnAttribute;
        _relationAttribute  = NSLayoutAttributeNotAnAttribute;
    }
    return self;
}

#pragma mark - Interface

- (ASConstraint *(^)(id))lessThanOrEqualTo {
    return ^ASConstraint *(id obj) {
        self.addRelation(obj, NSLayoutRelationLessThanOrEqual);
        return self;
    };
}

- (ASConstraint *(^)(id))equalTo {
    return ^ASConstraint *(id obj) {
        self.addRelation(obj, NSLayoutRelationEqual);
        return self;
    };
}

- (ASConstraint *(^)(id))greaterThanOrEqualTo {
    return ^ASConstraint *(id obj) {
        self.addRelation(obj, NSLayoutRelationGreaterThanOrEqual);
        return self;
    };
}

- (ASConstraint *(^)(NSNumber *))offset {
    return ^ASConstraint *(NSNumber * offset){
        self.constraint = offset.floatValue;
        return self;
    };
}

- (ASConstraint *)with {
    return self;
}

#pragma mark - Private

- (void(^)(id, NSLayoutRelation))addRelation {
    return ^(id obj, NSLayoutRelation relation) {
        self.relation = relation;
        
        if ([obj isKindOfClass:ASConstraint.class]) {
            ASConstraint *relationConstraint = (ASConstraint *)obj;
            self.relationItem = relationConstraint.item;
            self.relationAttribute = relationConstraint.attribute;
        } else if ([obj isKindOfClass:UIView.class]) {
            self.relationItem = (UIView *)obj;
            self.relationAttribute = self.attribute;
        } else if ([obj isKindOfClass:NSNumber.class]) {
            self.constraint = [obj floatValue];
        }
    };
}

@end
