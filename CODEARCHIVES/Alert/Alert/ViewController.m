//
//  ViewController.m
//  Alert
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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome!"
                                                    message:@"Enjoy the app!" delegate:self cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Done", nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doombutton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome!"
                                                    message:@"Enjoy the app!" delegate:self cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Done", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Done"]) {
        NSLog(@"woop woop");
    }
}

@end
