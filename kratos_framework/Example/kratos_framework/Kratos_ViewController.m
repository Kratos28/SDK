//
//  Kratos_ViewController.m
//  kratos_framework
//
//  Created by kratos_framework on 10/22/2018.
//  Copyright (c) 2018 kratos_framework. All rights reserved.
//

#import "Kratos_ViewController.h"
#import "aa_bbPlatform_aa_bb.h"

@interface Kratos_ViewController () <aa_bbPlatform_aa_bb_delegate>

@end

@implementation Kratos_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[aa_bbPlatform_aa_bb sharedaa_bbPlatform_aa_bb] aa_bbShowAccountViewController:self delegate:self];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
