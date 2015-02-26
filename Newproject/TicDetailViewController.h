//
//  TicDetailViewController.h
//  Prodektive
//
//  Created by Riya on 2/25/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSManpwrmdl.h"
#import "TSOtherMdl.h"
@interface TicDetailViewController : UIViewController{
     BOOL recordResults;
    NSInteger btnidf;
}
@property (strong, nonatomic) IBOutlet UIView *manpwrview;
@property (strong, nonatomic) IBOutlet UITableViewCell *manpwrcell;
@property (strong, nonatomic) IBOutlet UITableViewCell *othercell;
@property(strong,nonatomic)NSMutableArray*manpwrarry;
@property(strong,nonatomic)NSMutableArray*otherarray;
@property(strong,nonatomic)TSManpwrmdl*Manpwrmdl;
@property(strong,nonatomic)TSOtherMdl*Othermdl;
@property(strong,nonatomic)NSString *planid,*workorder;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic) IBOutlet UIButton *clsebtn;

@property (strong, nonatomic) IBOutlet UIView *otherview;

@property (strong, nonatomic) IBOutlet UITableView *othertable;

@property (strong, nonatomic) IBOutlet UITableView *manpwertable;
@property (strong, nonatomic) IBOutlet UIView *title1;
@property (strong, nonatomic) IBOutlet UIView *title2;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *manpowerbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *materialsbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *fleetbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *thirdpartybtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *equmntbutnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *consumblebtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *smallbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *safetybtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *otherbtnlbl;

- (IBAction)crewbtn:(id)sender;
- (IBAction)clsebutn:(id)sender;
- (IBAction)equipmntbtn:(id)sender;
- (IBAction)mtbtn:(id)sender;
- (IBAction)ftbtn:(id)sender;
- (IBAction)tpbtn:(id)sender;
- (IBAction)cobtn:(id)sender;
- (IBAction)smbtn:(id)sender;

- (IBAction)sfbtn:(id)sender;
- (IBAction)ocbtn:(id)sender;

/* Manpower cell Outlets*/
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
- (IBAction)otherupdatebtn:(id)sender;
@end
