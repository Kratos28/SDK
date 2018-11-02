//
//  Kratos_MainViewControllerPresenter.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/25.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_MainViewControllerPresenter.h"
#import "Kratos_LongZhuLogin.h"
#import "k_const.h"
#import "fffffff_MainViewController.h"
#import "Kratos_RegisterVC.h"
#import "Kratos_ForgotVC.h"
#import "Kratos_QuickLoginVC.h"

@implementation Kratos_MainViewControllerPresenter

- (void)presentVC
{
    UIViewController *vc =  (UIViewController *)_view;
    [vc presentViewController:[[Kratos_LongZhuLogin alloc]init] animated:false completion:nil];
    
}


- (void)dissmissVC{
    UIViewController *vc =  (UIViewController *)_view;
    [vc dismissViewControllerAnimated:false completion:nil];
}

- (void)loginClick:(UIButton *)btn{
    
    if ([_view isKindOfClass:[fffffff_MainViewController class]]) {
        [self saveAccount];
    }else if ([_view isKindOfClass:[Kratos_LongZhuLogin class]])
    {
        [self saveAccount];
    }

}

- (void)saveAccount
{
    fffffff_MainViewController *mian = (fffffff_MainViewController*)_view;
    kLog(@"%@",mian.accountView.wefweInputView.phoneInput.textField.text);
    NSString *str = mian.accountView.wefweInputView.phoneInput.textField.text;
    if (str != nil && str.length > 0)
    {
        NSString *key = [NSString stringWithFormat:@"%@", [mian.accountView.wefweInputView.phoneInput caller]];
        NSString*cachePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject] stringByAppendingString:key];
        
        if (![[NSFileManager defaultManager]fileExistsAtPath:cachePath])
        {
            NSMutableArray *att = [NSMutableArray array];
            [att addObject:str];
            [att writeToFile:cachePath atomically:YES];
            
        }else
        {
            NSMutableArray *mArray = [NSMutableArray arrayWithContentsOfFile:cachePath];
            [mArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (![obj isEqualToString:str])
                {
                    [mArray addObject:str];
                }
            }];
            if (mArray.count==0) {
                [mArray addObject:str];
            }
            [mArray writeToFile:cachePath atomically:YES];
        }
    }
}

- (void)forgetPwdClick:(UIButton *)btn
{
    kLog(@"forgetPwdClick");
    
    Kratos_ForgotVC *forgotVC =   [[Kratos_ForgotVC alloc]init];
    if ([_view isKindOfClass:[Kratos_LongZhuLogin class]])
    {
        [_view presentViewController:forgotVC animated:false completion:nil];
    }
}

- (void)regiterButtonClick:(UIButton *)btn
{
    kLog(@"regiterButtonClick");
    
    Kratos_RegisterVC *registerVC =   [[Kratos_RegisterVC alloc]init];
    if ([_view isKindOfClass:[Kratos_LongZhuLogin class]])
    {
        [_view presentViewController:registerVC animated:false completion:nil];
    }
    
    
}

- (void)quickButtonClick:(UIButton *)btn
{
    kLog(@"quickButtonClick");
    Kratos_QuickLoginVC *quick = [[Kratos_QuickLoginVC alloc]init];
    [_view presentViewController:quick animated:false completion:nil];
}
@end
