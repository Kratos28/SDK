//
//  CALayer+UIcolorToCGcolor.m
//  huiYouCai
//
//  Created by jk on 17/4/10.
//  Copyright © 2017年 YGD. All rights reserved.
//

#import "CALayer+UIcolorToCGcolor.h"

@implementation CALayer (UIcolorToCGcolor)
- (void)setBorderColorFromUIColor:(UIColor *)color
 {
        self.borderColor = color.CGColor;
 }

@end
