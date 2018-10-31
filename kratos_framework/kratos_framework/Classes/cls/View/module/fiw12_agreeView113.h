//
//  fiw12_agreeView113_.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/24.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fiw12_agreeView113 : UIView


typedef void (^agreenBlockClick)(void);
typedef void (^protocolkClick)(void);


@property (nonatomic,copy) agreenBlockClick agreenBlick;
@property (nonatomic,copy) protocolkClick protocolnBlick;

///agreenBlockClick 点击了协议block
///protocaolClick 点击了我已阅读并同意Block
+ (instancetype)fiw12_agreeView113agreenBlick:(agreenBlockClick)block protocaolClick:(protocolkClick)protocolnBlick;

@end
