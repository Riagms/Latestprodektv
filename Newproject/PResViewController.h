//
//  PResViewController.h
//  Prodektive
//
//  Created by Riya on 2/18/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PResViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *resurcebtnlbl;


@property (strong, nonatomic) IBOutlet UITableView *Crewtable;

@property (strong, nonatomic) IBOutlet UITableView *crewdroptable;

@property (strong, nonatomic) IBOutlet UIView *crewview;
@property (strong, nonatomic) IBOutlet UIView *resurceview;
@property (strong, nonatomic) IBOutlet UITableView *resurcetable;

@property (strong, nonatomic) IBOutlet UITableView *resurcedroptable;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *crewbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *manpowerbtn;
//- (IBAction)equipmentbtnlbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *materialsbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *fleetbtnlbl;
//- (IBAction)thirdbtnlbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *thirdpartybtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *equmntbutnlbl;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *consumblebtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *smallbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *safetybtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *otherbtnlbl;



- (IBAction)closeresources:(id)sender;
- (IBAction)resucebt:(id)sender;
- (IBAction)crewdeletebtn:(id)sender;
- (IBAction)crewbtn:(id)sender;

- (IBAction)manbtn:(id)sender;
- (IBAction)equbtn:(id)sender;
- (IBAction)matbtn:(id)sender;
- (IBAction)fleetbtn:(id)sender;
- (IBAction)thirdbtn:(id)sender;
- (IBAction)consubtn:(id)sender;
- (IBAction)Smallbtn:(id)sender;
- (IBAction)Safetybtn:(id)sender;
- (IBAction)othersbtn:(id)sender;

/*cell outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *crewdropcell;
@property (strong, nonatomic) IBOutlet UITableViewCell *Resourcedragcell;
@property (strong, nonatomic) IBOutlet UITableViewCell *resourcedropcell;



@end
