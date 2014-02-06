//
//  HRViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 9/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "HRViewController.h"
#import "Base64.h"
#import "SectionHeaderView.h"
#import "Section.h"

@interface HRViewController ()

@end
#define DEFAULT_ROW_HEIGHT 78
#define HEADER_HEIGHT 45


@implementation HRViewController
@synthesize sectionArray, openSectionIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=NSLocalizedString(@"Registered Applicants", @"Registered Applicants");
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     // Do any additional setup after loading the view from its nib.
   
;

//    self.sectionArray=[[NSMutableArray alloc]init];
//    for (int i=0; i<=10; i++) {
//        Section *section=[[Section alloc]init];
//        section.sectionHeader=[NSString stringWithFormat:@"Name %d",i];
//        section.sectionRows=[[NSMutableArray alloc]init];
//        
//        //for (int i=0; i<=1; i++) {
//        [section.sectionRows addObject:[NSString stringWithFormat:@"Details %d",1]];
//        //}
//        [self.sectionArray addObject:section];
//    }
//    self.employeestable.sectionHeaderHeight = HEADER_HEIGHT;
//    self.openSectionIndex = NSNotFound;
//

       _imageArraydict=[[NSMutableDictionary alloc]init];
    _employeestable.rowHeight=256;
    
    /*tablewidth*/
    
    
    _employeestable.layer.borderWidth = 2.0;
    _employeestable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.employeestable.tableHeaderView =_SearchingBar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    
    
    
   /*scroll*/
    
    //_scroll.frame=CGRectMake(0, 0, 1004,768);
   // [_scroll setContentSize:CGSizeMake(1500,768)];
    
    
    
    
    /*Arrays*/
    _listarray=[[NSMutableArray alloc]initWithObjects:@"verification details",@"Upload Documents",@"Convert as an Employee", nil];
    

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   // [self ListAllApplicants];
    [self AllSkills];

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonActions

- (IBAction)disclurebtn:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(160, 90);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
       
    UIButton *button = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    UITableView *table = (UITableView *)[cell superview];
    NSIndexPath *IndexPath = [table indexPathForCell:cell];
    
   
    Empdetails*empdetls1=(Empdetails *)[_empnameArray objectAtIndex:IndexPath.row];
    _applicantid=empdetls1.applicantid;
    _ssnstring=empdetls1.ssn;
    

    
    [self.popOverController presentPopoverFromRect:__disclyrebtnlbl.frame
                                            inView:cell
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];
    

}






