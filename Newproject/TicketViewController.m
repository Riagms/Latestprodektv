//
//  TicketViewController.m
//  Prodektive
//
//  Created by Riya on 2/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "TicketViewController.h"

@interface TicketViewController ()

@end

@implementation TicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _tickettable.layer.borderWidth=3.0;
    _tickettable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
  
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
    selcteddate=dateString;
      [self ReadTicketsWork];
    
    [self.popOverController dismissPopoverAnimated:YES];
  
    
    
    
}
#pragma mark-Webservices

-(void)ReadTicketsWork{
    recordResults=FALSE;
    
    
   
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat: @"MM/dd/yyyy"];
    
    NSDate *dateString1 = [dateFormat1 dateFromString:selcteddate];
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat:@"YYYY-MM-dd"];
    NSString* sqldate=[dateFormat2 stringFromDate:dateString1];
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadTicketsWork xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<date>%@</date>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</ReadTicketsWork>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",sqldate,_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadTicketsWork" forHTTPHeaderField:@"Soapaction"];
    
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
    
    [_tickettable reloadData];
    
    
    //    if (webtype==1) {
    //        [self ReadSchedulerWork];
    //        webtype=0;
    //    }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
     if([elementName isEqualToString:@"ReadTicketsWorkResponse"])
    {
        _ticketarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Entryid"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Workorder"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"plant"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubUnit"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DefTag"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Fname"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Foreman"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Equipment"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Date"])
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
        if([elementName isEqualToString:@"Entryid"])
    {
        
        _schmdl=[[Schedulermdl alloc]init];
        recordResults = FALSE;
        _schmdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Workorder"])
    {
        
        
        recordResults = FALSE;
        _schmdl.workorder=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"plant"])
    {
        
        
        recordResults = FALSE;
        _schmdl.plant=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SubUnit"])
    {
        
        recordResults = FALSE;
        _schmdl.subunit=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"DefTag"])
    {
        
        
        recordResults = FALSE;
        _schmdl.deftag=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Foreman"])
    {
        
        
        recordResults = FALSE;
        // _schmdl.foreman=_soapResults;
        
        //_schmdl.foreman=[_foremandict objectForKey:_soapResults];
        _soapResults = nil;    }
    if([elementName isEqualToString:@"Equipment"])
    {
        
        
        recordResults = FALSE;
        _schmdl.equipment=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Date"])
    {
        
        
        recordResults = FALSE;
        
        NSArray *dateArray=[[NSArray alloc]init];
        dateArray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1 =[dateArray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        _schmdl.wdate=myFormattedDate;
        [_ticketarray addObject:_schmdl];
        _soapResults = nil;
    }
        if([elementName isEqualToString:@"Fname"])
    {
        
        
        recordResults = FALSE;
        _schmdl.foreman=_soapResults;
        _soapResults = nil;
    }
    
}

#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==_tickettable) {
        return [_ticketarray count];
        
    }
    
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        if (tableView==_tickettable) {
            [[NSBundle mainBundle]loadNibNamed:@"TicketcellView" owner:self options:nil];
            cell=_ticketcell;
        }
        
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    if (tableView==_tickettable)
    {
        Schedulermdl *smdl=(Schedulermdl *)[_ticketarray objectAtIndex:indexPath.row];
        _workordrlbl=(UILabel *)[cell viewWithTag:1];
        _workordrlbl.text=smdl.workorder;
        _plantlbl=(UILabel*)[cell viewWithTag:2];
        _plantlbl.text=smdl.plant;
        _subunitlbl=(UILabel*)[cell viewWithTag:3];
        _subunitlbl.text=smdl.subunit;
        _equipmntlbl=(UILabel*)[cell viewWithTag:4];
        _equipmntlbl.text=smdl.equipment;
        _deftaglbl=(UILabel*)[cell viewWithTag:5];
        _deftaglbl.text=smdl.deftag;
        
        _foremanlbl=(UILabel*)[cell viewWithTag:6];
        _foremanlbl.text=smdl.foreman;
        
        _datelbl=(UILabel*)[cell viewWithTag:7];
        _datelbl.text=smdl.wdate;
        
    }
    
    return cell;
    
}

- (IBAction)disclurebtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.tickettable];
    NSIndexPath *textFieldIndexPath = [self.tickettable indexPathForRowAtPoint:rootViewPoint];
       Schedulermdl *smdl=(Schedulermdl *)[_ticketarray objectAtIndex:textFieldIndexPath.row];
    self.TicVCtrl=[[TicDetailViewController alloc]initWithNibName:@"TicDetailViewController" bundle:nil];
    self.TicVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    self.TicVCtrl.workorder=smdl.workorder;

    self.TicVCtrl.planid=_planid;
    
    [self presentViewController:_TicVCtrl animated:YES completion:nil];
}
- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)Datebtn:(id)sender {
    [self createCalenderPopover];
}
@end
