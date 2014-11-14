//
//  ViewController.m
//  MapKit
//
//  Created by iD Student on 7/9/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.[super viewDidLoad];
    CLLocationCoordinate2D pinCoordinate = {33.8090, -117.9190};
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    
    [point setTitle:@"Disneyland"];
    [point setCoordinate:pinCoordinate];
    
    [self.mapview addAnnotation:point];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearall:(id)sender {
    for (id annotation in self.mapview.annotations) {
        [self.mapview removeAnnotation:annotation];
    }
}
@end
