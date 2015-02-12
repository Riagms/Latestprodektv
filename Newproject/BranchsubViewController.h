//
//  BranchsubViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 12/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BranchViewController.h"
#import "Bsubmdl.h"
#import "Cbranch.h"

@interface BranchsubViewController : UIViewController
{
BOOL recordresults;
    NSInteger path;
}

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property(strong,nonatomic)BranchViewController *branchctrl;
@property(strong,nonatomic)Bsubmdl *bmdl;
@property(strong,nonatomic)Cbranch *branchmdl;


- (IBAction)closesubbranch:(id)sender;
- (IBAction)addbranch:(id)sender;
- (IBAction)deletebranch:(id)sender;
- (IBAction)updatebranch:(id)sender;
- (IBAction)gotomasterbranch:(id)sender;
- (IBAction)selectbranch:(id)sender;
- (IBAction)closeaddform:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popOvercontroller;
@property(strong,nonatomic)IBOutlet UIButton *branchselectbtn;
@property(strong,nonatomic)IBOutlet UITableView *branchtable;
@property(strong,nonatomic)IBOutlet UITableViewCell *branchcell;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UILabel *branchlabel;

@property(strong,nonatomic)NSMutableArray *brancharray;
@property(strong,nonatomic)NSMutableDictionary *popuparray;
@end
