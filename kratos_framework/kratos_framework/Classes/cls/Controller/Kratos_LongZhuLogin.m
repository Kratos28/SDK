//
//  Kratos_LongZhuLogin.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/25.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_LongZhuLogin.h"
#import "k_const.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "Kratos_longzhuloginView.h"
#import "Kratos_MainViewControllerPresenter.h"
#import "Masonry.h"

@interface Kratos_LongZhuLogin ()
@end

@implementation Kratos_LongZhuLogin

- (Kratos_longzhuloginView *)accountView
{
    if (_accountView == nil)
    {
        _accountView = [[Kratos_longzhuloginView alloc] init];
        _accountView.backgroundColor = [UIColor whiteColor];
        _accountView.presenter = self.presenter;
        [self.view addSubview:_accountView];
    }
    return  _accountView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter.view = self;

    self.view.backgroundColor = [UIColor whiteColor];
    [self.coverView addSubview:self.accountView];


    
    [self accountViewLayout];
  
    
  
}

- (void)accountViewLayout
{
        layoutView(self.accountView)
    
   
}



- (void)doRotateAction:(NSNotification *)notification {
    [self accountViewLayout];
}






@end
