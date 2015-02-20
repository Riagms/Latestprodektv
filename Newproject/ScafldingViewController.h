//
//  ScaffoldingViewController.h
//  Prodektive
//
//  Created by GMSIndia 2 on 18/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDetailsplandisplayViewController.h"

@interface ScafldingViewController : UIViewController<animatndelegate>


@property(strong,nonatomic)AllDetailsplandisplayViewController *allctrl;
@property (strong, nonatomic) IBOutlet UITextField *unittextfield;
@property (strong, nonatomic) IBOutlet UITextField *equiptextfield;
@property (strong, nonatomic) IBOutlet UIButton *scaffoldtypebtn;
@property (strong, nonatomic) IBOutlet UITextField *widthtextfield;
@property (strong, nonatomic) IBOutlet UITextField *qtytextfield;
@property (strong, nonatomic) IBOutlet UIButton *sequencebtn;
@property (strong, nonatomic) IBOutlet UITextField *subunittextfield;
@property (strong, nonatomic) IBOutlet UITextField *phtextfield;
@property (strong, nonatomic) IBOutlet UITextField *lengthtextfield;
@property (strong, nonatomic) IBOutlet UITextField *heighttextfield;
@property (strong, nonatomic) IBOutlet UITextField *elevationtextfield;
@property (strong, nonatomic) IBOutlet UIButton *phasebtn;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;

@property(strong,nonatomic)IBOutlet UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;

- (IBAction)phaseselection:(id)sender;

- (IBAction)scaffoldtypeselection:(id)sender;
- (IBAction)sequenceselection:(id)sender;


- (IBAction)closescaffoldpage:(id)sender;
- (IBAction)next:(id)sender;

@end
