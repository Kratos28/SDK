//
//  Kratos_RegisterVC.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/29.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_RegisterVC.h"
#import "Kratos_RegisiterView.h"
#import "k_const.h"
#import "Kratos_MainViewControllerPresenter.h"
#import "IQKeyboardManager.h"

@interface Kratos_RegisterVC ()
@property (nonatomic,strong) Kratos_RegisiterView *regisiterView;
@end

@implementation Kratos_RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
      self.view.backgroundColor = [UIColor whiteColor];
    self.presenter.view = self;
    
    [self.coverView addSubview:self.regisiterView];
    [self accountViewLayout];

}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.presenter = nil;
}

- (Kratos_RegisiterView *)regisiterView
{
    if (_regisiterView == nil) {
        _regisiterView = [[Kratos_RegisiterView alloc]init];
        _regisiterView.backgroundColor = [UIColor whiteColor];
        _regisiterView.presenter = self.presenter;
    }
    return _regisiterView;
}
- (void)doRotateAction:(NSNotification *)notification {
    [self accountViewLayout];
}

- (void)accountViewLayout
{
    layoutView(self.regisiterView)

}






@end
