//
//  SitevisitViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "NewrecordViewController.h"
#import "SitevistMdl.h"


@interface SitevisitViewController : UIViewController<UITabBarDelegate,UITableViewDataSource,UITableViewDelegate,newrecordDelgate>{
    BOOL recordResults;
    NSString *itemid;
    NSInteger path;

}

@property (strong, nonatomic)SitevistMdl *sitevistmdl;

-(void)toreloadatable;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;

@property (strong, nonatomic)NewrecordViewController *newrecordVCtrl;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*General View outlet*/
@property (strong, nonatomic) IBOutlet UIView *gernalview;
@property (strong, nonatomic) IBOutlet UITextField *companynametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *loctntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *ziptxtfld;
@property (strong, nonatomic) IBOutlet UIButton *complextyofwrkbtnlbl;
@property (strong, nonatomic) IBOutlet UITextView *facilitytxtview;
@property (strong, nonatomic) IBOutlet UITextView *scpeofwrktxtview;
- (IBAction)cmpxtyofwrkbtn:(id)sender;
- (IBAction)updatebtn:(id)sender;

/*productn Rate*/

@property (strong, nonatomic) IBOutlet UIView *rateview;

@property (strong, nonatomic) IBOutlet UITableViewCell *ratecell;
@property (strong, nonatomic) IBOutlet UILabel *ratelbl;
@property (strong, nonatomic) IBOutlet UILabel *ratedeslbl;
@property (strong, nonatomic) IBOutlet UITableView *prdunratetble;
@property (strong, nonatomic) IBOutlet UILabel *ratevaluelbl;
- (IBAction)ratedeletebtn:(id)sender;
- (IBAction)Rateaddbtn:(id)sender;
- (IBAction)celleditbtn:(id)sender;

/*Document view*/
@property (strong, nonatomic) IBOutlet UIView *docmntview;
@property (strong, nonatomic) IBOutlet UIButton *docutypebtnlbl;
@property (strong, nonatomic) IBOutlet UIImageView *picturepreviewimg;
- (IBAction)takepicturebtn:(id)sender;
- (IBAction)upadtepicturebtn:(id)sender;
- (IBAction)docutypebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *tabletitleview;

@property (strong, nonatomic) IBOutlet UITableView *documenttable;

@property (strong, nonatomic) IBOutlet UITableViewCell *docucell;

/*Accebility view*/

@property (strong, nonatomic) IBOutlet UIView *accessview;
@property (strong, nonatomic) IBOutlet UITextView *accblitytxtview;
@property (strong, nonatomic) IBOutlet UITextView *Accibltylblview;


- (IBAction)accebilityupdate:(id)sender;


/*Equipment Staging area Views*/

@property (strong, nonatomic) IBOutlet UIView *equipmentview;

@property (strong, nonatomic) IBOutlet UITextView *equipmnttxtview;
- (IBAction)equpmntupdatebtn:(id)sender;

/*Jobsite Views*/
@property (strong, nonatomic) IBOutlet UIView *jobsiteview;
@property (strong, nonatomic) IBOutlet UITableView *jobsitetable;
@property (strong, nonatomic) IBOutlet UIView *jobsitetitleview;
- (IBAction)addnewjobsite:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *jobsitecell;
@property (strong, nonatomic) IBOutlet UILabel *jobname;
@property (strong, nonatomic) IBOutlet UILabel *jobcode;
@property (strong, nonatomic) IBOutlet UILabel *jobtype;
@property (strong, nonatomic) IBOutlet UILabel *jobcost;
- (IBAction)deletejobsite:(id)sender;



/*safety views*/

@property (strong, nonatomic) IBOutlet UIView *safetyview;
@property (strong, nonatomic) IBOutlet UIView *safteytitleview;

@property (strong, nonatomic) IBOutlet UITableView *safetytableview;
- (IBAction)addsafetyrules:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *saftycell;

@property (strong, nonatomic) IBOutlet UILabel *rultitllbl;
@property (strong, nonatomic) IBOutlet UILabel *ruledesptn;

- (IBAction)deletesfty:(id)sender;

/*Equipments views*/
@property (strong, nonatomic) IBOutlet UIView *neweqmntview;
@property (strong, nonatomic) IBOutlet UIView *neweqmnttitile;

