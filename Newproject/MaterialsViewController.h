//
//  MaterialsViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 18/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import "Validation.h"
#import "Base64.h"

@interface MaterialsViewController : UIViewController{
     BOOL recordResults;
    NSInteger butntype;
    UIButton *button;
    NSInteger butnpath;
    NSInteger path;
    NSInteger webtype;
    
}

@property(strong,nonatomic)Manpwr *materialmdl;
@property(strong,nonatomic)Validation *val;
@property (nonatomic) BOOL newMedia;
@property(strong,nonatomic)NSData*basedata;
@property(strong,nonatomic)NSString*encodedString;

@property(strong,nonatomic)NSString*picturelocation;
@property(strong,nonatomic)NSString*uplodpiclctn;

@property(strong,nonatomic)NSMutableArray *materialarray;
@property(strong,nonatomic)NSMutableArray *subtypearray;

@property (strong, nonatomic) IBOutlet UITextField *stockinhandtxtfld;



/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *deslbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *costlbl;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
//outlets
@property(strong,nonatomic)IBOutlet UITableView *materialTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *materialCell;
@property(strong,nonatomic)IBOutlet UIView *titleView;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;
@property(strong,nonatomic)IBOutlet UIView *addmatView;
@property (strong, nonatomic)NSString*searchstring;

@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) IBOutlet UITextField *codetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *destxtfld;

@property (strong, nonatomic) IBOutlet UITextField *subtyptxtfld;
@property (strong, nonatomic) IBOutlet UITextField *unitcosttxtfld;
@property (strong, nonatomic) IBOutlet UIButton *subsearchbtnlbl;

- (IBAction)subsearchbtn:(id)sender;

- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;


-(IBAction)closeMaterials:(id)sender;
-(IBAction)addmaterial:(id)sender;
-(IBAction)editmaterial:(id)sender;
-(IBAction)closeaddview:(id)sender;

@end
