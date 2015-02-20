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
   
//    [[self.view layer] setBorderWidth:2];
//    [[self.view layer] setCornerRadius:8];
//     [[self.view layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1].CGColor];
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
    self.view.bounds = CGRectMake(0, 0, 550, 650);
    _scroll.frame=CGRectMake(0,50,550, 650);
    [_scroll setContentSize:CGSizeMake(550,800)];
    [[self.view layer] setBorderWidth:2];
    [[self.view layer] setCornerRadius:8];
    [[self.view layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1].CGColor];

   
}


- (IBAction)phaseselection:(id)sender {
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0,0, 200, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=30;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.preferredContentSize=CGSizeMake(200, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    self.popovercontroller.popoverContentSize=CGSizeMake(200, 200);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_phasebtn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }

- (IBAction)scaffoldtypeselection:(id)sender {
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=30;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.preferredContentSize=CGSizeMake(200, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    self.popovercontroller.popoverContentSize=CGSizeMake(200, 200);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_scaffoldtypebtn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
    
}

- (IBAction)sequenceselection:(id)sender {
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=30;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.preferredContentSize=CGSizeMake(200, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    self.popovercontroller.popoverContentSize=CGSizeMake(200, 200);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_sequencebtn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
}

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
-(void)navgteanimtn{
    [UIView transitionFromView:self.allctrl.view
                        toView:self.view
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self ScaffoldingSelectplan];
    
}

#pragma mark-Tableview Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_popovertableview)
    {
        return 5;
    }
   
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
            }
    
    return cell;
}

@end
