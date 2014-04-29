//
//  PlanningViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 2/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "PlanningViewController.h"

@interface PlanningViewController ()

@end

@implementation PlanningViewController

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
    
     _cmpxtyofwrk=[[NSMutableArray alloc]initWithObjects:@"Easy",@"Moderate",@"Difficult", nil];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _addplanview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
     _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _plangtable.layer.borderWidth=2.0f;
    _plangtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _disclosurearry=[[NSMutableArray alloc]initWithObjects:@"Add Services",@"Site Visit",@"Plan",nil];
    _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate=(id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.plangtable.tableHeaderView=_searchbar;
    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchctrlr.searchResultsDelegate=(id)self;
    searchctrlr.searchResultsDataSource=(id)self;
    searchctrlr.delegate=(id)self;

    [self WorkTypeSelect];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self SelectAllPlans];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_plangtable)
    {
        return [_planlistarray count];
    }
    if(tableView==_popovertableview)
    {
        switch (poptype) {
                case 1:
                if (newpoptype==2) {
                      return [_planslectionarray count];
                }
                else if (newpoptype==3){
                    return [_typelistarray count];
                }
                else if (newpoptype==4){
                    return [_cmpxtyofwrk count];
                }

              
                break;
                case 2:
                return[_disclosurearry count];
                break;
//               case 3:
//              return[_typelistarray count];
//               break;
                
            default:
                break;
        }
    }
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    
    if(tableView==_plangtable)
    {
        [[NSBundle mainBundle]loadNibNamed:@"customplancell" owner:self options:nil];
        cell=_planingcell;
    }
    }
    if(tableView==_popovertableview)
    {
        
        
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];

    

        switch (poptype) {
            case 1:
                if (newpoptype==2) {
                      cell.textLabel.text=[_planslectionarray objectAtIndex:indexPath.row];
                }
                else if (newpoptype==3){
                    cell.textLabel.text=[_typelistarray objectAtIndex:indexPath.row];

                }
                else if (newpoptype==4){
                    cell.textLabel.text=[_cmpxtyofwrk objectAtIndex:indexPath.row];
                    
                }

             break;
            case 2:
                cell.textLabel.text=[_disclosurearry objectAtIndex:indexPath.row];
                break;
           
            default:
                break;
        }
    }
     if(tableView==_plangtable)
     {  planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:indexPath.row];
         _organizationname=(UILabel*)[cell viewWithTag:1];
         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
         _organizationname.text=planmdl.customername;
