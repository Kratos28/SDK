//
//  UIImage+kkkk_LoadBundleImage.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/24.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "UIImage+kkkk_LoadBundleImage.h"

@implementation UIImage (kkkk_LoadBundleImage)
+  (instancetype)setBundleImageName:(NSString *)imageName
{
    NSString *kBundle_name = @"kratos_framework.bundle";
    NSString *subpatch = [NSString stringWithFormat:@"/Frameworks/kratos_framework.framework/%@",kBundle_name];
    NSString * bundle_Path = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:subpatch];
    NSBundle *boudd = [NSBundle bundleWithPath:bundle_Path];
    UIImage *image = [UIImage imageNamed:imageName inBundle:boudd compatibleWithTraitCollection:nil];
    return image;
}



@end
