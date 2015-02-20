//
//  ManagemttileViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "ManagemttileViewController.h"

@interface ManagemttileViewController ()

@end

@implementation ManagemttileViewController

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
    _result=@"";
    _Moduleid=0;
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(Resourcepage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.resurceview addGestureRecognizer:doubleTap];
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(Issuepage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.issueview addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(Timesheetpage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.timesheetview addGestureRecognizer:doubleTap2];
    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(labourPage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.labrview addGestureRecognizer:doubleTap3];
    
    UITapGestureRecognizer *doubleTap4 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(Sitereqpage)];
    doubleTap4.numberOfTapsRequired=1;
    doubleTap4.delegate=(id)self;
    [self.siteview addGestureRecognizer:doubleTap4];
    
    UITapGestureRecognizer *doubleTap5 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(Absentpage)];
    doubleTap5.numberOfTapsRequired=1;
    doubleTap5.delegate=(id)self;
    [self.absntview addGestureRecognizer:doubleTap5];
    
    UITapGestureRecognizer *doubleTap6 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(Jobpage)];
    doubleTap6.numberOfTapsRequired=1;
    doubleTap6.delegate=(id)self;
    [self.jobview addGestureRecognizer:doubleTap6];
    UITapGestureRecognizer *doubleTap7 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(schduler)];
    doubleTap7.numberOfTapsRequired=1;
    doubleTap7.delegate=(id)self;
    [self.jobview addGestureRecognizer:doubleTap7];

    UITapGestureRecognizer *doubleTap8 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(tracker)];
    doubleTap8.numberOfTapsRequired=1;
    doubleTap8.delegate=(id)self;
    [self.jobview addGestureRecognizer:doubleTap8];




}
-(void)schduler
{
    self.schedVCtrl=[[SchedulerViewController alloc]initWithNibName:@"SchedulerViewController" bundle:nil];
    self.schedVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:self.schedVCtrl animated:YES completion:nil];
}
-(void)tracker
{
    self.trackVCtrl=[[TrackerViewController alloc]initWithNibName:@"TrackerViewController" bundle:nil];
    self.trackVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
    [self presentViewController:self.trackVCtrl animated:YES completion:nil];
}
-(void)Resourcepage{
    _resurceactivitybtn.hidden=NO;
    [_resurceactivitybtn startAnimating];
    
    _Moduleid=48;
    [self UserRightsforparticularmoduleselect];
    }
-(void)Issuepage{
    _iactivitybtn.hidden=NO;
    [_iactivitybtn startAnimating];
    _Moduleid=51;
    [self UserRightsforparticularmoduleselect];
   
   
    
}
-(void)Timesheetpage{
    _timeactivitybtn.hidden=NO;
    [_timeactivitybtn startAnimating];

    _Moduleid=54;
    [self UserRightsforparticularmoduleselect];
    
    
}
-(void)labourPage{
    _laboractivitybtn.hidden=NO;
    [_laboractivitybtn startAnimating];

    _Moduleid=52;
    [self UserRightsforparticularmoduleselect];
  
    
    
}

-(void)Sitereqpage{
    _siteactivitybtn.hidden=NO;
    [_siteactivitybtn startAnimating];
    _Moduleid=47;
    [self UserRightsforparticularmoduleselect];

    
    }
