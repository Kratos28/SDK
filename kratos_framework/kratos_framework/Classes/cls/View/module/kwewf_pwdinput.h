//
//  kwewf_pwdinput.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/29.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//
#import "kwewf_input.h"
///密码改变通知
typedef void(^pwdNumChangeBlock)(NSString *);
@interface kwewf_pwdinput : kwewf_input
@property (nonatomic,copy) pwdNumChangeBlock pwdNumChangeBlock;
- (instancetype)initWithpwdNumChangeBlock:(pwdNumChangeBlock)pwdNumChangeBlock;

@end
