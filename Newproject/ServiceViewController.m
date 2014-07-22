//
//  ServiceViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ServiceViewController.h"

@interface ServiceViewController ()

@end

@implementation ServiceViewController

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
    _addserview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _servicesTable.layer.borderWidth = 2.0;
    _servicesTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.servicesTable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    self.openviewindex=NSNotFound;
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
   
    [super viewWillAppear:animated];
     self.openviewindex=NSNotFound;
    
    [self SelectAllServices];
//    disbtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    [disbtn setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
//    [disbtn setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closetheservicesview:(id)sender
{
     self.openviewindex=NSNotFound;
    _addserview.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:NULL];
}
#pragma mark-tableview datasources
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_servicelistarray count];
    }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"customservicescell" owner:self options:nil];
        cell=_servicecell;
           }
    Servicemdl*semdl=(Servicemdl *)[_servicelistarray objectAtIndex:indexPath.row];
    _servicelabel=(UILabel *)[cell viewWithTag:1];
    _servicelabel.text=semdl.servname;
    _abbrvtnlabel=(UILabel*)[cell viewWithTag:2];
    _abbrvtnlabel.text=semdl.abbrevtn;
     disbtn=[UIButton buttonWithType:UIButtonTypeCustom];
   [disbtn setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
  //  [disbtn setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
    disbtn.tag=indexPath.row;
    [disbtn addTarget:self action:@selector(disaction:) forControlEvents:UIControlEventTouchUpInside];
    disbtn.frame = CGRectMake(270.0, 0.0, 50.0, 50.0);
    [cell.contentView addSubview:disbtn];
    
       return cell;
}
-(void)disaction:(UIButton*)sender{
    
    // [_animatedview removeFromSuperview];
    _commentlabel.hidden=YES;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
        .frame =  CGRectMake(300, 11, 0, 0);} completion:nil];
    
    _animatedview.hidden=YES;
    //Empmdl *empmdl=(Empmdl *)[_employeelistarray objectAtIndex:sender.tag];
    
    
    
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.servicesTable];
    NSIndexPath *textFieldIndexPath = [self.servicesTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    
    
    //create uiview
    _animatedview=[[UIView alloc]initWithFrame:CGRectMake(300, 11, 0, 25)];
    _animatedview.backgroundColor=[UIColor colorWithRed:99.0/255.0f green:184.0/255.0f blue:255.0/255.0f alpha:1.0f];
    _commentlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 25)];
    _commentlabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
    _commentlabel.textColor=[UIColor blackColor];
    _commentlabel.text=@"Job Sequence";
    [self.animatedview addSubview:_commentlabel];
    
    _commentlabel.hidden=YES;
    
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tothejobsequence)];
    [self.animatedview addGestureRecognizer:tap];
    [cell addSubview:_animatedview];
    
    _animatedview.hidden=NO;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
        .frame =  CGRectMake(300, 11, 79, 25);} completion:nil];
    
    _commentlabel.hidden=NO;
    
    //    NSLog(@"%@",empmdl.badgeflag);
    //    if ([empmdl.badgeflag isEqualToString:@"true"]) {
    //        //_badgelbl.enabled=NO;
    //        _animatedview.userInteractionEnabled=NO;
    //        //_animatedview.
    //
    //    }
    
    [self showviewWithUserAction:YES];
}
-(void)tothejobsequence
{   Servicemdl*smdl=(Servicemdl *)[_servicelistarray objectAtIndex:btnindex];

    if (!self.jobseqctrl) {
        self.jobseqctrl=[[SerialViewController alloc]initWithNibName:@"SerialViewController" bundle:nil];
    }
    _jobseqctrl.skillid=smdl.servid;
    _jobseqctrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_jobseqctrl animated:YES completion:nil];
 self.openviewindex=NSNotFound;
}

-(void)showviewWithUserAction:(BOOL)userAction{
    
    // Toggle the disclosure button state.
   
    disbtn.selected = !disbtn.selected;
    
    if (userAction) {
        if (disbtn.selected) {
            
            _animatedview.hidden=NO;
            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
                .frame =  CGRectMake(300, 11, 79, 25);} completion:nil];
            [self viewopened:btnindex];
           
            _commentlabel.hidden=NO;
            
            
            
        }
        else{
            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
                .frame =  CGRectMake(300, 11, 79, 25);} completion:nil];
            [self viewclosed:btnindex];
            //_venderlbl.hidden=YES;
            
        }
        
        
    }
}
-(void)viewopened:(NSInteger)viewopened{
    
    
    selectedcell=viewopened;
    NSInteger previousOpenviewIndex = self.openviewindex;
    
    if (previousOpenviewIndex != NSNotFound) {
        [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{  _animatedview
            .frame =  CGRectMake(300, 10, 0, 0);} completion:nil];
        
        _animatedview.hidden=YES;
        
        
        // }
        
        
    }
    
    self.openviewindex=viewopened;
    
    
    
    
    
    
}
-(void)viewclosed:(NSInteger)viewclosed
{
    
    viewclosed=btnindex;
    _animatedview.hidden=YES;

    self.openviewindex = NSNotFound;
    
    
}


#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
        [self DeleteServices];
        [_servicelistarray removeObject:indexPath];
        
        
        
        
        
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_servicesTable)
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
#pragma mark-IBActions

