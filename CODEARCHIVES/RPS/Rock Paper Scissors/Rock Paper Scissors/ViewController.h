//
//  ViewController.h
//  Rock Paper Scissors
//
//  Created by iD Student on 7/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    rock = 1,
    paper = 2,
    scissor = 3
}Choice;

@interface ViewController : UIViewController <UIAlertViewDelegate>

{
    int playerWins;
    int playerLosses;
    int playerTies;
    Choice playerChoice;
    Choice computerChoice;
    NSUserDefaults *userDefaults;
}

- (IBAction)rockButtonPressed:(id)sender;
- (IBAction)scissorButtonPressed:(id)sender;
- (IBAction)paperButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *winLABEL;
@property (weak, nonatomic) IBOutlet UILabel *lossLABEL;
@property (weak, nonatomic) IBOutlet UILabel *tieLABEL;
@property (weak, nonatomic) IBOutlet UILabel *RESULT;

@property (weak, nonatomic) IBOutlet UIImageView *playerUI;
@property (weak, nonatomic) IBOutlet UIImageView *compUI;


@end