//         _leadlabel=(UILabel*)[cell viewWithTag:2];
//         NSString *led=[NSString stringWithFormat:@"%d",planmdl.leadid];
//         _leadlabel.text=led;
         _planidlabel=(UILabel*)[cell viewWithTag:3];
       _planidlabel.text=planmdl.planid;
             }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview) {
        
        //Coursemdl*coursemdl2=(Coursemdl *)[_requirementArray objectAtIndex:textFieldIndexPath.row];
        
        switch (poptype) {
                
            case 1:
                if (newpoptype==2) {
                     [_planselectionbtn setTitle:[_planslectionarray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
                }
                else if (newpoptype==3){
                     [_typebtnlbl setTitle:[_typelistarray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
                 
                    
                }
                else if (newpoptype==4){
                    [_cmplexitybtnlbl setTitle:[_cmpxtyofwrk objectAtIndex:indexPath.row]forState:UIControlStateNormal];
                    
                    
                }
                


               // [_customerselectionBtn setTitle:[_customerlistarray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
               
                

                
                
                break;
            case 2:
                if (indexPath.row==0) {
                    if (!self.servVctrl) {
                        self.servVctrl=[[AddserviceViewController alloc]initWithNibName:@"AddserviceViewController" bundle:nil];
                    }
                    planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:btnindex];
                    _servVctrl.planID=planmdl.planid;
                    NSLog(@"%@",planmdl.planid);
                    _servVctrl.modalPresentationStyle=UIModalPresentationPageSheet;
                    _servVctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                    [self presentViewController:_servVctrl
                                       animated:YES completion:NULL];
                }
                if (indexPath.row==1) {
                    if (!self.sitevisitVctrl) {
                        self.sitevisitVctrl=[[SitevisitViewController alloc]initWithNibName:@"SitevisitViewController" bundle:nil];
                    }
                    planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:btnindex];
                    _sitevisitVctrl.companyid=planmdl.planid;
                    _sitevisitVctrl.companyname=planmdl.customername;
                    NSLog(@"%@",planmdl.customername);
                    _sitevisitVctrl.modalPresentationStyle=UIModalPresentationFullScreen;
                    _sitevisitVctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                    [self presentViewController:_sitevisitVctrl
                                       animated:YES completion:NULL];
                }
                if (indexPath.row==2) {
                    if (!self.DetailplanVctrl) {
                        self.DetailplanVctrl=[[DetailplanViewController alloc]initWithNibName:@"DetailplanViewController" bundle:nil];
                    }
                     planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:btnindex];
                    _DetailplanVctrl.planid=planmdl.planid;
                    _DetailplanVctrl.modalPresentationStyle=UIModalPresentationFullScreen;
                    _DetailplanVctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                    [self presentViewController:_DetailplanVctrl
                                       animated:YES completion:NULL];
                }
                
                
                
                
                
                
                break;
                
//            case 3:
//                 if (indexPath.row==0) {
//                if (!self.servVctrl) {
//                    self.servVctrl=[[AddserviceViewController alloc]initWithNibName:@"AddserviceViewController" bundle:nil];
//                }
//                     
//                _servVctrl.modalPresentationStyle=UIModalPresentationPageSheet;
//                _servVctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
//                [self presentViewController:_servVctrl
//                                   animated:YES completion:NULL];
//                 }
//                if (indexPath.row==1) {
//                    if (!self.sitevisitVctrl) {
//                        self.sitevisitVctrl=[[SitevisitViewController alloc]initWithNibName:@"SitevisitViewController" bundle:nil];
//                    }
//                    _sitevisitVctrl.modalPresentationStyle=UIModalPresentationPageSheet;
//                    _sitevisitVctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
//                    [self presentViewController:_sitevisitVctrl
//                                       animated:YES completion:NULL];
//                }
//                if (indexPath.row==2) {
//                    if (!self.DetailplanVctrl) {
//                        self.DetailplanVctrl=[[DetailplanViewController alloc]initWithNibName:@"DetailplanViewController" bundle:nil];
//                    }
//                    _DetailplanVctrl.modalPresentationStyle=UIModalPresentationPageSheet;
//                    _DetailplanVctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
//                    [self presentViewController:_DetailplanVctrl
//                                       animated:YES completion:NULL];
//                }
//                
//
//                
//
//
//                
//                break;
            default:
                break;
        }
        [self.popovercontroller dismissPopoverAnimated:YES];

        
        
    }
    

    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
        [self DeletePlan];
        [_planlistarray removeObject:indexPath];
        
        
        
        
        
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_plangtable)
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




