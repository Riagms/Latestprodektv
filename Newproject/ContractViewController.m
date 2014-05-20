//
//  ContractViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "ContractViewController.h"

@interface ContractViewController ()

@end

@implementation ContractViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.openviewindex=NSNotFound;
    _contracttable.layer.borderWidth = 2.0;
    _contracttable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
   self.contracttitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f];
    _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate=(id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _contracttable.tableHeaderView=_searchbar;
    
    UISearchDisplayController *searchdisplaycontroller=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchdisplaycontroller.searchResultsDataSource=(id)self;
    searchdisplaycontroller.searchResultsDelegate=(id)self;
    searchdisplaycontroller.delegate=(id)self;
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
     self.openviewindex=NSNotFound;
    [super viewWillAppear:animated];
    [self SelectContractManagement];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-IBActions
-(IBAction)closethecontractpage:(id)sender
{
     self.openviewindex=NSNotFound;
    [self dismissViewControllerAnimated:YES completion:NULL];
}
#pragma mark-Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_contractlistarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"Contractcell" owner:self options:nil];
        cell=_contrctcell;
        
    }
    subcontract*submdl=(subcontract *)[_contractlistarray objectAtIndex:indexPath.row];
    _namelabel=(UILabel*)[cell viewWithTag:1];
    _namelabel.text=submdl.CustomerName;
    _numberlabel=(UILabel*)[cell viewWithTag:2];
    _numberlabel.text=submdl.Number;
    _datelabel=(UILabel*)[cell viewWithTag:3];
   
    NSArray *dateArray=[[NSArray alloc]init];
    dateArray=[submdl.EffectiveDate componentsSeparatedByString:@"T"];
    NSString *date1 =[dateArray objectAtIndex:0];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *dates = [dateFormat dateFromString:date1];
    [dateFormat setDateFormat:@"MM-dd-yyy"];
    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
    _datelabel.text=myFormattedDate;
    _billingdayslabel=(UILabel*)[cell viewWithTag:4];
    _billingdayslabel.text=submdl.NetDays;
    _weeklyhourslabel=(UILabel*)[cell viewWithTag:5];
    _weeklyhourslabel.text=submdl.WeeklyHours;
    _subcontractlabel=(UILabel*)[cell viewWithTag:6];
    _subcontractlabel.text=submdl.SubContractorMarkup;
    
    disbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    [disbutton setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
    
    disbutton.tag=indexPath.row;
    [disbutton addTarget:self action:@selector(showactions:) forControlEvents:UIControlEventTouchUpInside];
    disbutton.frame = CGRectMake(230.0, 1.0, 50.0, 40.0);
    [cell.contentView addSubview:disbutton];

    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_contracttable)
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
-(void)showactions:(UIButton*)sender{
    _detailslabel.hidden=YES;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
        .frame =  CGRectMake(260, 10, 0, 0);} completion:nil];
    
    _animatedview.hidden=YES;
    //Empmdl *empmdl=(Empmdl *)[_employeelistarray objectAtIndex:sender.tag];
    
    
    
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.contracttable];
    NSIndexPath *textFieldIndexPath = [self.contracttable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    buttonindex=textFieldIndexPath.row;
    
    
    
    //create uiview
    _animatedview=[[UIView alloc]initWithFrame:CGRectMake(260, 10, 0, 25)];
    _animatedview.backgroundColor=[UIColor colorWithRed:99.0/255.0f green:184.0/255.0f blue:255.0/255.0f alpha:1.0f];
    _detailslabel=[[UILabel alloc]initWithFrame:CGRectMake(12, 0, 160, 25)];
    _detailslabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
    _detailslabel.textColor=[UIColor blackColor];
    _detailslabel.text=@"Details";
    [self.animatedview addSubview:_detailslabel];
    
    _detailslabel.hidden=YES;
    
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotomanagementdetails)];
    [self.animatedview addGestureRecognizer:tap];
    [cell addSubview:_animatedview];
    
    _animatedview.hidden=NO;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
        .frame =  CGRectMake(260, 10, 70, 25);} completion:nil];
    
    _detailslabel.hidden=NO;
    //    NSLog(@"%@",empmdl.badgeflag);
    //    if ([empmdl.badgeflag isEqualToString:@"true"]) {
    //        //_badgelbl.enabled=NO;
    //        _animatedview.userInteractionEnabled=NO;
    //        //_animatedview.
    //
    //    }
    
    [self showviewWithUserAction:YES];
}

