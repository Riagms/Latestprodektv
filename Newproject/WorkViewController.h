//
//  WorkViewController.h
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddworkViewController.h"
#import "AddplanViewController.h"

@interface WorkViewController : UIViewController{
    UIButton *button;
}
@property (strong, nonatomic) IBOutlet UITableView *worktable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic)AddworkViewController*AddWCtrl;
@property (strong, nonatomic)AddplanViewController*PlanVCtrl;
@property (strong, nonatomic)NSMutableArray*menuitemarray;

- (IBAction)clsebtn:(id)sender;
- (IBAction)Addbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableViewCell *workcell;
@property (strong, nonatomic) IBOutlet UIButton *disclurebtn;
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;
- (IBAction)disclrebutn:(id)sender;

@end
