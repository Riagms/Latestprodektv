//
//  PriorityViewController.h
//  Prodektive
//
//  Created by Riya on 2/18/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PriorityViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *prioritytable;

@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;
- (IBAction)clsebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *prioritytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *priorityleveltxtfld;
- (IBAction)updatebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *titleview;

@property (strong, nonatomic) IBOutlet UIView *addview;

- (IBAction)addbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *deletebtn;

/*cell oulets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *prioritycell;
@property (strong, nonatomic) IBOutlet UILabel *prioritylbl;
@property (strong, nonatomic) IBOutlet UILabel *prioritylevellbl;
- (IBAction)editbtn:(id)sender;
- (IBAction)Deletebtn:(id)sender;


@end
