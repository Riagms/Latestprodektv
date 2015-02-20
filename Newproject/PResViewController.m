//
//  PResViewController.m
//  Prodektive
//
//  Created by Riya on 2/18/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "PResViewController.h"

@interface PResViewController ()

@end

@implementation PResViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    //_titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    self.crewview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.resurceview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _crewbtnlbl.tintColor=[UIColor whiteColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)equipmentbtnlbl:(id)sender {
}

- (IBAction)thirdbtnlbl:(id)sender {
}

- (IBAction)closeresources:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)resucebt:(id)sender {
   
}

- (IBAction)crewdeletebtn:(id)sender {
}

- (IBAction)crewbtn:(id)sender {
    
     _crewview.hidden=NO;
    _resurceview.hidden=YES;
    
    _crewbtnlbl.tintColor=[UIColor whiteColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    
}

- (IBAction)manbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
    _manpowerbtn.tintColor=[UIColor whiteColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)equbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor whiteColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)matbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    
    _crewbtnlbl.tintColor=[UIColor blackColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor whiteColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
}

- (IBAction)fleetbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor whiteColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
}

- (IBAction)thirdbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor whiteColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
}

- (IBAction)consubtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor whiteColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
}

- (IBAction)Smallbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor whiteColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
}

- (IBAction)Safetybtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor whiteColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
}

- (IBAction)othersbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor whiteColor];

}
@end
