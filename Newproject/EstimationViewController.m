//
//  EstimationViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 5/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "EstimationViewController.h"

@interface EstimationViewController ()

@end

@implementation EstimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
       self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
       self.addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    _estmntable.layer.borderWidth = 2.0;
    _estmntable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;

    _listarray=[[NSMutableArray alloc]initWithObjects:@"Resource planning", nil];
    [self WorkTypeSelect];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self EstimateSelect];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 120);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    [self.popOverController presentPopoverFromRect:_disclurbtnlbl.frame
                                                     inView:self.estmntable
                                      permittedArrowDirections:UIPopoverArrowDirectionLeft
                                                    animated:YES];

    
    
//    switch (poptype) {
//        case 1:
//            [self.popOverController presentPopoverFromRect:_leadcustmrbtnlbl.frame
//                                                    inView:self.addview
//                                  permittedArrowDirections:UIPopoverArrowDirectionUp
//                                                  animated:YES];
//
//            break;
//        case 2:
//            [self.popOverController presentPopoverFromRect:_planbtnlbl.frame
//                                                    inView:self.addview
//                                  permittedArrowDirections:UIPopoverArrowDirectionUp
//                                                  animated:YES];
//            
//            break;
//
//        default:
//            break;
//    }
    
    
    
}

#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return [_listarray count];
//        switch (poptype) {
//            case 1:
//                return [_leadcustmrarry count];
//                break;
//            case 2:
//                return [_planarray count];
//                break;
//                
//
//            default:
//                break;
//        }
    }
    else if (tableView==_estmntable) {
        return [_Estimationarray count];

    }
    
        
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_estmntable) {
            [[NSBundle mainBundle]loadNibNamed:@"Emtncell" owner:self options:nil];
            cell=_estmtncell;
            
        }
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
    if (tableView==_popOverTableView) {
              cell.textLabel.text=[_listarray objectAtIndex:indexPath.row];
//        switch (poptype) {
//            case 1:
//                cell.textLabel.text=[_leadcustmrarry objectAtIndex:indexPath.row];
//                break;
//            case 2:
//                   cell.textLabel.text=[_planarray objectAtIndex:indexPath.row];
//             
//                break;
//
//            default:
//                break;
//        }
    }
if (tableView==_estmntable) {
    
    ModlEstimation*estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:indexPath.row];
    _estlbl=(UILabel *)[cell viewWithTag:1];
    _estlbl.text=estmdl.EstimationId;
    _cmpnylbl=(UILabel *)[cell viewWithTag:2];
    _cmpnylbl.text=estmdl.Name;

    
}
    
    
    
       return cell;
}
#pragma mark-tableview datasource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     ModlEstimation *estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:indexPath.row];
    if (tableView==_popOverTableView) {
        
        
        if (!self.phestVCtrl) {
            self.phestVCtrl=[[PhsestViewController alloc]initWithNibName:@"PhsestViewController" bundle:nil];
        }
        _phestVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
        _phestVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
        _phestVCtrl.estmtnid=estmdl.estimateid;
        [self presentViewController:_phestVCtrl
                           animated:YES completion:NULL];

        
//        switch (poptype) {
//            case 1:
//                [_leadcustmrbtnlbl setTitle:[_leadcustmrarry objectAtIndex:indexPath.row] forState:UIControlStateNormal];
//                
//                break;
//            case 2:
//                
//                  [_planbtnlbl setTitle:[_planarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
//                  [self EstimationWorkTypeSelect];
//               
//                
//                break;
//            default:
//                break;
//        }
        [self.popOverController dismissPopoverAnimated:YES];

    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_estmntable)
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

