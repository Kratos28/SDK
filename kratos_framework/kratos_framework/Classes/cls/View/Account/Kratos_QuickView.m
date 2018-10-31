//
//  Kratos_QuickView.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/31.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_QuickView.h"
#import "Kratos_QuickInputView.h"
#import "k_const.h"
#import "Kratos_MainViewControllerPresenter.h"

@interface Kratos_QuickView()
@property (nonatomic,strong)  Kratos_QuickInputView *quickInputView;
///登录
@property (nonatomic,strong) UIButton *QuickButtton;
@property (nonatomic,strong) UIButton *backbtn;

@end

@implementation Kratos_QuickView


- (UIButton *)QuickButtton
{
    if (_QuickButtton == nil)
    {
        _QuickButtton= [[UIButton alloc]init];
        _QuickButtton.layer.masksToBounds = YES;
        _QuickButtton.layer.cornerRadius = 5;
        _QuickButtton.backgroundColor = [UIColor redColor];
        _QuickButtton.titleLabel.numberOfLines = 0;
        [_QuickButtton.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [_QuickButtton setTitle:@"立即进入" forState:UIControlStateNormal];
        [_QuickButtton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _QuickButtton;
    
}

- (Kratos_QuickInputView *)quickInputView
{
    if (_quickInputView == nil)
    {
        _quickInputView = [[Kratos_QuickInputView alloc]init];
    }
    return _quickInputView;
}

- (UIButton *)backbtn
{
    if (_backbtn == nil) {
        _backbtn = [[UIButton alloc] init];
        [_backbtn setTitle:@"返回" forState:UIControlStateNormal];
        [_backbtn setImage:[UIImage imageNamed:@"backp"] forState:UIControlStateNormal];
        [_backbtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backbtn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self) {
        
        [self configrationInputVIew];
        [self setupQuickButtton];
        [self setupBack];
    }
    return self;
}

- (void)setupQuickButtton
{
    [self addSubview:self.QuickButtton];
    [self.QuickButtton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.quickInputView.mas_bottom).mas_offset(10);
    }];
}

- (void)configrationInputVIew
{
    [self addSubview:self.quickInputView];
    [self.quickInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width);
//        make.top.equalTo(self).mas_offset(30);
        make.centerY.equalTo(self.mas_centerY).mas_offset(-50);
        make.centerX.equalTo(self.mas_centerX);
    }];
}

- (void)setupBack
{
    [self addSubview:self.backbtn];
    
    [self.backbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(5);
        make.left.mas_equalTo(self).mas_offset(5);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        
    }];
}
- (void)backBtnClick:(UIButton *)btn
{
    [self.presenter  dissmissVC];
}
- (NSString *)setTitle
{
    return @"一键登录";
}
- (void)loginClick:(UIButton *)btn
{
    
}
@end
