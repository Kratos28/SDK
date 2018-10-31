//
//  kwewf_phoneinput.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/24.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "kwewf_input.h"
#import <KratosDropDown/KratosDropDown-Swift.h>
typedef void(^phoneNumChangeBlock)(NSString *);
@interface kwewf_phoneinput : kwewf_input
@property (nonatomic,copy) phoneNumChangeBlock phoneNumChangeBlock;
@property (nonatomic,strong) UIButton *pullDownMenu;
@property (nonatomic,copy) NSString *caller;

- (instancetype)initWithphoneNumChangeBlock:(phoneNumChangeBlock)phoneNumChangeBlock;

@end
