//
//  BranchsubViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 12/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "BranchsubViewController.h"

@interface BranchsubViewController ()

@end

@implementation BranchsubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    //_addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    _branchtable.layer.borderWidth=3.0;
    _branchtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];

    // Do any additional setup after loading the view from its nib.
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

- (IBAction)closesubbranch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addbranch:(id)sender {
    _addview.hidden=NO;
}

- (IBAction)deletebranch:(id)sender {
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

- (IBAction)updatebranch:(id)sender {
}

- (IBAction)gotomasterbranch:(id)sender {
    _branchctrl=[[BranchViewController alloc]initWithNibName:@"BranchViewController" bundle:nil];
    [self presentViewController:_branchctrl animated:YES completion:nil];
}

- (IBAction)selectbranch:(id)sender {
    [self createpopover];
    [self SelectBranches];
}

- (IBAction)closeaddform:(id)sender {
    _addview.hidden=YES;
}

#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 250, 200)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 250, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 32;
    
    
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(250, 200);
    
    //create a popover controller
    self.popOvercontroller = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOvercontroller.popoverContentSize=CGSizeMake(250.0f, 200.0f);
    self.popOvercontroller=_popOvercontroller;
    [self.popOvercontroller presentPopoverFromRect:_branchselectbtn.frame
                                            inView:self.addview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_popovertableview){
        
        return [_brancharray count];
        
    }else{
        return 5;
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        if(tableView==_branchtable){
            
            [[NSBundle mainBundle]loadNibNamed:@"SBBranchcell" owner:self options:nil];
            cell=_branchcell;
        }
        
       
    }
    if(tableView==_popovertableview){
        _branchmdl=(Cbranch*)[_brancharray objectAtIndex:indexPath.row];
        cell.textLabel.text=_branchmdl.branchname;
        
    }
    else{
//        Craftreqmtmdl*crftreqmdl=(Craftreqmtmdl *)[_brcraftarray objectAtIndex:indexPath.row];
  //     _branchlabel=(UILabel *)[cell viewWithTag:1];
//        _branchlabel=crftreqmdl.Brdescriptn;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popovertableview) {
         _branchmdl=(Cbranch*)[_brancharray objectAtIndex:indexPath.row];
        path=indexPath.row;
        [_branchselectbtn setTitle:_branchmdl.branchname forState:UIControlStateNormal];
        
    }
    [self.popOvercontroller dismissPopoverAnimated:YES];
}

#pragma mark-Tableview UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (tableView==_branchtable) {
        
        
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
            
        }else
        {
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f]];
        }
        
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
//        [self UserLogmaindelete];
//        deletepath=indexPath.row;
//        
//        [self CraftrequirementDelete];
//        [_brcraftarray removeObject:indexPath];
        
        
        
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
    
    [_branchtable reloadData];
    [_popovertableview reloadData];


}
#pragma mark-Webservices
-(void)SelectBranches
{
    //webtype=0;
    recordresults = FALSE;
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
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
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
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"BranchselectResponse"]) {
        _brancharray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordresults = TRUE;
        
    }
    
    
    if ([elementName isEqualToString:@"BranchId"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
            
            
        }
        recordresults = TRUE;
    }
    if ([elementName isEqualToString:@"BranchName"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordresults = TRUE;
    }
    if ([elementName isEqualToString:@"BranchAddress"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordresults = TRUE;
    }
    if ([elementName isEqualToString:@"Phone"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordresults = TRUE;
    }if ([elementName isEqualToString:@"Fax"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordresults = TRUE;
    }
    if ([elementName isEqualToString:@"Email"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
            
        }
        recordresults = TRUE;
        
    }
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
    if( recordresults
       )
        
    {
        
        
        [_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"BranchId"]) {
        _branchmdl=[[Cbranch alloc]init];
        recordresults=FALSE;
        _branchmdl.branchid=[_soapResults integerValue];
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"BranchName"]) {
        recordresults=FALSE;
        
        _branchmdl.branchname=_soapResults;
        _soapResults=nil;
    }
    
    if ([elementName isEqualToString:@"BranchAddress"]) {
        
        recordresults=FALSE;
        _branchmdl.branchaddress=_soapResults;
        _soapResults=nil;
    }
    
    if ([elementName isEqualToString:@"Phone"]) {
        
        recordresults=FALSE;
        _branchmdl.phone=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _soapResults=nil;
    }
    
    if ([elementName isEqualToString:@"Fax"]) {
        
        recordresults=FALSE;
        _branchmdl.fax=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"Email"]) {
        
        recordresults=FALSE;
        _branchmdl.email=_soapResults;
        [_brancharray addObject:_branchmdl];
        _soapResults=nil;
    }
}



@end
