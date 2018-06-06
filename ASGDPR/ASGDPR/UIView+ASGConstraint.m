//
//  UIView+ASGConstraint.m
//  ASGDPR
//
//  Created by Lozhkin Ilya on 6/4/18.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "UIView+ASGConstraint.h"

@implementation UIView (ASConstraintMaker)

- (void (^)(void (^)(ASConstraintMaker *)))asc_make {
    return ^(void (^makerBlock)(ASConstraintMaker *)) {
        ASConstraintMaker *maker = [[ASConstraintMaker alloc] initWithView:self];
        makerBlock ? makerBlock(maker) : nil;
        [maker installConstraints];
    };
}

@end

@implementation UIView (ASConstraint)

- (ASConstraint *)asc_top {
    return self.class.asc_makeRelationConstraint(self, NSLayoutAttributeTop);
}

- (ASConstraint *)asc_left {
    return self.class.asc_makeRelationConstraint(self, NSLayoutAttributeLeft);
}

- (ASConstraint *)asc_bottom {
    return self.class.asc_makeRelationConstraint(self, NSLayoutAttributeBottom);
}

- (ASConstraint *)asc_right {
    return self.class.asc_makeRelationConstraint(self, NSLayoutAttributeRight);
}

- (ASConstraint *)asc_width {
    return self.class.asc_makeRelationConstraint(self, NSLayoutAttributeWidth);
}

- (ASConstraint *)asc_height {
    return self.class.asc_makeRelationConstraint(self, NSLayoutAttributeHeight);
}

- (ASConstraint *)asc_centerX {
    return self.class.asc_makeRelationConstraint(self, NSLayoutAttributeCenterX);
}

- (ASConstraint *)asc_centerY {
    return self.class.asc_makeRelationConstraint(self, NSLayoutAttributeCenterY);
}

+ (ASConstraint *(^)(UIView *, NSLayoutAttribute))asc_makeRelationConstraint {
    return ^ASConstraint *(UIView *item, NSLayoutAttribute attribute){
        ASConstraint *relationConstraint = [ASConstraint new];
        relationConstraint.item         = item;
        relationConstraint.attribute    = attribute;
        return relationConstraint;
    };
}

@end
