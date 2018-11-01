//
//  fffffff_MainViewController.m
//  kratos_framework_Example
//
//  Created by 7yao.top on 2018/10/23.
//  Copyright © 2018年 kratos_framework. All rights reserved.
//

#import "fffffff_MainViewController.h"
#import "aa_bb_account_bb_aa.h"
#import "Masonry.h"
#import "k_const.h"



@interface fffffff_MainViewController ()
@property (nonatomic,strong) UIView *coverView;
@property (nonatomic,strong) aa_bb_account_bb_aa *accountView;

@end

@implementation fffffff_MainViewController

- (aa_bb_account_bb_aa *)accountView
{
    if (_accountView == nil)
    {
        _accountView = [[aa_bb_account_bb_aa alloc] init];
        _accountView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_accountView];
    }
    return  _accountView;
}



- (UIView *)coverView
{
    if (_coverView == nil) {
        _coverView = [[UIView alloc]init];
        _coverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.3f];
        [_coverView addSubview:self.accountView];
    }
    return _coverView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.coverView];
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(0);
    }];
    
    
    [self accountViewLayout];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doRotateAction:) name:UIDeviceOrientationDidChangeNotification object:nil];
    

}

- (void)doRotateAction:(NSNotification *)notification {
    [self accountViewLayout];
}


- (void)accountViewLayout
{
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait) {
        __weak typeof(self)  weakSelf = self;
        [self.accountView mas_remakeConstraints:^(MASConstraintMaker *make) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            make.width.mas_equalTo(320);
            make.height.mas_equalTo(320);
            make.center.mas_equalTo(strongSelf.view);
        }];
        
    } else if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
        
        __weak typeof(self)  weakSelf = self;
        [self.accountView mas_remakeConstraints:^(MASConstraintMaker *make) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            make.width.mas_equalTo(320);
            make.height.mas_equalTo(320);
            make.center.equalTo(strongSelf.view);
        }];
    }

}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
