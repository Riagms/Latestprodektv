//
//  BidViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "BidViewController.h"

@interface BidViewController ()

@end

@implementation BidViewController

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
    _bidtitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    _bidtable.layer.borderWidth = 2.0;
    _bidtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
self.openviewindex=NSNotFound;
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self BidSelect];
    self.openviewindex=NSNotFound;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closebidpage:(id)sender
{
    self.openviewindex=NSNotFound;
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_bidlistarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        [[NSBundle mainBundle]loadNibNamed:@"bidcell" owner:self options:nil];
            cell=_bidcell;
            
    }
    
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    Bidmodel*bmdl=(Bidmodel *)[_bidlistarray objectAtIndex:indexPath.row];
    _bididlabel=(UILabel *)[cell viewWithTag:1];
    _bididlabel.text=bmdl.bidid;
    _namelabel=(UILabel *)[cell viewWithTag:2];
    _namelabel.text=bmdl.customername;
    _amountlabel=(UILabel *)[cell viewWithTag:3];
    _amountlabel.text=bmdl.totalamount;
    _statuslabel=(UILabel *)[cell viewWithTag:4];
    _statuslabel.text=bmdl.bidstatus;

    bidtablebtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [bidtablebtn setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
    //  [disbtn setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
    bidtablebtn.tag=indexPath.row;
    [bidtablebtn addTarget:self action:@selector(bidaction:) forControlEvents:UIControlEventTouchUpInside];
    bidtablebtn.frame = CGRectMake(200.0, 0.0, 50.0, 50.0);
    [cell.contentView addSubview:bidtablebtn];

    
    
    
    return cell;
}
-(void)bidaction:(UIButton*)sender{
    
    // [_animatedview removeFromSuperview];
    _bidlabel.hidden=YES;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
        .frame =  CGRectMake(245, 12, 0, 0);} completion:nil];
    
    _animatedview.hidden=YES;
    //Empmdl *empmdl=(Empmdl *)[_employeelistarray objectAtIndex:sender.tag];
    
    
    
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.bidtable];
    NSIndexPath *textFieldIndexPath = [self.bidtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    
    
    //create uiview
    _animatedview=[[UIView alloc]initWithFrame:CGRectMake(245, 12, 0, 25)];
    _animatedview.backgroundColor=[UIColor colorWithRed:99.0/255.0f green:184.0/255.0f blue:255.0/255.0f alpha:1.0f];
    _bidlabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 150, 25)];
    _bidlabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
    [_bidlabel setTextAlignment:NSTextAlignmentJustified];
    _bidlabel.textColor=[UIColor blackColor];
    _bidlabel.text=@"Bid Table";
    [self.animatedview addSubview:_bidlabel];
    
    _bidlabel.hidden=YES;
    
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tobidtable)];
    [self.animatedview addGestureRecognizer:tap];
    [cell addSubview:_animatedview];
    
    _animatedview.hidden=NO;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
        .frame =  CGRectMake(245, 12, 79, 25);} completion:nil];
    
    _bidlabel.hidden=NO;
    
    //    NSLog(@"%@",empmdl.badgeflag);
    //    if ([empmdl.badgeflag isEqualToString:@"true"]) {
    //        //_badgelbl.enabled=NO;
    //        _animatedview.userInteractionEnabled=NO;
    //        //_animatedview.
    //
    //    }
    
    [self showviewWithUserAction:YES];
}
-(void)showviewWithUserAction:(BOOL)userAction
{
     bidtablebtn.selected = !bidtablebtn.selected;
  if (userAction) {
    if (bidtablebtn.selected) {
        
        _animatedview.hidden=NO;
        [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
            .frame =  CGRectMake(245, 12, 79, 25);} completion:nil];
        [self viewopened:btnindex];
        
        _bidlabel.hidden=NO;
        
        
        
    }
    else{
        [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
            .frame =  CGRectMake(245, 12, 79, 25);} completion:nil];
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
            .frame =  CGRectMake(245, 12, 0, 0);} completion:nil];
        
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
-(void)tobidtable
{
    Bidmodel*bmdl=(Bidmodel *)[_bidlistarray objectAtIndex:btnindex];
    
    if (!self.Displayctrlr) {
        self.Displayctrlr=[[DisplayBidTableViewController alloc]initWithNibName:@"DisplayBidTableViewController" bundle:nil];
    }
    
    [self presentViewController:_Displayctrlr animated:YES completion:nil];
    self.openviewindex=NSNotFound;
}



#pragma mark-Webservice
-(void)BidSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</BidSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    [_bidtable reloadData];
    
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"BidSelectResponse"])
    {
        _bidlistarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"bidid"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
        
    }
    if([elementName isEqualToString:@"totalamount"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
        
    }
    if([elementName isEqualToString:@"bidstatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
        
    }
    if([elementName isEqualToString:@"customername"])
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
    if([elementName isEqualToString:@"BidSelectResponse"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        _bidmdl=[[Bidmodel alloc]init];
        _bidmdl.idvalue=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"bidid"])
    {
        
        recordResults = FALSE;
        _bidmdl.bidid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"totalamount"])
    {
        
        recordResults = FALSE;
        _bidmdl.totalamount=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"bidstatus"])
    {
        
        recordResults = FALSE;
        _bidmdl.bidstatus=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"customername"])
    {
        
        recordResults = FALSE;
        _bidmdl.customername=_soapResults;
        [_bidlistarray addObject:_bidmdl];
        _soapResults = nil;
    }


    



}


@end
