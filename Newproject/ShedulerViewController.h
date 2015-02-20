//
//  SchedulerViewController.h
//  Prodektive
//
//  Created by GMSIndia 2 on 20/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShedulerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *titleview;
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *schedulartable;
@property (strong, nonatomic) IBOutlet UITableViewCell *schedulercell;

@property (strong, nonatomic) IBOutlet UIView *addview;

- (IBAction)addclsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *wrkordrtxtfld;
@property (strong, nonatomic) IBOutlet UIButton *datetxtfld;
- (IBAction)Datebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *foremanbtnlbl;
- (IBAction)foremanbtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;
- (IBAction)cancel:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Cancelbtnlbl;
@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;

- (IBAction)addbtn:(id)sender;

- (IBAction)Deletebtn:(id)sender;


@end