-(void)Absentpage{
    _absentactivitybtn.hidden=NO;
    [_absentactivitybtn startAnimating];
    _Moduleid=53;
    [self UserRightsforparticularmoduleselect];
    

}
-(void)Jobpage{
    self.jobVCtrl=[[PMJobsViewController alloc]initWithNibName:@"PMJobsViewController" bundle:nil];
    self.jobVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
    [self presentViewController:self.jobVCtrl animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _iactivitybtn.hidden=YES;
    [_iactivitybtn stopAnimating];
    _resurceactivitybtn.hidden=YES;
    [_resurceactivitybtn stopAnimating];
    _timeactivitybtn.hidden=YES;
    [_timeactivitybtn stopAnimating];
    _laboractivitybtn.hidden=YES;
    [_laboractivitybtn stopAnimating];
    _siteactivitybtn.hidden=YES;
    [_siteactivitybtn stopAnimating];
    _absentactivitybtn.hidden=YES;
    [_absentactivitybtn stopAnimating];



}

- (IBAction)clsebtn:(id)sender {
    _result=@"";
    _Moduleid=0;
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark- WebService
-(void)UserRightsforparticularmoduleselect{
    recordResults = FALSE;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    userid = [defaults objectForKey:@"Userid"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsforparticularmoduleselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "</UserRightsforparticularmoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[userid integerValue],_Moduleid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsforparticularmoduleselect" forHTTPHeaderField:@"Soapaction"];
    
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
    //NSDictionary *dictionary=[_xmlParser dictionaryWithValuesForKeys:[[NSArray alloc]initWithObjects:@"JobNumber", nil]];
    
    //  NSLog(@"dictioanry is %@",dictionary);
    
    
	[_xmlParser parse];
    if ([_result isEqualToString:@"Not yet set"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Your rights are not yet set" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _result=@"";
    }
    
    
    else
    {
        
        if (_Moduleid==47) {
            
            
            Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
            if (rightsmodel.ViewModule==1) {
                
                
                //if (!_SitereqVCtrl) {
                _SitereqVCtrl=[[PSitereqmntViewController alloc]initWithNibName:@"PSitereqmntViewController" bundle:nil];
                //}
                //_issueVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
                _timesheetVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                _SitereqVCtrl.userrightsarray=_userrightsarray;
                [self presentViewController:_SitereqVCtrl
                                   animated:YES completion:NULL];
             
                _siteactivitybtn.hidden=YES;
                [_siteactivitybtn stopAnimating];
                
            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                //You don’t have right to view this form
                _siteactivitybtn.hidden=YES;
                [_siteactivitybtn stopAnimating];

            }
            
            
        }
        if (_Moduleid==48) {
            Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
            if (rightsmodel.ViewModule==1) {
                
                
                //if (!_movemtVCtrl) {
                _movemtVCtrl=[[MovementtileViewController alloc]initWithNibName:@"MovementtileViewController" bundle:nil];
                //}
                _movemtVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
                _movemtVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                [self presentViewController:_movemtVCtrl
                                   animated:YES completion:NULL];
                
                _resurceactivitybtn.hidden=YES;
                [_resurceactivitybtn stopAnimating];
             



            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _resurceactivitybtn.hidden=YES;
                [_resurceactivitybtn stopAnimating];
            }
            
        }
        if (_Moduleid==51)
        {
            Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
            if (rightsmodel.ViewModule==1) {
                //if (!_issueVCtrl) {
                _issueVCtrl=[[IssuesViewController alloc]initWithNibName:@"IssuesViewController" bundle:nil];
                //}
                //_issueVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
                _issueVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                _issueVCtrl.userrightsarray=_userrightsarray;
                [self presentViewController:_issueVCtrl
                                   animated:YES completion:NULL];
                _iactivitybtn.hidden=YES;
                [_iactivitybtn stopAnimating];

            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _iactivitybtn.hidden=YES;
                [_iactivitybtn stopAnimating];
            }
            
        }
        if (_Moduleid==52)
        {
            Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
            if (rightsmodel.ViewModule==1) {
                //if (!_lbrmgmtvctrl) {
                _lbrmgmtvctrl=[[LbrMgmtViewController alloc]initWithNibName:@"LbrMgmtViewController" bundle:nil];
                // }
                _lbrmgmtvctrl.modalPresentationStyle=UIModalPresentationFormSheet;
                _lbrmgmtvctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                _lbrmgmtvctrl.userrightsarray=_userrightsarray;
                [self presentViewController:_lbrmgmtvctrl
                                   animated:YES completion:NULL];
              
                _laboractivitybtn.hidden=YES;
                [_laboractivitybtn stopAnimating];
                           }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _laboractivitybtn.hidden=YES;
                [_laboractivitybtn stopAnimating];
            }
            
        }
        if (_Moduleid==53)
        {
            Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
            if (rightsmodel.ViewModule==1) {
                //if (!_absentVCtrl) {
                _absentVCtrl=[[AbsentViewController alloc]initWithNibName:@"AbsentViewController" bundle:nil];
                //}
                _absentVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
                _absentVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                _absentVCtrl.userrightsarray=_userrightsarray;
                [self presentViewController:_absentVCtrl
                                   animated:YES completion:NULL];
                _absentactivitybtn.hidden=YES;
                [_absentactivitybtn stopAnimating];
               
              

            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _absentactivitybtn.hidden=YES;
                [_absentactivitybtn stopAnimating];

            }
        }
        if (_Moduleid==54)
        {
            Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
            if (rightsmodel.ViewModule==1) {
                //if (!_timesheetVCtrl) {
                _timesheetVCtrl=[[TimeSheetViewController alloc]initWithNibName:@"TimeSheetViewController" bundle:nil];
                //}
                //_issueVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
                _timesheetVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                _timesheetVCtrl.userrightsarray=_userrightsarray;
                [self presentViewController:_timesheetVCtrl
                                   animated:YES completion:NULL];
                _timeactivitybtn.hidden=YES;
                [_timeactivitybtn stopAnimating];
                
                
            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _timeactivitybtn.hidden=YES;
                [_timeactivitybtn stopAnimating];
            }
        }
           }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"UserRightsforparticularmoduleselectResponse"])
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
    
    if([elementName isEqualToString:@"EntryId"])
    {
        _userrightsarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PrintModule"])
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
    if([elementName isEqualToString:@"result"])
    {
        
        
        recordResults = FALSE;
        
        _result=@"Not yet set";
        //        if ([_soapResults isEqualToString:@"0"]) {
        //            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //            [alert show];
        //        }
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"EntryId"])
    {
        
        
        recordResults = FALSE;
        _rights=[[Rightscheck alloc]init];
        _rights.entryid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"UserId"])
    {
        
        
        recordResults = FALSE;
        
        _rights.userid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        
        recordResults = FALSE;
        
        _rights.moduleid=[_soapResults integerValue];
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.ViewModule=1;
            
            
        }
        else{
            _rights.ViewModule=0;
            
        }
        
        
        
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.EditModule=1;
            
            
        }
        else{
            _rights.EditModule=0;
            
        }
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.DeleteModule=1;
            
            
        }
        else{
            _rights.DeleteModule=0;
            
        }
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.PrintModule=1;
            
            
        }
        else{
            _rights.PrintModule=0;
            
        }
        
        
        
        [_userrightsarray addObject:_rights];
        _soapResults=nil;
        
    }
    
}


@end
