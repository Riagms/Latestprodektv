//
//  InsulationViewController.h
//  Prodektive
//
//  Created by Riya on 3/4/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InsulatnMdl.h"
#import "Validation.h"
#import "Insubtypemdl.h"

@interface InsulationViewController : UIViewController{
      BOOL recordResults;
    NSInteger poptype,btnindfr,subcheck,subbtnIndex,webtype,otherbtnindex,barbtntype;
    NSString*typestrg,*msgstrg,*Insutnid;
    
    UIButton *button;
    NSInteger btnclck,removecheck,optnidntfr,newbtnindx,webbingtype;
    
}
@property(strong,nonatomic)Insubtypemdl *Subtypemdl;
@property (readwrite)NSInteger btntype;
@property(strong,nonatomic)NSMutableDictionary*Typedict;
@property(strong,nonatomic)NSMutableDictionary*pipedict;
@property(strong,nonatomic)NSMutableDictionary*layerdict;
@property(strong,nonatomic)NSMutableDictionary*insultndict;
@property(strong,nonatomic)NSMutableDictionary*streamdict;
@property(strong,nonatomic)NSMutableDictionary*phasedict;
@property(strong,nonatomic)NSMutableDictionary*sequencedict;
@property(strong,nonatomic)NSMutableDictionary*modedict;
@property(strong,nonatomic)NSMutableDictionary*subtypedict;
@property(strong,nonatomic)NSMutableDictionary*revsubtypedict;
@property(strong,nonatomic)NSMutableDictionary*sizedict;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIViewController*popoverContent;

@property(strong,nonatomic)UITableView *popOverTableView;


@property (strong, nonatomic)InsulatnMdl*Insmdl;
@property (strong, nonatomic) NSMutableArray*insultnarray;
@property (strong, nonatomic) NSMutableArray*SubtypeArray;
@property (strong, nonatomic) NSMutableArray*HeatArray;
@property (strong, nonatomic) NSMutableArray*ModeArray;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *subtypebtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *otherbtnlbl;

- (IBAction)clsebtn:(id)sender;
- (IBAction)subtypebtn:(id)sender;
- (IBAction)otherbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *unittxtfld;
@property (strong, nonatomic) IBOutlet UITextField *subunittxtfld;
@property (strong, nonatomic) IBOutlet UITextField *equpmnttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *phtxtfld;
@property (strong, nonatomic) IBOutlet UIButton *typebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *pipebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *layerbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *inslutnbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *linearbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *phasebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *sequbtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *streambtnlbl;

- (IBAction)typebtn:(id)sender;

- (IBAction)pipebtn:(id)sender;

- (IBAction)layerbtn:(id)sender;
- (IBAction)insultnbtn:(id)sender;
- (IBAction)phasebtn:(id)sender;
- (IBAction)sequencebtn:(id)sender;

- (IBAction)streambtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)newbtn:(id)sender;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*subtype outlets*/
@property (strong, nonatomic) IBOutlet UIView *subtypeview;

@property (strong, nonatomic) IBOutlet UIView *subtitle;
@property (strong, nonatomic) IBOutlet UITableView *subtable;

/*Other outlets*/
@property (strong, nonatomic) IBOutlet UIView *Otherview;
@property (strong, nonatomic) IBOutlet UIView *othertitle;
@property (strong, nonatomic) IBOutlet UITableView *othertable;
- (IBAction)Insptnportbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *insptnbtnlbl;

- (IBAction)personalbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *personalbtnlbl;

@property (strong, nonatomic) IBOutlet UITableViewCell *subcell;
@property (strong, nonatomic) IBOutlet UIButton *checkbtn;
@property (strong, nonatomic) IBOutlet UILabel *sublbl;

@property (strong, nonatomic) IBOutlet UILabel *quntylbl;
@property (strong, nonatomic) IBOutlet UIButton *subedit;

@property (strong, nonatomic) IBOutlet UITextField *subtypetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *quntytxtfld;
- (IBAction)subeditbtn:(id)sender;


- (IBAction)subupdatebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *subeditview;
- (IBAction)subclsebtn:(id)sender;

- (IBAction)subcheckbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *subcheckbtnlbl;


@property (strong, nonatomic) IBOutlet UIButton *othercheckbtnlbl;

- (IBAction)othercheckbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *otherlbl;

@property (strong, nonatomic) IBOutlet UITableViewCell *othercell;


@property (strong, nonatomic) IBOutlet UILabel *subtypetitlelbl;
@property (strong, nonatomic) IBOutlet UILabel *lineartitlelbl;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *heatbtnlbl;
- (IBAction)heatbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *heatview;
@property (strong, nonatomic) IBOutlet UITableView *heattable;
@property (strong, nonatomic) IBOutlet UIView *heattitle;

@property (strong, nonatomic) IBOutlet UILabel *modelbl;
@property (strong, nonatomic) IBOutlet UILabel *heatdescptnlbl;

@property (strong, nonatomic) IBOutlet UILabel *heatquantylbl;
@property (strong, nonatomic) IBOutlet UITableViewCell *heatcell;
- (IBAction)Addheat:(id)sender;

- (IBAction)heatclsebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *modebtnlbl;
- (IBAction)modebtn:(id)sender;
- (IBAction)Hsubtypebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *heatsubtypebtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *heatquntytxtfld;
- (IBAction)heatupdatebtn:(id)sender;

- (IBAction)cancelbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *heataddview;
@property (strong, nonatomic) IBOutlet UIButton *remveckbtnlbl;
- (IBAction)remvechckbtn:(id)sender;
- (IBAction)heateditbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *wraptitle;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *wrapbtnlbl;
- (IBAction)wrapbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *wsublbl;
@property (strong, nonatomic) IBOutlet UILabel *wmodelbl;
@property (strong, nonatomic) IBOutlet UILabel *wqtylbl;

@property (strong, nonatomic) IBOutlet UILabel *wsizelbl;
- (IBAction)weditbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *wcell;

@property (strong, nonatomic) IBOutlet UILabel *sizelbl;
- (IBAction)wsizebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *wrapsizebtn;

- (IBAction)wrapaddbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;
@property (strong, nonatomic) IBOutlet UIButton *heatcancelbtnlbl;

@property (strong, nonatomic) IBOutlet UINavigationItem *heatnavtitle;


@end
