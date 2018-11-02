//
//  Kratos_QuickInputView.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/31.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_QuickInputView.h"
#import "k_const.h"
@interface Kratos_QuickInputView()
@end


@implementation Kratos_QuickInputView
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
    }
    return _phoneInput;
}




- (void)configrationUI
{
    
    
    [self addSubview:self.phoneInput];
    
    
    [self.phoneInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.height.mas_equalTo(inputH);
        
    }];
}




@end
