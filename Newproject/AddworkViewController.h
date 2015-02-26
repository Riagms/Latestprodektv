//
//  AddworkViewController.h
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PrirityViewController.h"
#import "Workordrmdl.h"
#import "prioritymodel.h"

@interface AddworkViewController : UIViewController
{
    BOOL recordResults;
    NSInteger outage;
    NSInteger space;
    NSInteger clear;
    NSInteger priyorityindex;

    NSString *outagestring;
    NSString *clearstring;
    NSString *spacestring;
}
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;

@property(strong,nonatomic)NSString *result;
@property(strong,nonatomic)NSString *priyorityid;
- (IBAction)clsebtn:(id)sender;
@property(strong,nonatomic)NSString *planid;
@property(readwrite)NSInteger optiontype;
@property(strong,nonatomic)Workordrmdl *workmdl;
@property(strong,nonatomic)prioritymodel *pmodel;

@property(strong,nonatomic)NSMutableArray *workarray;

@property (strong, nonatomic)PrirityViewController *priorityVCtrl;
@property (strong, nonatomic) IBOutlet UITextView *destxtview;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;

@property (strong, nonatomic) IBOutlet UITextField *workordrtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *prioritytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *planttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *subunittxtfld;
@property (strong, nonatomic) IBOutlet UITextField *equmnttxtfld;

@property (strong, nonatomic) IBOutlet UITextField *tagtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *requsttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *date1;
@property (strong, nonatomic) IBOutlet UITextField *approvetxtfld;
@property (strong, nonatomic) IBOutlet UIButton *prioritybtn;

@property (strong, nonatomic) IBOutlet UITextField *date2;
@property (strong, nonatomic) IBOutlet UITextField *user1textfield;
@property (strong, nonatomic) IBOutlet UITextField *user2textfield;

- (IBAction)Prioritymaster:(id)sender;
- (IBAction)priorityselection:(id)sender;

- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property(strong,nonatomic)IBOutlet UIButton *outagebtn;
@property(strong,nonatomic)IBOutlet UIButton *clearancebtn;
@property(strong,nonatomic)IBOutlet UIButton *spacebtn;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;

@property(strong,nonatomic)NSMutableArray *priorityarray;
@property(strong,nonatomic)NSMutableDictionary *priyoritydict;
@property(strong,nonatomic)IBOutlet UITableView *poptableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;

-(IBAction)checkoutage:(id)sender;
-(IBAction)checkclearance:(id)sender;
-(IBAction)checkspace:(id)sender;

@end
