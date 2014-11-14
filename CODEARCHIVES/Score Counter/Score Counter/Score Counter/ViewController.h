//
//  ViewController.h
//  Score Counter
//
//  Created by iD Student on 7/7/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    a = 1,
    b = 2,
    c = 3,
    d = 4,
}ALPHAVARS;

@interface ViewController : UIViewController

{
    NSString *playerScoreText;
    int playerScore;
}

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
- (IBAction)addbutton:(id)sender;


@end
