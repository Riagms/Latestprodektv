//
//  AddworkViewController.m
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "AddworkViewController.h"

@interface AddworkViewController ()

@end

@implementation AddworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    self.scrollview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    [[self.destxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.destxtview layer] setBorderWidth:3];
    [[self.destxtview layer] setCornerRadius:10];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    outagestring=@"";
    spacestring=@"";
    clearstring=@"";
    [self ReadPriority];
    _updatebtn.enabled=YES;
    _scrollview.frame=CGRectMake(0, 44, 1024, 980);
    [_scrollview setContentSize:CGSizeMake(1024, 1100)];
    _date1.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _date2.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

    if (_optiontype==2) {
        _navitem.title=@"Edit Work Order";
        _workmdl=(Workordrmdl*)[_workarray objectAtIndex:0];
        _workordrtxtfld.text=_workmdl.WorkNo;
        [_prioritybtn setTitle:_workmdl.priorityname forState:UIControlStateNormal];
        _planttxtfld.text=_workmdl.plant;
        _subunittxtfld.text=_workmdl.subunit;
        _equmnttxtfld.text=_workmdl.equipmet;
        _tagtxtfld.text=_workmdl.defTag;
        _destxtview.text=_workmdl.des;
        _requsttxtfld.text=_workmdl.reqBy;
        _approvetxtfld.text=_workmdl.apprBy;
        _date1.text=_workmdl.reqDate;
        _date2.text=_workmdl.apprDate;
        _user1textfield.text=_workmdl.userD1;
        _user2textfield.text=_workmdl.userD2;
        if ([_workmdl.outage isEqualToString:@"true"]) {
             [_outagebtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else
        {
        [_outagebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        if ([_workmdl.space isEqualToString:@"true"]) {
  [_spacebtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];        }
        else
        {
            [_spacebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        if ([_workmdl.clearence isEqualToString:@"true"]) {
            [_clearancebtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else
        {
             [_clearancebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }

    }
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
- (IBAction)Prioritymaster:(id)sender {
    [_prioritybtn setTitle:@"Select" forState:UIControlStateNormal];
    self.priorityVCtrl=[[PrirityViewController alloc]initWithNibName:@"PrirityViewController" bundle:nil];
    self.priorityVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_priorityVCtrl animated:YES completion:nil];
    
}

- (IBAction)priorityselection:(id)sender {
    [self ReadPriority];
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    // popoverView.backgroundColor = [UIColor whiteColor];
    _poptableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _poptableview.delegate=(id)self;
    _poptableview.dataSource=(id)self
    ;
    
    _poptableview.rowHeight= 30;
    _poptableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
   
    [popoverView addSubview:_poptableview];
    popoverContent.view = popoverView;
    popoverContent.preferredContentSize = CGSizeMake(200, 200);
    
    
    //UITableView *table = (UITableView *)[cell superview];
    self.popovercontroller = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    self.popovercontroller.popoverContentSize=CGSizeMake(200.0f, 200.0f);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_prioritybtn.frame inView:self.scrollview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];

    
}

- (IBAction)updatebtn:(id)sender {
    if (_optiontype==1) {
        if ([_workordrtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Work Order No is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_prioritybtn.titleLabel.text isEqualToString:@"Select"]||[_prioritybtn.titleLabel.text isEqualToString:@""])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Priority is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
         else if([_planttxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
             UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Plant is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
             [alert show];
         }
         else if([_requsttxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
             UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Requested By is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
             [alert show];
         }
        else
        {

        
        [self CreatePlanningWorkEntImport];
        _updatebtn.enabled=NO;
        }
    }
    else if(_optiontype==2)
    {
        if ([_workordrtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Work Order No is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_prioritybtn.titleLabel.text isEqualToString:@"Select"]||[_prioritybtn.titleLabel.text isEqualToString:@""])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Priority is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_planttxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Plant is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if([_requsttxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Requested By is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {

        [self UpdatePlanningWorkorder];
         _updatebtn.enabled=NO;
        }
    }
    
}
-(IBAction)checkoutage:(id)sender
{ outagestring=@"out";
    if (outage==0) {
        [_outagebtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        outage=1;
        
    }
    
    else{
        [_outagebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        outage=0;
        
    }
    
}
-(IBAction)checkclearance:(id)sender
{
    clearstring=@"clear";
    if (clear==0) {
        [_clearancebtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        clear=1;
        
    }
    
    else{
        [_clearancebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        clear=0;
        
    }
    
}
-(IBAction)checkspace:(id)sender
{
    spacestring=@"space";
    if (space==0) {
        [_spacebtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        space=1;
        
    }
    
    else{
        [_spacebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        space=0;
        
    }
    
}


- (IBAction)cancelbtn:(id)sender {
    _workordrtxtfld.text=@"";
    _planttxtfld.text=@"";
    _subunittxtfld.text=@"";
    _equmnttxtfld.text=@"";
    _tagtxtfld.text=@"";
    _destxtview.text=@"";
    _requsttxtfld.text=@"";
    _date1.text=@"";
    _date2.text=@"";
    _user1textfield.text=@"";
    _user2textfield.text=@"";
    _approvetxtfld.text=@"";
     [_spacebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
     [_clearancebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
     [_outagebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_prioritybtn setTitle:@"Select" forState:UIControlStateNormal];
    

}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_poptableview){
        return [_priorityarray count];
    }
       return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
           }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    if(tableView==_poptableview){
        _pmodel=(prioritymodel*)[_priorityarray objectAtIndex:indexPath.row];
        cell.textLabel.text=_pmodel.priorityname;
    }
    
    return cell;
}


#pragma mark-Tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_poptableview) {
        priyorityindex=indexPath.row;
         _pmodel=(prioritymodel*)[_priorityarray objectAtIndex:indexPath.row];
        [_prioritybtn setTitle:_pmodel.priorityname forState:UIControlStateNormal];
    }
    [self.popovercontroller dismissPopoverAnimated:YES];
        
}


-(void)CreatePlanningWorkEntImport
{
    recordResults = FALSE;
    NSString *soapMessage;
       _pmodel=(prioritymodel*)[_priorityarray objectAtIndex:priyorityindex];
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreatePlanningWorkEntImport xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanIID>%@</PlanIID>\n"
                   "<WorkNo>%@</WorkNo>\n"
                   "<priority>%d</priority>\n"
                   "<plant>%@</plant>\n"
                   "<subunit>%@</subunit>\n"
                   "<equipmet>%@</equipmet>\n"
                   "<defTag>%@</defTag>\n"
                   "<description>%@</description>\n"
                   "<outage>%d</outage>\n"
                   "<clearence>%d</clearence>\n"
                   "<space>%d</space>\n"
                   "<reqBy>%@</reqBy>\n"
                   "<apprBy>%@</apprBy>\n"
                   "<userD1>%@</userD1>\n"
                   "<userD2>%@</userD2>\n"
                   "</CreatePlanningWorkEntImport>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workordrtxtfld.text,[_pmodel.Pentryid integerValue] ,_planttxtfld.text,_subunittxtfld.text,_equmnttxtfld.text,_tagtxtfld.text,_destxtview.text,outage,clear,space,_requsttxtfld.text,_approvetxtfld.text,_user1textfield.text,_user2textfield.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreatePlanningWorkEntImport" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdatePlanningWorkorder
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    _workmdl=(Workordrmdl*)[_workarray objectAtIndex:0];
    NSInteger a;
    NSInteger b;
    NSInteger c;
    if([outagestring isEqualToString:@"out"])
    {
        if (outage==0) {
            a=0;
        }
        else{
            a=1;
            
        }
        outagestring=@"";
    }
    else
    {   if([_workmdl.outage isEqualToString:@"true"])
    {
        a=1;
    }
    else
    {
        a=0;
    }
    }
    if([clearstring isEqualToString:@"clear"])
    {
        if (clear==0) {
            b=0;
        }
        else{
            b=1;
            
        }
        clearstring=@"";
    }
    else
    {
        if([_workmdl.clearence isEqualToString:@"true"])
        {
            b=1;
        }
        else
        {
            b=0;
        }
        
    }
    if([spacestring isEqualToString:@"space"])
    {
        if (spacestring==0) {
            c=0;
        }
        else{
            c=1;
            
        }
        spacestring=@"";
    }
    else
    {
        if([_workmdl.space isEqualToString:@"true"])
        {
            c=1;
        }
        else
        {
            c=0;
        }
        
    }
   
    NSString *pid=[_priyoritydict objectForKey:_prioritybtn.titleLabel.text];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdatePlanningWorkorder xmlns=\"http://ios.kontract360.com/\">\n"
                   "<WorkNo>%@</WorkNo>\n"
                   "<priority>%d</priority>\n"
                   "<plant>%@</plant>\n"
                   "<subunit>%@</subunit>\n"
                   "<equipmet>%@</equipmet>\n"
                   "<defTag>%@</defTag>\n"
                   "<description>%@</description>\n"
                   "<outage>%d</outage>\n"
                   "<clearence>%d</clearence>\n"
                   "<space>%d</space>\n"
                   "<reqBy>%@</reqBy>\n"
                   "<apprBy>%@</apprBy>\n"
                   "<userD1>%@</userD1>\n"
                   "<userD2>%@</userD2>\n"
                   "<EntryId>%d</EntryId>\n"
                   "</UpdatePlanningWorkorder>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_workordrtxtfld.text,[pid integerValue],_planttxtfld.text,_subunittxtfld.text,_equmnttxtfld.text,_tagtxtfld.text,_destxtview.text,a,b,c,_requsttxtfld.text,_approvetxtfld.text,_user1textfield.text,_user2textfield.text,[_workmdl.workorderid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdatePlanningWorkorder" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadPriority
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadPriority xmlns=\"http://ios.kontract360.com/\">\n"
                   "</ReadPriority>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadPriority" forHTTPHeaderField:@"Soapaction"];
    
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
    [_poptableview reloadData];
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"CreatePlanningWorkEntImportResponse"])
    {
      
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UpdatePlanningWorkorderResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ReadPriorityResponse"])
    {
        _priorityarray=[[NSMutableArray alloc]init];
        _priyoritydict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"priority"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"level"])
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
    if([elementName isEqualToString:@"EntryId"])
    {
        recordResults = FALSE;
        
        _pmodel=[[prioritymodel alloc]init];
        _pmodel.Pentryid=_soapResults;
        _priyorityid=_soapResults;
        _soapResults=nil;
        
        
    }
    
    if([elementName isEqualToString:@"priority"])
    {
        recordResults = FALSE;
        
        
        _pmodel.priorityname=_soapResults;
         [_priyoritydict setObject:_priyorityid forKey:_soapResults];
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"level"])
    {
        recordResults = FALSE;
        
        
        _pmodel.level=_soapResults;
        [_priorityarray addObject:_pmodel];
       
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"records"])
    {
        recordResults = FALSE;
        _result=_soapResults;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
     
        _soapResults=nil;
        
        
    }


    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.message isEqualToString:_result]) {
        _workordrtxtfld.text=@"";
        _planttxtfld.text=@"";
        _subunittxtfld.text=@"";
        _equmnttxtfld.text=@"";
        _tagtxtfld.text=@"";
        _destxtview.text=@"";
        _requsttxtfld.text=@"";
        _date1.text=@"";
        _date2.text=@"";
        _user1textfield.text=@"";
        _user2textfield.text=@"";
        _approvetxtfld.text=@"";
        [_spacebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_clearancebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_outagebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_prioritybtn setTitle:@"Select" forState:UIControlStateNormal];
        
        [_prioritybtn setTitle:@"Select" forState:UIControlStateNormal];
        //_updatebtn.enabled=YES;
        if (_optiontype==2) {
           
            //_updatebtn.enabled=YES;
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        [self ReadPriority];
    }
}

@end