#pragma mark-Webservice
-(void)SelectAllCustomer{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllCustomer xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllCustomer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllCustomer" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllLeads{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllLeads xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllLeads>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllLeads" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EstimateSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimateSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</EstimateSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimateSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EstimateInsert{
    recordResults = FALSE;
    
    NSString *ledid;
    NSString *custid;
  
    
    if (leadtuch%2)
    {
        ledid=[_leaddict objectForKey:_leadcustmrbtnlbl.titleLabel.text];
    }
    else
    {
        ledid=0;
       
    }
    if(custtuch%2)
    {
        custid=[_custmrdict objectForKey:_leadcustmrbtnlbl.titleLabel.text];

            }
    else
    {
        custid=0;
        
        
    }

    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimateInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<leadid>%d</leadid>\n"
                   "<CId>%d</CId>\n"
                   "<EstimationId>%@</EstimationId>\n"
                   "<SkillId>%d</SkillId>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Name>%@</Name>\n"
                   "<FoldID>%d</FoldID>\n"
                   "</EstimateInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",ledid,custid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimateInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EstimationPlanSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationPlanSelect xmlns=\"http://ios.kontract360.com/\">\n"
                  " <customername>%@</customername>\n"
                   "</EstimationPlanSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_leadcustmrbtnlbl.titleLabel.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    //NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationPlanSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EstimationWorkTypeSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationWorkTypeSelect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<planid>%@</planid>\n"
                   "</EstimationWorkTypeSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planbtnlbl.titleLabel.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    //NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationWorkTypeSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)WorkTypeSelect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<WorkTypeSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "</WorkTypeSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/WorkTypeSelect" forHTTPHeaderField:@"Soapaction"];
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    [_popOverTableView reloadData];
    [_estmntable reloadData];
        
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllLeadsResponse"])
    {
        _leadcustmrarry=[[NSMutableArray alloc]init];
        _leaddict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CompanyName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllCustomerResponse"])
    {
        _leadcustmrarry=[[NSMutableArray alloc]init];
        _custmrdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CustomerName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EstimateSelectResponse"])
    {_Estimationarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"EstimateId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"leadid"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EstimationId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SkillId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PlanId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Name"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"FoldID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EstimationPlanSelectResponse"])
    {
        _planarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"planid"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"WorkTypeSelectResult"])
    {
        _typelistarray=[[NSMutableArray alloc]init];
        _typelistdict=[[NSMutableDictionary alloc]init];
        _revtypelistarray=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"WorkType"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EstimationWorkTypeSelectResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"PlanWorkType"])
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
    if([elementName isEqualToString:@"SelectAllLeadsResponse"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        
        recordResults = FALSE;
    leadastring=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CompanyName"])
    {
        
        recordResults = FALSE;
        [_leaddict setObject:leadastring forKey:_soapResults];
        [_leadcustmrarry addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    } if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        customerstring=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CustomerName"])
    {
        
        recordResults = FALSE;
        [_custmrdict setObject:customerstring forKey:_soapResults];
        [_leadcustmrarry addObject:_soapResults];
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"EstimateId"])
    {
        _mdlestmtn=[[ModlEstimation alloc]init];
        
        recordResults = FALSE;
        _mdlestmtn.estimateid=_soapResults;
        
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"leadid"])
    {
        
        recordResults = FALSE;
        _mdlestmtn.leadid=_soapResults;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CId"])
    {
        
        recordResults = FALSE;
         _mdlestmtn.CId=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EstimationId"])
    {
        
        recordResults = FALSE;
         _mdlestmtn.EstimationId=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillId"])
    {
        
        recordResults = FALSE;
                 _soapResults = nil;

    }
    if([elementName isEqualToString:@"PlanId"])
    {
        
        recordResults = FALSE;
         _mdlestmtn.PlanId=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Name"])
    {
        
        recordResults = FALSE;
         _mdlestmtn.Name=_soapResults;
        
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"FoldID"])
    {
        
        recordResults = FALSE;
        
        
        [_Estimationarray addObject:_mdlestmtn];
        _soapResults = nil;

    }

    
    if([elementName isEqualToString:@"planid"])
    {
        
       recordResults = FALSE;
        [_planarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ID"])
    {
        
        recordResults = FALSE;
        typestg=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"WorkType"])
    {
        
        recordResults = FALSE;
        [_typelistarray addObject:_soapResults];
        [_typelistdict setObject:typestg forKey:_soapResults];
        [_revtypelistarray setObject:_soapResults forKey:typestg];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"PlanWorkType"])
    {
        recordResults = FALSE;
        [_wrktypebtnlbl setTitle:[_revtypelistarray objectForKey:_soapResults] forState:UIControlStateNormal];
            _soapResults = nil;
        
    }
    



}
#pragma mark-Uibutton Actions

- (IBAction)leadcustmrbtb:(id)sender {
    poptype=1;
    [self createpopover];
    
}

- (IBAction)planbtn:(id)sender {
    poptype=2;
    [self createpopover];
    [self EstimationPlanSelect];
   

}

- (IBAction)wrktypebtn:(id)sender {
}

- (IBAction)updatebtn:(id)sender {
}

- (IBAction)cancelbtn:(id)sender {
}

- (IBAction)editbtn:(id)sender {
    _addview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.estmntable];
    NSIndexPath *textFieldIndexPath = [self.estmntable indexPathForRowAtPoint:rootViewPoint];
    ModlEstimation *estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:textFieldIndexPath.row];
    NSLog(@"%@",estmdl.leadid);
    if ( ![estmdl.leadid isEqualToString:@"0"]) {
         [_leadchckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _custmrchckbtn.enabled=NO;
        _leadcustmlbl.text=@"Lead";
        [_leadcustmrbtnlbl setTitle:estmdl.Name forState:UIControlStateNormal];
    }
   
   else if (![estmdl.CId isEqualToString:@"0"]) {
        [_custmrchckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _leadchckbtnlbl.enabled=NO;
        _leadcustmlbl.text=@"Customer";

        [_leadcustmrbtnlbl setTitle:estmdl.Name forState:UIControlStateNormal];
    }

    
    [_planbtnlbl setTitle:estmdl.PlanId forState:UIControlStateNormal];
   // [_wrktypebtnlbl setTitle:estmdl.PlanId forState:UIControlStateNormal];
    
    
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addbtn:(id)sender {
    _addview.hidden=NO;
    _leadcustmrbtnlbl.enabled=NO;
         [_leadchckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
       [_custmrchckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
      [_leadcustmrbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
       [_planbtnlbl setTitle:@"Select"forState:UIControlStateNormal];
    [_wrktypebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    
}

- (IBAction)disclurebtn:(id)sender {
    [self createpopover];
}

- (IBAction)addclsebtn:(id)sender {
      _addview.hidden=YES;
}

- (IBAction)leadchckbtn:(id)sender {
    leadtuch++;
    if (leadtuch%2) {
        
        [_leadchckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _custmrchckbtn.enabled=NO;
          _leadcustmrbtnlbl.enabled=YES;
        _leadcustmlbl.text=@"Lead";
        [self SelectAllLeads];
    }
    
    else{
         [_leadcustmrbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_leadchckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
         _custmrchckbtn.enabled=YES;
        
        
        
    }

}
- (IBAction)custmrchck:(id)sender {
    custtuch++;
    if (custtuch%2) {
        
        [_custmrchckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
         _leadchckbtnlbl.enabled=NO;
         _leadcustmrbtnlbl.enabled=YES;
        _leadcustmlbl.text=@"Customer";
        [self SelectAllCustomer];
    }
    
    else{
         [_leadcustmrbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_custmrchckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
          _leadchckbtnlbl.enabled=YES;
    }

}
@end
