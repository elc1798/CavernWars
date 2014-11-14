//
//  ViewController.h
//  MapKit
//
//  Created by iD Student on 7/9/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
- (IBAction)clearall:(id)sender;

@end
