//
//  BranchViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/24/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "BranchViewController.h"

@interface BranchViewController ()

@end

@implementation BranchViewController

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
    [self SelectBranches];
    [[self.addresstextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.addresstextview layer] setBorderWidth:2];
    [[self.addresstextview layer] setCornerRadius:10];
    _branchtable.layer.borderWidth = 3.0;
    _branchtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _tabletitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.branchtable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Actions
- (IBAction)Closebranchpage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)addbranchaction:(id)sender
{
    _branchview.hidden=NO;
    optionidentifier=1;
    
}
-(IBAction)deletebranchAction:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_branchtable setEditing:NO animated:NO];
        [_branchtable reloadData];
        
    }
    else
    {
        [super setEditing:YES animated:YES];
        [_branchtable setEditing:YES animated:YES];
        [_branchtable reloadData];
    }
}
-(IBAction)editbranchaction:(id)sender
{
    _branchview.hidden=NO;
    optionidentifier=2;
    _navbar.title=@"EDIT";
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.branchtable];
    NSIndexPath *textFieldIndexPath = [self.branchtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    custbranchmodel*bmdl=(custbranchmodel *)[_brancharray objectAtIndex:textFieldIndexPath.row];
    
    _branchnametextfld.text=bmdl.branchname;
    _addresstextview.text=bmdl.branchaddress;
    _phonetextfield.text=bmdl.phone;
    _faxtextfield.text=bmdl.fax;
    _emailtextfield.text=bmdl.email;

    
}

-(IBAction)closebranch:(id)sender
{
    _branchview.hidden=YES;
}
-(IBAction)savebranch:(id)sender
{
    if (optionidentifier==1) {
        [self BranchInsert];
    }
    else
    {
        [self BranchUpdate];
    }
}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_brancharray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"branchcell" owner:self options:nil];
        cell=_branchcell;
        //        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    custbranchmodel*bmdl=(custbranchmodel *)[_brancharray objectAtIndex:indexPath.row];
    _branchnamelabel=(UILabel*)[cell viewWithTag:1];
    _branchnamelabel.text=bmdl.branchname;
    _branchaddresslabel=(UILabel*)[cell viewWithTag:2];
    _branchaddresslabel.text=bmdl.branchaddress;
    _phonelabel=(UILabel*)[cell viewWithTag:3];
    _phonelabel.text=bmdl.phone;
    _faxlabel=(UILabel*)[cell viewWithTag:4];
    _faxlabel.text=bmdl.fax;
    _emaillabel=(UILabel*)[cell viewWithTag:5];
    _emaillabel.text=bmdl.email;
    
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    if (!self.jbdetailVCtrl) {
    //        self.jbdetailVCtrl=[[jobdetailsViewController alloc]initWithNibName:@"jobdetailsViewController" bundle:nil];
    //    }
    //    _jbdetailVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    //    [self presentViewController:_jbdetailVCtrl
    //                       animated:YES completion:NULL];
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
        //[self Vendordelete];
        [_brancharray removeObject:indexPath];
        
        
        
        
        
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_branchtable)
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
#pragma mark-Webservices
-(void)SelectBranches
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Branchselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</Branchselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Branchselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BranchInsert
{  webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BranchInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BranchName>%@</BranchName>\n"
                   "<BranchAddress>%@</BranchAddress>\n"
                   "<Phone>%@</Phone>\n"
                   "<Fax>%@</Fax>\n"
                   "<Email>%@</Email>\n"
                   "</BranchInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_branchnametextfld.text,_addresstextview.text,_phonetextfield.text,_faxtextfield.text,_emailtextfield.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BranchInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BranchUpdate
{
    webtype=1;
    recordResults = FALSE;
    custbranchmodel*bmdl=(custbranchmodel *)[_brancharray objectAtIndex:btnindex];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BranchUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BranchId>%d</BranchId>\n"
                   "<BranchName>%@</BranchName>\n"
                   "<BranchAddress>%@</BranchAddress>\n"
                   "<Phone>%@</Phone>\n"
                   "<Fax>%@</Fax>\n"
                   "<Email>%@</Email>\n"
                   "</BranchUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",bmdl.branchid,_branchnametextfld.text,_addresstextview.text,_phonetextfield.text,_faxtextfield.text,_emailtextfield.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BranchUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webData length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webData mutableBytes] length:[_webData length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_branchtable reloadData];
    if (webtype==1) {
        [self SelectBranches];
        webtype=0;
    }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"BranchselectResult"]) {
        _brancharray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
         recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"BranchId"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
         recordResults = TRUE;
    }
    if ([elementName isEqualToString:@"BranchName"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
         recordResults = TRUE;
    }
    if ([elementName isEqualToString:@"BranchAddress"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
         recordResults = TRUE;
    }
    if ([elementName isEqualToString:@"Phone"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
         recordResults = TRUE;
    }if ([elementName isEqualToString:@"Fax"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
         recordResults = TRUE;
    }
    if ([elementName isEqualToString:@"Email"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
         recordResults = TRUE;
        
    }





}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults
       )
        
	{
        
        
		[_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"BranchId"]) {
        _branchmodel=[[custbranchmodel alloc]init];
        recordResults=FALSE;
        _branchmodel.branchid=[_soapResults integerValue];
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"BranchName"]) {
        recordResults=FALSE;
        _branchmodel.branchname=_soapResults;
        _soapResults=nil;
    }

    if ([elementName isEqualToString:@"BranchAddress"]) {
        
        recordResults=FALSE;
        _branchmodel.branchaddress=_soapResults;
        _soapResults=nil;
    }

    if ([elementName isEqualToString:@"Phone"]) {
        
        recordResults=FALSE;
        _branchmodel.phone=_soapResults;
        _soapResults=nil;
    }

    if ([elementName isEqualToString:@"Fax"]) {
       
        recordResults=FALSE;
        _branchmodel.fax=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"Email"]) {
        
        recordResults=FALSE;
        _branchmodel.email=_soapResults;
        [_brancharray addObject:_branchmodel];
        _soapResults=nil;
    }

}

@end