@property (strong, nonatomic) IBOutlet UITableView *newequipmenttable;
- (IBAction)addnewequipment:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *equmntcell;
@property (strong, nonatomic) IBOutlet UILabel *eqnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *eqdeslbl;
@property (strong, nonatomic) IBOutlet UILabel *equarealbl;
@property (strong, nonatomic) IBOutlet UILabel *equunitlbl;
- (IBAction)deleteequmnt:(id)sender;





/*work schedule view*/

@property (strong, nonatomic) IBOutlet UIView *workschdleview;
@property (strong, nonatomic) IBOutlet UIView *worktitleview;
@property (strong, nonatomic) IBOutlet UITableView *workscdletable;
- (IBAction)addworkscdle:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *wrkschdlecell;
@property (strong, nonatomic) IBOutlet UILabel *startdaelbl;
@property (strong, nonatomic) IBOutlet UILabel *enddatelbl;
@property (strong, nonatomic) IBOutlet UILabel *wrkschdledscrptn;
- (IBAction)deletewrkschdle:(id)sender;



/*meetingnote*/

@property (strong, nonatomic) IBOutlet UIView *meetingview;
@property (strong, nonatomic) IBOutlet UIView *meetingtitleview;
@property (strong, nonatomic) IBOutlet UITableView *meetingtable;
- (IBAction)addmeetgnots:(id)sender;
- (IBAction)deltemeetng:(id)sender;


/*otherbidders*/

@property (strong, nonatomic) IBOutlet UIView *biddersview;
@property (strong, nonatomic) IBOutlet UITableView *bidderstable;
@property (strong, nonatomic) IBOutlet UIView *bidderstitle;

- (IBAction)addbidder:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *biddercell;
@property (strong, nonatomic) IBOutlet UILabel *biddernamelbl;
- (IBAction)deletebidd:(id)sender;


/*weatheroutlook*/
@property (strong, nonatomic) IBOutlet UIView *weatherview;
@property (strong, nonatomic) IBOutlet UIView *weathertitle;
@property (strong, nonatomic) IBOutlet UITableView *weathertable;

- (IBAction)addweather:(id)sender;

- (IBAction)deleteweather:(id)sender;


/*Notes*/
@property (strong, nonatomic) IBOutlet UIView *notesview;
@property (strong, nonatomic) IBOutlet UIView *notestitle;

@property (strong, nonatomic) IBOutlet UITableView *notestable;

- (IBAction)addnotesbtn:(id)sender;
- (IBAction)deletenotes:(id)sender;

/*barbuttonitmlbl*/
@property (strong, nonatomic) IBOutlet UIBarButtonItem *gernalbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *pratebtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *documntbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *accesbltybtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *EstggAreabtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *jobsitebtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saftybtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *equpmntslbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *workbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *meetingnotesbtnlbl;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *biddersbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *weatherbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *notesbtnlbl;



/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


/*String*/
@property(strong,nonatomic)NSString *companyid;
@property(strong,nonatomic)NSString *companyname;




/*Arrays*/
@property(strong,nonatomic)NSMutableArray *cmpxtyofwrk;
@property(strong,nonatomic)NSMutableArray *productionratearray;
@property(strong,nonatomic)NSMutableArray *jobsiteArray;
@property(strong,nonatomic)NSMutableArray *saftyArray;
@property(strong,nonatomic)NSMutableArray *Equpmntarray;
@property(strong,nonatomic)NSMutableArray *wrkschdlearray;
@property(strong,nonatomic)NSMutableArray *meetgarray;
@property(strong,nonatomic)NSMutableArray *bidderarray;
@property(strong,nonatomic)NSMutableArray *weatherarray;
@property(strong,nonatomic)NSMutableArray *notearray;


/*Dictionary*/
@property(strong,nonatomic)NSMutableDictionary *JobtypeDict;

/*IBAction*/
-(IBAction)closesitevisit:(id)sender;
- (IBAction)generalbtn:(id)sender;

- (IBAction)prductnbtn:(id)sender;
- (IBAction)documntbtn:(id)sender;
- (IBAction)acceblitybtn:(id)sender;
- (IBAction)Equmntstgareabtn:(id)sender;
- (IBAction)jobsitebtn:(id)sender;
- (IBAction)safetybtn:(id)sender;
- (IBAction)newequipmentbtn:(id)sender;
- (IBAction)workschedulebtn:(id)sender;
- (IBAction)meetingnotesbtn:(id)sender;
- (IBAction)otherbiddersbtn:(id)sender;
- (IBAction)weatheroutlookbtn:(id)sender;
- (IBAction)notesbtn:(id)sender;


@end
