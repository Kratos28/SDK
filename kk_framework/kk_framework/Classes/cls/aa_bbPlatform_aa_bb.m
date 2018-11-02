//
//  aa_bbPlatform_aa_bb.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/22.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "aa_bbPlatform_aa_bb.h"
#import "aa_bb_account_bb_aa.h"
#import "fffffff_MainViewController.h"
@interface aa_bbPlatform_aa_bb ()


@property (nonatomic,strong) UIWindow *window;
@end

@implementation aa_bbPlatform_aa_bb
singleton_m(aa_bbPlatform_aa_bb)




- (void)aa_bbShowAccountViewController:(UIViewController *)viewController delegate:(id<aa_bbPlatform_aa_bb_delegate>)delegate options:(Kratos_Options *)option
{
    self.weak_viewController = viewController;
    self.delegate = delegate;
    fffffff_MainViewController * main = [[fffffff_MainViewController alloc] init];
    [self.weak_viewController addChildViewController:main];
    [self.weak_viewController.view addSubview:main.view];
}


- (void)kratos_logoutFromGame
{
    
}


@end
