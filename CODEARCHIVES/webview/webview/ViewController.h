//
//  ViewController.h
//  webview
//
//  Created by iD Student on 7/9/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

{
    NSURL *currentPage;
    NSUserDefaults *userDefaults;
    NSURL *home;
}

@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)goButton:(id)sender;
- (IBAction)backbutton:(id)sender;
- (IBAction)forwardbutton:(id)sender;
- (IBAction)refreshbutton:(id)sender;
- (IBAction)homebutton:(id)sender;
- (IBAction)sethome:(id)sender;

@end
