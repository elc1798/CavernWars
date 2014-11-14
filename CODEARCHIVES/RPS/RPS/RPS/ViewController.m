//
//  ViewController.m
//  RPS
//
//  Created by iD Student on 7/7/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIImageView *newImageView = [[UIImageView alloc]
                                 initWithImage:[UIImage imageNamed:@"myImage"]];
    
    [self.view addSubview:newImageView];
    
    [newImageView setFrame:CGRectMake(100,100,150,120)];
    
    [self.view addSubview:newImageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