#pragma mark-Button Actions
- (IBAction)clseVCtrlbtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addplan:(id)sender {
    _planslectionarray=[[NSMutableArray alloc]init];
    optionidentifier=1;
    self.navabar.title = @"ADD";
    //[self SelectAllCustomer];
    _addplanview.hidden=NO;
    _planselectionbtn.enabled=NO;
    [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
     [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
     [_planselectionbtn setTitle:@"Select" forState:UIControlStateNormal];
     [_typebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    _sitefactortxtfld.text=@"";
}
-(IBAction)closeaddview:(id)sender
{
    _addplanview.hidden=YES;
     _selectionlabel.hidden=YES;
    
}
-(IBAction)deleteplan:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_plangtable setEditing:NO animated:NO];
        [_plangtable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_plangtable setEditing:YES animated:YES];
        [_plangtable reloadData];
        
    }

}
-(IBAction)checkleadaction:(id)sender
{   leadclicked=@"Clicked";
    if(leadcheck==0)
    {
        [_popovertableview reloadData];
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _planselectionbtn.enabled=YES;

        leadcheck=1;
          customercheck=0;
          _selectionlabel.hidden=NO;
        _selectionlabel.text=@"Lead";
        _planslectionarray=[[NSMutableArray alloc]init];
        [self SelectAllLeads];
        //_customerselectionBtn.enabled=NO;
        
    }
    else
    {
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        leadcheck=0;
        //_customerselectionBtn.enabled=YES;
    }
    
}
-(IBAction)checkcustomeraction:(id)sender
{ customerclicked=@"clicked";
    if(customercheck==0)
    {      [_popovertableview reloadData];
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
         [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        customercheck=1;
        leadcheck=0;
        _planselectionbtn.enabled=YES;

        _selectionlabel.hidden=NO;
        _selectionlabel.text=@"Customer";
        _planslectionarray=[[NSMutableArray alloc]init];
        [self SelectAllCustomer];
        //_leadselectionBtn.enabled=NO;
    }
    else
    {
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        customercheck=0;
        //_leadselectionBtn.enabled=YES;
    }
    
}
-(IBAction)planselection:(id)sender
{
    //[self SelectAllLeads];
   
    poptype=1;
    newpoptype=2;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 120);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_planselectionbtn.frame inView:_addplanview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
    
}
-(IBAction)selectdisclosure:(id)sender
{
    poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 120, 90)];
    popoverView.backgroundColor = [UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 90)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 30;
    _popovertableview.separatorColor=[UIColor cyanColor];
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 90);
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.plangtable];
    NSIndexPath *textFieldIndexPath = [self.plangtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    //UITableView *table = (UITableView *)[cell superview];
    self.popovercontroller = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    [self.popovercontroller presentPopoverFromRect:_disclosurebtn.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    //[_popovertableview reloadData];
}

-(IBAction)updateplanning:(id)sender
{
    
    if([_planselectionbtn.titleLabel.text isEqualToString:@"Select"]||[_planselectionbtn.titleLabel.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Service field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        
  if(optionidentifier==1)
  {
      [self insertplans];
  }
    else if(optionidentifier==2)
    {
        [self UpdatePlan];
    }
    }
}
-(IBAction)cancelplanning:(id)sender
{
    
     _selectionlabel.hidden=YES;
    [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_planselectionbtn setTitle:@"Select" forState:UIControlStateNormal];
      [_typebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    _sitefactortxtfld.text=@"";



}
-(IBAction)Editaction:(id)sender
{
    optionidentifier=2;
    self.navabar.title = @"Edit";
      _addplanview.hidden=NO;
     _selectionlabel.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    _planselectionbtn.enabled=YES;

    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.plangtable];
    NSIndexPath *textFieldIndexPath = [self.plangtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:textFieldIndexPath.row];
    if (planmdl.leadid==0) {
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else{
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [self SelectAllLeads];
    }
    if (planmdl.customerid==0) {
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else{
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [self SelectAllCustomer];
    }
    [_planselectionbtn setTitle:planmdl.customername forState:UIControlStateNormal];
    
    _sitefactortxtfld.text=planmdl.sitefactor;
    NSLog(@"%@",_revtypelistdict);
      NSLog(@"%@",planmdl.worktypeid);
    
    [_typebtnlbl setTitle:[_revtypelistdict objectForKey:planmdl.worktypeid] forState:UIControlStateNormal];
    _loctntxtfld.text=planmdl.location;
    _ziptxtfld.text=planmdl.zip;
      [_cmplexitybtnlbl setTitle:planmdl.complexity forState:UIControlStateNormal];
    
    


}
- (IBAction)cmplxitywrkbtn:(id)sender {
    poptype=1;
    newpoptype=4;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 120);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_cmplexitybtnlbl.frame inView:_addplanview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    [_popovertableview reloadData];

}

#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchPlan];
    [searchBar resignFirstResponder];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self SelectAllPlans];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_searchbar.text length]==0) {
        
        [self SelectAllPlans];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
}
#pragma mark-webservices
-(void)SelectAllPlans
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllPlans xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllPlans>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];

    //NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllPlans" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SelectAllCustomer{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllCustomer xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllCustomer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllCustomer" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllLeads{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllLeads xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllLeads>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllLeads" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)insertplans
{  webtype=1;
    NSString *ledid;
    NSString *custid;
    
    recordResults = FALSE;
    NSString *soapMessage;
  
    if (leadcheck==0)
    {
        ledid=0;
    }
    else if(leadcheck==1)
    {
        ledid=[_leaddict objectForKey:_planselectionbtn.titleLabel.text];
    }
    if(customercheck==0)
    {
        custid=0;
    }
    else if(customercheck==1)
    {
        custid=[_customerdict objectForKey:_planselectionbtn.titleLabel.text];
    }
   
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertPlan xmlns=\"http://ios.kontract360.com/\">\n"
                   "<customer>%@</customer>\n"
                   "<lead>%d</lead>\n"
                   "<cusid>%d</cusid>\n"
                   "<id>%d</id>\n"
                   "<Fold_ID>%d</Fold_ID>\n"
                   "<WorkType>%d</WorkType>\n"
                   "<SiteFactor>%f</SiteFactor>\n"
                   "<Location>%@</Location>\n"
                   "<Zip>%@</Zip>\n"
                   "<Complexity>%@</Complexity>\n"
                   "</InsertPlan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planselectionbtn.titleLabel.text,[ledid integerValue],[custid integerValue],0,0,[[_typelistdict objectForKey:_typebtnlbl.titleLabel.text]integerValue],[_sitefactortxtfld.text floatValue],_loctntxtfld.text,_ziptxtfld.text,_cmplexitybtnlbl.titleLabel.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
   // NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/InsertPlan" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdatePlan
{
    webtype=1;
    NSInteger lead;
    NSInteger cust;
    
    recordResults = FALSE;
    NSString *soapMessage;
     planmodel*plmdl=(planmodel *)[_planlistarray objectAtIndex:btnindex];
   if([leadclicked isEqualToString:@"Clicked"])
   {
       NSString *ledid;
      
    if (leadcheck==0)
    {
        ledid=0;
        lead=[ledid integerValue];
    }
    else //if(leadcheck==1)
    {
        ledid=[_leaddict objectForKey:_planselectionbtn.titleLabel.text];
        lead=[ledid integerValue];
    }
}
    else
    {
        lead=plmdl.leadid;
    }
    if([customerclicked isEqualToString:@"Clicked"])
    {
         NSString *custid;
    if(customercheck==0)
    {
        custid=0;
        cust=[custid integerValue];
    }
    else //if(customercheck==1)
    {
        custid=[_customerdict objectForKey:_planselectionbtn.titleLabel.text];
        cust=[custid integerValue];
    }
    }
    else
    {
        cust=plmdl.customerid;
    }
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdatePlan xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "<customer>%@</customer>\n"
                   "<lead>%d</lead>\n"
                   "<cusid>%d</cusid>\n"
                   "<Fold_ID>%d</Fold_ID>\n"
                   "<WorkType>%d</WorkType>\n"
                   "<SiteFactor>%f</SiteFactor>\n"
                   "<Location>%@</Location>\n"
                   "<Zip>%@</Zip>\n"
                   "<Complexity>%@</Complexity>\n"
                   "</UpdatePlan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",plmdl.planid,_planselectionbtn.titleLabel.text,lead,cust,0,[[_typelistdict objectForKey:_typebtnlbl.titleLabel.text]integerValue ],[_sitefactortxtfld.text floatValue],_loctntxtfld.text,_ziptxtfld.text,_cmplexitybtnlbl.titleLabel.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdatePlan" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)DeletePlan
{
    webtype=3;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
   planmodel*plnmdl=(planmodel *)[_planlistarray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<DeletePlan xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</DeletePlan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",plnmdl.planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/DeletePlan" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SearchPlan
{
   // webtype=1;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<SearchPlan xmlns=\"http://ios.kontract360.com/\">\n"
                    "<searchtext>%@</searchtext>\n"
                   "</SearchPlan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SearchPlan" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)WorkTypeSelect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<WorkTypeSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "</WorkTypeSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/WorkTypeSelect" forHTTPHeaderField:@"Soapaction"];
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
    [_popovertableview reloadData];
    [_plangtable reloadData];
    if(webtype==1||webtype==3)
    {
        [self SelectAllPlans];
        webtype=0;
    }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {
        _planslectionarray=[[NSMutableArray alloc]init];
        _leaddict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CompanyName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllCustomerResult"])
    {
        _planslectionarray=[[NSMutableArray alloc]init];
        _customerdict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"CustomerName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllPlansResult"])
    {
        _planlistarray=[[NSMutableArray alloc]init];
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"planid"])
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
    if([elementName isEqualToString:@"leadid"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"customerid"])
    {
        
        
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
    if([elementName isEqualToString:@"PlanWorkType"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SiteFactor"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Location"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Zip"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Complexity"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"DeletePlanResult"])
    {

        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;


    }
    if([elementName isEqualToString:@"Column1"])
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

    if([elementName isEqualToString:@"SearchPlanResponse"])
    {
        _planlistarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }
    if([elementName isEqualToString:@"WorkTypeSelectResult"])
    {
        _typelistarray=[[NSMutableArray alloc]init];
        _typelistdict=[[NSMutableDictionary alloc]init];
        _revtypelistdict=[[NSMutableDictionary alloc]init];

        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ID"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"WorkType"])
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
    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        
        recordResults = FALSE;
        _leadstring=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CompanyName"])
    {
        
        recordResults = FALSE;
        [_leaddict setObject:_leadstring forKey:_soapResults];
        [_planslectionarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    } if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        _customerstring=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CustomerName"])
    {
        
        recordResults = FALSE;
        [_customerdict setObject:_customerstring forKey:_soapResults];
        [_planslectionarray addObject:_soapResults];

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SelectAllPlansResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"planid"])
    {
        
        recordResults = FALSE;
        _plnmdl=[[planmodel alloc]init];
        _plnmdl.planid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"customername"])
    {
        
        recordResults = FALSE;
        _plnmdl.customername=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"leadid"])
    {
        
        recordResults = FALSE;
        _plnmdl.leadid=[_soapResults integerValue];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"customerid"])
    {
        
        recordResults = FALSE;
        _plnmdl.customerid=[_soapResults integerValue];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"id"])
    {
        
        recordResults = FALSE;
        _plnmdl.idvalue=[_soapResults integerValue];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Fold_ID"])
    {
        
        
        recordResults = FALSE;
       
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"PlanWorkType"])
    {
        
        
       recordResults = FALSE;
        _plnmdl.worktypeid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SiteFactor"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.sitefactor=_soapResults;
      

        _soapResults = nil;

    }
    if([elementName isEqualToString:@"Location"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.location=_soapResults;
      
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Zip"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.zip=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Complexity"])
    {
        
        
        recordResults = FALSE;
        _plnmdl.complexity=_soapResults;
          [_planlistarray addObject:_plnmdl];
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"DeletePlanResult"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
        
    }


    if([elementName isEqualToString:@"Column1"])
    {
        _result=_soapResults;
        recordResults = FALSE;
        if (webtype!=3) {
            
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        }
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        _result=_soapResults;
        recordResults = FALSE;
        if (webtype!=3) {
            
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }

        _soapResults = nil;

        
    }
    
    
    if([elementName isEqualToString:@"ID"])
    {
        
        recordResults = FALSE;
        typestrg=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"WorkType"])
    {
        
        recordResults = FALSE;
        [_typelistarray addObject:_soapResults];
        [_typelistdict setObject:typestrg forKey:_soapResults];
        [_revtypelistdict setObject:_soapResults forKey:typestrg];
        _soapResults = nil;
        
    }

}


- (IBAction)typebtn:(id)sender {
    poptype=1;
    newpoptype=3;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 120);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_typebtnlbl.frame inView:_addplanview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];

     [self WorkTypeSelect];
    
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if ([alertView.message isEqualToString:_result]) {
       
        _sitefactortxtfld.text=@"";
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_planselectionbtn setTitle:@"Select" forState:UIControlStateNormal];
        [_typebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        _loctntxtfld.text=@"";
        _ziptxtfld.text=@"";
        [_cmplexitybtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    
    
}

@end
