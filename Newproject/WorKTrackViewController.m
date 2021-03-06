//
//  WorKTrackViewController.m
//  Prodektive
//
//  Created by Riya on 2/25/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "WorKTrackViewController.h"

@interface WorKTrackViewController ()

@end

@implementation WorKTrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _worktable.layer.borderWidth=3.0;
    _worktable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _menuarray=[[NSMutableArray alloc]initWithObjects:@"Tracking", nil];
    [self ReadPlanningWorkEntImport];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==_worktable) {
        //return 3;
        return [_workorderarray count];
        
    }
    if (tableView==_popovertableview) {
        return 1;
    }
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        if (tableView==_worktable) {
            [[NSBundle mainBundle]loadNibNamed:@"WorkTrackCell" owner:self options:nil];
            cell=_workcell;
        }
        
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    if (tableView==_worktable)
    {
        Schedulermdl*wmdl=(Schedulermdl *)[_workorderarray objectAtIndex:indexPath.row];
        
        _worklbl=(UILabel *)[cell viewWithTag:1];
        _worklbl.text=wmdl.workorder;
        _plantlbl=(UILabel*)[cell viewWithTag:2];
        _plantlbl.text=wmdl.plant;
        _sublbl=(UILabel*)[cell viewWithTag:3];
        _sublbl.text=wmdl.subunit;
        _equipment=(UILabel*)[cell viewWithTag:4];
        _equipment.text=wmdl.equipment;
        _deftaglbl=(UILabel*)[cell viewWithTag:5];
        _deftaglbl.text=wmdl.deftag;
        
       
        float Ahrs=[wmdl.allocatedhrs floatValue];
     
      
         float whrs=[wmdl.workedhrs floatValue];
        _allocatedhrslbl=(UILabel*)[cell viewWithTag:6];
        _allocatedhrslbl.text=[NSString stringWithFormat:@"%.02f",Ahrs];
        _usedhrslbl=(UILabel*)[cell viewWithTag:7];
        _usedhrslbl.text=[NSString stringWithFormat:@"%.02f",whrs];
        if (Ahrs<whrs) {
           
            UIView *bgColorView = [[UIView alloc] init];
            [bgColorView setBackgroundColor:[UIColor colorWithRed:139.0/255.0f green:0.0/255.0f blue:0.0/255.0f alpha:1.0f]];
            //[cell setSelectedBackgroundView:bgColorView];
            cell.backgroundView =bgColorView;
        }
        else if (Ahrs>whrs&&whrs!=0) {
            UIView *bgColorView = [[UIView alloc] init];
            [bgColorView setBackgroundColor:[UIColor colorWithRed:61.0/255.0f green:145.0/255.0f blue:18.0/255.0f alpha:1.0f]];
            //[cell setSelectedBackgroundView:bgColorView];
            cell.backgroundView =bgColorView;
        }
        else if(Ahrs==whrs){
            UIView *bgColorView = [[UIView alloc] init];
            [bgColorView setBackgroundColor:[UIColor colorWithRed:255.0/255.0f green:207.0/255.0f blue:18.0/255.0f alpha:1.0f]];
            //[cell setSelectedBackgroundView:bgColorView];
            cell.backgroundView=bgColorView;
        }
            
        else if(Ahrs>whrs&&whrs==0){
            UIView *bgColorView = [[UIView alloc] init];
            [bgColorView setBackgroundColor:[UIColor colorWithRed:39.0/255.0f green:64.0/255.0f blue:139.0/255.0f alpha:1.0f]];
            //[cell setSelectedBackgroundView:bgColorView];
            cell.backgroundView=bgColorView;
        }
        

        
        
        
    }
      if (tableView==_popovertableview) {
          cell.textLabel.text=@"Tracking";
      }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView==_popovertableview) {
      
//        self.TicketVCtrl=[[NewTrackerViewController alloc]initWithNibName:@"NewTrackerViewController" bundle:nil];
//        self.TicketVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
//        self.TicketVCtrl.workorder=_workorder;
//        [self dismissViewControllerAnimated:YES completion:^{ [self presentViewController:self.TicketVCtrl animated:YES completion:nil];
//        }];

    }
    
    
    
    [self.popovercontroller dismissPopoverAnimated:YES];
    
    
}
#pragma mark-Webservices

