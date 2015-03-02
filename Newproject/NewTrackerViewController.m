//
//  NewTrackerViewController.m
//  Prodektive
//
//  Created by Riya on 2/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "NewTrackerViewController.h"

@interface NewTrackerViewController ()

@end

@implementation NewTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _tracktable.layer.borderWidth=3.0;
    _tracktable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    // _navitem.titleView.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    
    self.tracktable.tableHeaderView =_SearchingBar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    
    
    _SearchingBar.text=@"";

    [self ReadWorkTracking];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_Trackarray count];
    //return 6;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if(tableView==_tracktable){
            [[NSBundle mainBundle]loadNibNamed:@"NewTrackerCell" owner:self options:nil];
            cell=_trackcell;
        }
        
        
        
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    
    Trackmdl*track1=(Trackmdl *)[_Trackarray objectAtIndex:indexPath.row];
    _worklbl=(UILabel *)[cell viewWithTag:1];
    _worklbl.text=track1.workorder;
    _planlbl=(UILabel *)[cell viewWithTag:2];
    _planlbl.text=track1.plan;
    _datelbl=(UILabel *)[cell viewWithTag:3];
    _datelbl.text=track1.workdate;
    _starttimelbl=(UILabel *)[cell viewWithTag:4];
    _starttimelbl.text=track1.starttime;
    _endtimelbl=(UILabel *)[cell viewWithTag:5];
    _endtimelbl.text=track1.endtime;
    
    _workedhrslbl =(UILabel *)[cell viewWithTag:6];
    _workedhrslbl.text=track1.workhrs;
    
    _delaylbl =(UILabel *)[cell viewWithTag:7];
    _delaylbl.text=track1.delaycode;

    return cell;
}
#pragma mark - Table Datsource
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

-(void)ReadWorkTracking{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadWorkTracking xmlns=\"http://ios.kontract360.com/\">\n"
                   
                    "<WOID>%@</WOID>\n"
                   "</ReadWorkTracking>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_workorder
                   ];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadWorkTracking" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)searchTracking{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<searchTracking xmlns=\"http://ios.kontract360.com/\">\n"
                   
                    "<WOID>%@</WOID>\n"
                      "<searchtext>%@</searchtext>\n"
                   "</searchTracking>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_workorder,_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/searchTracking" forHTTPHeaderField:@"Soapaction"];
    
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
    [_tracktable reloadData];
    
  
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ReadWorkTrackingResponse"])
    {
        _Trackarray=[[NSMutableArray alloc]init];
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FedBak_Per"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryID"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"FedBak_Des"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"FedBak_Start"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FedBak_End"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"plan"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"workorder"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Dates"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"percentage"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"delaycode"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Differ"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }
    if([elementName isEqualToString:@"searchTrackingResponse"])
    {
          _Trackarray=[[NSMutableArray alloc]init];
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
        if([elementName isEqualToString:@"FedBak_Per"])
    {
        _Trackmdl=[[Trackmdl alloc]init];
        
        recordResults = FALSE;
        _Trackmdl.fedbackpercentage=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryID"])
    {
        
        
        
        recordResults = FALSE;
        
        _Trackmdl.entryid=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"FedBak_Des"])
    {
        
        
        recordResults = FALSE;
        _Trackmdl.workdescrptn=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"FedBak_Start"])
    {
        
        
        
        recordResults = FALSE;
        _Trackmdl.starttime=_soapResults;
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"FedBak_End"])
    {
        
        
        
        recordResults = FALSE;
        
        _Trackmdl.endtime=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"plan"])
    {
        
        
        
        recordResults = FALSE;
        _Trackmdl.plan=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"workorder"])
    {
        
        
        
        recordResults = FALSE;
        _Trackmdl.workorder=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Dates"])
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
        
          _Trackmdl.workdate=myFormattedDate;
               _soapResults = nil;
    }
    if([elementName isEqualToString:@"percentage"])
    {
        
         recordResults = FALSE;
        
        _Trackmdl.percentage=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"delaycode"])
    {
        
        recordResults = FALSE;
        
        _Trackmdl.delaycode=_soapResults;
        

        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Differ"])
    {
        
        recordResults = FALSE;
        
        _Trackmdl.workhrs=_soapResults;
        [_Trackarray addObject:_Trackmdl];
        
        _soapResults = nil;
    }

}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Addbtn:(id)sender {
    
    self.TrackVCtrl=[[TrakerViewController alloc]initWithNibName:@"TrakerViewController" bundle:nil];
    self.TrackVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
    self.TrackVCtrl.editpath=@"1";
    self.TrackVCtrl.workorder=_workorder;
    self.TrackVCtrl.workorderdesc=_workorderdesc;
    [self presentViewController:self.TrackVCtrl animated:YES completion:nil];
    
}

- (IBAction)editbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.tracktable];
    NSIndexPath *textFieldIndexPath = [self.tracktable indexPathForRowAtPoint:rootViewPoint];
    
    btnindex=textFieldIndexPath.row;
    Trackmdl*track1=(Trackmdl *)[_Trackarray objectAtIndex:btnindex];
    
    self.TrackVCtrl=[[TrakerViewController alloc]initWithNibName:@"TrakerViewController" bundle:nil];
    self.TrackVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
    
    
    NSMutableArray*newarray=[[NSMutableArray alloc]init];
    [newarray addObject:track1];
    self.TrackVCtrl.trackarray=newarray;
     self.TrackVCtrl.editpath=@"2";
    self.TrackVCtrl.workorder=_workorder;
    self.TrackVCtrl.workorderdesc=track1.workorder;
    
    
    [self presentViewController:self.TrackVCtrl animated:YES completion:nil];

}
#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_SearchingBar.text;
    
    //NSLog(@"search%@",searchstring);
    [self searchTracking];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self ReadWorkTracking];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_SearchingBar.text length]==0) {
        
        [self ReadWorkTracking];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
    
}

@end
