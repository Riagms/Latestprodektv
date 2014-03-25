//
//  ContactInfoViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 20/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactInfoViewController : UIViewController{
    BOOL recordResults;
    
}

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property(strong,nonatomic)IBOutlet UITableView *contactinfoTable;
@property(strong,nonatomic)IBOutlet UIView *infoview;
@property(strong,nonatomic)NSMutableArray *infoarray;

@property(strong,nonatomic)IBOutlet UINavigationBar *navbar;
@property(strong,nonatomic)IBOutlet UIView *addview;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UINavigationItem *navitem;

@property (strong, nonatomic) IBOutlet UITextField *nametextfield;
@property (strong, nonatomic) IBOutlet UITextField *emailtextfield;
@property (strong, nonatomic) IBOutlet UITextField *phonetextfield;
@property (strong, nonatomic) IBOutlet UITextField *mobiletextfld;
@property (strong, nonatomic) IBOutlet UITextField *faxtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *pstntxtfld;

@property (strong, nonatomic) IBOutlet UITableViewCell *cntactcell;
@property (strong, nonatomic) IBOutlet UILabel *namelbl;
@property (strong, nonatomic) IBOutlet UILabel *emaillbl;
@property (strong, nonatomic) IBOutlet UILabel *phnelbl;

@property (strong, nonatomic) IBOutlet UILabel *mblelbl;
@property (strong, nonatomic) IBOutlet UILabel *faxlbl;


- (IBAction)editcellbtn:(id)sender;
-(IBAction)closetheView:(id)sender;
- (IBAction)clsebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)editbtn:(id)sender;


@end
