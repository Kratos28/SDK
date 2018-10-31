//
//  Kratos_longzhuloginView.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/25.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_longzhuloginView.h"
#import "Masonry.h"
#import "k_const.h"
#import "fiw12_agreeView113.h"
#import "wefwe_InputView.h"
#import "Kratos_longzhuInputView.h"
#import "Kratos_MainViewControllerPresenter.h"

@interface Kratos_longzhuloginView()
@property (nonatomic,strong)  Kratos_longzhuInputView *wefweInputView;
@property (nonatomic,strong) fiw12_agreeView113 *agreeView;
///登录
@property (nonatomic,strong) UIButton *QuickButtton;
///返回按钮就
@property (nonatomic,strong) UIButton *backbtn;
///忘记密码按钮
@property (nonatomic,strong) UIButton *forgotPWD;
@property (nonatomic,strong) UIButton *registerButton;
@end

@implementation Kratos_longzhuloginView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupBack];
        [self configrationInputVIew];
        [self setupQuickButtton];
        [self setupagreeView];
        [self setupForgotPWDUI];
        [self  setupregisterBttonUI];
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


- (UIButton *)forgotPWD
{
    if (_forgotPWD == nil) {
        _forgotPWD = [[UIButton alloc] init];
        [_forgotPWD setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgotPWD setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _forgotPWD.titleLabel.font = [UIFont systemFontOfSize:14];
        [_forgotPWD addTarget:self action:@selector(forgotPWDClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _forgotPWD;
}

- (UIButton *)registerButton
{
    if (_registerButton == nil) {
        _registerButton = [[UIButton alloc] init];
        [_registerButton setTitle:@"注册账号" forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_registerButton addTarget:self action:@selector(registerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
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

- (Kratos_longzhuInputView *)wefweInputView
{
    if (_wefweInputView == nil)
    {
        _wefweInputView = [[Kratos_longzhuInputView alloc]init];
        [self addSubview:self.wefweInputView];
    }
    return _wefweInputView;
}


- (void)backBtnClick:(UIButton *)btn
{
    [self.presenter  dissmissVC];
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
        [_QuickButtton setTitle:@"立即进入" forState:UIControlStateNormal];
        [_QuickButtton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _QuickButtton;
    
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

- (void)setupagreeView
{
    [self addSubview:self.agreeView];
    
    [self.agreeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.QuickButtton.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.wefweInputView.mas_left).mas_offset(10);
        make.right.mas_equalTo(self.wefweInputView.mas_right);
        make.height.mas_equalTo(25);
        
    }];
    
}


#pragma mark 配置标题
- (NSString *)setTitle
{
    return @"账号登录";
}

- (void)configrationInputVIew
{
    
    [self.wefweInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width);
        make.top.equalTo(self).mas_offset(30);
        make.centerX.equalTo(self.mas_centerX);
    }];
}

#pragma mark 配置登录按钮
- (void)setupQuickButtton
{
    
    [self addSubview:self.QuickButtton];
    
    [self.QuickButtton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.wefweInputView.mas_bottom).mas_offset(10);
    }];
    
    
}


- (void)setupForgotPWDUI
{
    [self addSubview:self.forgotPWD];
    [self.forgotPWD mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.agreeView.mas_bottom);
        make.right.mas_equalTo(self).mas_offset(-10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
        
    }];
}

- (void)setupregisterBttonUI
{
    [self addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.forgotPWD.mas_top);
        make.left.mas_equalTo(self).mas_offset(10);
        make.width.mas_equalTo(80);
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


- (void)forgotPWDClick:(UIButton *)btn
{
    if (self.presenter != nil)
    {
        [self.presenter forgetPwdClick:btn];
    }
}
- (void)registerButton:(UIButton *)btn
{
    if (self.presenter != nil)
    {
        [self.presenter regiterButtonClick:btn];
    }
}





@end
