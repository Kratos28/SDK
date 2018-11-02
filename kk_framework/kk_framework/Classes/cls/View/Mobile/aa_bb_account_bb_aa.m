//
//  aa_bb_account_bb_aa.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/22.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//  一键登录

#import "aa_bb_account_bb_aa.h"
#import "Masonry.h"
#import "k_const.h"
#import "fiw12_agreeView113.h"
#import "Kratos_LongZhuLogin.h"
#import "Kratos_MainViewControllerPresenter.h"

@interface aa_bb_account_bb_aa ()

@property (nonatomic,strong) UIButton *loginButtton;
@property (nonatomic,strong) fiw12_agreeView113 *agreeView;
@property (nonatomic,strong) UIButton *otherLogin;
@property (nonatomic,strong) UIButton *quickButton;
@end

@implementation aa_bb_account_bb_aa

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self configrationInputVIew];
        [self setupLoginButtton];
        [self setupagreeView];
        [self setupOtherLogin];
        [self configrationQuickUI];

        
    }
    return self;
}



- (UIButton *)otherLogin
{
    if (_otherLogin == nil) {
        _otherLogin = [[UIButton alloc]init];
        [_otherLogin  setTitle:@"其他登录方式" forState:UIControlStateNormal];
        _otherLogin.titleLabel.font = [UIFont systemFontOfSize:14];
        [_otherLogin setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_otherLogin addTarget:self action:@selector(otherLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _otherLogin;
}

- (UIButton *)quickButton
{
    if (_quickButton == nil) {
        _quickButton = [[UIButton alloc]init];
        [_quickButton setTitle:@"一键登录" forState:UIControlStateNormal];
        _quickButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_quickButton addTarget:self action:@selector(quickButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_quickButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
    }
    return _quickButton;
}

- (void)setupagreeView
{
    [self addSubview:self.agreeView];
    
    [self.agreeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginButtton.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.wefweInputView.mas_left).mas_offset(10);
        make.right.mas_equalTo(self.wefweInputView.mas_right);
        make.height.mas_equalTo(25);

    }];

}

- (void)configrationInputVIew
{
    [self.wefweInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.mas_equalTo(30);
//        make.centerY.equalTo(self.mas_centerY).mas_offset(-70);
        make.centerX.equalTo(self.mas_centerX);
    }];
}



- (wefwe_InputView *)wefweInputView
{
    if (_wefweInputView == nil)
    {
        _wefweInputView = [[wefwe_InputView alloc]init];
        [self addSubview:self.wefweInputView];
    }
    return _wefweInputView;
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
- (UIButton *)loginButtton
{
    if (_loginButtton == nil)
    {
        _loginButtton= [[UIButton alloc]init];
        _loginButtton.layer.masksToBounds = YES;
        _loginButtton.layer.cornerRadius = 5;
        _loginButtton.backgroundColor = [UIColor redColor];
        _loginButtton.titleLabel.numberOfLines = 0;
        [_loginButtton.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [_loginButtton setTitle:@"立即进入" forState:UIControlStateNormal];
        [_loginButtton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButtton;
    
}

#pragma mark 配置标题
- (NSString *)setTitle
{
    return @"手机登录";
}
#pragma mark 配置一键登录按钮
- (void)configrationQuickUI
{
    [self addSubview:self.quickButton];
    [self.quickButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(80);
        make.height.equalTo(self.otherLogin.mas_height);
        make.top.equalTo(self.otherLogin.mas_top);
    }];
}

#pragma mark 配置登录按钮
- (void)setupLoginButtton
{
    
    [self addSubview:self.loginButtton];
    
    [self.loginButtton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
        make.top.equalTo(self.wefweInputView.mas_bottom).mas_offset(10);
    }];
    
    
}

#pragma mark 配置其他登录按钮
- (void)setupOtherLogin
{
    [self addSubview:self.otherLogin];
    [self.otherLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.agreeView.mas_bottom);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(100);
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



#pragma mark 其他登录方式点击了
- (void)otherLoginClick:(UIButton *)sender
{
    
    if (self.presenter != nil )
    {
        [self.presenter presentVC];
    }
}

- (void)quickButtonClick:(UIButton *)sender
{
    [self.presenter quickButtonClick:sender];
}




@end
