//
//  fffffff_MainViewController.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/23.
//  Copyright © 2018年 kratos_framework. All rights reserved.
// 手机账号密码控制器

#import "fffffff_MainViewController.h"
#import "k_const.h"
#import "Kratos_MainViewControllerPresenter.h"
#import "DYYFloatWindow.h"


@interface fffffff_MainViewController ()
@property (strong,nonatomic)  DYYFloatWindow *floatWindow;
@end

@implementation fffffff_MainViewController

- (aa_bb_account_bb_aa *)accountView
{
    if (_accountView == nil)
    {
        _accountView = [[aa_bb_account_bb_aa alloc] init];
        _accountView.backgroundColor = [UIColor whiteColor];
        _accountView.presenter = self.presenter;
        [self.view addSubview:_accountView];
    }
    return  _accountView;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.presenter.view = self;
    [self.coverView addSubview:self.accountView];
    [self accountViewLayout];
    
    [self showFloadWindouw];
    
}



- (void)doRotateAction:(NSNotification *)notification {
    [self accountViewLayout];
}
- (void)showFloadWindouw
{
    _floatWindow =  [[DYYFloatWindow alloc]initWithFrame:CGRectMake(0, 0, 50, 50) mainImageName:@"ico_mimakejian.png" imagesAndTitle:@{@"ddd":@"用户中心",@"eee":@"退出登录",@"fff":@"客服中心"} bgcolor:[UIColor lightGrayColor] animationColor:[UIColor purpleColor]];
    
    _floatWindow.clickBolcks = ^(NSInteger i) {
        
    };
    
}

- (void)accountViewLayout
{
   layoutView(self.accountView)
}









@end
