//
//  ViewController.h
//  WHAT DO I CALL EET
//
//  Created by iD Student on 7/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int x;
}
@property (weak, nonatomic) IBOutlet UILabel *score;
- (IBAction)clicker:(id)sender;
- (IBAction)onoff:(id)sender;
- (IBAction)step:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *level;

@end
