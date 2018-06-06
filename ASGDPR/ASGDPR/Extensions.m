//
//  UIColor+Extensions.m
//  ASGDPR
//
//  Created by Stas Kochkin on 04/06/2018.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "Extensions.h"
#import "Source.h"
#import <sys/utsname.h>
#import <objc/runtime.h>

@implementation UIColor (Extensions)

+ (UIColor *)asg_redColor {
    return [UIColor colorWithRed:1
                           green:0.219
                            blue:0.137
                           alpha:1];
}

@end


@implementation UIImage (Extensions)

+ (UIImage *)asg_closeImage {
    return [UIImage imageWithData:[NSData dataWithBytes:asg_close_png length:asg_close_png_len]];
}

+ (UIImage *)asg_labelImage {
    return [UIImage imageWithData:[NSData dataWithBytes:asg_label_png length:asg_label_png_len]];
}

@end

@implementation NSAttributedString (Extensions)

+ (NSAttributedString *(^)(NSData *))asg_attributedFromData {
    return ^NSAttributedString *(NSData * data){
        return [[NSAttributedString alloc] initWithData:data
                                                options:@{
                                                          NSDocumentTypeDocumentAttribute       : NSHTMLTextDocumentType,
                                                          NSCharacterEncodingDocumentAttribute  : @(NSUTF8StringEncoding)
                                                          }
                                     documentAttributes:nil
                                                  error:nil];
    };
}

+ (NSAttributedString *(^)(void (^)(NSMutableString *, NSMutableDictionary *)))asg_attributedString {
    return ^NSAttributedString *(void (^block)(NSMutableString *, NSMutableDictionary *)) {
        NSMutableDictionary * attributes = [NSMutableDictionary dictionary];
        NSMutableString *text = [NSMutableString string];
        block ? block(text, attributes) : nil;
        NSAttributedString * string = [[NSAttributedString alloc] initWithString:text attributes:attributes];
        return string;
    };
}

@end

@implementation UIDevice (Extensions)

+ (NSString *)asg_deviceName {
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}

+ (BOOL)asg_isIphoneX {
#if TARGET_IPHONE_SIMULATOR
    NSString * device = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];
#else
    NSString * device = self.asg_deviceName;
#endif
    return  [device isEqualToString:@"iPhone10,3"] || [device isEqualToString:@"iPhone10,6"];
}

@end

@implementation UIButton (Extensions)

static const NSString *ASG_KEY_ACTION_BLOCK = @"kASGButtonActionBlock";

- (void)setAsk_actionBlock:(dispatch_block_t)ask_actionBlock {
    objc_setAssociatedObject(self, &ASG_KEY_ACTION_BLOCK, ask_actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (dispatch_block_t)ask_actionBlock {
    return objc_getAssociatedObject(self, &ASG_KEY_ACTION_BLOCK);
}

- (UIButton *(^)(dispatch_block_t))asg_tap {
    return ^UIButton *(dispatch_block_t block) {
        [self setAsk_actionBlock:block];
        [self addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

- (void)action:(UIButton *)button {
    dispatch_block_t actionBlock = self.ask_actionBlock;
    actionBlock ? actionBlock() : nil;
}

///

+ (UIButton *(^)(UIColor *, NSAttributedString *))asg_customButton {
    return ^UIButton *(UIColor *backColor, NSAttributedString * attributedTitle) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = backColor;
        [button setAttributedTitle:attributedTitle forState:UIControlStateNormal];
        return button;
    };
}

+ (UIButton *(^)(NSString *))asg_customRedButton {
    return ^UIButton *(NSString *title){

        NSAttributedString * attributeTitle = NSAttributedString.asg_attributedString(^(NSMutableString *text, NSMutableDictionary * attributes){
            [text appendString:title];
            attributes[NSFontAttributeName]             = [UIFont boldSystemFontOfSize:16.0];
            attributes[NSForegroundColorAttributeName]  = UIColor.whiteColor;
        });
        
        UIButton *button = self.asg_customButton(UIColor.asg_redColor, attributeTitle);
        button.layer.cornerRadius   = 5.0f;
        button.layer.masksToBounds  = YES;
        return button;
    };
}

+ (UIButton *(^)(NSString *))asg_customUnderlineButton {
    return ^UIButton *(NSString *title){

        NSAttributedString * attributeTitle = NSAttributedString.asg_attributedString(^(NSMutableString *text, NSMutableDictionary * attributes){
            [text appendString:title];
            attributes[NSFontAttributeName]             = [UIFont boldSystemFontOfSize:16.0];
            attributes[NSForegroundColorAttributeName]  = UIColor.blackColor;
            attributes[NSUnderlineStyleAttributeName]   = @1;
        });
        
        return self.asg_customButton(UIColor.whiteColor, attributeTitle);
    };
}

@end

@implementation UIImageView (Extensions)

static const NSString *ASG_KEY_GESTURE_BLOCK = @"kASGImageViewGestureBlock";

- (void)setAsk_actionBlock:(dispatch_block_t)ask_actionBlock {
    objc_setAssociatedObject(self, &ASG_KEY_GESTURE_BLOCK, ask_actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (dispatch_block_t)ask_actionBlock {
    return objc_getAssociatedObject(self, &ASG_KEY_GESTURE_BLOCK);
}

- (UIImageView *(^)(dispatch_block_t))asg_tap {
    return ^UIImageView *(dispatch_block_t block) {
        [self setAsk_actionBlock:block];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action:)];
        
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tapGesture];
        return self;
    };
}

- (void)action:(UIImageView *)imageView {
    dispatch_block_t actionBlock = self.ask_actionBlock;
    actionBlock ? actionBlock() : nil;
}

///

@end

@implementation UILabel (Extensions)

+ (UILabel *(^)(void (^)(NSMutableString *, NSMutableDictionary *)))asg_label {
    return ^UILabel *(void (^block)(NSMutableString *, NSMutableDictionary *)){
        UILabel *label = UILabel.new;
        [label setAttributedText: NSAttributedString.asg_attributedString(block)];
        return label;
    };
}

- (UILabel *(^)(NSUInteger))asg_lines {
    return ^UILabel*(NSUInteger lines){
        self.numberOfLines = lines;
        return self;
    };
}

@end

@implementation NSParagraphStyle (Extensions)

+ (NSParagraphStyle *(^)(void (^)(NSMutableParagraphStyle *)))asg_style {
    return ^NSParagraphStyle *(void (^block)(NSMutableParagraphStyle *)) {
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        block ? block(paragraphStyle) : nil;
        return paragraphStyle;
    };
}

@end

@implementation UITextView (Extensions)

- (UITextView *(^)(BOOL))asg_scrollable {
    return ^UITextView *(BOOL scrollable) {
        self.scrollEnabled = scrollable;
        return self;
    };
}

- (UITextView *(^)(BOOL))asg_editable {
    return ^UITextView *(BOOL editable) {
        self.editable = editable;
        return self;
    };
}

@end
