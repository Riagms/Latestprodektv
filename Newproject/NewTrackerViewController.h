//
//  NewTrackerViewController.h
//  Prodektive
//
//  Created by Riya on 2/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrakerViewController.h"

@interface NewTrackerViewController : UIViewController


@property (strong, nonatomic)TrakerViewController*TrackVCtrl;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *tracktable;

- (IBAction)clsebtn:(id)sender;

- (IBAction)Addbtn:(id)sender;

- (IBAction)editbtn:(id)sender;


/*cell outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *trackcell;
@property (strong, nonatomic) IBOutlet UILabel *worklbl;
@property (strong, nonatomic) IBOutlet UILabel *planlbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UILabel *starttimelbl;
@property (strong, nonatomic) IBOutlet UILabel *endtimelbl;
@property (strong, nonatomic) IBOutlet UIButton *editbtn;

@end
