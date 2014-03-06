//
//  UsersViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listusermdl.h"
#import "Validation.h"

@interface UsersViewController : UIViewController<UITextFieldDelegate>
{
    NSInteger path;
    BOOL recordresults;
    NSInteger optionIdentifier;
    UIButton *button;
    NSInteger btnindex;
    NSInteger webtype;
    NSInteger poptype;
}
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)listusermdl *usrmdl;
@property(strong,nonatomic)NSString *searchstring;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;


//Outlets
@property(strong,nonatomic)IBOutlet UITableView *usertable;
@property(strong,nonatomic)IBOutlet UITableViewCell *usercell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *addview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) IBOutlet UIButton *type1btnlbl;
@property (strong, nonatomic) IBOutlet UIButton *type2btnlbl;

/*outlets in cell*/
@property(strong,nonatomic)IBOutlet UILabel *usernamelabel;

/*outlets in view*/
@property(strong,nonatomic)IBOutlet UITextField *usrnametextfld;
@property(strong,nonatomic)IBOutlet UITextField *pswdtextfld;

/*IBAction in view*/
-(IBAction)insertuser:(id)sender;
-(IBAction)cancel:(id)sender;

//IBActions
-(IBAction)closeuser:(id)sender;
-(IBAction)adduserview:(id)sender;
-(IBAction)edituserview:(id)sender;
-(IBAction)closeuserview:(id)sender;
-(IBAction)deleteusers:(id)sender;
- (IBAction)usertype1btn:(id)sender;
- (IBAction)usertype2btn:(id)sender;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*array*/
@property(strong,nonatomic)NSMutableArray *userlistarray;

@end