#pragma mark - Table View
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    
    /*
     Create the section header views lazily.
     */
	Section *aSection=[sectionArray objectAtIndex:section];
    if (!aSection.sectionHeaderView) {
        aSection.sectionHeaderView = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.employeestable.bounds.size.width, HEADER_HEIGHT) title:aSection.sectionHeader section:section delegate:self];
        NSLog(@"sectn%d",section);
  Empdetails*empdetls2=(Empdetails *)[_empnameArray objectAtIndex:section];
        NSLog(@"sectn%@",empdetls2.Inproceesstatus);
        if ([empdetls2.Inproceesstatus isEqualToString:@"true"]) {
            
            CAGradientLayer *gradient = [CAGradientLayer layer];
            gradient.frame =  aSection.sectionHeaderView.bounds;
            gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:255.0/255.0f green:174.0/255.0f blue:185.0/255.0f alpha:1.0f] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
            [ aSection.sectionHeaderView.layer insertSublayer:gradient atIndex:0];

        }
        else{
            CAGradientLayer *gradient = [CAGradientLayer layer];
            gradient.frame =  aSection.sectionHeaderView.bounds;
            gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f] CGColor],(id)[[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
            [ aSection.sectionHeaderView.layer insertSublayer:gradient atIndex:0];

            
        }
        
        
        
    }
    
    
    return aSection.sectionHeaderView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return [sectionArray count];
    //return [_empnameArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return [_listarray count];
    }
    else{
        Section *aSection=[sectionArray objectAtIndex:section];
        // Return the number of rows in the section.
        return aSection.open ? [aSection.sectionRows count]:0;
        //return aSection.open ? 1:0;

        
       // return [_empnameArray count];
    }
    // Return the number of rows in the section.
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_employeestable) {
            
        
        [[NSBundle mainBundle]loadNibNamed:@"HRcellview" owner:self options:nil];
            _newcellview.backgroundColor=[UIColor whiteColor];
        cell=_employeecell;
        }
    }
    if (tableView==_employeestable) {
        
        
        Empdetails*empdetls1=(Empdetails *)[_empnameArray objectAtIndex:indexPath.section];
        _adresslbl=(UILabel *)[cell viewWithTag:1];
        _adresslbl.text = empdetls1.address;
         _citylbl=(UILabel *)[cell viewWithTag:2];
        _citylbl.text=empdetls1.city;
        _statelbl=(UILabel *)[cell viewWithTag:3];
        _statelbl.text=empdetls1.state;
         _countrylbl=(UILabel *)[cell viewWithTag:4];
        _countrylbl.text=empdetls1.country;
         _ziplbl=(UILabel *)[cell viewWithTag:5];
        _ziplbl.text=empdetls1.zip;
         _doblbl=(UILabel *)[cell viewWithTag:6];
        _doblbl.text=empdetls1.dob;
         _phonelbl=(UILabel *)[cell viewWithTag:7];
        _phonelbl.text=empdetls1.phone;
         _emergencylbl=(UILabel *)[cell viewWithTag:8];
        _emergencylbl.text=empdetls1.emergencycontact;
        
         _EmrgcyName=(UILabel *)[cell viewWithTag:9];
        _EmrgcyName.text=empdetls1.emergencycontactname;
        
         _maillbl=(UILabel *)[cell viewWithTag:10];
        _maillbl.text=empdetls1.email;
        
         _alternatvelbl=(UILabel *)[cell viewWithTag:11];
        _alternatvelbl.text=empdetls1.alternativeno;
         _basicexpry=(UILabel *)[cell viewWithTag:12];
        _basicexpry.text=empdetls1.basicplusexp;
        
        
         _licenceno=(UILabel *)[cell viewWithTag:13];
        _licenceno.text=empdetls1.drivinglicenceno;
        _licencename=(UILabel *)[cell viewWithTag:14];
        _licencename.text=empdetls1.nameinlicence;
         _licencestate=(UILabel *)[cell viewWithTag:15];
        _licencestate.text=empdetls1.stateissuinglicence;
         _twiclbl=(UILabel *)[cell viewWithTag:16];
         _twiclbl.text=empdetls1.twiccardno;
        _basicchecklbl=(UIButton *)[cell viewWithTag:17];
        
        if ([empdetls1.basicplus isEqualToString:@"true"]) {
            
            
            [_basicchecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            
            
        }
        else{
            [_basicchecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }

        
                }

    if (tableView==_popOverTableView) {
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12.0f];

        cell.textLabel.text=[_listarray objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView==_popOverTableView) {
        
       
        if (indexPath.row==0) {
            if (!self.verifctnVCtrl) {
                _verifctnVCtrl=[[VerificationViewController alloc]initWithNibName:@"VerificationViewController" bundle:nil];
            }
            [self.popOverController dismissPopoverAnimated:YES];
            _verifctnVCtrl.applicantid=_applicantid;
            NSLog(@" _verifctnVCtrl.applicantid%d", _verifctnVCtrl.applicantid);
                        [self.navigationController pushViewController:_verifctnVCtrl animated:YES];
            
        }
        if (indexPath.row==1) {
            if (!self.uploadVCtrl) {
                _uploadVCtrl=[[UploadDocViewController alloc]initWithNibName:@"UploadDocViewController" bundle:nil];
            }
            [self.popOverController dismissPopoverAnimated:YES];
              _uploadVCtrl.applicantid=_applicantid;
            _uploadVCtrl.ssnstring=_ssnstring;
            [self.navigationController pushViewController:_uploadVCtrl animated:YES];
            
        }

        
        if (indexPath.row==2) {
            /*arvinice*/
            [self UpdateApplicantEmployeeStatus];
           // [self FetchApplicant];
            //[_employeestable reloadData];
            
        }
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    
    if (tableView==_employeestable) {
[cell setBackgroundColor:[UIColor whiteColor]];
    }
    
//    if(tableView==_employeestable)
//    {
//        if (indexPath.row%2 == 0) {
//            [cell setBackgroundColor:[UIColor whiteColor]];
//            
//        }else
//        {
//            
//            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
//            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
//            
//            
//        }
//    }
}


-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
    
    Section *aSection=[sectionArray objectAtIndex:sectionOpened];
    aSection.open=YES;
    
    /*
     Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
     */
    NSInteger countOfRowsToInsert = [aSection.sectionRows count];
    NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
        [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
    }
    
    /*
     Create an array containing the index paths of the rows to delete: These correspond to the rows for each quotation in the previously-open section, if there was one.
     */
    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
    
    NSInteger previousOpenSectionIndex = self.openSectionIndex;
    if (previousOpenSectionIndex != NSNotFound) {
        Section *previousOpenSection=[sectionArray objectAtIndex:previousOpenSectionIndex];
        previousOpenSection.open=NO;
        [previousOpenSection.sectionHeaderView toggleOpenWithUserAction:NO];
        NSInteger countOfRowsToDelete = [previousOpenSection.sectionRows count];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenSectionIndex]];
        }
        
        
    }
    
    // Style the animation so that there's a smooth flow in either direction.
    UITableViewRowAnimation insertAnimation;
    UITableViewRowAnimation deleteAnimation;
    if (previousOpenSectionIndex == NSNotFound || sectionOpened < previousOpenSectionIndex) {
        insertAnimation = UITableViewRowAnimationTop;
        deleteAnimation = UITableViewRowAnimationBottom;
    }
    else {
        insertAnimation = UITableViewRowAnimationBottom;
        deleteAnimation = UITableViewRowAnimationTop;
    }
    
    // Apply the updates.
    [self.employeestable beginUpdates];
    [self.employeestable insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:insertAnimation];
    [self.employeestable deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self.employeestable endUpdates];
    self.openSectionIndex = sectionOpened;
    
    
}
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
    
    /*
     Create an array of the index paths of the rows in the section that was closed, then delete those rows from the table view.
     */
	Section *aSection = [self.sectionArray objectAtIndex:sectionClosed];
	
    aSection.open = NO;
    
    NSInteger countOfRowsToDelete = [self.employeestable numberOfRowsInSection:sectionClosed];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
        }
        [self.employeestable deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    self.openSectionIndex = NSNotFound;
}



