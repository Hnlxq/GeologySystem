//
//  LiButton.m
//  PetroChina.THYT.KaoQXT
//
//  Created by Migoo on 16/6/12.
//  Copyright © 2016年 Migoo. All rights reserved.
//

#import "LiButton.h"

@implementation LiButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.y = 0;
    self.imageView.centerX = self.width * 0.5;
    
    self.titleLabel.numberOfLines=0;
    self.titleLabel.width = self.width;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame)-30;
    self.titleLabel.x = 0;
    self.titleLabel.height = self.height - self.titleLabel.y;
}

@end
