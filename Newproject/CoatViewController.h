//
//  CoatViewController.h
//  Prodektive
//
//  Created by Riya on 3/26/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoatMdl.h"
#import "Valvemdl.h"

@interface CoatViewController : UIViewController
{
     BOOL recordResults;
    NSInteger poptype,lead,floating,spray,btnindex,valuecheck,factorcheck;
    NSString*typestrg,*surfaceid,*coatingid;
    UIButton*button;
    
}
@property(readwrite)NSInteger btntype;
@property(strong,nonatomic)CoatMdl*cmdl;
@property(strong,nonatomic)Valvemdl*valmdl;

@property(strong,nonatomic)NSMutableArray*CoatingArray;
@property(strong,nonatomic)NSMutableArray*ValveArray;
@property(strong,nonatomic)NSMutableArray*factorArray;


@property(strong,nonatomic)NSMutableDictionary*phasedict;
@property(strong,nonatomic)NSMutableDictionary*sequencedict;
@property(strong,nonatomic)NSMutableDictionary*typedict;
@property(strong,nonatomic)NSMutableDictionary*Retypedict;
@property(strong,nonatomic)NSMutableDictionary*surfacedict;
@property(strong,nonatomic)NSMutableDictionary*surfacesubdict;
@property(strong,nonatomic)NSMutableDictionary*thicknessdict;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIViewController*popoverContent;
@property(strong,nonatomic)UITableView *popOverTableView;

/*Outlets*/
@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UITextField *planttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *subtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *equtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *phtxtfld;
@property (strong, nonatomic) IBOutlet UIButton *phasebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *sequncebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *typebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *surfacebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *surfsubbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *thicknessbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *sqfttxtfld;
@property (strong, nonatomic) IBOutlet UIButton *leadcheckbtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *floatingcheckbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *noncheckbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;


- (IBAction)navbtn:(id)sender;
- (IBAction)phasebtn:(id)sender;
- (IBAction)seqbtn:(id)sender;

- (IBAction)typebtn:(id)sender;
- (IBAction)surfcebtn:(id)sender;
- (IBAction)surfsubbtn:(id)sender;

- (IBAction)thickbtn:(id)sender;
- (IBAction)leadbtn:(id)sender;
- (IBAction)floatbtn:(id)sender;
- (IBAction)spraybtn:(id)sender;
- (IBAction)updatebtn:(id)sender;

/*Tab Outlets*/

- (IBAction)valvebtn:(id)sender;
- (IBAction)Factrbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *valvecell;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *valuesbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *factrbtnlbl;

@property (strong, nonatomic) IBOutlet UIView *valvestitleview;

@property (strong, nonatomic) IBOutlet UIView *valveseditview;

@property (strong, nonatomic) IBOutlet UITextField *valvestxtfld;
@property (strong, nonatomic) IBOutlet UITextField *Vqtytxtfld;

- (IBAction)Vupdatebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Vupdatebtnlbl;

- (IBAction)vclsebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *vcheckbtnlbl;
@property (strong, nonatomic) IBOutlet UILabel *otherfactrlbl;
@property (strong, nonatomic) IBOutlet UILabel *quntylbl;

- (IBAction)vcheckbtn:(id)sender;
- (IBAction)veditbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *valveview;
@property (strong, nonatomic) IBOutlet UITableView *valvetable;

@property (strong, nonatomic) IBOutlet UIView *otherfactrview;

@property (strong, nonatomic) IBOutlet UITableView *factrtable;
@property (strong, nonatomic) IBOutlet UIView *factrtitleview;

@property (strong, nonatomic) IBOutlet UITableViewCell *factorcell;
@property (strong, nonatomic) IBOutlet UIButton *factrcheckbtnlbl;
- (IBAction)factrchckbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *otherlbl;

@end
