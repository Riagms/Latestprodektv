//
//  TrackerViewController.h
//  Prodektive
//
//  Created by GMSIndia 2 on 20/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrakerViewController : UIViewController
{
    
}

@property (strong, nonatomic) IBOutlet UIButton *clsebtn;

- (IBAction)closebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *wrktxtlbl;
//@property (strong, nonatomic) IBOutlet UITextField *foremanbtnlbl;

//- (IBAction)foremanbtn:(id)sender;

//- (IBAction)jobidbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *datebtnlbl;

- (IBAction)datebtn:(id)sender;
- (IBAction)starttimebtn:(id)sender;
- (IBAction)endtimebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *starttimebtnlbl;

@end
