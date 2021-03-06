//
//  FollowupViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CKCalendarView.h"
#import "commentmdl.h"
#import "followupmodel.h"
@interface FollowupViewController : UIViewController{
    BOOL recordResults;
      NSInteger butnidtfr;
     NSInteger poptype;
}
@property (strong, nonatomic)commentmdl*cmtmdl;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UITableView *followuptable;

@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationbar;

@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(strong,nonatomic)UIPopoverController *popOverController;

@property(nonatomic, weak) CKCalendarView *calendar;

@property(strong,nonatomic)UITableView *popOverTableView;


@property(strong,nonatomic)IBOutlet UITableViewCell *followcell;

@property(strong,nonatomic)followupmodel*followupmdl;
@property(readwrite)NSInteger ActivityId;
@property (strong, nonatomic)NSIndexPath *Path;
/*Arrays*/
@property(strong,nonatomic)NSMutableArray*CommentsArray;
@property(strong,nonatomic)NSMutableArray*btnArray;
@property(strong,nonatomic)NSMutableArray *communctiontypeArray;
@property(strong,nonatomic)NSMutableArray *FollowupArray;

/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*Addview   Outlets*/
@property (strong, nonatomic) IBOutlet UITextField *summarytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *contacttxtfld;
@property (strong, nonatomic) IBOutlet UITextView *detailtxtview;
@property(strong,nonatomic)IBOutlet UIButton *communictntypeBtn;
@property(strong,nonatomic)IBOutlet UIButton *dateBtn;
@property (strong, nonatomic) IBOutlet UITextField *cmuntntimetxtfld;
@property (strong, nonatomic) IBOutlet UIButton *disclurebtnlbl;
/*buttons*/
- (IBAction)editcellbtn:(id)sender;
- (IBAction)namebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)closebtn:(id)sender;
-(IBAction)selectCommunicationType:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)disclurebtn:(id)sender;

/*cell Outlets*/

@property (strong, nonatomic) IBOutlet UILabel *summarylbl;

@property (strong, nonatomic) IBOutlet UILabel *OrgContact;
@property (strong, nonatomic) IBOutlet UILabel *cmtunictntype;
@property (strong, nonatomic) IBOutlet UILabel *datecontact;
/*Commentsview*/
@property (strong, nonatomic) IBOutlet UIView *commentview;
@property (strong, nonatomic) IBOutlet UINavigationBar *cmtnav;
@property (strong, nonatomic) IBOutlet UITableView *cmttable;
@property (strong, nonatomic) IBOutlet UITextView *cmttxtbox;
@property (strong, nonatomic) IBOutlet UIView *composecmtview;
@property (strong, nonatomic) IBOutlet UITableViewCell *cmtcell;
@property (strong, nonatomic) IBOutlet UILabel *titilelbl;

@property (strong, nonatomic) IBOutlet UILabel *commentlbl;

/*searchbar*/
@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;
@property (strong, nonatomic) NSString *searchstring;
- (IBAction)Addcmtbtn:(id)sender;

- (IBAction)savecmtbtn:(id)sender;
- (IBAction)cancelcmtbtn:(id)sender;

@end
