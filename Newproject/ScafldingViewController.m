//
//  ScaffoldingViewController.m
//  Prodektive
//
//  Created by GMSIndia 2 on 18/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "ScafldingViewController.h"

@interface ScafldingViewController ()

@end

@implementation ScafldingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
      //self.view.bounds = CGRectMake(0, 0, 768, 768);
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.view.bounds = CGRectMake(0, 0, 540, 620);
    
    //[self.view addSubview:_scroll];
    //self.scroll.bounds = CGRectMake(0, 0, 768, 768);
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
    _allctrl.modalPresentationStyle=UIModalPresentationCustom;
    [self.navigationController pushViewController:_allctrl animated:NO];

}
@end
