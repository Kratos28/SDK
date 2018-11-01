//
//  fiw12_agreeView113_.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/24.
//  Copyright © 2018年 kratos_framework. All rights reserved.
// 用户协议试图

#import "fiw12_agreeView113.h"
#import "Masonry.h"
#import "k_const.h"

@interface fiw12_agreeView113 ()
@property (nonatomic,strong) UIButton *selectBtn;
@end

@implementation fiw12_agreeView113


+ (instancetype)fiw12_agreeView113agreenBlick:(agreenBlockClick)block protocaolClick:(protocolkClick)protocolnBlick
{
      fiw12_agreeView113 *v =  [[self alloc] initWithFrame:CGRectZero];
    v.agreenBlick = block;
    v.protocolnBlick = protocolnBlick;
    return v;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupAgreenButton];
    }
    return self;
}
- (void)setupAgreenButton
{
    UIButton *btn  = [[UIButton alloc]init];
    [btn setTitle:@"我已阅读并同意" forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"agree"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn setImage:[UIImage imageNamed:@"disagree"] forState:UIControlStateSelected];
    [self addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.left.mas_equalTo(self.mas_left);
        make.width.mas_equalTo(120);
    }];
    
    
    UIButton *argren  = [[UIButton alloc]init];
    [argren setTitle:@"《用户注册服务协议》" forState:UIControlStateNormal];
    argren.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [argren addTarget:self action:@selector(argrenClick:) forControlEvents:UIControlEventTouchUpInside];
    [argren setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    argren.titleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:argren];
    
    
    [argren mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.left.mas_equalTo(btn.mas_right);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.5);
    }];
    
}


- (void)argrenClick:(UIButton *)sender
{
    kLog(@"argrenClick");
    
    NSString *str = [NSString stringWithFormat:@"https://www.jianshu.com/p/366adbba23b7"];
    NSURL *url = [NSURL URLWithString:str];
    if ([[UIApplication sharedApplication]canOpenURL:url])
    {
        
        if (@available(iOS 10.0, *))
        {
            [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:^(BOOL success) {}];
            kLog(@"10")
            
        } else {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
            [[UIApplication sharedApplication]openURL:url];
            #pragma clang diagnostic pop
        }
    }
    
}

- (UIButton *)selectBtn
{
    if (_selectBtn == nil)
    {
        _selectBtn = [[UIButton alloc]init];
        [_selectBtn addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return  _selectBtn;
}

- (void)selectButtonClick:(UIButton *)sender
{
    sender.selected = !self.selectBtn.isSelected;
    self.selectBtn = sender;
    if (self.agreenBlick != nil)
    {
        self.agreenBlick();
    }
}




@end
