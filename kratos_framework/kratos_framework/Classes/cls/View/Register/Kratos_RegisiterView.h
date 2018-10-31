//
//  Kratos_RegisiterView.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/29.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Kratos_baseView.h"

@class Kratos_MainViewControllerPresenter,Kratos_RegiterInputView;
@interface Kratos_RegisiterView : Kratos_baseView
@property (nonatomic,strong) Kratos_MainViewControllerPresenter *presenter;
@property (nonatomic,strong) Kratos_RegiterInputView *registerInputView;
@end
