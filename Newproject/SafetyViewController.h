//
//  SafetyViewController.h
//  Newproject
//
//  Created by Riya on 2/12/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SafetyViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *saftytable;
@property (strong, nonatomic) IBOutlet UITextField *codetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *codedestxtfld;

@property (strong, nonatomic) IBOutlet UIButton *subtypebtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *unitcosttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *unitmeasuretxtfld;
@property (strong, nonatomic) IBOutlet UITextField *stocktxtfld;
@property (strong, nonatomic) IBOutlet UIView *addview;


- (IBAction)clsebtn:(id)sender;
- (IBAction)Addbtn:(id)sender;
- (IBAction)Deletebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)subtypebtn:(id)sender;
- (IBAction)picclsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *picimgeview;
- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;


@end
