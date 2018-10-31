//
//  aa_bbPlatform_aa_bb.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/22.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "single.h"
@protocol aa_bbPlatform_aa_bb_delegate;
@protocol  aa_bbPlatform_aa_bb_delegate<NSObject>


@end



@interface aa_bbPlatform_aa_bb : NSObject
@property (nonatomic,weak) UIViewController *weak_viewController;
@property (nonatomic,weak) id<aa_bbPlatform_aa_bb_delegate> delegate;
singleton_h(aa_bbPlatform_aa_bb)
//show 登录视图
- (void)aa_bbShowAccountViewController:(UIViewController *)viewController delegate:(id <aa_bbPlatform_aa_bb_delegate>)delegate;

@end
