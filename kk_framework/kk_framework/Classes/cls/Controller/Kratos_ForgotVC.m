//
//  Kratos_ForgotVC.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/29.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_ForgotVC.h"
#import "Kratos_RegisiterView.h"
#import "k_const.h"
#import "IQKeyboardManager.h"

@interface Kratos_ForgotVC ()
@property (nonatomic,strong) Kratos_RegisiterView *forgotView;

@end

@implementation Kratos_ForgotVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.presenter.view = self;
    
    [self.coverView addSubview:self.forgotView];
    [self accountViewLayout];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.presenter = nil;
}
- (Kratos_RegisiterView *)forgotView
{
    if (_forgotView == nil) {
        _forgotView = [[Kratos_RegisiterView alloc]init];
        _forgotView.backgroundColor = [UIColor whiteColor];
        _forgotView.presenter = self.presenter;
    }
    return _forgotView;
}
- (void)doRotateAction:(NSNotification *)notification {
    [self accountViewLayout];
}

- (void)accountViewLayout
{
    layoutView(self.forgotView)    
}


@end
