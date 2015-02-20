//
//  SchedulerViewController.m
//  Prodektive
//
//  Created by GMSIndia 2 on 20/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "ShedulerViewController.h"

@interface ShedulerViewController ()

@end

@implementation ShedulerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _schedulartable.layer.borderWidth=3.0;
    _schedulartable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
     _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
     self.addview .backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if(tableView==_schedulartable){
            [[NSBundle mainBundle]loadNibNamed:@"SchedulerCell" owner:self options:nil];
            cell=_schedulercell;
        }
        
        
        
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    
    
    
    return cell;
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addclsebtn:(id)sender {
    _addview.hidden=YES;
}
- (IBAction)Datebtn:(id)sender {
}
- (IBAction)foremanbtn:(id)sender {
}

- (IBAction)updatebtn:(id)sender {
}
- (IBAction)cancel:(id)sender {
}
- (IBAction)addbtn:(id)sender {
    _addview.hidden=NO;
}

- (IBAction)Deletebtn:(id)sender {
}
@end
