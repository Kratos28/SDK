//
//  Kratos_RegisiterView.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/29.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_RegisiterView.h"
#import "Kratos_RegiterInputView.h"
#import "fiw12_agreeView113.h"
#import "k_const.h"
#import "Kratos_MainViewControllerPresenter.h"
#import "Kratos_ForgotVC.h"
#import "Masonry.h"


@interface Kratos_RegisiterView()

@property (nonatomic,strong) fiw12_agreeView113 *agreeView;
///登录
@property (nonatomic,strong) UIButton *QuickButtton;
///返回按钮就
@property (nonatomic,strong) UIButton *backbtn;
///忘记密码按钮
@property (nonatomic,strong) UIButton *forgotPWD;
@property (nonatomic,strong) UIButton *registerButton;
@end


@implementation Kratos_RegisiterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self configrationInputVIew];
        [self setupQuickButtton];
        [self setupBack];
        [self setupagreeView];

    }
    return self;
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
- (void)backBtnClick:(UIButton *)btn
{
    [self.presenter  dissmissVC];
}

- (Kratos_RegiterInputView *)registerInputView
{
    if (_registerInputView == nil) {
        _registerInputView = [[Kratos_RegiterInputView alloc] init];
    }
    return _registerInputView;
}

- (fiw12_agreeView113 *)agreeView
{
    if (_agreeView == nil)
    {
        _agreeView = [fiw12_agreeView113 fiw12_agreeView113agreenBlick:^{
            
        } protocaolClick:^{
            
        }];
    }
    return _agreeView;
}

- (void)configrationInputVIew
{
    [self addSubview:self.registerInputView];
    [self.registerInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width);
        make.top.equalTo(self).mas_offset(30);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    
}



- (void)setupQuickButtton
{
    
    [self addSubview:self.QuickButtton];
    
    [self.QuickButtton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(35);
        make.top.equalTo(self.registerInputView.mas_bottom).mas_offset(0);
    }];
    
    
}



- (void)setupagreeView
{
    [self addSubview:self.agreeView];
    [self.agreeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.QuickButtton.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(self.registerInputView.mas_left).mas_offset(10);
        make.right.mas_equalTo(self.registerInputView.mas_right);
        make.height.mas_equalTo(30);
    }];
    
}

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
        
    
        
        [_QuickButtton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _QuickButtton;
    
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


#pragma mark 登录点击了
- (void)loginClick:(UIButton *)btn
{
    if (self.presenter != nil )
    {
        [self.presenter loginClick:btn];
    }
}


- (NSString *)setTitle
{
    if ([self.presenter.view isMemberOfClass:[Kratos_ForgotVC class]]) {
        [_QuickButtton setTitle:@"修改密码" forState:UIControlStateNormal];
        return @"忘记密码";
    }else
    {
        [_QuickButtton setTitle:@"立即注册" forState:UIControlStateNormal];
        return @"手机号注册";
    }
}

@end
