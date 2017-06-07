//
//  UIColor+ASColor.m
//  appodeal_demo
//
//  Copyright © 2017 appodeal. All rights reserved.
//

#import "UIColor+ASColor.h"

@implementation UIColor (ASColor)

+ (UIColor *)asMainColor {
    return [UIColor colorWithRed:0.94f green:0.18f blue:0.16f alpha:1.0f];
}

- (UIImage *)asImage{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
