//
//  YYViewController.m
//  YYLib
//
//  Created by simonchen311 on 08/15/2021.
//  Copyright (c) 2021 simonchen311. All rights reserved.
//

#import "YYViewController.h"
#import "ImperialConcubine.pbobjc.h"

@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    imperial_concubine *c = [[imperial_concubine alloc] init];
    NSLog(@"has Age: %@", @(c.hasAge));
}

@end
