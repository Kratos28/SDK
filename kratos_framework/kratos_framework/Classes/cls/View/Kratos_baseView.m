//
//  Kratos_baseView.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/29.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_baseView.h"
#import "k_const.h"
#import "Masonry.h"

@implementation Kratos_baseView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return self;
}


- (NSString *)setTitle
{
    return nil;
}


- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    [self setupTitle];

}

#pragma mark 配置标题
- (void)setupTitle
{
    UILabel *label = [[UILabel alloc]init];
    label.text = [self setTitle];
    label.textColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];;
    [self addSubview:label];
    _titleLabel  = label;
    [label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
}


@end
