//
//  Kratos_RegiterInputView.h
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/29.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import <UIKit/UIKit.h>
@class kwewf_phoneinput,kwewf_inputCode,kwewf_pwdinput;
@interface Kratos_RegiterInputView : UIView
@property (nonatomic,strong)kwewf_phoneinput *phoneInput;
@property (nonatomic,strong)kwewf_inputCode *codeinput;
@property (nonatomic,strong)kwewf_pwdinput *affirmPWD;


@end
