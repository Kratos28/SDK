//
//  TYProgressHUD.m
//  TYSDK
//
//  Created by iOS on 2017/1/17.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "TYProgressHUD.h"
static UIView *bgView = NULL;
static MBProgressHUD *hud = NULL;
@implementation TYProgressHUD

+(void)showMessage:(NSString *)msg
{
    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height)];
    bgView.backgroundColor = [UIColor clearColor];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:bgView];
    
    hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.labelText = msg;
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    //hud.dimBackground = YES;
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5/*延迟执行时间*/ * NSEC_PER_SEC)); dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [hud hide:YES];
        [bgView removeFromSuperview];
    });
}

+(void)hide
{
    //[hud setRemoveFromSuperViewOnHide:YES];
    [hud hide:YES];
    [bgView removeFromSuperview];
}

@end
