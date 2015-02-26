//
//  PriorityViewController.h
//  Prodektive
//
//  Created by Riya on 2/18/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "prioritymodel.h"
#import "Validation.h"

@interface PrirityViewController : UIViewController
{
    BOOL recordResults;
    NSInteger optionidentifier;
    UIButton *button;
    NSInteger btnindex;
    NSInteger deleteindex;

}
@property(strong,nonatomic)NSString *result;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;
@property(strong,nonatomic)prioritymodel *pmdl;
@property(strong,nonatomic)Validation *val;
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
@property (strong, nonatomic) IBOutlet UIButton *updatebtn;

/*cell oulets*/
@property(strong,nonatomic)NSMutableArray *priorityarray;
@property (strong, nonatomic) IBOutlet UITableViewCell *prioritycell;
@property (strong, nonatomic) IBOutlet UILabel *prioritylbl;
@property (strong, nonatomic) IBOutlet UILabel *prioritylevellbl;
- (IBAction)editbtn:(id)sender;
- (IBAction)Deletebtn:(id)sender;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@end
