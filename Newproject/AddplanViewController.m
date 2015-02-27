//
//  AddplanViewController.m
//  KontractWorkOrder
//
//  Created by Riya on 1/28/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "AddplanViewController.h"

@interface AddplanViewController ()

@end

@implementation AddplanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1];
    _detailstextview.layer.borderWidth=2;
    _detailstextview.layer.cornerRadius=10;
    _detailstextview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1].CGColor;
    _Workperformtextview.layer.borderWidth=2;
    _Workperformtextview.layer.cornerRadius=10;
    _Workperformtextview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1].CGColor;
    _scroll.frame=CGRectMake(0, 44, 1024, 724);
    _scroll.contentSize=CGSizeMake(1024, 800);
    _scaffoldtable.layer.borderWidth=2;
    _scaffoldtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1].CGColor;
    _scafoldtitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1];

    _scaffoldtable.hidden=YES;
    _scafoldtitle.hidden=YES;
//    _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
//    _searchbar.delegate=(id)self;
//    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
//    self.scaffoldtable.tableHeaderView=_searchbar;
//    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
//    searchctrlr.searchResultsDelegate=(id)self;
//    searchctrlr.searchResultsDataSource=(id)self;
//    searchctrlr.delegate=(id)self;

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _work=(Workordrmdl*)[_workorderarray objectAtIndex:0];
    _detailstextview.text=[NSString stringWithFormat:@"%@    %@    %@    %@      %@    %@       %@     %@",_work.WorkNo,_work.plant,_work.subunit,_work.equipmet,_work.reqBy,_work.reqDate,_work.apprBy,_work.apprDate];
    [self ReadWorkOrder];
    [self SelectAllServices];
    [_servicebtn setTitle:@"Scaffoldings" forState:UIControlStateNormal];
    [self ReadScaffoldPlan];
    if ([_servicebtn.titleLabel.text isEqualToString:@"Scaffoldings"]) {
        _scaffoldtable.hidden=NO;
        _scafoldtitle.hidden=NO;
        
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableReload) name:@"tableReload" object:nil];
}
-(void)tableReload{
    [self ReadScaffoldPlan];
    
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

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)serviceselection:(id)sender {
    [self SelectAllServices];
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    // popoverView.backgroundColor = [UIColor whiteColor];
    _PopOvertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _PopOvertableview.delegate=(id)self;
    _PopOvertableview.dataSource=(id)self
    ;
    _PopOvertableview.rowHeight= 30;
    _PopOvertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    //_popovertableview.separatorColor=[UIColor blackColor];
    [popoverView addSubview:_PopOvertableview];
    popoverContent.view = popoverView;
    popoverContent.preferredContentSize = CGSizeMake(200, 200);
    
    
    //UITableView *table = (UITableView *)[cell superview];
    self.popoverctrlr = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    self.popoverctrlr.popoverContentSize=CGSizeMake(200.0f, 200.0f);
    self.popoverctrlr=_popoverctrlr;
    [self.popoverctrlr presentPopoverFromRect:_servicebtn.frame inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    

}
#pragma mark-Tableview Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_PopOvertableview)
    {
    return [_Subtypelistarray count];
    }
    if(tableView==_scaffoldtable)
    {
        return [_scaffoldingplanlistarray count];
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        if (tableView==_scaffoldtable) {
            [[NSBundle mainBundle]loadNibNamed:@"Scaffcell" owner:self options:nil];
            cell=_scaffoldcell;
        }
    }
    if(tableView==_PopOvertableview){
         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        cell.textLabel.text=[_Subtypelistarray objectAtIndex:indexPath.row];
        
    }
    if(tableView==_scaffoldtable){
        Customscaffoldingplan*scaffmdl=(Customscaffoldingplan *)[_scaffoldingplanlistarray objectAtIndex:indexPath.row];
        _unitcelllabel=(UILabel*)[cell viewWithTag:1];
        _unitcelllabel.text=scaffmdl.unit;
        _equipcelllabel=(UILabel*)[cell viewWithTag:2];
        _equipcelllabel.text=scaffmdl.equp;
        
        _pjctheadercelllabel=(UILabel*)[cell viewWithTag:3];
        _pjctheadercelllabel.text=scaffmdl.ph;
        
        _scaffoldcellalbel=(UILabel*)[cell viewWithTag:4];
        _scaffoldcellalbel.text=scaffmdl.scaffoldname;
        //[NSString stringWithFormat:@"%d",scaffmdl.typescaffold];
        
        _lengthcelllabel=(UILabel*)[cell viewWithTag:5];
        _lengthcelllabel.text=scaffmdl.length;
        
        _widthcelllabel=(UILabel*)[cell viewWithTag:6];
        _widthcelllabel.text=scaffmdl.width;
        _heightcelllabel=(UILabel*)[cell viewWithTag:7];
        _heightcelllabel.text=scaffmdl.height;
        
        _quantitycelllabel=(UILabel*)[cell viewWithTag:8];
        _quantitycelllabel.text=scaffmdl.qty;
        
        _elevationcelllabel=(UILabel*)[cell viewWithTag:9];
        _elevationcelllabel.text=scaffmdl.elevation;
        _manhourslabel=(UILabel*)[cell viewWithTag:10];
        _manhourslabel.text=scaffmdl.manhours;
        _erecthourslabel=(UILabel*)[cell viewWithTag:11];
        _erecthourslabel.text=scaffmdl.erecthours;
        _desmanitilehourslabel=(UILabel*)[cell viewWithTag:12];
        _desmanitilehourslabel.text=scaffmdl.dismantlehours;

    }
    
   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_PopOvertableview) {
        path=indexPath.row;
        [_servicebtn setTitle:[_Subtypelistarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        if ([[_Subtypelistarray objectAtIndex:indexPath.row] isEqualToString:@"Scaffoldings"]) {
            _scafoldtitle.hidden=NO;
            _scaffoldtable.hidden=NO;
            [self ReadScaffoldPlan];
        }
        else
        {
            _scafoldtitle.hidden=YES;
            _scaffoldtable.hidden=YES;

        }
        
    }
    [self.popoverctrlr dismissPopoverAnimated:YES];
}


- (IBAction)addscaffoldaction:(id)sender {
    _optionidentifier=1;
    _scaffoldctrl=[[ScafldingViewController alloc]initWithNibName:@"ScafldingViewController" bundle:nil];
    modalViewNavController = [[UINavigationController alloc] initWithRootViewController:_scaffoldctrl];
  //  modalViewNavController.modalPresentationStyle=UIModalPresentationFormSheet;
     modalViewNavController.modalPresentationStyle=UIModalPresentationCustom;
    [modalViewNavController setNavigationBarHidden:YES animated:YES];
    if ([[_subtypelistdictionary objectForKey:[_Subtypelistarray objectAtIndex:path]]integerValue]) {
        _scaffoldctrl.serviceid=1;
    }
    else
    {
        _scaffoldctrl.serviceid=[[_subtypelistdictionary objectForKey:[_Subtypelistarray objectAtIndex:path]]integerValue];
    }

    _scaffoldctrl.worktypeid=_worktypeid;
    _scaffoldctrl.workorderid=_workorderid;
    _scaffoldctrl.planid=_planid;
    _scaffoldctrl.optionidentifier=_optionidentifier;
    _scaffoldctrl.sitefactor=_sitefactor;
     _scaffoldctrl.workorderarray=_workorderarray;
    NSLog(@"%d",_scaffoldctrl.serviceid);
    [self presentViewController:modalViewNavController animated:YES completion:NULL];
}
- (IBAction)editscaffoldaction:(id)sender
{
    _optionidentifier=2;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.scaffoldtable];
    NSIndexPath *textFieldIndexPath = [self.scaffoldtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    Customscaffoldingplan*scaff=(Customscaffoldingplan *)[_scaffoldingplanlistarray objectAtIndex:btnindex];
  
    NSMutableArray *array1=[[NSMutableArray alloc]init];
    [array1 addObject:scaff];
   

    _scaffoldctrl=[[ScafldingViewController alloc]initWithNibName:@"ScafldingViewController" bundle:nil];
    modalViewNavController = [[UINavigationController alloc] initWithRootViewController:_scaffoldctrl];
    //  modalViewNavController.modalPresentationStyle=UIModalPresentationFormSheet;
    modalViewNavController.modalPresentationStyle=UIModalPresentationCustom;
     modalViewNavController.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [modalViewNavController setNavigationBarHidden:YES animated:YES];
    _scaffoldctrl.workorderid=_workorderid;
    _scaffoldctrl.worktypeid=_worktypeid;
    _scaffoldctrl.planid=_planid;
    _scaffoldctrl.sitefactor=_sitefactor;
    _scaffoldctrl.optionidentifier=_optionidentifier;
    _scaffoldctrl.sccfarray=array1;
    _scaffoldctrl.workorderarray=_workorderarray;
    if ([[_subtypelistdictionary objectForKey:[_Subtypelistarray objectAtIndex:path]]integerValue]) {
        _scaffoldctrl.serviceid=1;
    }
    else
    {
      _scaffoldctrl.serviceid=[[_subtypelistdictionary objectForKey:[_Subtypelistarray objectAtIndex:path]]integerValue];
    }
    [self presentViewController:modalViewNavController animated:YES completion:NULL];

}
#pragma mark- WebService
-(void)SelectAllServices{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllServices xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllServices>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllServices" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadWorkOrder{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadWorkOrder xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ID>%@</ID>\n"
                   "<WID>%@</WID>\n"
                   "</ReadWorkOrder>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorderid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadWorkOrder" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)updateScaffoldWorkDet{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<updateScaffoldWorkDet xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Work>%@</Work>\n"
                   "<workDets>%@</workDets>\n"
                   "</updateScaffoldWorkDet>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorderid,_Workperformtextview.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/updateScaffoldWorkDet" forHTTPHeaderField:@"Soapaction"];
    
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

#pragma mark- WebService
-(void)ReadScaffoldPlan{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldPlan xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ID>%@</ID>\n"
                    "<workorderid>%@</workorderid>\n"
                   "</ReadScaffoldPlan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorderid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldPlan" forHTTPHeaderField:@"Soapaction"];
    
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
    [_scaffoldtable reloadData];
    [_PopOvertableview reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    if([elementName isEqualToString:@"SelectAllServicesResult"])
    {
        _Subtypelistarray=[[NSMutableArray alloc]init];
        _subtypelistdictionary=[[NSMutableDictionary alloc]init];

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
    if([elementName isEqualToString:@"SkillName"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Abbrevation"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SkillNumber"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldPlanResponse"])
    {
        _scaffoldingplanlistarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"id"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Slength"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Swidth"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Sheight"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SQty"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Elevation"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SUnit"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SEqup"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SPh"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SDescription"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Leadid"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TypeofScaffold"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ScaffoldType"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Decking"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"HandRail"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Tarpaulin"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"PlasticSheet"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"InternalWorkingFactor"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SpecialPPEFactor"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"UnplannedWork"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ScaffoldSubTypeId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"lbit"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }if([elementName isEqualToString:@"wbit"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }if([elementName isEqualToString:@"hbit"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }if([elementName isEqualToString:@"ScaffoldDetailId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"MainScaffId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"number"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ManHoures"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ErectHoures"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DesmandleHoures"])
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

    if([elementName isEqualToString:@"SSequenceNumber"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Sequence"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SPhaseId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"PhaseName"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadWorkOrderResponse"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"records"])
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
    if([elementName isEqualToString:@"SkillId"])
    {
        
        recordResults=FALSE;
        
        
        _skillstring=_soapResults;
        
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"SkillName"])
    {
        recordResults=FALSE;
        
        [_subtypelistdictionary setObject:_skillstring forKey:_soapResults];
        [_Subtypelistarray addObject:_soapResults];
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Abbrevation"])
    {
        
        recordResults=FALSE;
        
        
        
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SkillNumber"])
    {
        
        recordResults=FALSE;
        
        
        
        
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"id"])
    {
        _scfldmdl=[[Customscaffoldingplan alloc]init];
        recordResults = FALSE;
        _scfldmdl.idvalue=[_soapResults integerValue];;
        _soapResults = nil;

    }
    
         if([elementName isEqualToString:@"Slength"])
    {
        recordResults=FALSE;
        
        
        _scfldmdl.length=_soapResults;
        
        _soapResults = nil;
        }
    if([elementName isEqualToString:@"Swidth"])
    {
        recordResults=FALSE;
        
        
        _scfldmdl.width=_soapResults;
        
        _soapResults = nil;
        
            }
    if([elementName isEqualToString:@"Sheight"])
    {
        recordResults=FALSE;
        
        
        _scfldmdl.height=_soapResults;
        
        _soapResults = nil;
        
            }
    if([elementName isEqualToString:@"SQty"])
    {
        
        recordResults=FALSE;
        
        
        _scfldmdl.qty=_soapResults;
        
        _soapResults = nil;

         }
    if([elementName isEqualToString:@"Elevation"])
    {
        
       
        
        
        recordResults=FALSE;
        
        
        _scfldmdl.elevation=_soapResults;
        
        _soapResults = nil;
       
      
    }
    if([elementName isEqualToString:@"SUnit"])
    {
        
        recordResults=FALSE;
        
        
        _scfldmdl.unit=_soapResults;
        
        _soapResults = nil;
           }
    if([elementName isEqualToString:@"SEqup"])
    {
        recordResults=FALSE;
        
        _scfldmdl.equp=_soapResults;
        
        
        _soapResults = nil;
        
          }
    if([elementName isEqualToString:@"SPh"])
    {
        recordResults=FALSE;
        
        
        _scfldmdl.ph=_soapResults;
        
        _soapResults = nil;
        
          }
    if([elementName isEqualToString:@"SDescription"])
    {
        recordResults=FALSE;
        
        
        
        _scfldmdl.desc=_soapResults;
        _soapResults = nil;
        
        }
    if([elementName isEqualToString:@"Leadid"])
    {
        recordResults=FALSE;
        
    
        
        
        _soapResults = nil;
        
         }
    if([elementName isEqualToString:@"TypeofScaffold"])
    {
        recordResults=FALSE;
        
        
        _scfldmdl.typescaffold=[_soapResults integerValue];
        
        _soapResults = nil;
        
      
    }
    if([elementName isEqualToString:@"ScaffoldType"])
    {
        
        
        recordResults=FALSE;
        
        _scfldmdl.scaffoldname=_soapResults;
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Decking"])
    {
        recordResults=FALSE;
        
        _scfldmdl.decking=_soapResults;
        
        
        _soapResults = nil;
        
          }
    if([elementName isEqualToString:@"HandRail"])
    {
        
        recordResults=FALSE;
        
        _scfldmdl.handrail=_soapResults;

        
        
        _soapResults = nil;
           }
    if([elementName isEqualToString:@"Tarpaulin"])
    {
        
        recordResults=FALSE;
        
        _scfldmdl.tarpaulin=_soapResults;

        
        
        _soapResults = nil;
          }
    
    
    if([elementName isEqualToString:@"PlasticSheet"])
    {
        
        recordResults=FALSE;
        
        _scfldmdl.Plasticsheet=_soapResults;

        
        
        _soapResults = nil;
      
    }
    
    if([elementName isEqualToString:@"InternalWorkingFactor"])
    {
        recordResults=FALSE;
        
       
        if ([_soapResults isEqualToString:@"true"]) {
            _scfldmdl.internalworkfactor=1;
        }
        else
        {
            _scfldmdl.internalworkfactor=0;
        }

        
        
        _soapResults = nil;


          }
    
    if([elementName isEqualToString:@"SpecialPPEFactor"])
    {
        
        
        recordResults=FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            _scfldmdl.ppe=1;
        }
        else
        {
            _scfldmdl.ppe=0;
        }

        
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"UnplannedWork"])
    {
        recordResults=FALSE;
       
        if ([_soapResults isEqualToString:@"true"]) {
            _scfldmdl.unplannedwork=1;
        }
        else
        {
            _scfldmdl.unplannedwork=0;
        }
        

        
        
        _soapResults = nil;
        
           }
    
    if([elementName isEqualToString:@"ScaffoldSubTypeId"])
    {
        recordResults=FALSE;
        
      

        
        
        _soapResults = nil;
        
           }
    if([elementName isEqualToString:@"lbit"])
    {
        recordResults=FALSE;
        
        

        
        
        _soapResults = nil;
        
         }if([elementName isEqualToString:@"wbit"])
    {
        recordResults=FALSE;
        
        
        
        
        _soapResults = nil;
        
         }if([elementName isEqualToString:@"hbit"])
    {
        
      
    }if([elementName isEqualToString:@"ScaffoldDetailId"])
    {
        
        recordResults=FALSE;
        
        
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"MainScaffId"])
    {
        
        recordResults=FALSE;
        
        
        
        
        _soapResults = nil;
      
    }
    if([elementName isEqualToString:@"number"])
    {
        
        recordResults=FALSE;
        
        
        

        
        _soapResults = nil;
          }
    if([elementName isEqualToString:@"ManHoures"])
    {
        recordResults=FALSE;
        
        
          _scfldmdl.manhours=_soapResults;

        
        _soapResults = nil;
         }
    if([elementName isEqualToString:@"ErectHoures"])
    {
        
        recordResults=FALSE;
        
        
        _scfldmdl.erecthours=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"DesmandleHoures"])
    {
        recordResults=FALSE;
        
         _scfldmdl.dismantlehours=_soapResults;

        
        
        _soapResults = nil;
           }
    if([elementName isEqualToString:@"PlanId"])
    {
        
        recordResults=FALSE;
        
        _scfldmdl.pid=_soapResults;

      //  [_scaffoldingplanlistarray addObject:_scfldmdl];
        
        _soapResults = nil;
      
    }
    if([elementName isEqualToString:@"SSequenceNumber"])
    {
        
        recordResults=FALSE;
        
        _scfldmdl.sequence=[_soapResults integerValue];
        
       // [_scaffoldingplanlistarray addObject:_scfldmdl];
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Sequence"])
    {
        
        recordResults=FALSE;
        
        _scfldmdl.sequencename=_soapResults;
        
      //  [_scaffoldingplanlistarray addObject:_scfldmdl];
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SPhaseId"])
    {
        
        recordResults=FALSE;
        
        _scfldmdl.phase=[_soapResults integerValue];
        
       // [_scaffoldingplanlistarray addObject:_scfldmdl];
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"PhaseName"])
    {
        
        recordResults=FALSE;
        
        _scfldmdl.phasename=_soapResults;
        
        [_scaffoldingplanlistarray addObject:_scfldmdl];
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"records"])
    {
        
        recordResults=FALSE;
        
        _Workperformtextview.text=_soapResults;
        
        _soapResults = nil;
        
    }


}
- (IBAction)update:(id)sender
{
    if ([_Workperformtextview.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Work Details is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        [self updateScaffoldWorkDet];
    }
}
@end
