//
//  ScaffoldingViewController.h
//  Prodektive
//
//  Created by GMSIndia 2 on 18/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDetailsplandisplayViewController.h"
#import "Scaffoldtypemdl.h"
#import "Workordrmdl.h"
#import "Customscaffoldingplan.h"



@interface ScafldingViewController : UIViewController<animatndelegate>
{
    NSInteger ipw;
    NSInteger ppe;
    NSInteger upw;
    
    NSString *ipwstring;
    NSString *ppestring;
    NSString *upwstring;
    
      BOOL recordResults;
    
    NSInteger poptype;
     NSString *phasestrg;
     NSString *jobsequnce;
    NSInteger scaffoldtypeindex;
    NSInteger txtfldtype;
    NSDecimalNumber *chrate;

}
/*Outlets*/
@property(strong,nonatomic)Workordrmdl * work;
@property(strong,nonatomic)Customscaffoldingplan * smdl;
@property (readwrite)NSDecimalNumber *manpwr;
@property (readwrite)NSDecimalNumber *dishr;
@property (readwrite)NSDecimalNumber *erecrhr;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;
@property(strong,nonatomic)UITableView * autotable;
@property(strong,nonatomic)UITableView * autotable1;
@property(strong,nonatomic)UITableView * autotable2;
@property(strong,nonatomic)UITableView * autotable3;
@property(strong,nonatomic)NSMutableArray * autocompletearray;
@property(strong,nonatomic)NSMutableArray * workorderarray;
@property(strong,nonatomic)NSMutableDictionary *scaffoldtypeDict;
@property(strong,nonatomic)NSMutableDictionary *scaffoldidDict;
@property(strong,nonatomic)NSString *sequencestring;
@property(readwrite)NSInteger optionidentifier;
@property(readwrite)NSDecimalNumber *sitefactor;
@property(strong,nonatomic)NSString *scaffoldtypestring;
@property(strong,nonatomic)NSString *insertresultvalue;
@property(readwrite)NSInteger serviceid;
@property(strong,nonatomic)NSString *worktypeid;
@property(strong,nonatomic)NSString *workorderid;
@property(strong,nonatomic)NSString *planid;
@property(strong,nonatomic)AllDetailsplandisplayViewController *allctrl;
@property(strong,nonatomic)Scaffoldtypemdl *typmdl;
@property (strong, nonatomic) IBOutlet UITextField *unittextfield;
@property (strong, nonatomic) IBOutlet UITextField *equiptextfield;
@property (strong, nonatomic) IBOutlet UIButton *scaffoldtypebtn;
@property (strong, nonatomic) IBOutlet UITextField *widthtextfield;
@property (strong, nonatomic) IBOutlet UITextField *qtytextfield;
@property (strong, nonatomic) IBOutlet UIButton *sequencebtn;
@property (strong, nonatomic) IBOutlet UITextField *subunittextfield;
@property (strong, nonatomic) IBOutlet UITextField *phtextfield;
@property (strong, nonatomic) IBOutlet UITextField *lengthtextfield;
@property (strong, nonatomic) IBOutlet UITextField *heighttextfield;
@property (strong, nonatomic) IBOutlet UITextField *elevationtextfield;
@property (strong, nonatomic) IBOutlet UITextView *destextview;
@property (strong, nonatomic) IBOutlet UIButton *phasebtn;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UIButton *IWFbtn;
@property (strong, nonatomic) IBOutlet UIButton *ppebtn;
@property (strong, nonatomic) IBOutlet UIButton *upwbtn;

@property(strong,nonatomic)IBOutlet UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;

- (IBAction)phaseselection:(id)sender;

- (IBAction)scaffoldtypeselection:(id)sender;
- (IBAction)sequenceselection:(id)sender;
- (IBAction)checkunplanned:(id)sender;
- (IBAction)checkppefactor:(id)sender;
- (IBAction)checkworkfactor:(id)sender;


- (IBAction)closescaffoldpage:(id)sender;
- (IBAction)next:(id)sender;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableArray * sccfarray;
@property(strong,nonatomic)NSMutableArray * phasearray;
@property(strong,nonatomic)NSMutableArray * sequencearray;
@property(strong,nonatomic)NSMutableArray *scaffoldtyperesultarray;
@property(strong,nonatomic)NSMutableArray * projectheaderarray;
@property(strong,nonatomic)NSMutableArray * unitarray;

@property(strong,nonatomic)NSMutableArray * subunitarray;
@property(strong,nonatomic)NSMutableArray * equipmentarray;

/*dicts*/
@property(strong,nonatomic)NSMutableDictionary * phasedict;
@property(strong,nonatomic)NSMutableDictionary * sequncedict;

@end
