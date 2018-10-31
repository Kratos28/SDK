//
//  Kratos_Presenter.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/25.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Kratos_Presenter<E> : NSObject
{
    __weak E _view;
}

@property (weak,nonatomic) E view;


/**
 初始化函数
 
 @param view 要绑定的视图
 */
- (instancetype) initWithView:(E)view;

/**
 * 绑定视图
 * @param view 要绑定的视图
 */
- (void) attachView:(E)view ;

/**
 解绑视图
 */
- (void)detachView;

@end
