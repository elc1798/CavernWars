//
//  ViewController.m
//  webview
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
    [self.webView setDelegate:self];
    userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults URLForKey:@"homepage"])
    {
        NSURL *url;
        NSString *urlString = @"http://www.google.com";
        url = [NSURL URLWithString:urlString];
        [userDefaults setURL:url forKey:@"homepage"];
    }
    home = [userDefaults URLForKey:@"homepage"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:home];
    [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.addressTextField setText:webView.request.URL.absoluteString];
    currentPage = [NSURL URLWithString:webView.request.URL.absoluteString];
}

- (IBAction)goButton:(id)sender {
    NSString *urlString = self.addressTextField.text;
    NSURL *url;
    
    if([urlString hasPrefix:@"http://"] || [urlString hasPrefix:@"http:/"] || [urlString hasPrefix:@"http:"]) {
        url = [NSURL URLWithString:urlString];
    }else {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", self.addressTextField.text]];
    }
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (IBAction)backbutton:(id)sender {
    [self.webView goBack];
}

- (IBAction)forwardbutton:(id)sender {
    [self.webView goForward];
}

- (IBAction)refreshbutton:(id)sender {
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:currentPage];
    [self.webView loadRequest:urlRequest];
}

- (IBAction)homebutton:(id)sender {
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:home];
    [self.webView loadRequest:urlRequest];
}

- (IBAction)sethome:(id)sender {
    [userDefaults setURL:currentPage forKey:@"homepage"];
    home = [userDefaults URLForKey:@"homepage"];
}
@end
