//
//  AddplanViewController.h
//  KontractWorkOrder
//
//  Created by Riya on 1/28/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScafldingViewController.h"
#import "Servicemdl.h"
#import "Customscaffoldingplan.h"
#import "Workordrmdl.h"
@interface AddplanViewController : UIViewController
{
    UINavigationController *modalViewNavController;
    UIButton *button;
    NSInteger btnindex;
    BOOL recordResults;
    NSInteger path;
}
@property(strong,nonatomic)Customscaffoldingplan *scfldmdl;
@property(strong,nonatomic)Workordrmdl *work;

@property(readwrite)NSInteger optionidentifier;
@property(readwrite)NSDecimalNumber *sitefactor;
@property(strong,nonatomic)Servicemdl *servmdl;
@property(strong,nonatomic)NSString *workorderid;
@property(strong,nonatomic)NSString *worktypeid;
@property(strong,nonatomic)NSString *planid;
@property(strong,nonatomic)NSString *servid;
@property(strong,nonatomic)ScafldingViewController *scaffoldctrl;
- (IBAction)clsebtn:(id)sender;
- (IBAction)serviceselection:(id)sender;
@property(strong,nonatomic)IBOutlet UIPopoverController *popoverctrlr;
@property(strong,nonatomic)IBOutlet UITableView *PopOvertableview;
@property(strong,nonatomic)IBOutlet UITableViewCell *scaffoldcell;
@property (strong, nonatomic) IBOutlet UIView *scafoldtitle;
@property(strong,nonatomic)IBOutlet UITableView *scaffoldtable;
@property (strong, nonatomic) IBOutlet UITextView *detailstextview;
@property (strong, nonatomic) IBOutlet UITextView *Workperformtextview;
@property (strong, nonatomic) IBOutlet UIButton *servicebtn;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
- (IBAction)addscaffoldaction:(id)sender;
- (IBAction)update:(id)sender;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)NSString *skillstring;
@property(strong,nonatomic)NSMutableDictionary *subtypelistdictionary;
@property(strong,nonatomic)NSMutableArray *Subtypelistarray;
@property(strong,nonatomic)NSMutableArray *scaffoldingplanlistarray;
@property(strong,nonatomic)NSMutableArray *workorderarray;
@property(strong,nonatomic)IBOutlet UILabel *unitcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *equipcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *pjctheadercelllabel;
@property(strong,nonatomic)IBOutlet UILabel *scaffoldcellalbel;
@property(strong,nonatomic)IBOutlet UILabel *lengthcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *heightcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *widthcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *quantitycelllabel;
@property(strong,nonatomic)IBOutlet UILabel *elevationcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *manhourslabel;
@property(strong,nonatomic)IBOutlet UILabel *desmanitilehourslabel;
@property(strong,nonatomic)IBOutlet UILabel *erecthourslabel;

@end
