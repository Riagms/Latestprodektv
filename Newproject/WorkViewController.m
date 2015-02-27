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
    _menuitemarray=[[NSMutableArray alloc]initWithObjects:@"Site visit",@"Plan",@"Resources", nil];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate=(id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.worktable.tableHeaderView=_searchbar;
    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchctrlr.searchResultsDelegate=(id)self;
    searchctrlr.searchResultsDataSource=(id)self;
    searchctrlr.delegate=(id)self;

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
        
        return [_workorderarray count];
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
         _workmdl=(Workordrmdl*)[_workorderarray objectAtIndex:indexPath.row];
         _worknolabel=(UILabel*)[cell viewWithTag:1];
         _worknolabel.text=_workmdl.WorkNo;
         _planlabel=(UILabel*)[cell viewWithTag:2];
         _planlabel.text=_workmdl.plant;
         _subunitlabel=(UILabel*)[cell viewWithTag:3];
         _subunitlabel.text=_workmdl.subunit;
         _equiplabel=(UILabel*)[cell viewWithTag:4];
         _equiplabel.text=_workmdl.equipmet;
         _deftaglabel=(UILabel*)[cell viewWithTag:5];
         _deftaglabel.text=_workmdl.defTag;
         _prioritylabel=(UILabel*)[cell viewWithTag:6];
         _prioritylabel.text=_workmdl.priorityname;
         _reqdatelabel=(UILabel*)[cell viewWithTag:7];
         _reqdatelabel.text=_workmdl.reqDate;
         _appdatelabel=(UILabel*)[cell viewWithTag:8];
         _appdatelabel.text=_workmdl.apprDate;
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
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        deleteindex=indexPath.row;
        
        [self DestroyPlanningWorkorder];
        [_workorderarray removeObject:indexPath];
    }
    
}
#pragma mark-Tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview) {
        if (indexPath.row==0) {

         Workordrmdl*workmdl=(Workordrmdl *)[_workorderarray objectAtIndex:btnindex];
                self.SitevisitVCtrl=[[SitevisitViewController alloc]initWithNibName:@"SitevisitViewController" bundle:nil];
                
            _SitevisitVCtrl.companyid=_planid;
            _SitevisitVCtrl.workorderid=workmdl.WorkNo;
            _SitevisitVCtrl.companyname=_companyname;
                [self dismissViewControllerAnimated:YES completion:^{    [self presentViewController:_SitevisitVCtrl
                                                                                            animated:YES completion:NULL];
                }];
        }
        if (indexPath.row==1) {
             Workordrmdl*workmdl=(Workordrmdl *)[_workorderarray objectAtIndex:btnindex];
                self.PlanVCtrl=[[AddplanViewController alloc]initWithNibName:@"AddplanViewController" bundle:nil];
            _PlanVCtrl.workorderid=workmdl.WorkNo;
            _PlanVCtrl.planid=_planid;
            _PlanVCtrl.worktypeid=_worktypeid;
            _PlanVCtrl.sitefactor=_sitefactor;
          
          
            NSMutableArray *array1=[[NSMutableArray alloc]init];
            [array1 addObject:workmdl];
            _PlanVCtrl.planid=_planid;
            _PlanVCtrl.workorderarray=array1;

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
- (IBAction)editbtn:(id)sender
{
    _optiontype=2;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    
   
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.worktable];
    NSIndexPath *textFieldIndexPath = [self.worktable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    Workordrmdl*work=(Workordrmdl *)[_workorderarray objectAtIndex:textFieldIndexPath.row];
    self.AddWCtrl=[[AddworkViewController alloc]initWithNibName:@"AddworkViewController" bundle:nil];
    NSMutableArray *array1=[[NSMutableArray alloc]init];
    [array1 addObject:work];
    _AddWCtrl.planid=_planid;
    _AddWCtrl.workarray=array1;
    _AddWCtrl.optiontype=_optiontype;
    //  _AddWCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_AddWCtrl
                       animated:YES completion:NULL];

}
- (IBAction)Deletebtn:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_worktable setEditing:NO animated:NO];
        [_worktable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_worktable setEditing:YES animated:YES];
        [_worktable reloadData];
        
    }

}

- (IBAction)Addbtn:(id)sender {
    self.AddWCtrl=[[AddworkViewController alloc]initWithNibName:@"AddworkViewController" bundle:nil];
    
    _AddWCtrl.planid=_planid;
    _AddWCtrl.optiontype=1;
  //  _AddWCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
       [self presentViewController:_AddWCtrl
                           animated:YES completion:NULL];
 
}

