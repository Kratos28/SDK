//
//  aa_bbPlatform_aa_bb.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/22.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "single.h"
#import <UIKit/UIKit.h>

@class Kratos_Options;

@protocol aa_bbPlatform_aa_bb_delegate;
@protocol  aa_bbPlatform_aa_bb_delegate<NSObject>
- (void)kratos_getUserInfo:(NSDictionary *)userinfo;
- (void)kratos_logoutFromSDK;
- (void)kratos_SDKInitSuccessed:(NSString *)info;
@end



@interface aa_bbPlatform_aa_bb : NSObject
singleton_h(aa_bbPlatform_aa_bb)

@property (nonatomic,weak) UIViewController *weak_viewController;
@property (nonatomic,weak) id<aa_bbPlatform_aa_bb_delegate> delegate;

- (void)kratos_logoutFromGame;
//show 登录视图
- (void)aa_bbShowAccountViewController:(UIViewController *)viewController delegate:(id <aa_bbPlatform_aa_bb_delegate>)delegate options:(Kratos_Options*)option;

@end
