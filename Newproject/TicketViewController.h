//
//  TicketViewController.h
//  Prodektive
//
//  Created by Riya on 2/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKCalendarView.h"
#import "TicDetailViewController.h"
#import "Schedulermdl.h"
#import "TrakerViewController.h"
@interface TicketViewController : UIViewController{
    BOOL recordResults;
    NSString *selcteddate,*foremanid;
    UIButton*button;
    
}

@property(strong,nonatomic)NSMutableDictionary *foremandict;
@property(strong,nonatomic)NSMutableDictionary *Revforemandict;
@property(strong,nonatomic)Schedulermdl*schmdl;
@property (strong, nonatomic)TrakerViewController*TrackVCtrl;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableArray *ticketarray;

@property (strong, nonatomic)TicDetailViewController*TicVCtrl;
/*calendar*/
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
@property(strong,nonatomic)NSString*planid;
/*cell outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *ticketcell;
@property (strong, nonatomic) IBOutlet UILabel *workordrlbl;
@property (strong, nonatomic) IBOutlet UILabel *plantlbl;
@property (strong, nonatomic) IBOutlet UILabel *subunitlbl;
@property (strong, nonatomic) IBOutlet UILabel *equipmntlbl;
@property (strong, nonatomic) IBOutlet UILabel *deftaglbl;
@property (strong, nonatomic) IBOutlet UILabel *foremanlbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *tickettable;
@property (strong, nonatomic) IBOutlet UIButton *datebtnlbl;
- (IBAction)disclurebtn:(id)sender;
- (IBAction)Datebtn:(id)sender;
- (IBAction)clsebtn:(id)sender;

- (IBAction)foremanbtnlbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *formanbtn;

@end
