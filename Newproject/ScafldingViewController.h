//
//  ScaffoldingViewController.h
//  Prodektive
//
//  Created by GMSIndia 2 on 18/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDetailsplandisplayViewController.h"

@interface ScafldingViewController : UIViewController<animatndelegate>


@property(strong,nonatomic)AllDetailsplandisplayViewController *allctrl;
- (IBAction)closescaffoldpage:(id)sender;
- (IBAction)next:(id)sender;

@end