-(void)ReadPlanningWorkEntImport{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadPlanningWorkEntImport xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<PlanIID>%@</PlanIID>\n"
                   "</ReadPlanningWorkEntImport>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"PJ-00001"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
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
    
    [_worktable reloadData];
    
    
    //    if (webtype==1) {
    //        [self ReadSchedulerWork];
    //        webtype=0;
    //    }
    
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
    if([elementName isEqualToString:@"manhrs"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"workedhrs"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"feet"])
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
        
        _workmdl=[[Schedulermdl alloc]init];
        
        
        _soapResults=nil;
        
        
    }
    
    if([elementName isEqualToString:@"EntryId"])
    {
        recordResults = FALSE;
        
        
        _workmdl.entryid=_soapResults;
        
        _soapResults=nil;
        
        
    }
    
    if([elementName isEqualToString:@"plan"])
    {
        
        recordResults = FALSE;
        
        
        //_workmdl.plant=_soapResults;
        
        _soapResults=nil;
        
    }
    
    if([elementName isEqualToString:@"WorkNo"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.workorder=_soapResults;
        
        _soapResults=nil;
        
    }
    
    if([elementName isEqualToString:@"priority"])
    {
        
        recordResults = FALSE;
        
        
        //_workmdl.priority=_soapResults;
        
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
        
        
        _workmdl.equipment=_soapResults;
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"outage"])
    {
        
        recordResults = FALSE;
        
        
        //_workmdl.outage=_soapResults;
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"clearence"])
    {
        
        recordResults = FALSE;
        
        
        //_workmdl.clearence=_soapResults;
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"space"])
    {
        
        recordResults = FALSE;
        
        
       // _workmdl.space=_soapResults;
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"defTag"])
    {
        
        recordResults = FALSE;
        
        
    _workmdl.deftag=_soapResults;
        
        _soapResults=nil;
        
    }
    
    
    if([elementName isEqualToString:@"reqBy"])
    {
        
        recordResults = FALSE;
        
        
        //_workmdl.reqBy=_soapResults;
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"apprBy"])
    {
        
        recordResults = FALSE;
        
        
        //_workmdl.apprBy=_soapResults;
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"reqDate"])
    {
        
        recordResults = FALSE;
        
        
      //  _workmdl.reqDate=_soapResults;
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"userD1"])
    {
        
        recordResults = FALSE;
        
        
        //_workmdl.userD1=_soapResults;
        
        _soapResults=nil;
        
    }
    
    if([elementName isEqualToString:@"userD2"])
    {
        
        recordResults = FALSE;
        
        
       // _workmdl.userD2=_soapResults;
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"priorityname"])
    {
        
        recordResults = FALSE;
        
        
        //_workmdl.priorityname=_soapResults;
        
        _soapResults=nil;
        
    }
    
    if([elementName isEqualToString:@"description"])
    {
        
        recordResults = FALSE;
        
        
        //_workmdl.w=_soapResults;
        
        _soapResults=nil;
        
    }
    
    
    if([elementName isEqualToString:@"apprDate"])
    {
        
        recordResults = FALSE;
        
        
        //_workmdl.apprDate=_soapResults;
        
        
        _soapResults=nil;
        
    }
    
    if([elementName isEqualToString:@"manhrs"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.allocatedhrs=_soapResults;
        
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"workedhrs"])
    {
        
        recordResults = FALSE;
        
        
        _workmdl.workedhrs=_soapResults;
        
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"feet"])
    {
         recordResults = FALSE;
        [_workorderarray addObject:_workmdl];
         _soapResults=nil;
    }

}
- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)disclurebtn:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 132, 46)];
    // popoverView.backgroundColor = [UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 132, 46)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 41;
    //_popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    //_popovertableview.separatorColor=[UIColor blackColor];
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    popoverContent.contentSizeForViewInPopover = CGSizeMake(132, 46);
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.worktable];
    NSIndexPath *textFieldIndexPath = [self.worktable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
       Schedulermdl*wmdl=(Schedulermdl *)[_workorderarray objectAtIndex:btnindex];
    _workorder=wmdl.entryid;
    //UITableView *table = (UITableView *)[cell superview];
    self.popovercontroller = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    self.popovercontroller.popoverContentSize=CGSizeMake(132.0f, 46.0f);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_disclurebtn.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}
- (IBAction)addbtn:(id)sender {
    self.TrackVCtrl=[[TrakerViewController alloc]initWithNibName:@"TrakerViewController" bundle:nil];
    self.TrackVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
    self.TrackVCtrl.editpath=@"1";
    self.TrackVCtrl.workorder=_workorder;
    //self.TrackVCtrl.workorderdesc=_workorderdesc;
    [self presentViewController:self.TrackVCtrl animated:YES completion:nil];
    
}

- (IBAction)editbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.worktable];
    NSIndexPath *textFieldIndexPath = [self.worktable indexPathForRowAtPoint:rootViewPoint];
    
    btnindex=textFieldIndexPath.row;
   // Trackmdl*track1=(Trackmdl *)[_Trackarray objectAtIndex:btnindex];
    Schedulermdl*wmdl=(Schedulermdl *)[_workorderarray objectAtIndex:btnindex];
    _workorder=wmdl.entryid;
    
    self.TrackVCtrl=[[TrakerViewController alloc]initWithNibName:@"TrakerViewController" bundle:nil];
    self.TrackVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
    
    
   // NSMutableArray*newarray=[[NSMutableArray alloc]init];
   // [newarray addObject:track1];
   // self.TrackVCtrl.trackarray=newarray;
    self.TrackVCtrl.editpath=@"2";
    self.TrackVCtrl.workorder=_workorder;
    //self.TrackVCtrl.workorderdesc=track1.workorder;
    
    
    [self presentViewController:self.TrackVCtrl animated:YES completion:nil];
}
@end
