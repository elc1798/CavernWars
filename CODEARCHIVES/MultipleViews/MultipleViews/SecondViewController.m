//
//  SecondViewController.m
//  MultipleViews
//
//  Created by iD Student on 7/9/14.
//  Copyright (c) 2014 iD Student. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)topage3:(id)sender {
    ThirdViewController *VC3 = [self.storyboard
                                instantiateViewControllerWithIdentifier:@"thirdViewController"];
    [self.navigationController pushViewController:VC3 animated:YES];
}

//- (IBAction)topage3:(id)sender {
//    ThirdViewController *thirdVC = [self.storyboard instantiateViewControllerWithIdentifier:@"thirdViewController"];
//
//    [self presentViewController:thirdVC animated:YES completion:nil];
//
//}

@end