-(IBAction)Addservices:(id)sender
{   optionidentifier=1;
    self.navabar.title = @"Create";
    _resultdispalylabel.hidden=YES;
    _addserview.hidden=NO;
    _servicetextfld.text=@"";
    _abbreviatintextfld.text=@"";
 self.openviewindex=NSNotFound;
     _animatedview.hidden=YES;
    _cancelbtn.enabled=YES;
}
-(IBAction)editservices:(id)sender
{   optionidentifier=2;
    _cancelbtn.enabled=NO;
     self.navabar.title = @"Edit";
    _resultdispalylabel.hidden=YES;
    _addserview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.servicesTable];
    NSIndexPath *textFieldIndexPath = [self.servicesTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    Servicemdl*servmdl=(Servicemdl *)[_servicelistarray objectAtIndex:textFieldIndexPath.row];
    
    _servicetextfld.text=servmdl.servname;
    _abbreviatintextfld.text=servmdl.abbrevtn;
    NSLog(@"%@",servmdl.abbrevtn);
   self.openviewindex=NSNotFound;
    _animatedview.hidden=YES;
}
-(IBAction)closeaddview:(id)sender
{
    _resultdispalylabel.hidden=YES;
    _addserview.hidden=YES;
     self.openviewindex=NSNotFound;
}
-(IBAction)updateservice:(id)sender
{
  if(optionidentifier==1)
{
    
   Validation*val=[[Validation alloc]init];
        int value1=[val isBlank:_servicetextfld.text];
        if (value1==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Service name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        
        
    }
    else
    {
        
    

    [self InsertServices];
//    _servicetextfld.text=@"";
//    _abbreviatintextfld.text=@"";
    [_servicetextfld resignFirstResponder];
    }
}
    else if(optionidentifier==2)
    {   Validation*val=[[Validation alloc]init];
        int value1=[val isBlank:_servicetextfld.text];
        if (value1==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Service name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
            
        }
        else
        {

        [self UpdateServices];
//        _servicetextfld.text=@"";
//        _abbreviatintextfld.text=@"";
        [_servicetextfld resignFirstResponder];
        }
    }
}
-(IBAction)cancelservice:(id)sender
{
    _servicetextfld.text=@"";
    _abbreviatintextfld.text=@"";
}
-(IBAction)deleteservices:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_servicesTable setEditing:NO animated:NO];
        [_servicesTable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_servicesTable setEditing:YES animated:YES];
        [_servicesTable reloadData];

}


}
#pragma mark- WebService
-(void)SelectAllServices{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllServices xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</SelectAllServices>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SelectAllServices" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)InsertServices{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertServices xmlns=\"http://test.kontract360.com/\">\n"
                   "<servname>%@</servname>\n"
                   "<Abbrevation>%@</Abbrevation>\n"
                   "</InsertServices>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_servicetextfld.text,_abbreviatintextfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/InsertServices" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DeleteServices{
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
     Servicemdl*servmdl=(Servicemdl *)[_servicelistarray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   "<soap:Body>\n"
                   "<DeleteServices xmlns=\"http://test.kontract360.com/\">\n"
                    "<skillid>%d</skillid>\n"
                   "</DeleteServices>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",servmdl.servid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/DeleteServices" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)UpdateServices{
    webtype=1;
    
    
    recordResults = FALSE;
    NSString *soapMessage;
    Servicemdl*sermdl=(Servicemdl *)[_servicelistarray objectAtIndex:btnindex];

    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateServices xmlns=\"http://test.kontract360.com/\">\n"
                   "<SkillId>%d</SkillId>\n"
                   "<servname>%@</servname>\n"
                   "<Abbrevation>%@</Abbrevation>\n"
                   "</UpdateServices>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",sermdl.servid,_servicetextfld.text,_abbreviatintextfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UpdateServices" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SearchServices{
    
    
    
    recordResults = FALSE;
    NSString *soapMessage;
   
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchServices xmlns=\"http://test.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchServices>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SearchServices" forHTTPHeaderField:@"Soapaction"];
    
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
	
	
	if( _xmlParser )
	{
		
	}
	
	_xmlParser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlParser setDelegate:(id)self];
	[_xmlParser setShouldResolveExternalEntities: YES];
	[_xmlParser parse];
    if (webtype==1||webtype==2) {
        [self SelectAllServices];
        webtype=0;
    }

    [_servicesTable reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllServicesResult"])
    {
        _servicelistarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"UpdateServicesResult"])
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
    if([elementName isEqualToString:@"InsertServicesResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DeleteServicesResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    

    



    if([elementName isEqualToString:@"SearchServicesResponse"])
    {
        _servicelistarray=[[NSMutableArray alloc]init];
        
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
        _servmdl=[[Servicemdl alloc]init];
        
        recordResults = FALSE;
        
        _servmdl.servid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        
        
        recordResults = FALSE;
        
        _servmdl.servname=_soapResults;
        
      
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Abbrevation"])
    {
        
        recordResults = FALSE;
        
        _servmdl.abbrevtn=_soapResults;
        [_servicelistarray addObject:_servmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"UpdateServicesResult"])
    {
        
        recordResults = FALSE;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"InsertServicesResult"])
    {
        
        recordResults = FALSE;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"DeleteServicesResult"])
    {
        
        recordResults = FALSE;
        _soapResults = nil;
    }


    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
    
        msgstr=_soapResults;
        if (webtype==1) {
            
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:msgstr delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        }
        

        _soapResults = nil;
    }




}
#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchServices];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self SelectAllServices];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self SelectAllServices];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
    
}
#pragma mark-textfld delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField==_servicetextfld)
    {
        NSUInteger newLength = [_servicetextfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_abbreviatintextfld)
    {
        NSUInteger newLength = [_abbreviatintextfld.text length] + [string length] - range.length;
        return (newLength > 5) ? NO : YES;
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
   
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.message isEqualToString:msgstr]) {
        _servicetextfld.text=@"";
        _abbreviatintextfld.text=@"";
        [_servicetextfld resignFirstResponder];
        [_abbreviatintextfld resignFirstResponder];
    }
}

@end