#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_SearchingBar.text length]==0) {
        
             [searchBar resignFirstResponder];
        
        
    }
    else  if ([_SearchingBar.text length]>0) {
        
        
        
        
        _searchstring=_SearchingBar.text;
        
        
        }
    
    }


#pragma mark - webservice
/*arvinices*/
-(void)UpdateApplicantEmployeeStatus{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateApplicantEmployeeStatus xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<AppId>%d</AppId>\n"
                   "</UpdateApplicantEmployeeStatus>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/UpdateApplicantEmployeeStatus" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ListAllApplicants{
   
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ListAllApplicants xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</ListAllApplicants>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ListAllApplicants" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)AllSkills{
  imgString=@"skill";
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllSkills xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</AllSkills>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/AllSkills" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"ERROR with theConenction" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
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
   
    if ([imgString isEqualToString:@"skill"]) {
        
        [self ListAllApplicants];
        imgString=@"";
    }

    
    if([imgString isEqualToString:@"Fetchapp"])
    {
        self.sectionArray=[[NSMutableArray alloc]init];
        for (int i=0; i<[_empnameArray count]; i++) {
             Empdetails*empdet=(Empdetails *)[_empnameArray objectAtIndex:i];
            Section *section=[[Section alloc]init];
             NSString*ssn=[empdet.ssn stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
             NSString*firstname=[empdet.firstname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
               NSString*lastname=[empdet.lastname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
              NSString*phoneno=[empdet.Phonenumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
             NSString*skill=[empdet.skillid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
           
          

            
            NSString *newstr2=[NSString stringWithFormat:@"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t%@\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t%@",phoneno,skill];
            section.sectionHeader=[NSString stringWithFormat:@"%@\t\t\t\t\t%@\t\t\t\t\t%@\t\t\t\t\t%@",ssn,firstname,lastname,newstr2];
            
                     //section.sectionHeader=[NSString stringWithFormat:@"%@\t\t\t\t\t%@\t\t\t\t\t%@\t\t\t\t\t\t\t\t\t\t\t\t%@\t\t\t\t\t\t\t\t\t\t\t\t%@",empdet.ssn,empdet.firstname,empdet.lastname,phoneno,empdet.skillid] ;
            //section.sectionname=[NSString stringWithFormat:@"%@",empdet.firstname];
            section.sectionRows=[[NSMutableArray alloc]init];
            
            //for (int i=0; i<=1; i++) {
            [section.sectionRows addObject:[NSString stringWithFormat:@"Details %d",1]];
            //}
            [self.sectionArray addObject:section];
        }
        self.employeestable.sectionHeaderHeight = HEADER_HEIGHT;
        self.openSectionIndex = NSNotFound;

        
        
    [_employeestable reloadData];
           imgString=@"";
    
    }
//    if([imgString isEqualToString:@"img"])
//    {
//        if (x==[_empnameArray count]) {
//             [_employeestable reloadData];
//        }
//       
//
//       // imgString=@"";
//        
//    }

    

}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ListAllApplicantsResult"])
    { imgString=@"Fetchapp";
        _empnameArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"applicant_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }
    if([elementName isEqualToString:@"applicant_FirstName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_CellPhone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
       
    if([elementName isEqualToString:@"applicant_Skill"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_EmergencyContactNo"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_DOB"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Zip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Address"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_City"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_DrivingLicense"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_NameinLicense"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    

    
    if([elementName isEqualToString:@"applicant_EmergencyContact"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_Gender"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"applicant_AlternateNo"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"BasicPlusExpiry"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_TWIC"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_State"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

   
       if([elementName isEqualToString:@"BasicPlus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Email"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
  if([elementName isEqualToString:@"applicant_phone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }


    if([elementName isEqualToString:@"applicant_LicenseState"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"country_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"InProcess"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }
    
    if([elementName isEqualToString:@"AllSkillsResult"])
    {
        _Skilldict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"applicant_Id"])
    {
        _empdetl=[[Empdetails alloc]init];
        recordResults = FALSE;
               _empdetl.applicantid=[_soapResults integerValue];
       
        //[self FetchImage];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_FirstName"])
    {
        recordResults = FALSE;
        _teststrng=_soapResults;
        _empdetl.firstname=_soapResults;
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        recordResults = FALSE;
      //  [_empnameArray addObject:[NSString stringWithFormat:@"%@ %@",_teststrng,_soapResults]];
        _empdetl.lastname=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
         recordResults = FALSE;
        _empdetl.ssn=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"applicant_CellPhone"])
    { recordResults = FALSE;
        _empdetl.Phonenumber=_soapResults;
       
         _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"applicant_Skill"])
    { recordResults = FALSE;
        _empdetl.skillid=[_Skilldict objectForKey:_soapResults];
      
        
      
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"EmployeeStatus"])
    {
         recordResults = FALSE;
        _empdetl.empstatus=_soapResults;
        if ([_empdetl.empstatus isEqualToString:@"true"]) {
            _empdetl.emp=1;
            
        }
        else{
            _empdetl.emp=0;
        }
        _soapResults = nil;
        
    }
    
    
    if([elementName isEqualToString:@"applicant_EmergencyContactNo"])
    {
      recordResults = FALSE;
        _empdetl.emergencycontact=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"applicant_DOB"])
    {
        recordResults = FALSE;
        _empdetl.dob=_soapResults;
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"applicant_Zip"])
    {
        recordResults = FALSE;
        _empdetl.zip=_soapResults;
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"applicant_State"])
    {
        recordResults = FALSE;
        _empdetl.state=_soapResults;
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"applicant_Address"])
    {
        recordResults = FALSE;
        _empdetl.address=_soapResults;
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"applicant_City"])
    {
        recordResults = FALSE;
        _empdetl.city=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_DrivingLicense"])
    {
        recordResults = FALSE;
        _empdetl.drivinglicenceno=_soapResults;
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"applicant_NameinLicense"])
    {
        recordResults = FALSE;
        _empdetl.nameinlicence=_soapResults;
        _soapResults = nil;
    }
    
    
    
    
    if([elementName isEqualToString:@"applicant_EmergencyContact"])
    {
        recordResults = FALSE;
        _empdetl.emergencycontactname=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"applicant_Gender"])
    {
        recordResults = FALSE;
        _empdetl.gender=_soapResults;
        _soapResults = nil;

        
    }
    
    if([elementName isEqualToString:@"applicant_AlternateNo"])
    {
        recordResults = FALSE;
        _empdetl.alternativeno=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"BasicPlusExpiry"])
    {
        recordResults = FALSE;
        _empdetl.basicplusexp=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_TWIC"])
    {
        recordResults = FALSE;
        _empdetl.twiccardno=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"BasicPlus"])
    {
        recordResults = FALSE;
        _empdetl.basicplus=_soapResults;
                _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"applicant_Email"])
    {
        recordResults = FALSE;
        _empdetl.email=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"applicant_phone"])
    {
        recordResults = FALSE;
        _empdetl.phone=_soapResults;
        _soapResults = nil;
        
    }
    
    
    if([elementName isEqualToString:@"applicant_LicenseState"])
    {
        recordResults = FALSE;
        _empdetl.stateissuinglicence=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"country_name"])
    {
        recordResults = FALSE;
        _empdetl.country=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"InProcess"])
    {
        recordResults = FALSE;
        _empdetl.Inproceesstatus=_soapResults;
          [_empnameArray addObject:_empdetl];
        _soapResults = nil;
        
    }


    if([elementName isEqualToString:@"SkillId"])
    {
               recordResults = FALSE;
        _empskillid=_soapResults;
         _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SkillName"])
    {        recordResults =FALSE;
        [_Skilldict setObject:_soapResults forKey:_empskillid];
         _soapResults = nil;
        
        
    }



}
- (IBAction)basiccheck:(id)sender {
    
    
}
@end
