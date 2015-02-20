//
//  WorkViewController.m
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "WorkViewController.h"

@interface WorkViewController ()

@end

@implementation WorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _worktable.layer.borderWidth=2.0f;
    _worktable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _menuitemarray=[[NSMutableArray alloc]initWithObjects:@"Site visit",@"Plan",@"Resources",@"Feed Back", nil];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self ReadPlanningWorkEntImport];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_popovertableview){
        return [_menuitemarray count];
    }
    else{
        
        return 6;
    }
       return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
       
        if(tableView==_worktable){
        
        [[NSBundle mainBundle]loadNibNamed:@"WorkCell" owner:self options:nil];
        cell=_workcell;
    }
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
     if(tableView==_popovertableview){
         cell.textLabel.text=[_menuitemarray objectAtIndex:indexPath.row];
     }
     else{
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
   // cell.textLabel.text=@"WO0001";
     }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_worktable)
    {
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
            
            
        }
    }
}
#pragma mark-Tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview) {
        if (indexPath.row==0) {

        
                self.SitevisitVCtrl=[[SitevisitViewController alloc]initWithNibName:@"SitevisitViewController" bundle:nil];
                
            _SitevisitVCtrl.companyid=_planid;
                [self dismissViewControllerAnimated:YES completion:^{    [self presentViewController:_SitevisitVCtrl
                                                                                            animated:YES completion:NULL];
                }];
        }
        if (indexPath.row==1) {
            
                self.PlanVCtrl=[[AddplanViewController alloc]initWithNibName:@"AddplanViewController" bundle:nil];
                
              
                [self dismissViewControllerAnimated:YES completion:^{    [self presentViewController:_PlanVCtrl
                                                                                            animated:YES completion:NULL];
                }];

            
                
            
        }
        if (indexPath.row==2) {
            
            self.resVCtrl=[[PResViewController alloc]initWithNibName:@"PResViewController" bundle:nil];
            
            
            [self dismissViewControllerAnimated:YES completion:^{    [self presentViewController:_resVCtrl
                                                                                        animated:YES completion:NULL];
            }];
            
            
            
            
        }

    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Addbtn:(id)sender {
    self.AddWCtrl=[[AddworkViewController alloc]initWithNibName:@"AddworkViewController" bundle:nil];
    
    
  //  _AddWCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
       [self presentViewController:_AddWCtrl
                           animated:YES completion:NULL];
 
}

- (IBAction)disclrebutn:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 132, 130)];
    // popoverView.backgroundColor = [UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 132, 130)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 30;
   // _popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    _popovertableview.separatorColor=[UIColor lightGrayColor];
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    popoverContent.preferredContentSize = CGSizeMake(132, 130);
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.worktable];
    NSIndexPath *textFieldIndexPath = [self.worktable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    //btnindex=textFieldIndexPath.row;
    
    //UITableView *table = (UITableView *)[cell superview];
    self.popovercontroller = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    self.popovercontroller.popoverContentSize=CGSizeMake(132.0f, 130.0f);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_disclurebtn.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}
-(void)ReadPlanningWorkEntImport
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadPlanningWorkEntImport xmlns=\"http://ios.kontract360.com/\">\n"
                  "<PlanIID>%@</PlanIID>\n"
                   "</ReadPlanningWorkEntImport>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadPlanningWorkEntImport" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
#pragma mark - Connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webData length]);
    NSString *theXML = [[NSString alloc] initWithBytes: [_webData mutableBytes] length:[_webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"xml===== %@",theXML);
    
    
    if( _xmlParser )
    {
        
    }
    
    _xmlParser = [[NSXMLParser alloc] initWithData: _webData];
    [_xmlParser setDelegate:(id)self];
    [_xmlParser setShouldResolveExternalEntities: YES];
    [_xmlParser parse];
   
   
   }


@end
