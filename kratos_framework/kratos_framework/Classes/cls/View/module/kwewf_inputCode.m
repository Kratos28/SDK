//
//  kwewf_inputCode.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/24.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "kwewf_inputCode.h"
#import "UIView+kkk_viewExtionsion.h"
#import "k_const.h"
#import "Masonry.h"
#import "UIView+Toast.h"

extern  BOOL isPhoneNum;
@implementation kwewf_inputCode
- (instancetype)initWithcodeNumChangeBlock:(codeChangeBlock)codeNumChangeBlock countDownBlock:(countDownStartingWithCountDownEndBlock)countDownBlock{
    if (self = [super init])
    {
        self.codeNumChangeBlock = codeNumChangeBlock;
        self.countDownBlock = countDownBlock;
        
    }
    return self;
}


- (void)setupUI
{
    [super setupUI];
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @"请输入验证码";
    self.textField.font = [UIFont systemFontOfSize:14];
    self.textField.keyboardType =  UIKeyboardTypeNumberPad;
    UIView * ff = [[UIView alloc]init];
    ff.frame = CGRectMake(0, 0, 10, 10);
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.leftView = ff;
    

    [self addSubview:self.textField];
    [self borderForColor:[UIColor blackColor] borderWidth:1 borderType:UIBorderSideTypeAll corner:1];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-150);
    }];
    
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:self.textField];
    ///设置倒计时按钮
    [self configrationCodeButton];
    
}


- (void)configrationCodeButton
{
    _countDownCode = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
    [_countDownCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_countDownCode setBackgroundColor:[UIColor orangeColor]];
    _countDownCode.titleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_countDownCode];
    
    __weak typeof(self)weakSelf = self;
    
    [_countDownCode countDownButtonHandler:^(JKCountDownButton*sender, NSInteger tag) {
        if (isPhoneNum == true) {
            sender.enabled = NO;
            [sender startCountDownWithSecond:60];
            
            [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
                NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
                
                __strong typeof(self) strongSelf = weakSelf;
                if (strongSelf != nil && strongSelf.countDownBlock != nil)
                {
                    strongSelf.countDownBlock(YES, NO, second);
                }
                return title;
            }];
            
            [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
                countDownButton.enabled = YES;
                __strong typeof(self) strongSelf = weakSelf;
                if (strongSelf != nil  && strongSelf.countDownBlock != nil)
                {
                    strongSelf.countDownBlock(NO, false, 0);
                }
                
                return @"点击重新获取";
            }];
            
        }else
        {
            [self  makeToast:@"手机号码不合法"
                    duration:2.0
                    position:CSToastPositionCenter];
        }
 
    }];
    
    
    [self.countDownCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(2);
        make.bottom.mas_equalTo(-2);
        make.right.mas_equalTo(-4);
        make.width.mas_equalTo(100);
    }];
    _countDownCode.layer.masksToBounds = true;
    _countDownCode.layer.cornerRadius = 14;
}

- (void)textFieldChange:(NSNotification *)note
{
    if (self.codeNumChangeBlock != nil) {
        self.codeNumChangeBlock(self.textField.text);
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
