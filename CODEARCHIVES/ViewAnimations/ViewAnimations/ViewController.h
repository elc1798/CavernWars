//
//  ViewController.h
//  ViewAnimations
//
//  Created by iD Student on 7/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)changeLabel:(id)sender;
- (IBAction)rotateLabel:(id)sender;
@property (assign, nonatomic) BOOL didRotate;




@end
