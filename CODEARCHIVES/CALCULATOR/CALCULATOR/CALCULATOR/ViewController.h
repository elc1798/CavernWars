//
//  ViewController.h
//  CALCULATOR
//
//  Created by iD Student on 7/7/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    int firstnum;
    int operation;
    int currNumber;
    NSString *currDisplay;
}

@property (weak, nonatomic) IBOutlet UILabel *display;
- (IBAction)onekey:(id)sender;
- (IBAction)twokey:(id)sender;
- (IBAction)threekey:(id)sender;
- (IBAction)fourkey:(id)sender;
- (IBAction)fivekey:(id)sender;
- (IBAction)sixkey:(id)sender;
- (IBAction)sevenkey:(id)sender;
- (IBAction)eightkey:(id)sender;
- (IBAction)ninekey:(id)sender;
- (IBAction)zerokey:(id)sender;
- (IBAction)clearkey:(id)sender;
- (IBAction)pluskey:(id)sender;
- (IBAction)subtractkey:(id)sender;
- (IBAction)multiplykey:(id)sender;
- (IBAction)dividekey:(id)sender;
- (IBAction)equalkey:(id)sender;




@end
