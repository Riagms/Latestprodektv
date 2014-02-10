//
//  ProcesshrViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 2/10/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Section.h"
#import "Empdetails.h"
#import "DetailproHrViewController.h"
#import "Processsectionheaderview.h"
@interface ProcesshrViewController : UIViewController<ProcesssectionheaderviewDelegate>{
    BOOL   recordResults;
    NSInteger selectedsectn;
}
@property(strong,nonatomic)Empdetails*empdetl;

@property (nonatomic, assign) NSInteger openSectionIndex;
@property (nonatomic, assign) NSInteger openviewIndex;
@property(strong,nonatomic)DetailproHrViewController *DetailproVCtrl;

/*views*/
@property (strong, nonatomic) IBOutlet UINavigationBar *titleview;

/*strings*/
@property (strong, nonatomic)NSString *imgString;
@property (strong, nonatomic)NSString *empskillid;

/*arrays &Dictionaries*/
@property (strong, nonatomic)NSMutableArray *newprocesssarray;
@property (strong, nonatomic)NSMutableArray *empnameArray;
@property (strong, nonatomic)NSMutableArray *sectionArray;
@property (strong, nonatomic)NSMutableDictionary *SkillDict;

/*Table*/
@property (strong, nonatomic) IBOutlet UITableView *processtable;

/*searchbar*/
@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;
@property (strong, nonatomic) NSString *searchstring;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;

/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;






/*buttons*/
- (IBAction)prcessclsebtn:(id)sender;

@end
