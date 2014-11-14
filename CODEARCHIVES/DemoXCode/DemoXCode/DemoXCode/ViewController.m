//
//  ViewController.m
//  DemoXCode
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
	// Do any additional setup after loading the view, typically from a nib.
    
    self.string = @"Hello world";
    self.theScore = 5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addToScore
{
    _score++;
}

- (int) getScore
{
    return _score;
}

- (NSString*) getPlayerName
{
    return _playerName;
}

- (void) gameOver
{
    if (_score > 10)
    {
//        gameLabel.text = @"You Win!"
        self.string = @"You win!";
    }
}

NSString *stringOne = @"1";
int thisInt = [stringOne intValue];

NSString *stringTwo = @"2.0";
double thisDouble = [stringTwo doubleValue];
float thisFloat = [stringTwo floatValue];

@end
