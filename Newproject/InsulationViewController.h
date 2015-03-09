//
//  InsulationViewController.h
//  Prodektive
//
//  Created by Riya on 3/4/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InsulatnMdl.h"

@interface InsulationViewController : UIViewController{
      BOOL recordResults;
    NSInteger poptype,btnindfr;
    NSString*typestrg,*msgstrg;
}
@property (readwrite)NSInteger btntype;
@property(strong,nonatomic)NSMutableDictionary*Typedict;
@property(strong,nonatomic)NSMutableDictionary*pipedict;
@property(strong,nonatomic)NSMutableDictionary*layerdict;
@property(strong,nonatomic)NSMutableDictionary*insultndict;
@property(strong,nonatomic)NSMutableDictionary*streamdict;
@property(strong,nonatomic)NSMutableDictionary*phasedict;
@property(strong,nonatomic)NSMutableDictionary*sequencedict;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIViewController*popoverContent;

@property(strong,nonatomic)UITableView *popOverTableView;


@property (strong, nonatomic)InsulatnMdl*Insmdl;
@property (strong, nonatomic) NSMutableArray*insultnarray;
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




@end
