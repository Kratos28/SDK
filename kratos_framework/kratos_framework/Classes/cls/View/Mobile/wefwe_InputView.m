//
//  wefwe_InputView.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/24.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "wefwe_InputView.h"
#import "k_const.h"
#import "Masonry.h"

@interface wefwe_InputView()



@end


@implementation wefwe_InputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self) {
        
        [self configrationUI];
    }
    return self;
}

- (kwewf_inputCode *)codeinput11
{
    if (_codeinput11 == nil)
    {
        _codeinput11 = [[kwewf_inputCode alloc]init];
    }
    return _codeinput11;
}





- (kwewf_phoneinput *)phoneInput
{
    if (_phoneInput == nil)
    {
        _phoneInput = [[kwewf_phoneinput alloc]initWithphoneNumChangeBlock:^(NSString *str) {
            
        }];
        _phoneInput.textField.keyboardType = UIKeyboardTypePhonePad;
        _phoneInput.textField.placeholder = @"请输入手机号码";

    }
    return _phoneInput;
}



- (void)configrationUI
{
    
    
    [self addSubview:self.phoneInput];
    [self addSubview:self.codeinput11];

    
    [self.phoneInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.mas_equalTo(inputH);
        
    }];
    
    
    
    [self.codeinput11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.phoneInput.mas_bottom).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.height.mas_equalTo(inputH);
        
    }];
    

}



@end
