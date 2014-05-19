//
//  EmplyhrmgntViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/4/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empmdl.h"
@interface EmplyhrmgntViewController : UIViewController
{
    NSInteger Path;
       BOOL recordResults;
    NSInteger webtype;
    UIButton *butn;
     NSInteger btnindex;
    NSInteger selectedcell;
    
    NSInteger btnclck;
    NSInteger previousindexpath;

}
@property(readwrite)NSInteger openviewindex;
@property(readwrite)NSInteger previousopenviewindex;

@property(strong,nonatomic)IBOutlet UIView *animatedview;
@property(strong,nonatomic)IBOutlet UILabel *badgelbl;

@property(strong,nonatomic)Empmdl *empmdl;
@property (strong, nonatomic)NSString *jobsiteid;
@property (strong, nonatomic)NSMutableDictionary *jobsitedict;
@property (strong, nonatomic)NSMutableArray *jobsitearray;
/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*IBAction*/
-(IBAction)closeempmgmt:(id)sender;

/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITableView *mgmttableview;
@property(strong,nonatomic)IBOutlet UIView *tabletitleview;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)IBOutlet UITableViewCell *mgmtcell;
@property(strong,nonatomic)NSString *searchstring;

/*Array*/
@property(strong,nonatomic)NSMutableArray *employeelistarray;

/*outlet in cell*/
@property(strong,nonatomic)IBOutlet UILabel *ssnlabel;
@property(strong,nonatomic)IBOutlet UILabel *firstnamelabel;
@property(strong,nonatomic)IBOutlet UILabel *lastnamelabel;
@property(strong,nonatomic)IBOutlet UILabel *jobsitelabel;


@property (strong, nonatomic) IBOutlet UIView *badgeview;
@property (strong, nonatomic) IBOutlet UITextField *firsttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *lastnametxtfld;

@property (strong, nonatomic) IBOutlet UITextField *ssntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *jobsitetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *badgenumbrtxtfld;

- (IBAction)savebtn:(id)sender;

- (IBAction)badgeclsebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *disclsebtn;
- (IBAction)disclbtn:(id)sender;

@end
