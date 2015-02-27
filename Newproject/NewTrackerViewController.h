//
//  NewTrackerViewController.h
//  Prodektive
//
//  Created by Riya on 2/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrakerViewController.h"
#import "Trackmdl.h"

@interface NewTrackerViewController : UIViewController{
       BOOL recordResults;
    UIButton*button;
    NSInteger btnindex;
}
@property (strong, nonatomic)NSString*searchstring;

@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;
@property(strong,nonatomic)NSString*editpath,*workorder, *workorderdesc;

@property (strong, nonatomic)Trackmdl*Trackmdl;
@property (strong, nonatomic)NSMutableArray*Trackarray;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic) IBOutlet UILabel *workedhrslbl;


@property (strong, nonatomic)TrakerViewController*TrackVCtrl;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *tracktable;



/*cell outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *trackcell;
@property (strong, nonatomic) IBOutlet UILabel *worklbl;
@property (strong, nonatomic) IBOutlet UILabel *planlbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UILabel *starttimelbl;
@property (strong, nonatomic) IBOutlet UILabel *endtimelbl;
//@property (strong, nonatomic) IBOutlet UIButton *editbtn;


@property (strong, nonatomic) IBOutlet UILabel *delaylbl;

- (IBAction)clsebtn:(id)sender;

- (IBAction)Addbtn:(id)sender;

- (IBAction)editbtn:(id)sender;
@end
