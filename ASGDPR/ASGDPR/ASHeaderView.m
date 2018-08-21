//
//  HeaderView.m
//
//  Copyright © 2018 Appodeal. All rights reserved.
//

#import "ASHeaderView.h"
#import "Extensions.h"
#import "UIView+ASGConstraint.h"

@interface ASHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *titleImage;

@end

@implementation ASHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.asg_redColor;
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.titleImage];
    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    
    self.titleImage.asc_make(^(ASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(@(-4));
        make.left.equalTo(self).with.offset(@16);
        make.height.equalTo(@ASG_SIZE(13));
        make.width.equalTo(@ASG_SIZE(13));
    });
    
    self.titleLabel.asc_make(^(ASConstraintMaker *make) {
        make.centerY.equalTo(self.titleImage);
        make.left.equalTo(self.titleImage.asc_right).with.offset(@10);
        make.right.equalTo(self).with.offset((@(-16)));
    });
}

#pragma mark - Lazy

- (UIImageView *)titleImage {
    !_titleImage ? _titleImage = [[UIImageView alloc] initWithImage:UIImage.asg_labelImage] : nil;
    return _titleImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.asg_label(^(NSMutableString *text, NSMutableDictionary * attributes){
            [text appendString:@"appodeal".uppercaseString];
            
            UIFont *font = [UIFont fontWithName:@"Arial-BoldMT" size:ASG_SIZE(10)];
            attributes[NSFontAttributeName]             = font;
            attributes[NSForegroundColorAttributeName]  = UIColor.whiteColor;
            attributes[NSExpansionAttributeName]  = @(-0.4f);
        });
    }
    return _titleLabel;
}

@end
