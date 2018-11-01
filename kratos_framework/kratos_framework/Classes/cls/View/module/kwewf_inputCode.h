//
//  kwewf_inputCode.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/24.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "kwewf_input.h"
#import "JKCountDownButton.h"

///phone 文字改变了
typedef void(^codeChangeBlock)(NSString *phone);
/// isStart 是否开始了
typedef void (^countDownStartingWithCountDownEndBlock)(BOOL isStart, BOOL isEnd,NSUInteger second);

@interface kwewf_inputCode : kwewf_input
@property (nonatomic,strong) JKCountDownButton *countDownCode;
@property (nonatomic,copy) codeChangeBlock codeNumChangeBlock;
@property (nonatomic,copy) countDownStartingWithCountDownEndBlock countDownBlock;

- (instancetype)initWithcodeNumChangeBlock:(codeChangeBlock)codeNumChangeBlock countDownBlock:(countDownStartingWithCountDownEndBlock )countDownBlock;


@end