-(void)showviewWithUserAction:(BOOL)userAction{
    
    // Toggle the disclosure button state.
    
    disbutton.selected = !disbutton.selected;
    
    if (userAction) {
        if (disbutton.selected) {
            _animatedview.hidden=NO;
            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
                .frame =  CGRectMake(260, 10, 70, 25);} completion:nil];
            [self viewopened:buttonindex];
            _detailslabel.hidden=NO;
            
            
            
        }
        else{
            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
                .frame =  CGRectMake(260, 10, 70, 25);} completion:nil];
            [self viewclosed:buttonindex];
            //_venderlbl.hidden=YES;
            
        }
        
        
    }
}
-(void)viewopened:(NSInteger)viewopened{
    
    
    selectedcell=viewopened;
    NSInteger previousOpenviewIndex = self.openviewindex;
    
    if (previousOpenviewIndex != NSNotFound) {
        [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{  _animatedview
            .frame =  CGRectMake(260, 10, 0, 0);} completion:nil];
        
        _animatedview.hidden=YES;
        
        
        // }
        
        
    }
    
    self.openviewindex=viewopened;
    
    
    
    
    
    
}

-(void)viewclosed:(NSInteger)viewclosed
{
    
    viewclosed=buttonindex;
    _animatedview.hidden=YES;
    self.openviewindex = NSNotFound;
    
    
}
-(void)gotomanagementdetails
{
    
    _passingarray=[[NSMutableArray alloc]init];
    subcontract*smdl=(subcontract *)[_contractlistarray objectAtIndex:selectedcell];
    [_passingarray addObject:smdl];

    if (!self.mgmtdetails) {
        self.mgmtdetails=[[MangmntdetailsViewController alloc]initWithNibName:@"MangmntdetailsViewController" bundle:nil];
    }
    _mgmtdetails.detailsarray=_passingarray;
    //_custmrVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:_mgmtdetails
                       animated:YES completion:NULL];
}

#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self ContractManagementSearch];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self SelectContractManagement];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self SelectContractManagement];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
    
}
#pragma mark-Webservices
-(void)SelectContractManagement
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectContractManagement xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectContractManagement>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectContractManagement" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}
-(void)ContractManagementSearch
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ContractManagementSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</ContractManagementSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ContractManagementSearch" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}


