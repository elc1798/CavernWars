//
//  ViewController.m
//  CALCULATOR
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
    firstnum = 0;
    operation = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)updateDisplay
{
    currDisplay = [NSString stringWithFormat:@"%d" , currNumber];
    self.display.text = currDisplay;
}

- (IBAction)onekey:(id)sender {
    currNumber = (currNumber * 10) + 1;
    [self updateDisplay];
}

- (IBAction)twokey:(id)sender {
    currNumber = (currNumber * 10) + 2;
    [self updateDisplay];
}

- (IBAction)threekey:(id)sender {
    currNumber = (currNumber * 10) + 3;
    [self updateDisplay];
}

- (IBAction)fourkey:(id)sender {
    currNumber = (currNumber * 10) + 4;
    [self updateDisplay];
}

- (IBAction)fivekey:(id)sender {
    currNumber = (currNumber * 10) + 5;
    [self updateDisplay];
}

- (IBAction)sixkey:(id)sender {
    currNumber = (currNumber * 10) + 6;
    [self updateDisplay];
}

- (IBAction)sevenkey:(id)sender {
    currNumber = (currNumber * 10) + 7;
    [self updateDisplay];
}

- (IBAction)eightkey:(id)sender {
    currNumber = (currNumber * 10) + 8;
    [self updateDisplay];
}

- (IBAction)ninekey:(id)sender {
    currNumber = (currNumber * 10) + 9;
    [self updateDisplay];
}

- (IBAction)zerokey:(id)sender {
    currNumber = (currNumber * 10);
    [self updateDisplay];
}

- (IBAction)clearkey:(id)sender {
    currNumber = 0;
    firstnum = 0;
    operation = 0;
    [self updateDisplay];
}

- (IBAction)pluskey:(id)sender {
    if (operation == 0)
    {
        firstnum = currNumber;
        currNumber = 0;
        //Do not update the display yet!
        operation = 1;
    }
    else {
        [self compileNum];
    }
}

- (IBAction)subtractkey:(id)sender {
    if (operation == 0)
    {
        firstnum = currNumber;
        currNumber = 0;
        //DO NOT UPDATE THE DISPLAY D:
        operation = 2;
    }
    else {
        [self compileNum];
    }
}

- (IBAction)multiplykey:(id)sender {
    if (operation == 0)
    {
        firstnum = currNumber;
        currNumber = 0;
        operation = 3;
    }
    else {
        [self compileNum];
    }
}

- (IBAction)dividekey:(id)sender {
    if (operation == 0)
    {
        firstnum = currNumber;
        currNumber = 0;
        operation = 4;
    }
    else {
        [self compileNum];
    }
}

- (void)compileNum {
    switch (operation) {
        case 1: ;
            currNumber = currNumber + firstnum;
            break;
        case 2: ;
            currNumber = firstnum - currNumber;
            break;
        case 3: ;
            currNumber = firstnum * currNumber;
            break;
        case 4: ;
            currNumber = firstnum / currNumber;
            break;
        case 0: ;
            //Nothing happens because nothing can be operated on
            break;
    }
    [self updateDisplay];
    operation = 0;
}

- (IBAction)equalkey:(id)sender {
    [self compileNum];
}
@end