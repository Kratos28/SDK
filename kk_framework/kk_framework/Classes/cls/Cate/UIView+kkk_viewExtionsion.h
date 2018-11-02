//
//  UIView+kkk_viewExtionsion.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/24.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};

@interface UIView (kkk_viewExtionsion)


// 判断View是否显示在屏幕上
- (BOOL)isDisplayedInScreen;


/**
 设置圆角
 
 
 */
- (void)setCorner:(CGFloat)corner;
//设置边框
- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;
- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType corner:(CGFloat)corner;

/**
 lineLength:     虚线的宽度
 lineSpacing:    虚线的间距
 lineColor:      虚线的颜色
 */
- (void)drawDashLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

@end
