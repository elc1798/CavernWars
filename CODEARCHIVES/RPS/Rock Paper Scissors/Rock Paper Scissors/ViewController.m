//
//  ViewController.m
//  Rock Paper Scissors
//
//  Created by iD Student on 7/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "tgmath.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger losses = [userDefaults integerForKey:@"player losses"];
    if (losses) {
        playerLosses = (int)losses;
        [self.lossLABEL setText:[NSString stringWithFormat:@"%d", playerLosses]];
    }
    NSInteger wins = [userDefaults integerForKey:@"player wins"];
    if (wins) {
        playerWins = (int)wins;
        [self.winLABEL setText:[NSString stringWithFormat:@"%d", playerWins]];
    }
    NSInteger ties = [userDefaults integerForKey:@"player ties"];
    
    if (ties) {
        playerTies = (int)ties;
        [self.tieLABEL setText:[NSString stringWithFormat:@"%d", playerTies]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rockButtonPressed:(id)sender {
    [self.playerUI setImage:[UIImage imageNamed:@"Rock"]];
    playerChoice = rock;
    [self makeComputerChoice];
    [self outcome];
}

- (IBAction)scissorButtonPressed:(id)sender {
    [self.playerUI setImage:[UIImage imageNamed:@"Scissor"]];
    playerChoice = scissor;
    [self makeComputerChoice];
    [self outcome];
}

- (IBAction)paperButtonPressed:(id)sender {
    [self.playerUI setImage:[UIImage imageNamed:@"Paper"]];
    playerChoice = paper;
    [self makeComputerChoice];
    [self outcome];
}

- (void)outcome {
    if (playerChoice % 3 > computerChoice % 3)
    {
        playerWins++;
        self.winLABEL.text = [NSString stringWithFormat:@"%d" , playerWins];
        self.RESULT.text = @"WIN";
        [userDefaults setInteger:playerWins forKey:@"player wins"];
    }
    else if (playerChoice % 3 < computerChoice % 3)
    {
        playerLosses++;
        self.lossLABEL.text = [NSString stringWithFormat:@"%d" , playerLosses];
        self.RESULT.text = @"LOSS";
        [userDefaults setInteger:playerLosses forKey:@"player losses"];
    }
    else if (playerChoice % 3 == computerChoice % 3)
    {
        playerTies++;
        self.tieLABEL.text = [NSString stringWithFormat:@"%d" , playerTies];
        self.RESULT.text = @"TIE";
        [userDefaults setInteger:playerTies forKey:@"player ties"];
    }
    [userDefaults synchronize];
    if ((playerTies + playerWins + playerLosses) % 50 == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"RPS Lite"
                                                        message:@"You have over 50 games. Reset scores?"
                                                       delegate:self
                                              cancelButtonTitle:@"No"
                                              otherButtonTitles:@"Yes", nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Yes"]) {
        playerWins = 0;
        playerLosses = 0;
        playerTies = 0;
        self.winLABEL.text = [NSString stringWithFormat:@"%d" , playerWins];
        self.RESULT.text = @"WIN";
        self.lossLABEL.text = [NSString stringWithFormat:@"%d" , playerLosses];
        self.RESULT.text = @"LOSS";
        self.tieLABEL.text = [NSString stringWithFormat:@"%d" , playerTies];
        self.RESULT.text = @"TIE";
        [userDefaults setInteger:playerWins forKey:@"player wins"];
        [userDefaults setInteger:playerLosses forKey:@"player losses"];
        [userDefaults setInteger:playerTies forKey:@"player ties"];
    }
}

- (void)makeComputerChoice {
    int randomNumber = (int)1 + arc4random() % (3);
    
    switch (randomNumber) {
        case 1:
            [self.compUI setImage:[UIImage imageNamed:@"Rock"]];
            computerChoice = rock;
            break;
        case 2:
            [self.compUI setImage:[UIImage imageNamed:@"Paper"]];
            computerChoice = paper;
            break;
        case 3:
            [self.compUI setImage:[UIImage imageNamed:@"Scissor"]];
            computerChoice = scissor;
            break;
    }
}

@end
