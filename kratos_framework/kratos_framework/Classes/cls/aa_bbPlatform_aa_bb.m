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





-(void)setupWindow{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [fffffff_MainViewController new];
    window.rootViewController.view.userInteractionEnabled = true;
    window.windowLevel = UIWindowLevelStatusBar + 1;
    window.hidden = NO;
    window.alpha = 1;
    _window = window;
}

- (void)aa_bbShowAccountViewController:(UIViewController *)viewController delegate:(id <aa_bbPlatform_aa_bb_delegate>)delegate{
    self.weak_viewController = viewController;
    self.delegate = delegate;
//    [self setupWindow];
    fffffff_MainViewController * main = [[fffffff_MainViewController alloc] init];
    [self.weak_viewController addChildViewController:main];
    [self.weak_viewController.view addSubview:main.view];

    
}







@end