#pragma mark - Connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[_webdata setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webdata appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webdata length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webdata mutableBytes] length:[_webdata length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webdata];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_contracttable reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"SelectContractManagementResult"]) {
        _contractlistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
    }
    if ([elementName isEqualToString:@"ContractManagementSearchResponse"]) {
        _contractlistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
    }

    if ([elementName isEqualToString:@"ContactEntryId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"CustomerId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"CustomerName"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"AgreementorContract"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"Number"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"EffectiveDate"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"IndemnityClause"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"Payementclause"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"NetDays"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"VolumeDisClause"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"LabourClause"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"WeeklyHours"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"LabourOverTime"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"ShiftDifferential"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MinHrs"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"HolidaysPaid"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"SubContractorMarkup"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"SubContractorMarkup1"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"OtherClause"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"ShopWorkPermitted"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"ConsumableBilling"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"SmallToolBilling"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MarkupId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"OvertimeMarkupPer"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"EquipmentClause"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"ThirdPartyequipmentMarkup"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"LeaseMarkup"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"RentalMarkup"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MaterialPurchaseMarkup"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"DeliveryRatesClause"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"SpecialRatesStructure"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }


























    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults)
        
	{
        
        
		[_soapresults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"ContactEntryId"]) {
        _sub=[[subcontract alloc]init];
        recordResults=FALSE;
        _sub.contractid=[_soapresults integerValue];
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"CustomerId"]) {
        recordResults=FALSE;
        _sub.custid=[_soapresults integerValue];
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"CustomerName"]) {
        recordResults=FALSE;
        _sub.CustomerName=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"AgreementorContract"]) {
        recordResults=FALSE;
        _sub.AgreementorContract=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"Number"]) {
        
        recordResults=FALSE;
        _sub.Number=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"EffectiveDate"]) {
        
        recordResults=FALSE;
        _sub.EffectiveDate=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"IndemnityClause"]) {
        
        recordResults=FALSE;
        _sub.IndemnityClause=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"Payementclause"]) {
        
        recordResults=FALSE;
        _sub.Payementclause=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"NetDays"]) {
        
        recordResults=FALSE;
        _sub.NetDays=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"VolumeDisClause"]) {
        
        recordResults=FALSE;
        _sub.VolumeDisClause=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"LabourClause"]) {
        
        recordResults=FALSE;
        _sub.LabourClause=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"WeeklyHours"]) {
        
        recordResults=FALSE;
        _sub.WeeklyHours=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"LabourOverTime"]) {
        
        recordResults=FALSE;
        _sub.LabourOverTime=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"ShiftDifferential"]) {
        
        recordResults=FALSE;
        _sub.ShiftDifferential=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"MinHrs"]) {
        
        recordResults=FALSE;
        _sub.MinHrs=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"HolidaysPaid"]) {
        
        recordResults=FALSE;
        _sub.HolidaysPaid=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"SubContractorMarkup"]) {
        
        recordResults=FALSE;
        _sub.SubContractorMarkup=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"SubContractorMarkup1"]) {
        
        recordResults=FALSE;
        _sub.SubContractorMarkup1=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"OtherClause"]) {
        
        recordResults=FALSE;
        _sub.OtherClause=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"ShopWorkPermitted"]) {
        
        recordResults=FALSE;
        _sub.ShopWorkPermitted=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"ConsumableBilling"]) {
        
        recordResults=FALSE;
        _sub.ConsumableBilling=_soapresults;
        _soapresults=nil;
    }
    
    if ([elementName isEqualToString:@"SmallToolBilling"]) {
        
        recordResults=FALSE;
        _sub.SmallToolBilling=_soapresults;
        _soapresults=nil;
    }

    
    if ([elementName isEqualToString:@"MarkupId"]) {
        
        recordResults=FALSE;
        _sub.MarkupId=_soapresults;
        _soapresults=nil;
    }

    
    if ([elementName isEqualToString:@"OvertimeMarkupPer"]) {
        
        recordResults=FALSE;
        _sub.OvertimeMarkupPer=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"EquipmentClause"]) {
        
        recordResults=FALSE;
        _sub.EquipmentClause=_soapresults;
        _soapresults=nil;
    }
    


    
    if ([elementName isEqualToString:@"ThirdPartyequipmentMarkup"]) {
        
        recordResults=FALSE;
        _sub.ThirdPartyequipmentMarkup=_soapresults;
        _soapresults=nil;
    }

    
    if ([elementName isEqualToString:@"LeaseMarkup"]) {
        
        recordResults=FALSE;
        _sub.LeaseMarkup=_soapresults;
        _soapresults=nil;
    }

    
    if ([elementName isEqualToString:@"RentalMarkup"]) {
        
        recordResults=FALSE;
        _sub.RentalMarkup=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"MaterialPurchaseMarkup"]) {
        
        recordResults=FALSE;
        _sub.MaterialPurchaseMarkup=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"DeliveryRatesClause"]) {
        
        recordResults=FALSE;
        _sub.DeliveryRatesClause=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"SpecialRatesStructure"]) {
        
        recordResults=FALSE;
        _sub.SpecialRatesStructure=_soapresults;
        [_contractlistarray addObject:_sub];
        _soapresults=nil;
    }






}



@end
