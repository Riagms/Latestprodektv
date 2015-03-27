//
//  AddplanViewController.h
//  KontractWorkOrder
//
//  Created by Riya on 1/28/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScafldingViewController.h"
#import "Servicemdl.h"
#import "Customscaffoldingplan.h"
#import "Workordrmdl.h"
#import "InsulationViewController.h"
#import "InsulatnMdl.h"
#import "CoatMdl.h"
#import "CoatViewController.h"
#import "Asbetosmdl.h"
@interface AddplanViewController : UIViewController
{
    UINavigationController *modalViewNavController;
    UIButton *button;
    NSInteger btnindex,droptype;
    BOOL recordResults;
    NSInteger path;
}

@property (strong, nonatomic)InsulatnMdl*Insmdl;
@property (strong, nonatomic)Asbetosmdl*Asmdl;

@property (strong, nonatomic)NSMutableArray*InsultnArray;
@property (strong, nonatomic)NSMutableArray*AsbetosArray;



@property(strong,nonatomic)NSString *searchstring;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)Customscaffoldingplan *scfldmdl;
@property(strong,nonatomic)InsulationViewController*insultnVctrl;
@property(strong,nonatomic)CoatViewController*CoatVCtrl;
@property(strong,nonatomic)Workordrmdl *work;

@property(readwrite)NSInteger optionidentifier;
@property(readwrite)NSDecimalNumber *sitefactor;
@property(strong,nonatomic)Servicemdl *servmdl;
@property(strong,nonatomic)NSString *workorderid;
@property(strong,nonatomic)NSString *worktypeid;
@property(strong,nonatomic)NSString *planid;
@property(strong,nonatomic)NSString *servid;
@property(strong,nonatomic)ScafldingViewController *scaffoldctrl;
- (IBAction)clsebtn:(id)sender;
- (IBAction)serviceselection:(id)sender;
@property(strong,nonatomic)IBOutlet UIPopoverController *popoverctrlr;
@property(strong,nonatomic)IBOutlet UITableView *PopOvertableview;
@property(strong,nonatomic)IBOutlet UITableViewCell *scaffoldcell;
@property (strong, nonatomic) IBOutlet UIView *scafoldtitle;
@property(strong,nonatomic)IBOutlet UITableView *scaffoldtable;
@property (strong, nonatomic) IBOutlet UITextView *detailstextview;
@property (strong, nonatomic) IBOutlet UITextView *Workperformtextview;
@property (strong, nonatomic) IBOutlet UIButton *servicebtn;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
- (IBAction)addscaffoldaction:(id)sender;
- (IBAction)update:(id)sender;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)NSString *skillstring;
@property(strong,nonatomic)NSMutableDictionary *subtypelistdictionary;
@property(strong,nonatomic)NSMutableArray *Subtypelistarray;
@property(strong,nonatomic)NSMutableArray *scaffoldingplanlistarray;
@property(strong,nonatomic)NSMutableArray *workorderarray;
@property(strong,nonatomic)IBOutlet UILabel *unitcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *equipcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *pjctheadercelllabel;
@property(strong,nonatomic)IBOutlet UILabel *scaffoldcellalbel;
@property(strong,nonatomic)IBOutlet UILabel *lengthcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *heightcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *widthcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *quantitycelllabel;
@property(strong,nonatomic)IBOutlet UILabel *elevationcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *manhourslabel;
@property(strong,nonatomic)IBOutlet UILabel *desmanitilehourslabel;
@property(strong,nonatomic)IBOutlet UILabel *erecthourslabel;


/*Insulation outlets*/
@property (strong, nonatomic) IBOutlet UIView *institleview;
- (IBAction)insultnaddbtn:(id)sender;
- (IBAction)insultneditbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableViewCell *insultncell;

@property (strong, nonatomic) IBOutlet UILabel *Iunitlbl;
@property (strong, nonatomic) IBOutlet UILabel *Iequmntlbl;
@property (strong, nonatomic) IBOutlet UILabel *Iphlbl;
@property (strong, nonatomic) IBOutlet UILabel *Isubunitlbl;
@property (strong, nonatomic) IBOutlet UILabel *Itypelbl;

@property (strong, nonatomic) IBOutlet UILabel *Ipipelbl;
@property (strong, nonatomic) IBOutlet UILabel *Ilayerlbl;

@property (strong, nonatomic) IBOutlet UILabel *Iinsultnlbl;
@property (strong, nonatomic) IBOutlet UILabel *Imanlbl;
@property (strong, nonatomic) IBOutlet UILabel *Ilinearlbl;
/*Coating Outlets*/
@property (strong, nonatomic) CoatMdl*coatgmdl;
@property (strong, nonatomic) IBOutlet UIView *coatgview;
- (IBAction)coatgaddbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *Cplantlbl;
@property (strong, nonatomic) IBOutlet UILabel *Cequptlbl;
@property (strong, nonatomic) IBOutlet UILabel *Cphlbl;
@property (strong, nonatomic) IBOutlet UILabel *Csublbl;
@property (strong, nonatomic) IBOutlet UITableViewCell *coatcell;
@property (strong, nonatomic)NSMutableArray*Coatgarray;
- (IBAction)Ceditbtn:(id)sender;

/*asbestos outlets*/
@property (strong, nonatomic) IBOutlet UIView *asbestosview;

@property (strong, nonatomic) IBOutlet UILabel *Aplantlbl;
@property (strong, nonatomic) IBOutlet UILabel *Aequlbl;

@property (strong, nonatomic) IBOutlet UILabel *Aphlbl;
@property (strong, nonatomic) IBOutlet UILabel *Asublbl;
@property (strong, nonatomic) IBOutlet UILabel *Atypelbl;
@property (strong, nonatomic) IBOutlet UILabel *Apipelbl;
@property (strong, nonatomic) IBOutlet UILabel *Alayerlbl;
@property (strong, nonatomic) IBOutlet UILabel *Amanlbl;

- (IBAction)editbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableViewCell *asbtoscell;

@end
