//
//  ASNativeView.m
//  AppodealObjectiveCDemo
//
//  Copyright © 2018 appodeal. All rights reserved.
//

#import "ASNativeView.h"
#import <ASExtentions/ASExtentions.h>

@interface ASNativeView ()

//required
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *callToActionLabel;
//optional
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIView *mediaContainerView;
@property (weak, nonatomic) IBOutlet UIView *adChoicesView;

@end

@implementation ASNativeView

+ (UINib *)nib {
    return [UINib nibWithNibName:@"Native" bundle:[NSBundle mainBundle]];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    ASNativeView * nativeView = [super initWithCoder:aDecoder];
    return nativeView;
}

- (void)drawRect:(CGRect)rect {
    [self asxRound];
    
    self.iconView.layer.cornerRadius = 10.0;
    self.iconView.layer.masksToBounds = YES;
    
    self.callToActionLabel.layer.cornerRadius = 10.0;
    self.callToActionLabel.layer.masksToBounds = YES;
}

@end
