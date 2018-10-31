//
//  aa_bb_account_bb_aa.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/22.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//  一键登录

#import "aa_bb_account_bb_aa.h"
#import "Masonry.h"

@interface aa_bb_account_bb_aa ()
@end

@implementation aa_bb_account_bb_aa

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupTitle];
        [self setupQuickButtton];
    }
    return self;
}



- (void)setupTitle
{
    UILabel *label = [[UILabel alloc]init];
    label.text = @"一键登录";
    label.textColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];;
    [self addSubview:label];
    
    [label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
    
}

- (void)setupQuickButtton
{
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor redColor];
    [button setImage:[UIImage imageNamed:@"cellphone_34.313253012048px_1166712_easyicon.net.png"] forState:UIControlStateNormal];
    [self addSubview:button];
    
    [button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.center.mas_equalTo(self);
    }];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
