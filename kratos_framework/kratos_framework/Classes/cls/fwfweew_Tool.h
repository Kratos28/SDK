//
//  fwfweew_Tool.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/24.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface fwfweew_Tool : NSObject
///单纯改变一句话中的某些字的颜色
/// color 需要改变成的颜色
/// totalStr 总的字符串
/// subArray 需要改变颜色的文字数组
+(NSMutableAttributedString *)fwfweew_changeCorlorWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray;


///单纯改变句子的字间距（需要 ）
///totalString 需要更改的字符串
///space       字间距
+ (NSMutableAttributedString *)fwfweew_changeSpaceWithTotalString:(NSString *)totalString Space:(CGFloat)space;


///改变某些文字的颜色 并单独设置其字体
/// font        设置的字体
/// color       颜色
/// totalString 总的字符串
/// subArray    想要变色的字符数组
+ (NSMutableAttributedString *)fwfweew_changeFontAndColor:(UIFont *)font Color:(UIColor *)color  Space:(CGFloat)space  TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray;




+ (BOOL)valiMobile:(NSString *)mobile;


/**
 *  正则匹配返回符合要求的字符串 数组
 *
 *  @param string   需要匹配的字符串
 *  @param regexStr 正则表达式
 *
 *  @return 符合要求的字符串 数组 (按(),分级,正常0)
**/
+ (NSArray *)matchString:(NSString *)string toRegexString:(NSString *)regexStr;

@end
