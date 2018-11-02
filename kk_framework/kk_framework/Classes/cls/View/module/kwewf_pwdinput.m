//
//  kwewf_pwdinput.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/29.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "kwewf_pwdinput.h"
#import "k_const.h"
#import "UIView+kkk_viewExtionsion.h"


@interface kwewf_pwdinput()
@property (nonatomic,strong) UIButton *isDisPlay;
@property (nonatomic,strong) UIButton *isSeleectDisPlay;

@end;



@implementation kwewf_pwdinput
- (instancetype)initWithpwdNumChangeBlock:(pwdNumChangeBlock)pwdNumChangeBlock
{
    self = [super init];
    if (self) {
        self.pwdNumChangeBlock = pwdNumChangeBlock;
    }
    return self;
}

- (UIButton *)isDisPlay
{
    if (_isDisPlay == nil) {
        _isDisPlay = [[UIButton alloc] init];
        _isDisPlay.backgroundColor = [UIColor yellowColor];
        [_isDisPlay addTarget:self action:@selector(isDisPlayClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _isDisPlay;
}

- (void)isDisPlayClick:(UIButton *)btn
{
    btn.selected = !self.isSeleectDisPlay.isSelected;
    self.textField.secureTextEntry = !btn.selected;
    
   
    
    self.isSeleectDisPlay = btn;
}

- (void)setupUI
{
    [super setupUI];
    [self borderForColor:[UIColor lightTextColor] borderWidth:0.5 borderType:UIBorderSideTypeAll];
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @"请输入密码";
    self.textField.secureTextEntry = true;
    self.textField.keyboardType =  UIKeyboardTypeNumberPad;
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    UIView * ff = [[UIView alloc]init];
    ff.frame = CGRectMake(0, 0, 10, 10);
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.leftView = ff;
    [self borderForColor:[UIColor blackColor] borderWidth:1 borderType:UIBorderSideTypeAll];
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-40);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:self.textField];
    
    
    [self setupDisPlaybutton];

    
}
- (void)setupDisPlaybutton
{
    
    
    self.isDisPlay = [[UIButton alloc] init];
    self.isDisPlay.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.isDisPlay setImage: [UIImage imageNamed:@"ico_mimabukejian"] forState:UIControlStateNormal];
    self.isDisPlay.titleLabel.font = [UIFont systemFontOfSize:17];;
    [self.isDisPlay setImage: [UIImage imageNamed:@"ico_mimakejian"] forState:UIControlStateSelected];
    [self.isDisPlay addTarget:self action:@selector(isDisPlayClick:) forControlEvents:UIControlEventTouchUpInside];
    self.isDisPlay.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [self.isDisPlay setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self insertSubview:self.isDisPlay atIndex:0];
    [self.isDisPlay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.width.mas_equalTo(self);
        
    }];
}

///记录是否为合法的手机号码
- (void)textFieldChange:(NSNotification *)note
{

    if (self.pwdNumChangeBlock != nil) {
        self.pwdNumChangeBlock (self.textField.text);
    }
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
