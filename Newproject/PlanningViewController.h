//
//  PlanningViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 2/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AddserviceViewController.h"
#import "SitevisitViewController.h"
#import "DetailplanViewController.h"
#import "planmodel.h"
@interface PlanningViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger leadcheck;
    NSInteger customercheck;
    NSInteger poptype;
    UIButton *button;
    BOOL recordResults;
    NSInteger optionidentifier;
    NSInteger path;
    NSInteger webtype;
    NSInteger btnindex;
    NSString *customerclicked;
    NSString *leadclicked;
    NSString *typestrg;
    NSInteger newpoptype;
    
    
}

/* newcomment*/


@property(strong,nonatomic)planmodel *plnmdl;
@property(strong,nonatomic)AddserviceViewController *servVctrl;
@property(strong,nonatomic)SitevisitViewController *sitevisitVctrl;
@property(strong,nonatomic)DetailplanViewController *DetailplanVctrl;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;



/*views*/
@property (strong, nonatomic) IBOutlet UINavigationBar *titleview;
@property (strong, nonatomic) IBOutlet UIView *tabletitleview;
@property (strong, nonatomic) IBOutlet UITableView *plangtable;
@property(strong,nonatomic)IBOutlet UIView *addplanview;

/*Buttons*/
@property(strong,nonatomic)IBOutlet UIButton *leadcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *custcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *planselectionbtn;
@property(strong,nonatomic)IBOutlet UIButton *disclosurebtn;

@property(strong,nonatomic)IBOutlet UITableViewCell *planingcell;
@property(strong,nonatomic)IBOutlet UILabel *organizationname;
@property(strong,nonatomic)IBOutlet UILabel *leadlabel;
@property(strong,nonatomic)IBOutlet UILabel *planidlabel;
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;
@property(strong,nonatomic)UISearchBar *searchbar;
@property(strong,nonatomic)NSString *searchstring;
@property(strong,nonatomic)IBOutlet UILabel *selectionlabel;
@property(strong,nonatomic)IBOutlet UINavigationItem *navabar;


/*IBAction*/
- (IBAction)clseVCtrlbtn:(id)sender;
- (IBAction)addplan:(id)sender;
-(IBAction)closeaddview:(id)sender;
-(IBAction)checkleadaction:(id)sender;
-(IBAction)checkcustomeraction:(id)sender;
//-(IBAction)selectcustomer:(id)sender;
-(IBAction)planselection:(id)sender;
-(IBAction)selectdisclosure:(id)sender;
-(IBAction)updateplanning:(id)sender;
-(IBAction)cancelplanning:(id)sender;
-(IBAction)Editaction:(id)sender;
-(IBAction)deleteplan:(id)sender;

/*array*/
//@property(strong,nonatomic)NSMutableArray *leadlistarray;
//@property(strong,nonatomic)NSMutableArray *customerlistarray;
@property(strong,nonatomic)NSMutableArray *planslectionarray;
@property(strong,nonatomic)NSMutableArray *disclosurearry;
@property(strong,nonatomic)NSMutableArray *planlistarray;
@property(strong,nonatomic)NSMutableArray *typelistarray;


/*Dict*/
@property(strong,nonatomic)NSMutableDictionary *leaddict;
@property(strong,nonatomic)NSMutableDictionary *customerdict;
@property(strong,nonatomic)NSMutableDictionary *typelistdict;
@property(strong,nonatomic)NSMutableDictionary *revtypelistdict;


@property(strong,nonatomic)NSString *leadstring;
@property(strong,nonatomic)NSString *customerstring;

@property (strong, nonatomic) IBOutlet UIButton *typebtnlbl;

- (IBAction)typebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *sitefactortxtfld;




@end
