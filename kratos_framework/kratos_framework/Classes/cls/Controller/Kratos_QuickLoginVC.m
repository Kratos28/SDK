//
//  Kratos_QuickLoginVC.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/30.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_QuickLoginVC.h"
#import "Kratos_QuickView.h"
#import "Kratos_MainViewControllerPresenter.h"
#import "k_const.h"

@interface Kratos_QuickLoginVC ()
@property (nonatomic,strong) Kratos_QuickView *quickView;

@end

@implementation Kratos_QuickLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter.view = self;

    self.view.backgroundColor = [UIColor whiteColor];
    [self.coverView addSubview:self.quickView];
    [self accountViewLayout];

}


- (Kratos_QuickView *)quickView
{
    if (_quickView == nil) {
        _quickView = [[Kratos_QuickView alloc]init];
        _quickView.backgroundColor = [UIColor whiteColor];
        _quickView.presenter = self.presenter;
    }
    return _quickView;
}
- (void)doRotateAction:(NSNotification *)notification {
    [self accountViewLayout];
}

- (void)accountViewLayout
{
    layoutView(self.quickView)
}

@end