- (IBAction)disclrebutn:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 132, 85)];
    // popoverView.backgroundColor = [UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 132, 85)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 30;
   // _popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    _popovertableview.separatorColor=[UIColor lightGrayColor];
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    popoverContent.preferredContentSize = CGSizeMake(132, 85);
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.worktable];
    NSIndexPath *textFieldIndexPath = [self.worktable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    //UITableView *table = (UITableView *)[cell superview];
    self.popovercontroller = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    self.popovercontroller.popoverContentSize=CGSizeMake(132.0f, 85.0f);
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
                   "</soap:Envelope>\n",[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
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
-(void)DestroyPlanningWorkorder
{
    recordResults = FALSE;
    NSString *soapMessage;
      Workordrmdl*work=(Workordrmdl *)[_workorderarray objectAtIndex:deleteindex];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DestroyPlanningWorkorder xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "</DestroyPlanningWorkorder>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[work.workorderid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/DestroyPlanningWorkorder" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SearchPlanningWorkEntImport
{
    // webtype=1;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<SearchPlanningWorkEntImport xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchPlanningWorkEntImport>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SearchPlanningWorkEntImport" forHTTPHeaderField:@"Soapaction"];
    
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
    [_worktable reloadData];
   
   }

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ReadPlanningWorkEntImportResponse"])
    {
        
        _workorderarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SearchPlanningWorkEntImportResponse"])
    {
        
        _workorderarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"menunamework"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"EntryId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"plan"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"WorkNo"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"priority"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"plant"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"subunit"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"equipmet"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"outage"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

      if([elementName isEqualToString:@"clearence"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"defTag"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"space"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"reqBy"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"apprBy"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"reqDate"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"apprDate"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"description"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"userD1"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"userD2"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"priorityname"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"DestroyPlanningWorkorderResponse"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }




}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
    if( recordResults )
        
    {
        [_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"menunamework"])
    {
        recordResults = FALSE;
        
        _workmdl=[[Workordrmdl alloc]init];
        _workmdl.menunamework=_soapResults;
        
        _soapResults=nil;

        
          }
    
    if([elementName isEqualToString:@"EntryId"])
    {
        recordResults = FALSE;
        
        
        _workmdl.workorderid=_soapResults;
        
        _soapResults=nil;

        
           }
    
    if([elementName isEqualToString:@"plan"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.plan=_soapResults;
        
        _soapResults=nil;
       
    }
    
    if([elementName isEqualToString:@"WorkNo"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.WorkNo=_soapResults;
        
        _soapResults=nil;
        
    }
    
    if([elementName isEqualToString:@"priority"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.priority=_soapResults;
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"plant"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.plant=_soapResults;
        
        _soapResults=nil;
        
    }
    
    if([elementName isEqualToString:@"subunit"])
    {
        recordResults = FALSE;
        
        
        _workmdl.subunit=_soapResults;
        
        _soapResults=nil;
           }
    
    if([elementName isEqualToString:@"equipmet"])
    {
        recordResults = FALSE;
        
        
        _workmdl.equipmet=_soapResults;
        
        _soapResults=nil;
     
    }
    if([elementName isEqualToString:@"outage"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.outage=_soapResults;
        
        _soapResults=nil;
           }
    
    if([elementName isEqualToString:@"clearence"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.clearence=_soapResults;
        
        _soapResults=nil;
       
    }
    if([elementName isEqualToString:@"space"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.space=_soapResults;
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"defTag"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.defTag=_soapResults;
        
        _soapResults=nil;
        
    }


    if([elementName isEqualToString:@"reqBy"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.reqBy=_soapResults;
        
        _soapResults=nil;
          }
    if([elementName isEqualToString:@"apprBy"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.apprBy=_soapResults;
        
        _soapResults=nil;
    }

       if([elementName isEqualToString:@"reqDate"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.reqDate=_soapResults;
        
        _soapResults=nil;
       
    }
    if([elementName isEqualToString:@"userD1"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.userD1=_soapResults;
        
        _soapResults=nil;
        
    }

    if([elementName isEqualToString:@"userD2"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.userD2=_soapResults;
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"priorityname"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.priorityname=_soapResults;
        [_workorderarray addObject:_workmdl];
        _soapResults=nil;
        
    }

    if([elementName isEqualToString:@"description"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.des=_soapResults;
        
        _soapResults=nil;
        
    }

    
    if([elementName isEqualToString:@"apprDate"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.apprDate=_soapResults;
       
        
        _soapResults=nil;
      
    }
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"Deleted"]) {
            [self ReadPlanningWorkEntImport];
        }
        
        _soapResults=nil;

    }
    

}
#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchPlanningWorkEntImport];
    [searchBar resignFirstResponder];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self ReadPlanningWorkEntImport];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_searchbar.text length]==0) {
        
        [self ReadPlanningWorkEntImport];
        
        
    }
    
    
}

@end
