//
//  TrackerViewController.h
//  Prodektive
//
//  Created by GMSIndia 2 on 20/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TScfTypemdl.h"
#import "CKCalendarView.h"
#import "Trackmdl.h"
#import "TSManpwrmdl.h"
#import "TSOtherMdl.h"
#import "Validation.h"

@interface TrakerViewController : UIViewController
{
       BOOL recordResults;
    NSInteger Scbtnindexpath,Scfpresent,manbtnindex,ScafldPresntcheck,Sotherbtnindex,tabtype;
    UIButton *button;
    NSString* trackid,*Manpresent,*usedQtystrg;
    
    NSInteger poptype;
}
@property(strong,nonatomic)TSManpwrmdl*Manpwrmdl;
@property(strong,nonatomic)TSOtherMdl*Othermdl;
@property(strong,nonatomic)NSMutableArray*manpwrarry;
@property(strong,nonatomic)NSMutableArray*otherarray;
@property(strong,nonatomic)NSMutableArray* delayarray;
@property(strong,nonatomic)NSMutableDictionary*Delaydict;
          

@property(strong,nonatomic)Trackmdl*track1;
@property(strong,nonatomic)NSString*editpath,*workorder,*workorderdesc;
@property(strong,nonatomic)IBOutlet UIDatePicker *timepick;
/*calendar*/
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;


/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

@property (strong, nonatomic)NSMutableArray*trackarray;
@property (strong, nonatomic)NSMutableArray*ScaffoldArray,*percentagearray;
@property (strong, nonatomic)TScfTypemdl*Scaffldmdl;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic) IBOutlet UIButton *clsebtn;
@property (strong, nonatomic) IBOutlet UITextView *wrktxtlbl;
@property (strong, nonatomic) IBOutlet UIButton *datebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *starttimebtnlbl;
@property (strong, nonatomic) IBOutlet UITableView *scaffoldtable;

@property (strong, nonatomic) IBOutlet UIView *titleview1;

@property (strong, nonatomic) IBOutlet UIView *titleview2;
@property (strong, nonatomic) IBOutlet UITableView *manpwrtable;
@property (strong, nonatomic) IBOutlet UIView *manpwrview;
@property (strong, nonatomic) IBOutlet UIView *otherview;
@property (strong, nonatomic) IBOutlet UIView *titleview3;

@property (strong, nonatomic) IBOutlet UITableView *othertable;



@property (strong, nonatomic) IBOutlet UIBarButtonItem *manpowerbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *materialsbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *fleetbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *thirdpartybtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *equmntbutnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *consumblebtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *smallbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *safetybtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *otherbtnlbl;


- (IBAction)datebtn:(id)sender;
- (IBAction)starttimebtn:(id)sender;
- (IBAction)endtimebtn:(id)sender;
- (IBAction)closebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;




- (IBAction)manpwrbtn:(id)sender;
- (IBAction)equipmntbtn:(id)sender;
- (IBAction)materialsbtn:(id)sender;
- (IBAction)fleetbtn:(id)sender;
- (IBAction)thirdpartybtn:(id)sender;
- (IBAction)consumablesbtn:(id)sender;
- (IBAction)smalltoolbtn:(id)sender;
- (IBAction)safetybtn:(id)sender;
- (IBAction)othersbtn:(id)sender;


/* Scaffold cell Outlets*/

@property (strong, nonatomic) IBOutlet UIButton *Sccheckbtnlbl;
@property (strong, nonatomic) IBOutlet UILabel *scfldlbl;

@property (strong, nonatomic) IBOutlet UILabel *lengthlbl;
@property (strong, nonatomic) IBOutlet UILabel *widthlbl;
@property (strong, nonatomic) IBOutlet UILabel *heightlbl;

@property (strong, nonatomic) IBOutlet UILabel *quantitylbl;
@property (strong, nonatomic) IBOutlet UITableViewCell *scaffldcell;
@property (strong, nonatomic) IBOutlet UIButton *endbtnlbl;

- (IBAction)Sccheckbtn:(id)sender;

/* Manpower cell Outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *manpwrcell;
@property (strong, nonatomic) IBOutlet UITableViewCell *othercell;
@property (strong, nonatomic) IBOutlet UIButton *manCheckbtnlbl;

@property (strong, nonatomic) IBOutlet UILabel *firstnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *lastnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *craftlbl;
- (IBAction)mancheckbtn:(id)sender;
/* Other cell Outlets*/

@property (strong, nonatomic) IBOutlet UILabel *Namelbl;
@property (strong, nonatomic) IBOutlet UILabel *quntyalloclbl;

@property (strong, nonatomic) IBOutlet UITextField *quantyused;


@property (strong, nonatomic) IBOutlet UITextField *quntytxtfld;
//- (IBAction)updatebtn:(id)sender;
- (IBAction)qtyusedbtn:(id)sender;


- (IBAction)otherupdatebtn:(id)sender;

- (IBAction)percntbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *percntbtnlbl;
- (IBAction)delaybtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *delaybtnlbl;

@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
- (IBAction)trackerbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *trackerbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *sequencebtnlbl;
- (IBAction)sequencebtn:(id)sender;


@end
