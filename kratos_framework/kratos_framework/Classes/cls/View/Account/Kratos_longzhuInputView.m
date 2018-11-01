//
//  Kratos_longzhuInputView.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/25.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_longzhuInputView.h"
#import "k_const.h"
#import "Masonry.h"



#define  inputH  40

@implementation Kratos_longzhuInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self) {
        
        [self configrationUI];
    }
    return self;
}


- (kwewf_phoneinput *)phoneInput
{
    if (_phoneInput == nil)
    {
        _phoneInput = [[kwewf_phoneinput alloc]initWithphoneNumChangeBlock:^(NSString *str) {
        }];
        _phoneInput.textField.keyboardType = UIKeyboardTypeDefault;
        _phoneInput.textField.placeholder = @"请输入账号";
        _phoneInput.accessibilityIdentifier = NSStringFromClass([self class]);


    }
    return _phoneInput;
}


- (kwewf_pwdinput *)pwdinput
{
    if (_pwdinput == nil) {
        _pwdinput = [[kwewf_pwdinput alloc] initWithpwdNumChangeBlock:^(NSString *str) {
            
        }];
    }
    return _pwdinput;
}



- (void)configrationUI
{
    
    
    [self addSubview:self.phoneInput];
    [self addSubview:self.pwdinput];
    
    
    [self.phoneInput mas_makeConstraints:^(MASConstraintMaker *make) {        
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.mas_equalTo(inputH);

    }];
  
    

    [self.pwdinput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.phoneInput.mas_bottom).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.height.mas_equalTo(inputH);

    }];
}


@end
