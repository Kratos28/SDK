//
//  ffffff_baseViewController.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/23.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "ffffff_baseViewController.h"
#import "k_const.h"
#import "IQKeyboardManager.h"

@interface ffffff_baseViewController ()

@end


@implementation ffffff_baseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.coverView];
    
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(0);
    }];
    
    [[IQKeyboardManager sharedManager]setEnable:true];
    
    
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doRotateAction:) name:UIDeviceOrientationDidChangeNotification object:nil];

}
- (Kratos_MainViewControllerPresenter *)presenter
{
    if (_presenter == nil) {
        _presenter = [[Kratos_MainViewControllerPresenter alloc]init];
    }
    return _presenter;
}
- (void)doRotateAction:(NSNotification *)notification
{
    
}

- (UIView *)coverView
{
    if (_coverView == nil) {
        _coverView = [[UIView alloc]init];
        _coverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.3f];
    }
    return _coverView;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


@end
