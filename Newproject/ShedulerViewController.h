//
//  SchedulerViewController.h
//  Prodektive
//
//  Created by GMSIndia 2 on 20/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKCalendarView.h"
#import "Schedulermdl.h"

@interface ShedulerViewController : UIViewController{
      BOOL recordResults;
    NSString*foremanid;
    UIButton*button;
    NSInteger btnindex,webtype,check;
}

@property (strong, nonatomic)NSString*searchstring ,*planid;

@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;

@property(strong,nonatomic)NSMutableDictionary*foremandict;
@property(strong,nonatomic)NSMutableDictionary*Revforemandict;
@property(strong,nonatomic)Schedulermdl*schmdl;
@property(strong,nonatomic)NSMutableArray*schedulearray;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*calendar*/
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


@property (strong, nonatomic) IBOutlet UIView *titleview;
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *schedulartable;
@property (strong, nonatomic) IBOutlet UITableViewCell *schedulercell;

@property (strong, nonatomic) IBOutlet UIView *addview;

- (IBAction)addclsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *wrkordrtxtfld;
@property (strong, nonatomic) IBOutlet UIButton *datetxtfld;
- (IBAction)Datebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *foremanbtnlbl;
- (IBAction)foremanbtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;
- (IBAction)cancel:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Cancelbtnlbl;
@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;

- (IBAction)addbtn:(id)sender;

- (IBAction)Deletebtn:(id)sender;


/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *workordrlbl;
@property (strong, nonatomic) IBOutlet UILabel *plantlbl;
@property (strong, nonatomic) IBOutlet UILabel *subunitlbl;
@property (strong, nonatomic) IBOutlet UILabel *equipmentlbl;

@property (strong, nonatomic) IBOutlet UILabel *deflbl;
@property (strong, nonatomic) IBOutlet UILabel *foremanlbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;

- (IBAction)editbtn:(id)sender;
- (IBAction)checkbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *checkbtnlbl;

@end
