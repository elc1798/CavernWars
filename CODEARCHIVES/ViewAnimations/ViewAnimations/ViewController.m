//
//  ViewController.m
//  ViewAnimations
//
//  Created by iD Student on 7/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)changeLabel:(id)sender {
    [UIView beginAnimations:@"changeAlpha" context:nil];
    [UIView setAnimationDuration:0.5];
    if (self.label.alpha == 1) {
        [self.label setAlpha:0];
    }else {
        [self.label setAlpha:1];
    }
    [UIView commitAnimations];
}

- (IBAction)rotateLabel:(id)sender {
    [UIView beginAnimations:@"rotate" context:nil];
    [UIView setAnimationDuration:0.5];
    
    if (!self.didRotate) {
        self.label.transform = CGAffineTransformMakeRotation(M_PI);
        self.didRotate=true;
    }else {
        self.label.transform = CGAffineTransformMakeRotation(0);
        self.didRotate = false;
    }
    [UIView commitAnimations];
}
@end
