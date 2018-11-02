//
//  Kratos_MainViewControllerPresenter.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/25.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_HttpPresenter.h"
#import <UIKit/UIKit.h>
#import "Kratos_LoadDataProtocol.h"


@interface Kratos_MainViewControllerPresenter : Kratos_HttpPresenter


- (void)presentVC;
- (void)loginClick:(UIButton *)btn;

- (void)dissmissVC;


- (void)forgetPwdClick:(UIButton *)btn;

- (void)regiterButtonClick:(UIButton *)btn;

- (void)quickButtonClick:(UIButton *)btn;

@end
