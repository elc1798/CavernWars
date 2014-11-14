//
//  ViewController.m
//  Score Counter
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
	playerScore = 0;
    playerScoreText = [NSString stringWithFormat:@"Score: %d" , playerScore];
    NSLog(@"%@" , playerScoreText);
    ALPHAVARS abra = b;
    NSLog(@"%d" , abra);
}

- (IBAction)addbutton:(id)sender
{
    playerScore++;
    playerScoreText = [NSString stringWithFormat:@"Score: %d" , playerScore];
    self.scoreLabel.text = playerScoreText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
