//
//  ScaffoldingViewController.m
//  Prodektive
//
//  Created by GMSIndia 2 on 18/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "ScaffoldingViewController.h"

@interface ScaffoldingViewController ()

@end

@implementation ScaffoldingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closescaffoldpage:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)next:(id)sender {
    _allctrl.delegate=self;
    self.allctrl=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
    [UIView transitionFromView:self.view
                        toView:self.allctrl.view
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:nil];
    _allctrl.modalPresentationStyle=UIModalPresentationFullScreen;
    [self.navigationController pushViewController:_allctrl animated:NO];

}
@end
