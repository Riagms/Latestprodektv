//
//  TrackerViewController.m
//  Prodektive
//
//  Created by GMSIndia 2 on 20/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "TrakerViewController.h"

@interface TrakerViewController ()

@end

@implementation TrakerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    [[self.wrktxtlbl layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.wrktxtlbl layer] setBorderWidth:2];
    [[self.wrktxtlbl layer] setCornerRadius:10];
     _titleview1.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
     _titleview2.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _titleview3.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
       self.manpwrview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.otherview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _manpwrview.hidden=NO;
    _otherview.hidden=YES;
    _manpowerbtn.tintColor=[UIColor whiteColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    
    _percentagearray=[[NSMutableArray alloc]initWithObjects:@"10%",@"20%",@"30%",@"40%",@"50%",@"60%",@"70%",@"80%",@"90%",@"100%",nil];
    _delayarray=[[NSMutableArray alloc]initWithObjects:@"Material",@"Training",@"Permit",@"Equipment",@"Crew",@"Weather", nil];
    NSArray*array=[[NSArray alloc]initWithObjects:@"MD",@"TD",@"PD",@"ED",@"CD",@"WD", nil];
    
    
    _Delaydict=[[NSMutableDictionary alloc]initWithObjects:array forKeys:_delayarray];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _scroll.frame=CGRectMake(0,44,1024, 768);
    [_scroll setContentSize:CGSizeMake(1024,900)];
    self.manpwrview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.otherview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _manpwrview.hidden=NO;
    _otherview.hidden=YES;
    _manpowerbtn.tintColor=[UIColor whiteColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    
    _manpwrview.hidden=NO;
    _otherview.hidden=YES;
    if ([_editpath isEqualToString:@"2"]) {
        _track1=(Trackmdl *)[_trackarray objectAtIndex:0];
        _wrktxtlbl.text=_track1.workdescrptn;
        
        _datebtnlbl.titleLabel.text=_track1.workdate;
        
        [_datebtnlbl setTitle:_track1.workdate forState:UIControlStateNormal];
         [_starttimebtnlbl setTitle:_track1.starttime forState:UIControlStateNormal];
         [_endbtnlbl setTitle:_track1.endtime forState:UIControlStateNormal];
           [_percntbtnlbl setTitle:_track1.percentage forState:UIControlStateNormal];
           [_delaybtnlbl setTitle:_track1.delaycode forState:UIControlStateNormal];
        
        trackid=_track1.entryid;
        [self ReadScaffold];
        [self Readmanpower];
        
    }
    else{
        
    }
  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Calendar
-(void)createCalenderPopover
{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 315, 330)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(315, 330);
    
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendar = calendar;
    calendar.delegate = (id)self;
    
    
    NSDate *date = [NSDate date];
    
    // format it
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    // convert it to a string
    NSString *dateString = [dateFormat stringFromDate:date];
    //NSLog(@"datestring%@",dateString);
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    calendar.selectedDate = [self.dateFormatter dateFromString:dateString];
    
    calendar.minimumDate = [self.dateFormatter dateFromString:@"09/07/2011"];
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2050"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(320.0f, 340.0f);
    self.popOverController=_popOverController;
    
    [self.popOverController presentPopoverFromRect:_datebtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}



- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    [_datebtnlbl setTitle:dateString forState:UIControlStateNormal];
    [self.popOverController dismissPopoverAnimated:YES];
    
  
    
    
}

#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_scaffoldtable){
    return [_ScaffoldArray count];
    
}
    if(tableView==_manpwrtable){
        return [_manpwrarry count];
    }
    if(tableView==_othertable){
        return [_otherarray count];
    }
    if(tableView==_popOverTableView){
        if(poptype==1){
            return [_percentagearray count];
        }
        else if(poptype==2){
            return [_delayarray count];
        }
            
        
    }

    return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if(tableView==_scaffoldtable){
            [[NSBundle mainBundle]loadNibNamed:@"TScafldCell" owner:self options:nil];
            cell=_scaffldcell;
        }
        
        if(tableView==_manpwrtable){
            [[NSBundle mainBundle]loadNibNamed:@"TManpwrCell" owner:self options:nil];
            cell=_manpwrcell;
        }
        if(tableView==_othertable){
            [[NSBundle mainBundle]loadNibNamed:@"TOtherCell" owner:self options:nil];
            cell=_othercell;
        }

        
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    if(tableView==_scaffoldtable){
        
        TScfTypemdl*smdl=(TScfTypemdl *)[_ScaffoldArray objectAtIndex:indexPath.row];
        
        if ([smdl.presentcheck isEqualToString:@"1"]) {
             [_Sccheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else{
             [_Sccheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
            _scfldlbl=(UILabel*)[cell viewWithTag:1];
        _scfldlbl.text=smdl.scaffoldtype;
        _lengthlbl=(UILabel*)[cell viewWithTag:2];
        _lengthlbl.text=smdl.length;
        _widthlbl=(UILabel*)[cell viewWithTag:3];
        _widthlbl.text=smdl.width;
        _heightlbl=(UILabel*)[cell viewWithTag:4];
        _heightlbl.text=smdl.height;
        _quantitylbl=(UILabel*)[cell viewWithTag:5];
        _quantitylbl.text=smdl.quanity;
        


        
        
    }
    if(tableView==_manpwrtable){
        
     
        TSManpwrmdl*mdl=(TSManpwrmdl *)[_manpwrarry objectAtIndex:indexPath.row];
        
        
        if ([mdl.ispresent isEqualToString:@"1"]) {
            [_manCheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else{
            [_manCheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        _firstnamelbl=(UILabel*)[cell viewWithTag:2];
        _firstnamelbl.text=mdl.firstname;
        _lastnamelbl=(UILabel*)[cell viewWithTag:3];
        _lastnamelbl.text=mdl.lastname;
        
        _craftlbl=(UILabel*)[cell viewWithTag:4];
        _craftlbl.text=mdl.craft;
        
        
        
        
    }
    if(tableView==_othertable){
        
        
        TSOtherMdl*othrmdl=(TSOtherMdl *)[_otherarray objectAtIndex:indexPath.row];
        
        
        _Namelbl=(UILabel*)[cell viewWithTag:1];
        _Namelbl.text=othrmdl.itemcode;
        _quntyalloclbl=(UILabel*)[cell viewWithTag:2];
        _quntyalloclbl.text=othrmdl.allowedquantity;
        
        _quantyused=(UITextField*)[cell viewWithTag:3
                                   ];
        _quantyused.text=othrmdl.usedquantity;
        
        
        
        
    }
    
if(tableView==_popOverTableView){
    if(poptype==1){
         cell.textLabel.text=[_percentagearray objectAtIndex:indexPath.row];
    }
    else if(poptype==2){
         cell.textLabel.text=[_delayarray objectAtIndex:indexPath.row];
      
    }

   
}
    
    
    return cell;
}

#pragma mark - Table Datsource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView==_popOverTableView) {
        if(poptype==1){
           [_percntbtnlbl setTitle:[_percentagearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        }
        else if(poptype==2){
             [_delaybtnlbl setTitle:[_delayarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            
            
        }

        [_percntbtnlbl setTitle:[_percentagearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    
    
    
    [self.popOverController dismissPopoverAnimated:YES];
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
        
        
    }
    
}
#pragma mark-Webservices

-(void)ReadScaffold{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffold xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<WOID>%@</WOID>\n"
                   "<TrackMasterID>%@</TrackMasterID>\n"
                   "</ReadScaffold>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_workorder,trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffold" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateScaffoldManpow{
    recordResults=FALSE;
    
      TSManpwrmdl*mdl=(TSManpwrmdl *)[_manpwrarry objectAtIndex:manbtnindex];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateScaffoldManpow xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<EntryId>%d</EntryId>\n"
                   "<isPre>%@</isPre>\n"
                   "<Master>%@</Master>\n"
                   "</UpdateScaffoldManpow>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[mdl.entryid integerValue],Manpresent,trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateScaffoldManpow" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateScaffoldManpow12{
    
    
    TScfTypemdl*smdl=(TScfTypemdl *)[_ScaffoldArray objectAtIndex:Scbtnindexpath];

    recordResults=FALSE;
    
    
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateScaffoldManpow12 xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<EntryId>%d</EntryId>\n"
                   "<isPre>%d</isPre>\n"
                   "<Master>%@</Master>\n"
                   "</UpdateScaffoldManpow12>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[smdl.entryid integerValue],Scfpresent,trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateScaffoldManpow12" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CreateWorkPlanTracking{
    recordResults=FALSE;
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat: @"MM/dd/yyyy"];
    
      NSDate *dateString1 = [dateFormat1 dateFromString:_datebtnlbl.titleLabel.text];
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat:@"YYYY-MM-dd"];
    NSString* sqldate=[dateFormat2 stringFromDate:dateString1];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateWorkPlanTracking xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<WOID>%@</WOID>\n"
                   "<FedBak_Start>%@</FedBak_Start>\n"
                   "<FedBak_End>%@</FedBak_End>\n"
                   "<Dates>%@</Dates>\n"
                   "<workorder>%@</workorder>\n"
                   "<percentage>%@</percentage>\n"
                   "<delay>%@</delay>\n"
                   "<delaycode>%@</delaycode>\n"
                   "</CreateWorkPlanTracking>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_workorder,_starttimebtnlbl.titleLabel.text,_endbtnlbl.titleLabel.text,sqldate,_workorderdesc,_percntbtnlbl.titleLabel.text,[_Delaydict objectForKey:_delaybtnlbl.titleLabel.text],_delaybtnlbl.titleLabel.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreateWorkPlanTracking" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateScaffoldEquipment{
    recordResults=FALSE;
    
    TSOtherMdl*mdl=(TSOtherMdl *)[_otherarray objectAtIndex:Sotherbtnindex];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateScaffoldEquipment xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "<EntryId>%d</EntryId>\n"
                   "<itemCode>%@</itemCode>\n"
                   "<ResourceDesc>%@</ResourceDesc>\n"
                   "<AllowedQuantity>%d</AllowedQuantity>\n"
                   "<UsedQuantity>%d</UsedQuantity>\n"
                   "<Type>%@</Type>\n"
                   "</UpdateScaffoldEquipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid,[mdl.entryid integerValue],mdl.itemcode,mdl.resurcedesc,[mdl.allowedquantity integerValue],[usedQtystrg integerValue],mdl.type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateScaffoldEquipment" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Readmanpower{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Readmanpower xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "</Readmanpower>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Readmanpower" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ReadScaffoldEquipment{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldEquipment xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "</ReadScaffoldEquipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldEquipment" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ReadScaffoldFleet{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldFleet xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "</ReadScaffoldFleet>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldFleet" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldThirdParty{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldThirdParty xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "</ReadScaffoldThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldMaterial{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldMaterial xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "</ReadScaffoldMaterial>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldMaterial" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldConsumebles{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldConsumebles xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "</ReadScaffoldConsumebles>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldConsumebles" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldSmallTools{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldSmallTools xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "</ReadScaffoldSmallTools>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldSmallTools" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldSafety{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldSafety xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "</ReadScaffoldSafety>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldSafety" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldOthers{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldOthers xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "</ReadScaffoldOthers>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldOthers" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateScaffoldMaterial{
    recordResults=FALSE;
    
    TSOtherMdl*mdl=(TSOtherMdl *)[_otherarray objectAtIndex:Sotherbtnindex];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateScaffoldMaterial xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "<EntryId>%d</EntryId>\n"
                   "<itemCode>%@</itemCode>\n"
                   "<ResourceDesc>%@</ResourceDesc>\n"
                   "<AllowedQuantity>%d</AllowedQuantity>\n"
                   "<UsedQuantity>%d</UsedQuantity>\n"
                   "<Type>%@</Type>\n"
                   "</UpdateScaffoldMaterial>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid,[mdl.entryid integerValue],mdl.itemcode,mdl.resurcedesc,[mdl.allowedquantity integerValue],[usedQtystrg integerValue],mdl.type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateScaffoldMaterial" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateScaffoldFleet{
    recordResults=FALSE;
    
    TSOtherMdl*mdl=(TSOtherMdl *)[_otherarray objectAtIndex:Sotherbtnindex];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateScaffoldFleet xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "<EntryId>%d</EntryId>\n"
                   "<itemCode>%@</itemCode>\n"
                   "<ResourceDesc>%@</ResourceDesc>\n"
                   "<AllowedQuantity>%d</AllowedQuantity>\n"
                   "<UsedQuantity>%d</UsedQuantity>\n"
                   "<Type>%@</Type>\n"
                   "</UpdateScaffoldFleet>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid,[mdl.entryid integerValue],mdl.itemcode,mdl.resurcedesc,[mdl.allowedquantity integerValue],[usedQtystrg integerValue],mdl.type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateScaffoldFleet" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateScaffoldThirdParty{
    recordResults=FALSE;
    
    TSOtherMdl*mdl=(TSOtherMdl *)[_otherarray objectAtIndex:Sotherbtnindex];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateScaffoldThirdParty xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "<EntryId>%d</EntryId>\n"
                   "<itemCode>%@</itemCode>\n"
                   "<ResourceDesc>%@</ResourceDesc>\n"
                   "<AllowedQuantity>%d</AllowedQuantity>\n"
                   "<UsedQuantity>%d</UsedQuantity>\n"
                   "<Type>%@</Type>\n"
                   "</UpdateScaffoldThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid,[mdl.entryid integerValue],mdl.itemcode,mdl.resurcedesc,[mdl.allowedquantity integerValue],[usedQtystrg integerValue],mdl.type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateScaffoldThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateScaffoldConsumables{
    recordResults=FALSE;
    
    TSOtherMdl*mdl=(TSOtherMdl *)[_otherarray objectAtIndex:Sotherbtnindex];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateScaffoldConsumables xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "<EntryId>%d</EntryId>\n"
                   "<itemCode>%@</itemCode>\n"
                   "<ResourceDesc>%@</ResourceDesc>\n"
                   "<AllowedQuantity>%d</AllowedQuantity>\n"
                   "<UsedQuantity>%d</UsedQuantity>\n"
                   "<Type>%@</Type>\n"
                   "</UpdateScaffoldConsumables>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid,[mdl.entryid integerValue],mdl.itemcode,mdl.resurcedesc,[mdl.allowedquantity integerValue],[usedQtystrg integerValue],mdl.type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateScaffoldConsumables" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateScaffoldSmallTools{
    recordResults=FALSE;
    
    TSOtherMdl*mdl=(TSOtherMdl *)[_otherarray objectAtIndex:Sotherbtnindex];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateScaffoldSmallTools xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "<EntryId>%d</EntryId>\n"
                   "<itemCode>%@</itemCode>\n"
                   "<ResourceDesc>%@</ResourceDesc>\n"
                   "<AllowedQuantity>%d</AllowedQuantity>\n"
                   "<UsedQuantity>%d</UsedQuantity>\n"
                   "<Type>%@</Type>\n"
                   "</UpdateScaffoldSmallTools>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid,[mdl.entryid integerValue],mdl.itemcode,mdl.resurcedesc,[mdl.allowedquantity integerValue],[usedQtystrg integerValue],mdl.type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateScaffoldSmallTools" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateScaffoldOthers{
    recordResults=FALSE;
    
    TSOtherMdl*mdl=(TSOtherMdl *)[_otherarray objectAtIndex:Sotherbtnindex];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateScaffoldOthers xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "<EntryId>%d</EntryId>\n"
                   "<itemCode>%@</itemCode>\n"
                   "<ResourceDesc>%@</ResourceDesc>\n"
                   "<AllowedQuantity>%d</AllowedQuantity>\n"
                   "<UsedQuantity>%d</UsedQuantity>\n"
                   "<Type>%@</Type>\n"
                   "</UpdateScaffoldOthers>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid,[mdl.entryid integerValue],mdl.itemcode,mdl.resurcedesc,[mdl.allowedquantity integerValue],[usedQtystrg integerValue],mdl.type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateScaffoldOthers" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateScaffoldSafety{
    recordResults=FALSE;
    
    TSOtherMdl*mdl=(TSOtherMdl *)[_otherarray objectAtIndex:Sotherbtnindex];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateScaffoldSafety xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Mas>%@</Mas>\n"
                   "<EntryId>%d</EntryId>\n"
                   "<itemCode>%@</itemCode>\n"
                   "<ResourceDesc>%@</ResourceDesc>\n"
                   "<AllowedQuantity>%d</AllowedQuantity>\n"
                   "<UsedQuantity>%d</UsedQuantity>\n"
                   "<Type>%@</Type>\n"
                   "</UpdateScaffoldSafety>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",trackid,[mdl.entryid integerValue],mdl.itemcode,mdl.resurcedesc,[mdl.allowedquantity integerValue],[usedQtystrg integerValue],mdl.type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateScaffoldSafety" forHTTPHeaderField:@"Soapaction"];
    
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
    [_manpwrtable reloadData];
    [_othertable reloadData];
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ReadScaffoldResponse"])
    {
        _ScaffoldArray=[[NSMutableArray alloc]init];
        
        
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
    if([elementName isEqualToString:@"SPhaseId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"length1"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"width1"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"height1"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Qty1"])
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
    if([elementName isEqualToString:@"Perc"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"isCheck"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UpdateScaffoldManpower12Response"])
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
    if([elementName isEqualToString:@"CreateWorkPlanTrackingResponse"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"value"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadmanpowerResponse"])
    {
        _manpwrarry=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"FirstName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LastName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"craft"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Present"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"isPresent"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldEquipmentResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"EntryIdeq"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"itemCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UsedQuantity"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"AllowedQuantity"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ResourceDesc"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"type"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ReadScaffoldMaterialResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];

        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdMt"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldFleetResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdft"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldConsumeblesResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdCon"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldSafetyResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdSM"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldOthersResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdOther"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldThirdPartyResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdtp"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ReadScaffoldSmallToolsResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdST"])
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
       if([elementName isEqualToString:@"id"])
    {
        _Scaffldmdl=[[TScfTypemdl alloc]init];

        
        recordResults = FALSE;
        _Scaffldmdl.entryid=_soapResults;

         _soapResults = nil;
    }
    if([elementName isEqualToString:@"SPhaseId"])
    {
        
        
        recordResults = FALSE;
              _soapResults = nil;
    }

    if([elementName isEqualToString:@"length1"])
    {
        
        
        recordResults = FALSE;
        _Scaffldmdl.length=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"width1"])
    {
        
        recordResults = FALSE;
         _Scaffldmdl.width=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"height1"])
    {
        
        
        recordResults = FALSE;
        _Scaffldmdl.height=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Qty1"])
    {
        
        
        recordResults = FALSE;
        _Scaffldmdl.quanity=_soapResults;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TypeofScaffold"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ScaffoldType"])
    {
        
        
        recordResults = FALSE;
        _Scaffldmdl.scaffoldtype=_soapResults;

        _soapResults = nil;
    }
      if([elementName isEqualToString:@"Perc"])
    {
        
        
        recordResults = FALSE;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"isCheck"])
    {
        
        
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            
            _Scaffldmdl.presentcheck=@"1";
        }
        else{
             _Scaffldmdl.presentcheck=@"0";
        }
        [_ScaffoldArray addObject:_Scaffldmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"records"])
    {
        
        
        
        recordResults = FALSE;
        
        
        switch (tabtype) {
            
            case 1:
                [self Readmanpower];
                break;

            case 2:
                [self ReadScaffoldEquipment];

                break;
            case 3:
                [self ReadScaffoldMaterial];

                break;
            case 4:
                [self ReadScaffoldFleet];
                break;
            case 5:
                [self ReadScaffoldThirdParty];
                break;
            case 6:
                [self ReadScaffoldConsumebles];
                break;
            case 7:
                [self ReadScaffoldSmallTools];
                break;
                
            case 8:
                [self ReadScaffoldSafety];
                break;
            case 9:
                [self ReadScaffoldOthers];
                break;
                
            default:
                break;
        }

        
        if ([_soapResults isEqualToString:@"Manpower Updated"]) {
              [self Readmanpower];
        }
    
        if ([_soapResults isEqualToString:@"Scaffold Updated"]) {
            [self Readmanpower];
        }

        
      
        
        
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"value"])
    {
        
        
        recordResults = FALSE;
        trackid=_soapResults;
        [self ReadScaffold];
        [self Readmanpower];
        _soapResults = nil;
        
    }

     if([elementName isEqualToString:@"EntryId"])
    {
        recordResults = FALSE;
        _Manpwrmdl=[[TSManpwrmdl alloc]init];
        _Manpwrmdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FirstName"])
    {
        recordResults = FALSE;
        _Manpwrmdl.firstname=_soapResults;

        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LastName"])
    {
        recordResults = FALSE;
        _Manpwrmdl.lastname=_soapResults;

        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"craft"])
    {
        recordResults = FALSE;
        _Manpwrmdl.craft=_soapResults;

        _soapResults = nil;    }
    if([elementName isEqualToString:@"Present"])
    {
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"isPresent"])
    {
        recordResults = FALSE;
       
        if ([_soapResults isEqualToString:@"true"]) {
            
             _Manpwrmdl.ispresent=@"1";
        }
        else{
           _Manpwrmdl.ispresent=@"0";
        }

        [_manpwrarry addObject:_Manpwrmdl];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"EntryIdeq"])
    {
        recordResults = FALSE;
       
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"itemCode"])
    {
        recordResults = FALSE;
         _Othermdl=[[TSOtherMdl alloc]init];
          _Othermdl.itemcode=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"UsedQuantity"])
    {
        recordResults = FALSE;
          _Othermdl.usedquantity=_soapResults;
        _soapResults = nil;

    }
    
    
    if([elementName isEqualToString:@"AllowedQuantity"])
    {
        recordResults = FALSE;
          _Othermdl.allowedquantity=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"ResourceDesc"])
    {
        recordResults = FALSE;
          _Othermdl.resurcedesc=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"type"])
    {
        recordResults = FALSE;
          _Othermdl.type=_soapResults;
        [_otherarray addObject:_Othermdl];
        
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"EntryIdMt"])
    {
        recordResults = FALSE;
      _Othermdl.entryid=_soapResults;
         _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryIdft"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryIdCon"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryIdSM"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryIdOther"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"EntryIdtp"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"EntryIdST"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
        
    }

}
#pragma mark-Button Actions

- (IBAction)closebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)updatebtn:(id)sender {
    if ([_datebtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Date is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
    }
    else  if ([_starttimebtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Time is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
    }
    else  if ([_endbtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Time is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
    }
    else{

    [self CreateWorkPlanTracking];
    }
}

- (IBAction)manpwrbtn:(id)sender {
    tabtype=1;
    [self Readmanpower];
    _manpwrview.hidden=NO;
    _otherview.hidden=YES;
    _manpowerbtn.tintColor=[UIColor whiteColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
}

- (IBAction)equipmntbtn:(id)sender {
    tabtype=2;
    [self ReadScaffoldEquipment];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor whiteColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)materialsbtn:(id)sender {
    tabtype=3;
    [self ReadScaffoldMaterial];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor whiteColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];


}

- (IBAction)fleetbtn:(id)sender {
    tabtype=4;
    [self ReadScaffoldFleet];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor whiteColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];


}

- (IBAction)thirdpartybtn:(id)sender {
    tabtype=5;
    [self ReadScaffoldThirdParty];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor whiteColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)consumablesbtn:(id)sender {
    tabtype=6;
    [self ReadScaffoldConsumebles];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor whiteColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    


}

- (IBAction)smalltoolbtn:(id)sender {
    tabtype=7;
    [self ReadScaffoldSmallTools];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor whiteColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
}

- (IBAction)safetybtn:(id)sender {
    tabtype=8;
    [self ReadScaffoldSafety];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor whiteColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)othersbtn:(id)sender {
    tabtype=9;
    [self ReadScaffoldOthers];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor whiteColor];


}
- (IBAction)datebtn:(id)sender {
    
    [self createCalenderPopover];
}

- (IBAction)starttimebtn:(id)sender {
    UIViewController *viewCon = [[UIViewController alloc] init];
    _timepick = [[UIDatePicker alloc]initWithFrame:CGRectMake(5, 0, 0, 0)];
    _timepick.datePickerMode =UIDatePickerModeTime;
    [_timepick addTarget:self action:@selector(dateChanged1) forControlEvents:UIControlEventValueChanged];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm dd MMM yyyy"];
    [viewCon.view addSubview:_timepick];
    viewCon.preferredContentSize = _timepick.bounds.size ; // Set the content size
    
    _popOverController = [[UIPopoverController alloc] initWithContentViewController:viewCon];
    
    
    [_popOverController presentPopoverFromRect:_starttimebtnlbl.frame
                                        inView:self.view
                      permittedArrowDirections:UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown
                                      animated:YES];

    
}
-(void)dateChanged1{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:_timepick.date];
    NSLog(@"%@", currentTime);
    [_starttimebtnlbl setTitle:currentTime forState:UIControlStateNormal];
    
}
- (IBAction)endtimebtn:(id)sender {
    UIViewController *viewCon = [[UIViewController alloc] init];
    _timepick = [[UIDatePicker alloc]initWithFrame:CGRectMake(5, 0, 0, 0)];
    _timepick.datePickerMode =UIDatePickerModeTime;
    [_timepick addTarget:self action:@selector(dateChanged2) forControlEvents:UIControlEventValueChanged];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm dd MMM yyyy"];
    [viewCon.view addSubview:_timepick];
    viewCon.preferredContentSize = _timepick.bounds.size ; // Set the content size
    
    _popOverController = [[UIPopoverController alloc] initWithContentViewController:viewCon];
    
    
    [_popOverController presentPopoverFromRect:_endbtnlbl.frame
                                        inView:self.view
                      permittedArrowDirections:UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown
                                      animated:YES];

}
-(void)dateChanged2{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:_timepick.date];
    NSLog(@"%@", currentTime);
    [_endbtnlbl setTitle:currentTime forState:UIControlStateNormal];
    
}

- (IBAction)mancheckbtn:(id)sender {
     ScafldPresntcheck=0;
    
       button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.manpwrtable];
    NSIndexPath *textFieldIndexPath = [self.manpwrtable indexPathForRowAtPoint:rootViewPoint];
    
    manbtnindex=textFieldIndexPath.row;
    
    for (int i = 0; i<[_ScaffoldArray count]; i++ ) {
        
        
        TScfTypemdl*smdl=(TScfTypemdl *)[_ScaffoldArray objectAtIndex:i];
        
        
        if([smdl.presentcheck isEqualToString:@"1"]){
            ScafldPresntcheck=1;
        }
    }

    TSManpwrmdl*mdl=(TSManpwrmdl *)[_manpwrarry objectAtIndex:manbtnindex];

    if ([mdl.ispresent isEqualToString:@"0"])
        
        
    {
        
        [_manCheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        Manpresent=@"true";
        
        
    }
    else
    {
        [_manCheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        Manpresent=@"false";
        
    }

    [_manpwrtable reloadData];
    
    if (ScafldPresntcheck==1) {
        [self UpdateScaffoldManpow];
    }
    else{
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Select Scaffold" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}

- (IBAction)Sccheckbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
  
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.scaffoldtable];
    NSIndexPath *textFieldIndexPath = [self.scaffoldtable indexPathForRowAtPoint:rootViewPoint];
   
    Scbtnindexpath=textFieldIndexPath.row;
    
   
  TScfTypemdl*smdl=(TScfTypemdl *)[_ScaffoldArray objectAtIndex:Scbtnindexpath];
    if ([smdl.presentcheck isEqualToString:@"0"])
        
        
    {
        
        [_Sccheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        Scfpresent=1;
        
        
    }
    else
    {
        [_Sccheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
      Scfpresent=0;
        
    }
    [_scaffoldtable reloadData];
    [self UpdateScaffoldManpow12];

}
- (IBAction)qtyusedbtn:(id)sender {
    
//    button = (UIButton *)sender;
//    CGPoint center= button.center;
//    
//    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.othertable];
//    NSIndexPath *textFieldIndexPath = [self.othertable indexPathForRowAtPoint:rootViewPoint];
//    UITableViewCell*cell=(UITableViewCell *)[[button superview]superview];
//     _quantyused=(UITextField *)[cell viewWithTag:textFieldIndexPath.row];
//    usedQtystrg=_quantyused.text;
    
}

- (IBAction)otherupdatebtn:(id)sender {
    
    [_quntytxtfld resignFirstResponder];
    
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.othertable];
    NSIndexPath *textFieldIndexPath = [self.othertable indexPathForRowAtPoint:rootViewPoint];
    
   // UITableViewCell*cell=(UITableViewCell *)[[button superview]superview];
   // _quantyused=(UITextField *)[cell viewWithTag:textFieldIndexPath.row];
      //usedQtystrg=_quantyused.text;
    
    
    Validation*val=[[Validation alloc]init];
    int value1=[val isNumeric:_quantyused.text];
      Sotherbtnindex=textFieldIndexPath.row;
    if(value1==0)
    {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Please enter a valid quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        _quantyused.text=@"";
        
        
    }
    else{

  
    switch (tabtype) {
        case 2:
            [self UpdateScaffoldEquipment];
            break;
        case 3:
            [self UpdateScaffoldMaterial];
            break;
        case 4:
            [self UpdateScaffoldFleet];
            break;
        case 5:
            [self UpdateScaffoldThirdParty];
            break;
        case 6:
            [self UpdateScaffoldConsumables];
            break;
        case 7:
            [self UpdateScaffoldSmallTools];
            break;

        case 8:
            [self UpdateScaffoldSafety];
            break;
        case 9:
            [self UpdateScaffoldOthers];
            break;

        default:
            break;
    }
    }
  
  
    
    
}

- (IBAction)percntbtn:(id)sender {
    poptype=1;
    [self createPopover];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    //usedQtystrg=textField.text;
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
   
    usedQtystrg=textField.text;
    
    
    return YES;
}
-(void)createPopover
{
    
    //poptype=1;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 239, 200)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 239, 200)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(239, 200);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(239.0f, 200.0f);
    self.popOverController=_popOverController;
    
    if(poptype==1){
        
    [self.popOverController presentPopoverFromRect:_percntbtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    }
    
    if(poptype==2){
        
        [self.popOverController presentPopoverFromRect:_delaybtnlbl.frame
                                                inView:self.view
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }

    
}

- (IBAction)delaybtn:(id)sender {
    poptype=2;
    [self createPopover];
}
- (IBAction)trackerbtn:(id)sender {
}
- (IBAction)sequencebtn:(id)sender {
}
@end
