//
//  Kratos_RegiterInputView.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/29.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_RegiterInputView.h"
#import "kwewf_inputCode.h"
#import "kwewf_pwdinput.h"
#import "kwewf_phoneinput.h"
#import "k_const.h"

@implementation Kratos_RegiterInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self) {
        
        [self configrationUI];
    }
    return self;
}

- (kwewf_inputCode *)codeinput
{
    if (_codeinput == nil)
    {
        _codeinput = [[kwewf_inputCode alloc]initWithcodeNumChangeBlock:^(NSString *phone) {
            
        } countDownBlock:^(BOOL isStart, BOOL isEnd, NSUInteger second) {
            
        }];
    }
    return _codeinput;
}

- (kwewf_phoneinput *)phoneInput
{
    if (_phoneInput == nil)
    {
        _phoneInput = [[kwewf_phoneinput alloc]initWithphoneNumChangeBlock:^(NSString *str) {
            
        }];
        _phoneInput.textField.placeholder = @"请输入手机号码";
        _phoneInput.textField.keyboardType = UIKeyboardTypePhonePad;

    }
    return _phoneInput;
}


- (kwewf_pwdinput *)affirmPWD
{
    if (_affirmPWD == nil)
    {
        _affirmPWD = [[kwewf_pwdinput alloc]initWithpwdNumChangeBlock:^(NSString *str) {
            
        }];
        _affirmPWD.textField.keyboardType = UIKeyboardTypeDefault;
        _affirmPWD.textField.placeholder = @"请确认密码";
        
    }
    return _affirmPWD;
}




- (void)configrationUI
{
    
    
    [self addSubview:self.phoneInput];
    [self addSubview:self.codeinput];
    [self addSubview:self.affirmPWD];
    
    [self.phoneInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.mas_equalTo(inputH);
    }];
    
    
    [self.codeinput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.phoneInput.mas_bottom).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.mas_equalTo(inputH);
    }];
    
    

    [self.affirmPWD mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.codeinput.mas_bottom).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.height.mas_equalTo(inputH);
    }];
    
}





@end
