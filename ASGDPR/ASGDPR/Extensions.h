//
//  UIColor+Extensions.h
//  ASGDPR
//
//  Created by Stas Kochkin on 04/06/2018.
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import <UIKit/UIKit.h>

struct ASGSize {
    float scale;
    float invertScale;
    BOOL tablete;
};
typedef struct ASGSize ASGSize;

extern ASGSize ASGCurrentSize(void);

#define ASG_SIZE(_v1) (ASGCurrentSize().scale * _v1)
#define ASG_TABLETE_CHOICE(_v1, _v2) UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? _v1 : _v2

@interface UIColor (Extensions)

@property (class, readonly) UIColor *asg_redColor;

@end

@interface UIImage (Extensions)

@property (class, readonly) UIImage *asg_closeImage;

@property (class, readonly) UIImage *asg_labelImage;

@end

@interface NSAttributedString (Extensions)

@property (class, readonly) NSAttributedString *(^asg_attributedFromData)(NSData *);

@property (class, readonly) NSAttributedString *(^asg_attributedString)(void(^)(NSMutableString *, NSMutableDictionary *));

@end

@interface UIDevice (Extensions)

@property (class, readonly) BOOL asg_isIphoneX;

@property (class, readonly) BOOL asg_oldPhone;

@property (class, readonly) BOOL asg_sePhone;

@end

@interface UIButton (Extensions)

@property (class, readonly) UIButton *(^asg_customRedButton)(NSString *);

@property (class, readonly) UIButton *(^asg_customUnderlineButton)(NSString *);


@property (class, readonly) UIButton *(^asg_customButton)(UIColor *, NSAttributedString *);

@property (readonly) UIButton *(^asg_tap)(dispatch_block_t);

@end

@interface UIImageView (Extensions)

@property (readonly) UIImageView *(^asg_tap)(dispatch_block_t);

@end

@interface UILabel (Extensions)

@property (class, readonly) UILabel *(^asg_label)(void(^)(NSMutableString *, NSMutableDictionary *));

@property (readonly) UILabel *(^asg_lines)(NSUInteger);

@end

@interface NSParagraphStyle (Extensions)

@property (class, readonly) NSParagraphStyle *(^asg_style)(void(^)(NSMutableParagraphStyle *));

@end

@interface UITextView (Extensions)

@property (readonly) UITextView*(^asg_scrollable)(BOOL);

@property (readonly) UITextView*(^asg_editable)(BOOL);

@end
