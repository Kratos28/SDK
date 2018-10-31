//
//  k_const.h
//  kratos_framework
//
//  Created by 7yao.top on 2018/10/23.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//


#ifndef k_const_h
#define k_const_h
#import "UIImage+kkkk_LoadBundleImage.h"
#import "fwfweew_Tool.h"
#import "Masonry.h"
#import "UIView+Toast.h"
#define  inputH  40

#define UIDeviceOrientationIsPortrait(orientation)  ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown)
#define UIDeviceOrientationIsLandscape(orientation) ((orientation) == UIDeviceOrientationLandscapeLeft || (orientation) == UIDeviceOrientationLandscapeRight)


#define kaccountViewW 320


#define  Portraitlayout   __strong __typeof(weakSelf)strongSelf = weakSelf; \
make.width.mas_equalTo(kaccountViewW); \
make.height.equalTo(self.view.mas_width).multipliedBy(0.8); \
make.center.mas_equalTo(strongSelf.view);

#define Landscapelayout  __strong __typeof(weakSelf)strongSelf = weakSelf; \
make.width.mas_equalTo(kaccountViewW); \
make.height.equalTo(self.view.mas_height).multipliedBy(0.8); \
make.center.equalTo(strongSelf.view);


#define layoutView(view)      if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait) { \
__weak typeof(self)  weakSelf = self; \
[(view) mas_remakeConstraints :^(MASConstraintMaker *make) { \
    Landscapelayout \
}];\
} else if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice]  orientation] == UIDeviceOrientationLandscapeRight) { \
    __weak typeof(self)  weakSelf = self; \
    [(view) mas_remakeConstraints:^(MASConstraintMaker *make) { \
        Landscapelayout \
    }]; \
}else if ([[UIDevice currentDevice]orientation] == UIDeviceOrientationPortraitUpsideDown ) { \
    __weak typeof(self)  weakSelf = self; \
    [(view) mas_remakeConstraints :^(MASConstraintMaker *make) { \
        Landscapelayout \
    }]; \
}else if ([[UIDevice currentDevice]orientation] == UIDeviceOrientationFaceUp) \
{ \
    __weak typeof(self)  weakSelf = self; \
    [(view) mas_remakeConstraints :^(MASConstraintMaker *make) { \
        Landscapelayout \
    }]; \
}



#ifdef DEBUG
#define kLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define kLog(...)
#endif








#endif /* k_const_h */
