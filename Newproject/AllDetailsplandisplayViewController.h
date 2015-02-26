//
//  AllDetailsplandisplayViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 24/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scaffoldtypemdl.h"
#import "Customscaffoldingplan.h"
#import <QuartzCore/QuartzCore.h>
#import "NewscfldDetails.h"
#import "Scaffoldsubtypemodel.h"
#import <sqlite3.h>
#import "Validation.h"


@protocol animatndelegate <NSObject>
-(void)navgteanimtn;
@end


@interface AllDetailsplandisplayViewController : UIViewController<UIGestureRecognizerDelegate>{
    
    float manhrs;
    BOOL recordResults;
    NSInteger path;
    NSInteger Deletepath;
    NSInteger insertpath;
    NSInteger tabpath;
    NSInteger btntouch;
    NSInteger chektouch;
    NSInteger ticktouch;
    NSInteger chrate;
    NSInteger firstscfldid;


    UIView* dropArea;
    id  draggedData;
    BOOL dragFromSource;     // used for reodering
    NSString *scfldid;
    NSMutableArray* srcData;
    NSMutableArray*dstData;
    NSIndexPath*   pathFromDstTable;
    UITableViewCell*draggedCell;
    
    }
@property(strong,nonatomic)NSString *existstring;
@property(strong,nonatomic)NSString *qty;
@property(strong,nonatomic)NSDecimalNumber *sitefactor;
@property(strong,nonatomic)NSDecimalNumber *chightrate;
@property(strong,nonatomic)NSString *desvalue;
@property(weak,nonatomic)id<animatndelegate>delegate;
@property(strong,nonatomic)Scaffoldsubtypemodel  * scfldsubtypemdl;
@property(strong,nonatomic)NewscfldDetails       * newscflddetails;
@property(strong,nonatomic)Scaffoldtypemdl       * sccfldtypemdl;
@property(strong,nonatomic)Customscaffoldingplan * customsccfldmdl;
@property(strong,nonatomic)UISearchBar *searchbar;
@property(strong,nonatomic)NSString *searchstring;

/*variables*/
//@property (nonatomic)double manpwr;
//@property (nonatomic)double dishr;
//@property (nonatomic)double erecrhr;
@property (readwrite)NSDecimalNumber *manpwr;
@property (readwrite)NSDecimalNumber *dishr;
@property (readwrite)NSDecimalNumber *erecrhr;

@property (readwrite)NSInteger btnindx;
@property (readwrite)NSInteger optionidentifier;
@property (readwrite)NSInteger scaffoldtypeindex;

@property (strong, nonatomic)NSString  * planid;
@property (strong, nonatomic)NSString  * Scfldid;
@property (strong, nonatomic)NSString  * len;
@property (strong, nonatomic)NSString  * wid;
@property (strong, nonatomic)NSString  * height;
@property (strong, nonatomic)NSString  * ele;
@property (strong, nonatomic)NSString  * unit;
@property (strong, nonatomic)NSString  * equip;
@property (strong, nonatomic)NSString  * ph;
@property (strong, nonatomic)NSString  * sid;
//@property (strong, nonatomic)NSString  * qty;
@property (strong, nonatomic)NSString  * phaseid;
@property (strong, nonatomic)NSString  * sequenceid;
@property (strong, nonatomic)NSString  * subunit;
@property(readwrite)NSInteger ppecheck;
@property(readwrite)NSInteger  upwcheck;
@property(readwrite)NSInteger  iwfcheck;





     /*Arrays*/
@property (strong, nonatomic)NSMutableArray * Scafldarry;
@property (strong, nonatomic)NSMutableArray * newscfoldtypearry;
@property (strong, nonatomic)NSMutableArray * Maintablescflddetailsarray;
@property (strong, nonatomic)NSMutableArray * scfldsubtypearray;

/*Dicts*/
@property (strong, nonatomic)NSMutableDictionary *subtypdict;
@property (strong, nonatomic)NSMutableDictionary *subtypreversedict;


@property (strong, nonatomic) IBOutlet UINavigationBar * navbar;
@property (strong, nonatomic) IBOutlet UITableView     * subtypetable;
@property (strong, nonatomic) IBOutlet UITableView     * maintable;
@property (strong, nonatomic) IBOutlet UITableViewCell * subtypecell;
@property (strong, nonatomic) IBOutlet UITableViewCell * maintblecell;
@property (strong, nonatomic) IBOutlet UIView          * tuchgview;
@property (strong, nonatomic) IBOutlet UILabel         * scfldtypesublbl;


/*for drag and Drop*/


/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;


/*cell Outlets main cell*/

@property (strong, nonatomic) IBOutlet UILabel * scffoldtypemainlbl;
@property (strong, nonatomic) IBOutlet UILabel * lngtnlbl;
@property (strong, nonatomic) IBOutlet UILabel * widthlbl;
@property (strong, nonatomic) IBOutlet UILabel * heihtlbl;
@property (strong, nonatomic) IBOutlet UILabel * numbrlbl;
@property (strong, nonatomic) IBOutlet UILabel * manhrslbl;
@property (strong, nonatomic) IBOutlet UILabel * ercthrslbl;
@property (strong, nonatomic) IBOutlet UILabel * dismntlehrslbl;


/*xib outlets*/
@property (strong, nonatomic) IBOutlet UILabel  * lengthfld;
@property (strong, nonatomic) IBOutlet UILabel  * widthfld;
@property (strong, nonatomic) IBOutlet UILabel  * hightfld;
@property (strong, nonatomic) IBOutlet UILabel  * elvatnfld;
@property (strong, nonatomic) IBOutlet UIButton * iwfbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton * spfbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton * upwbtnlbl;
@property (strong, nonatomic) IBOutlet UITextView  * Destxtfld;
@property (strong, nonatomic) IBOutlet UITextField * sitefctrfld;


- (IBAction)updatebtn:(id)sender;
- (IBAction)iwfbtn:(id)sender;
- (IBAction)spfbtn:(id)sender;
- (IBAction)upwbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)clsebtn:(id)sender;

@property(strong,nonatomic) NSString *docsDir;
@property(strong,nonatomic) NSArray *dirPaths;
@property(nonatomic,readwrite) sqlite3 *AllscaffoldDB;
@property (strong, nonatomic) NSString *ScaffoldPath;
@property (strong, nonatomic) NSString *lastID;
@property (strong, nonatomic) NSString *Availablityresult;
@property(nonatomic,readwrite) sqlite3 *scaffoldTypeDB;
@property (strong, nonatomic) NSString *scaffoldtypepath;
@property(strong,nonatomic)NSMutableArray *scaffoldtyperesultarray;
@property(strong,nonatomic)NSMutableArray *DBScaffoldarry;

@end
