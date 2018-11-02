//
//  ViewController.m
//  TestFramework
//
//  Created by 7yao.top on 2018/11/2.
//  Copyright © 2018年 7yao.top. All rights reserved.
//

#import "ViewController.h"
#import "aa_bbPlatform_aa_bb.h"
#import "kk_framework.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[aa_bbPlatform_aa_bb sharedaa_bbPlatform_aa_bb]aa_bbShowAccountViewController:self delegate:self options:nil];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
