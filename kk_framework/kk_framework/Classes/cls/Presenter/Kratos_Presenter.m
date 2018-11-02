//
//  Kratos_Presenter.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/25.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "Kratos_Presenter.h"

@implementation Kratos_Presenter
/**
 初始化函数
 */
- (instancetype)initWithView:(id)view{
    
    if (self = [super init]) {
        _view = view;
    }
    return self;
}
/**
 * 绑定视图
 * @param view 要绑定的视图
 */
- (void) attachView:(id)view {
    _view = view;
}


/**
 解绑视图
 */
- (void)detachView{
    _view = nil;
}
@end
