//
//  WorKTrackViewController.h
//  Prodektive
//
//  Created by Riya on 2/25/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Schedulermdl.h"
#import "TrakerViewController.h"

@interface WorKTrackViewController : UIViewController{
    UIButton*button;
    NSInteger   btnindex;
     BOOL recordResults;
}
@property (strong, nonatomic)NSString*planid,*workorder;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic)TrakerViewController*TrackVCtrl;
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;

@property (strong, nonatomic) Schedulermdl*workmdl;
@property (strong, nonatomic)NSMutableArray *workorderarray,*menuarray;

@property (strong, nonatomic) IBOutlet UITableView *worktable;
@property (strong, nonatomic) IBOutlet UIView *titleview;

- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *workcell;

@property (strong, nonatomic) IBOutlet UILabel *worklbl;
@property (strong, nonatomic) IBOutlet UILabel *plantlbl;

@property (strong, nonatomic) IBOutlet UILabel *sublbl;
@property (strong, nonatomic) IBOutlet UILabel *equipment;
@property (strong, nonatomic) IBOutlet UILabel *deftaglbl;
- (IBAction)disclurebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *disclurebtn;
@property (strong, nonatomic) IBOutlet UILabel *allocatedhrslbl;
@property (strong, nonatomic) IBOutlet UILabel *usedhrslbl;
- (IBAction)addbtn:(id)sender;
- (IBAction)editbtn:(id)sender;


@end
