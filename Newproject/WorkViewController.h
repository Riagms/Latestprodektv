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
#import "SitevisitViewController.h"
#import "PResViewController.h"
#import "Workordrmdl.h"

@interface WorkViewController : UIViewController{
    UIButton *button;
     BOOL recordResults;
    NSInteger btnindex;
    NSInteger deleteindex;
}
@property(strong,nonatomic)NSString *planid;
@property(readwrite)NSDecimalNumber *sitefactor;
@property(strong,nonatomic)NSString *worktypeid;

@property(strong,nonatomic)NSString *companyname;
@property(strong,nonatomic)NSString *searchstring;
@property(readwrite)NSInteger optiontype;
@property (strong, nonatomic) IBOutlet UITableView *worktable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property(strong,nonatomic)Workordrmdl *workmdl;
@property (strong, nonatomic)AddworkViewController*AddWCtrl;
@property (strong, nonatomic)AddplanViewController*PlanVCtrl;
@property (strong, nonatomic)SitevisitViewController*SitevisitVCtrl;
@property (strong, nonatomic)PResViewController*resVCtrl;
@property (strong, nonatomic)NSMutableArray*menuitemarray;
@property (strong, nonatomic)NSMutableArray*workorderarray;

- (IBAction)clsebtn:(id)sender;
- (IBAction)Addbtn:(id)sender;
- (IBAction)editbtn:(id)sender;
- (IBAction)Deletebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *workcell;
@property (strong, nonatomic) IBOutlet UIButton *disclurebtn;
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;
- (IBAction)disclrebutn:(id)sender;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic) IBOutlet UILabel *worknolabel;
@property (strong, nonatomic) IBOutlet UILabel *planlabel;
@property (strong, nonatomic) IBOutlet UILabel *subunitlabel;
@property (strong, nonatomic) IBOutlet UILabel *equiplabel;
@property (strong, nonatomic) IBOutlet UILabel *deftaglabel;
@property (strong, nonatomic) IBOutlet UILabel *prioritylabel;
@property (strong, nonatomic) IBOutlet UILabel *reqdatelabel;
@property (strong, nonatomic) IBOutlet UILabel *appdatelabel;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;

@property(strong,nonatomic)IBOutlet UITextField *worknotextfield;


@end
