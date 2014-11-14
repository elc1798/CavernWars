//
//  ViewController.m
//  WHAT DO I CALL EET
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
    x = 0;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicker:(id)sender {
    UISegmentedControl *segmentButton = (UISegmentedControl*)sender;
    if (segmentButton.selectedSegmentIndex == 0)
    {
        x++;
        self.score.text = [NSString stringWithFormat:@"%d" , x];
    }
    else if(segmentButton.selectedSegmentIndex == 1)
    {
        x = x + 5;
        self.score.text = [NSString stringWithFormat:@"%d" , x];
    }
    else if(segmentButton.selectedSegmentIndex == 2)
    {
        x = x + 10;
        self.score.text = [NSString stringWithFormat:@"%d" , x];
    }
}

- (IBAction)onoff:(id)sender {
    UISwitch *switchButton = (UISwitch *)sender;
    
    if (switchButton.isOn) {
        self.score.text = [NSString stringWithFormat:@"%d" , x];
    }
    else
    {
        [self.score setText:@"Display is Off!"];
    }
}

- (IBAction)step:(id)sender {
    UIStepper *stepper = (UIStepper *)sender;
    
    [self.level setText:[NSString stringWithFormat:@"%d", (int)stepper.value]];
}
@end
