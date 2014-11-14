//
//  ViewController.m
//  arrays
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
    
    staticArray = [[NSArray alloc] initWithObjects:@"Text1", @"Text2", @"Text3", nil];
    
    dynamicArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < 3; i++)
    {
        [dynamicArray addObject:[NSString stringWithFormat:@"Text%d",(i+1)]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender {
    [dynamicArray addObject:@"element"];
}

- (IBAction)subtract:(id)sender {
    [dynamicArray removeObjectAtIndex:0];
}

- (IBAction)Remove:(id)sender {
    [dynamicArray removeObject:@"element"];
}
@end
