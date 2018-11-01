//
//  kwewf_phoneinput.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/24.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "kwewf_phoneinput.h"
#import "UIView+kkk_viewExtionsion.h"
#import "Masonry.h"
#import "k_const.h"
#import <KratosDropDown/KratosDropDown-Swift.h>


@interface kwewf_phoneinput()
@property (nonatomic,strong)DropDown *downMenu;

@end

@implementation kwewf_phoneinput
  BOOL isPhoneNum;



- (void)setupUI
{
    [super setupUI];
    
    [self borderForColor:[UIColor lightTextColor] borderWidth:0.5 borderType:UIBorderSideTypeAll];
        self.textField = [[UITextField alloc] init];
    self.textField.keyboardType =  UIKeyboardTypeNumberPad;
    UIView * ff = [[UIView alloc]init];
    ff.frame = CGRectMake(0, 0, 10, 10);
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.leftView = ff;
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    
    [self borderForColor:[UIColor blackColor] borderWidth:1 borderType:UIBorderSideTypeAll];
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-30);
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:self.textField];
    
    
    
    
    [self setupsetupPullDownMenu];
    

}


- (void)setupsetupPullDownMenu
{
    self.pullDownMenu = [[UIButton alloc] init];
    self.pullDownMenu.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.pullDownMenu setImage: [UIImage imageNamed:@"downarrow"] forState:UIControlStateNormal];
    self.pullDownMenu.titleLabel.font = [UIFont systemFontOfSize:17];;
    [self.pullDownMenu setImage: [UIImage imageNamed:@"uparrow"] forState:UIControlStateSelected];
    [self.pullDownMenu addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.pullDownMenu.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [self.pullDownMenu setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self insertSubview:self.pullDownMenu atIndex:0];
    self.downMenu = [[DropDown alloc] init];
    self.downMenu.anchorView = self.pullDownMenu;
    
    
    
    [self.pullDownMenu mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.width.mas_equalTo(self);
    }];
    
    
    
    
    

//    NSString *key =   NSStringFromClass([self class]);
//    NSString*cachePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject] stringByAppendingString:key];
//

    
    
    
    DropDown *dropDownappearance  = [DropDown appearance];
    dropDownappearance.cellHeight =  35;
    
    __weak typeof(self) weakSelf = self;
    [self.downMenu setCustomCellConfiguration:^(NSInteger index, NSString * _Nonnull str, DropDownCell * _Nonnull cell) {
        [cell.deleteButton addTarget:weakSelf action:@selector(deleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.deleteButton.tag = index;
    }];

    self.downMenu. selectionAction = ^(NSInteger index , NSString * _Nonnull str ) {
        [weakSelf.pullDownMenu setSelected: false];
        weakSelf.textField.text = str;
    };
    
 
    
    self.downMenu.cancelAction = ^{
        [weakSelf.pullDownMenu setSelected:false];
    };
    
    
    
    
    
    
    
    
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    NSString *key =  self.caller;
    NSString*cachePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject] stringByAppendingString:key];
    
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:cachePath] && [NSMutableArray arrayWithContentsOfFile:cachePath]) {
        NSMutableArray *temp = [NSMutableArray arrayWithContentsOfFile:cachePath];
        self.downMenu.dataSource = temp;
        
    }
    
    __weak typeof(self) weakSelf = self;

    self.downMenu.willShowAction = ^{
        if (weakSelf.downMenu.dataSource == nil || weakSelf.downMenu.dataSource.count == 0) {
            if ([[NSFileManager defaultManager]fileExistsAtPath:cachePath] && [NSMutableArray arrayWithContentsOfFile:cachePath]) {
                NSMutableArray *temp = [NSMutableArray arrayWithContentsOfFile:cachePath];
                weakSelf.downMenu.dataSource = temp;
            }
            
        }
        [weakSelf.pullDownMenu setSelected:YES];
    };
}


- (void)deleteButtonClick:(UIButton *)btn
{
    
    
//    NSString *key =   NSStringFromClass([self class]);
//
//    NSString*cachePath = [[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject] stringByAppendingString:key] stringByAppendingString:self.caller];
    
    NSString *key =  self.caller;
    NSString*cachePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject] stringByAppendingString:key];
    __weak typeof(self) weakSelf = self;
    

    if ([[NSFileManager defaultManager]fileExistsAtPath:cachePath])
    {
        NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:cachePath];
        if (array.count > 0) {
            [array removeObjectAtIndex:btn.tag];
            weakSelf.downMenu.dataSource = array;
            [array writeToFile:cachePath atomically:true];
        }
    }
    
 
    

}

- (void)buttonClick:(UIButton *)btn
{
    [self.downMenu objcShow];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.downMenu.bottomOffset = CGPointMake(0, self.frame.size.height);

}

 - (DropDown *)downMenu
{
    if (_downMenu == nil) {
        _downMenu = [[DropDown alloc] init];
    }
    return _downMenu;
}


- (instancetype)initWithphoneNumChangeBlock:(phoneNumChangeBlock)phoneNumChangeBlock
{
    if (self = [super init])
    {
        NSArray *syms = [NSThread  callStackSymbols];
        self.phoneNumChangeBlock = phoneNumChangeBlock;
        
        NSString *caller = [syms objectAtIndex:1];
        NSArray *ss = [fwfweew_Tool matchString:caller toRegexString:@"\\[(.*?)\\]"];
        if (ss.count > 1)
        {
            caller = ss[1];
            NSArray *sss = [fwfweew_Tool matchString:caller toRegexString:@"\\S*"];
            self.caller = sss[0];
            
            
        }
        
    }
    return  self;
    
}

///记录是否为合法的手机号码
- (void)textFieldChange:(NSNotification *)note
{
    if (self.textField.text.length > 0 && [fwfweew_Tool valiMobile:self.textField.text]) {
        isPhoneNum = true;
    }else
    {
        isPhoneNum = false;
    }

    if (self.phoneNumChangeBlock != nil) {
        self.phoneNumChangeBlock(self.textField.text);
    }
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
