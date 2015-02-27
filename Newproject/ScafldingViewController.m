//
//  ScaffoldingViewController.m
//  Prodektive
//
//  Created by GMSIndia 2 on 18/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "ScafldingViewController.h"

@interface ScafldingViewController ()

@end

@implementation ScafldingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1];
    _destextview.layer.borderWidth=2;
    _destextview.layer.cornerRadius=10;
    _destextview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1].CGColor;
//    [[self.view layer] setBorderWidth:2];
//    [[self.view layer] setCornerRadius:8];
//     [[self.view layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1].CGColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _work=(Workordrmdl*)[_workorderarray objectAtIndex:0];
    _unittextfield.text=_work.plant;
    _subunittextfield.text=_work.subunit;
    _equiptextfield.text=_work.equipmet;
    if (_optionidentifier==2) {
        _smdl=(Customscaffoldingplan*)[_sccfarray objectAtIndex:0];
        _navitem.title=@"Edit Scaffold";
        _unittextfield.text=_smdl.unit;
        _subunittextfield.text=_work.subunit;
        _equiptextfield.text=_smdl.equp;
        _phtextfield.text=_smdl.ph;
        [_scaffoldtypebtn setTitle:_smdl.scaffoldname forState:UIControlStateNormal];
        [_phasebtn setTitle:_smdl.phasename forState:UIControlStateNormal];
        [_sequencebtn setTitle:_smdl.sequencename forState:UIControlStateNormal];
        _lengthtextfield.text=_smdl.length;
        _widthtextfield.text=_smdl.width;
        _elevationtextfield.text=_smdl.elevation;
        _heighttextfield.text=_smdl.height;
        _qtytextfield.text=_smdl.qty;
        _destextview.text=_smdl.desc;
        if (_smdl.internalworkfactor==1) {
            [_IWFbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else
        {
            [_IWFbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        if (_smdl.ppe==1) {
            [_ppebtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else{
            [_ppebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        if (_smdl.unplannedwork==1) {
            [_upwbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            
        }
        else
        {
            [_upwbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }

        
    }
    else
    {
    _navitem.title=@"Create Scaffold";
    }
    [self UnitSelect];
    [self SubUnitSelect];
    [self GeneralEquipmentSelect];
    [self ProjectHeaderselect];
    _autocompletearray=[[NSMutableArray alloc]init];
    _autotable = [[UITableView alloc] initWithFrame:CGRectMake(20, 50, 195, 100) style:UITableViewStylePlain];
    
    _autotable.delegate = (id)self;
    _autotable.dataSource =(id) self;
    _autotable.scrollEnabled = YES;
    _autotable.hidden = YES;
    _autotable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _autotable.layer.borderWidth=2.0f;
    _autotable.layer.cornerRadius=5;
    _autotable.rowHeight=30;
    [self.scroll addSubview:_autotable];
    
    _autotable1 = [[UITableView alloc] initWithFrame:CGRectMake(325, 50, 195, 100) style:UITableViewStylePlain];
    
    _autotable1.delegate = (id)self;
    _autotable1.dataSource =(id) self;
    _autotable1.scrollEnabled = YES;
    _autotable1.hidden = YES;
    _autotable1.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _autotable1.layer.borderWidth=2.0f;
    _autotable1.rowHeight=30;
    _autotable1.layer.cornerRadius=5;
    [self.scroll addSubview:_autotable1];
    
    _autotable2 = [[UITableView alloc] initWithFrame:CGRectMake(20, 115, 195, 100) style:UITableViewStylePlain];
    
    _autotable2.delegate = (id)self;
    _autotable2.dataSource =(id) self;
    _autotable2.scrollEnabled = YES;
    _autotable2.hidden = YES;
    _autotable2.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _autotable2.layer.borderWidth=2.0f;
    _autotable2.rowHeight=30;
    _autotable3.layer.cornerRadius=5;
    [self.scroll addSubview:_autotable2];
    _autotable3 = [[UITableView alloc] initWithFrame:CGRectMake(325, 115, 195, 100) style:UITableViewStylePlain];
    
    _autotable3.delegate = (id)self;
    _autotable3.dataSource =(id) self;
    _autotable3.scrollEnabled = YES;
    _autotable3.hidden = YES;
    _autotable3.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _autotable3.layer.borderWidth=2.0f;
    _autotable3.rowHeight=30;
    _autotable3.layer.cornerRadius=5;
    [self.scroll addSubview:_autotable3];

    [self ScaffoldingSelectScaffoldtype];
    [self SelectAllPhases];
    [self JobsequenceSelect];
      //self.view.bounds = CGRectMake(0, 0, 768, 768);
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.view.bounds = CGRectMake(0, 0, 550, 650);
    _scroll.frame=CGRectMake(0,50,550, 650);
    [_scroll setContentSize:CGSizeMake(550,800)];
    [[self.view layer] setBorderWidth:2];
    [[self.view layer] setCornerRadius:8];
    [[self.view layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1].CGColor];

   
}
- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    
    // Put anything that starts with this substring into the autocompleteUrls array
    // The items in this array is what will show up in the table view
    if (txtfldtype==1) {
        
        
        [_autocompletearray removeAllObjects];
        for(NSString * curString in _unitarray) {
            NSRange substringRange = [curString rangeOfString:substring];
            if (substringRange.location == 0) {
                
                [_autocompletearray addObject:curString];
                NSLog(@"%@",_autocompletearray);
                
            }
        }
        [_autotable reloadData];
    }
    
    if (txtfldtype==2) {
        
        
        [_autocompletearray removeAllObjects];
        for(NSString * curString in _subunitarray) {
            NSRange substringRange = [curString rangeOfString:substring];
            if (substringRange.location == 0) {
                
                [_autocompletearray addObject:curString];
                NSLog(@"%@",_autocompletearray);
                
            }
        }
        [_autotable1 reloadData];
    }
    
    if (txtfldtype==3) {
        
        
        [_autocompletearray removeAllObjects];
        for(NSString * curString in _equipmentarray) {
            NSRange substringRange = [curString rangeOfString:substring];
            if (substringRange.location == 0) {
                
                [_autocompletearray addObject:curString];
                NSLog(@"%@",_autocompletearray);
                
            }
        }
        [_autotable2 reloadData];
    }
    if (txtfldtype==4) {
        
        
        [_autocompletearray removeAllObjects];
        for(NSString * curString in _projectheaderarray) {
            NSRange substringRange = [curString rangeOfString:substring];
            if (substringRange.location == 0) {
                
                [_autocompletearray addObject:curString];
                NSLog(@"%@",_autocompletearray);
                
            }
        }
        [_autotable3 reloadData];
    }
    
    
}



- (IBAction)phaseselection:(id)sender {
    poptype=1;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0,0, 200, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=30;
   // _popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.preferredContentSize=CGSizeMake(200, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    self.popovercontroller.popoverContentSize=CGSizeMake(200, 200);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_phasebtn.frame inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }

- (IBAction)scaffoldtypeselection:(id)sender {
    poptype=2;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=30;
    //_popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.preferredContentSize=CGSizeMake(200, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    self.popovercontroller.popoverContentSize=CGSizeMake(200, 200);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_scaffoldtypebtn.frame inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
    
}

- (IBAction)sequenceselection:(id)sender {
    poptype=3;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=30;
  //  _popovertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.preferredContentSize=CGSizeMake(200, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    self.popovercontroller.popoverContentSize=CGSizeMake(200, 200);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_sequencebtn.frame inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
}

- (IBAction)checkunplanned:(id)sender
{
    upwstring=@"clicked";
    if (upw==0) {
        [_upwbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        upw=1;
        
    }
    
    else{
        [_upwbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        upw=0;
        
    }

}

- (IBAction)checkppefactor:(id)sender
{
    ppestring=@"clicked";
    if (ppe==0) {
        [_ppebtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        ppe=1;
        
    }
    
    else{
        [_ppebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        ppe=0;
        
    }

}

- (IBAction)checkworkfactor:(id)sender {
    ipwstring=@"clicked";
    if (ipw==0) {
        [_IWFbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        ipw=1;
        
    }
    
    else{
        [_IWFbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        ipw=0;
        
    }

}

- (IBAction)closescaffoldpage:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tableReload" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)next:(id)sender {
    if ([_unittextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Unit is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_subunittextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Subunit is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_equiptextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Equipment is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_phtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Project Header is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_lengthtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Length is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_widthtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Width is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_heighttextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Height is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_elevationtextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Elevation is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_qtytextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Quantity is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_scaffoldtypebtn.titleLabel.text isEqualToString:@"Select"]||[_scaffoldtypebtn.titleLabel.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Scaffold Type is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_phasebtn.titleLabel.text isEqualToString:@"Select"]||[_phasebtn.titleLabel.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Phase is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_sequencebtn.titleLabel.text isEqualToString:@"Select"]||[_sequencebtn.titleLabel.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Sequence is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {



    [self Selectcheight];
    }
   // [self Scaffoldinsert];
//    _allctrl.delegate=self;
//   
//    self.allctrl=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
//    [UIView transitionFromView:self.view
//                        toView:self.allctrl.view
//                      duration:1
//                       options:UIViewAnimationOptionTransitionFlipFromRight
//                    completion:nil];
//    _allctrl.modalPresentationStyle=UIModalPresentationCustom;
//    [self.navigationController pushViewController:_allctrl animated:NO];
 
}
-(void)navgteanimtn{
    [UIView transitionFromView:self.allctrl.view
                        toView:self.view
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self ScaffoldingSelectplan];
    
}

#pragma mark-Tableview Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_popovertableview)
    {
        if (poptype==1) {
             return [_phasearray count];
        }
        else if(poptype==2)
        {
            return [_scaffoldtyperesultarray count];

        }
        else if(poptype==3)
        {
            return [_sequencearray count];
        }
    }
    if(tableView==_autotable||tableView==_autotable1||tableView==_autotable2||tableView==_autotable3)
    {
        return [_autocompletearray count];
    }
   
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
            }
    if (tableView==_popovertableview) {
        
    
    if (poptype==1) {
         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        cell.textLabel.text=[_phasearray objectAtIndex:indexPath.row];
    }
    else if(poptype==2)
    {
         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        _typmdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:indexPath.row];
        cell.textLabel.text=_typmdl.typeName;
           }
    else if(poptype==3)
    { cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        cell.textLabel.text=[_sequencearray objectAtIndex:indexPath.row];

    }
    }
    if (tableView==_autotable||tableView==_autotable1||tableView==_autotable2||tableView==_autotable3) {
         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        cell.textLabel.text=[_autocompletearray objectAtIndex:indexPath.row];
    }

    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
if (tableView==_popovertableview)
{
    if (poptype==1) {
         [_phasebtn setTitle:[_phasearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
           }
    else if(poptype==2)
    {
        _typmdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:indexPath.row];
        scaffoldtypeindex=indexPath.row;
        // cell.textLabel.text=typmdl.typeName;
        [_scaffoldtypebtn setTitle:_typmdl.typeName forState:UIControlStateNormal];
   }
    else if(poptype==3)
    {   [_sequencebtn setTitle:[_sequencearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];    }

   }
    if (tableView==_autotable) {
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        _unittextfield.text = selectedCell.textLabel.text;
        
        _autotable.hidden = YES;
    }
    if (tableView==_autotable1) {
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        _subunittextfield.text = selectedCell.textLabel.text;
        
        _autotable1.hidden = YES;
    }
    if (tableView==_autotable2) {
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        _equiptextfield.text = selectedCell.textLabel.text;
        
        _autotable2.hidden = YES;
    }
    
    if (tableView==_autotable3) {
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        _phtextfield.text = selectedCell.textLabel.text;
        
        _autotable3.hidden = YES;
    }

    
    [self.popovercontroller dismissPopoverAnimated:YES];
    
}

#pragma mark-webservice
-(void)SelectAllPhases{
  
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Phasesbasedonworktypeselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ServicesId>%d</ServicesId>\n"
                   "</Phasesbasedonworktypeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_worktypeid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Phasesbasedonworktypeselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ScaffoldingSelectScaffoldtype{
   
    poptype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldingSelectScaffoldtype xmlns=\"http://ios.kontract360.com/\">\n"
                   "</ScaffoldingSelectScaffoldtype>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];

    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ScaffoldingSelectScaffoldtype" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)JobsequenceSelect{
   
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ServiceJobSequenceselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<SkillId>%d</SkillId>\n"
                   "</ServiceJobSequenceselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_serviceid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ServiceJobSequenceselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)Scaffoldinsert{
    recordResults = FALSE;
    NSString *soapMessage;
   
        NSString *scaffoldid=[_scaffoldidDict objectForKey:_scaffoldtypebtn.titleLabel.text];
        NSString *phaseid=[_phasedict objectForKey:_phasebtn.titleLabel.text];
        NSString *sequenceid=[_sequncedict objectForKey:_sequencebtn.titleLabel.text];
        NSLog(@"%@",_sequencebtn.titleLabel.text);
        NSLog(@"%@",scaffoldid);
    
    NSString*newstrg=  [_destextview.text stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@"'" withString:@"&#39;"];
//        NSString *manhours=@"0";
//        NSString *erecthours=@"0";
//        NSString *dismantilehours=@"0";
        NSString *insertid=@"0";
        
        soapMessage = [NSString stringWithFormat:
                       
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                       
                       
                       "<soap:Body>\n"
                       
                       "<Scaffoldinsert xmlns=\"http://ios.kontract360.com/\">\n"
                       "<id>%d</id>\n"
                       "<length>%@</length>\n"
                       "<width>%@</width>\n"
                       "<height>%@</height>\n"
                       "<qty>%@</qty>\n"
                       "<elevation>%@</elevation>\n"
                       "<unit>%@</unit>\n"
                       "<equp>%@</equp>\n"
                       "<description>%@</description>\n"
                       "<typeofscaffold>%d</typeofscaffold>\n"
                       "<ManHours>%f</ManHours>\n"
                       "<ErectHours>%f</ErectHours>\n"
                       "<DismantleHours>%f</DismantleHours>\n"
                       "<planId>%@</planId>\n"
                       "<InternalWorkFactor>%d</InternalWorkFactor>\n"
                       "<PPE>%d</PPE>\n"
                       "<UnplannedWork>%d</UnplannedWork>\n"
                       "<ph>%@</ph>\n"
                       "<Sequence>%d</Sequence>\n"
                       "<Phase>%d</Phase>\n"
                       "<SubUnit>%@</SubUnit>\n"
                       "<WorkOrderID>%@</WorkOrderID>\n"
                       "</Scaffoldinsert>\n"
                       "</soap:Body>\n"
                       "</soap:Envelope>\n",[insertid integerValue],_lengthtextfield.text,_widthtextfield.text,_heighttextfield.text,_qtytextfield.text,_elevationtextfield.text,_unittextfield.text,_equiptextfield.text,newstrg,[scaffoldid integerValue],[_manpwr doubleValue],[_erecrhr doubleValue],[_dishr doubleValue],_planid,ipw,ppe,upw,_phtextfield.text,[sequenceid integerValue],[phaseid integerValue],_subunittextfield.text,_workorderid];
        NSLog(@"soapmsg%@",soapMessage);
    
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Scaffoldinsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Scaffoldupdate{
    recordResults = FALSE;
    NSString *soapMessage;
    
    NSString *scaffoldid=[_scaffoldidDict objectForKey:_scaffoldtypebtn.titleLabel.text];
    NSString *phaseid=[_phasedict objectForKey:_phasebtn.titleLabel.text];
    NSString *sequenceid=[_sequncedict objectForKey:_sequencebtn.titleLabel.text];
    NSLog(@"%@",_sequencebtn.titleLabel.text);
    NSLog(@"%@",scaffoldid);
    
    NSString*newstrg=  [_destextview.text stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
    newstrg=  [newstrg stringByReplacingOccurrencesOfString:@"'" withString:@"&#39;"];
     _smdl=(Customscaffoldingplan *)[_sccfarray objectAtIndex:0];
    NSInteger check1;
    NSInteger check2;
    NSInteger check3;
    if([ipwstring isEqualToString:@"clicked"])
    {
        if (ipw==0) {
            check1=0;
        }
        else{
            check1=1;
            
        }
        ipwstring=@"";
    }
    else
    {
        check1 =_smdl.internalworkfactor;
    }
    if([ppestring isEqualToString:@"clicked"])
    {
        if (ppe==0) {
            check2=0;
        }
        else{
            check2=1;
            
        }
        ppestring=@"";
    }
    else
    {
        check2=_smdl.ppe;
    }
    if([upwstring isEqualToString:@"clicked"])
    {
        if (upw==0) {
            check3=0;
        }
        else{
            check3=1;
            
        }
        upwstring=@"";
    }
    else
    {
        check3=_smdl.unplannedwork;
    }

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Scaffoldinsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<id>%d</id>\n"
                   "<length>%@</length>\n"
                   "<width>%@</width>\n"
                   "<height>%@</height>\n"
                   "<qty>%@</qty>\n"
                   "<elevation>%@</elevation>\n"
                   "<unit>%@</unit>\n"
                   "<equp>%@</equp>\n"
                   "<description>%@</description>\n"
                   "<typeofscaffold>%d</typeofscaffold>\n"
                   "<ManHours>%f</ManHours>\n"
                   "<ErectHours>%f</ErectHours>\n"
                   "<DismantleHours>%f</DismantleHours>\n"
                   "<planId>%@</planId>\n"
                   "<InternalWorkFactor>%d</InternalWorkFactor>\n"
                   "<PPE>%d</PPE>\n"
                   "<UnplannedWork>%d</UnplannedWork>\n"
                   "<ph>%@</ph>\n"
                   "<Sequence>%d</Sequence>\n"
                   "<Phase>%d</Phase>\n"
                   "<SubUnit>%@</SubUnit>\n"
                   "<WorkOrderID>%@</WorkOrderID>\n"
                   "</Scaffoldinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_smdl.idvalue ,_lengthtextfield.text,_widthtextfield.text,_heighttextfield.text,_qtytextfield.text,_elevationtextfield.text,_unittextfield.text,_equiptextfield.text,newstrg,[scaffoldid integerValue],[_manpwr doubleValue],[_erecrhr doubleValue],[_dishr doubleValue],_planid,check1,check2,check3,_phtextfield.text,[sequenceid integerValue],[phaseid integerValue],_subunittextfield.text,_workorderid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Scaffoldinsert" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)UnitSelect{
  //  p=@"Other";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UnitSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</UnitSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UnitSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SubUnitSelect{
    //p=@"Other";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SubUnitSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</SubUnitSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SubUnitSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GeneralEquipmentSelect{
   // p=@"Other";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralEquipmentSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</GeneralEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ProjectHeaderselect{
   // p=@"Other";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ProjectHeaderselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</ProjectHeaderselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"https://vip.kontract360.com/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ProjectHeaderselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Selectcheight{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Selectcheight xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ht>%d</ht>\n"
                   "</Selectcheight>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_elevationtextfield.text integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Selectcheight" forHTTPHeaderField:@"Soapaction"];
    
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
    
    [_popovertableview reloadData];
    [_autotable reloadData];
    [_autotable1 reloadData];
    [_autotable2 reloadData];
    [_autotable3 reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ProjectHeaderselectResult"])
    {
        _projectheaderarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ProjectHeader"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"UnitSelectResult"])
    {
        _unitarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Unit"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"SubUnitSelectResult"])
    {
        _subunitarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"GeneralEquipmentSelectResult"])
    {
        _equipmentarray=[[NSMutableArray alloc]init];
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

    if([elementName isEqualToString:@"PhasesbasedonworktypeselectResponse"])
    {
        _phasearray=[[NSMutableArray alloc]init];
        _phasedict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"PhaseName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"ServiceJobSequenceselectResponse"])
    {
        _sequencearray=[[NSMutableArray alloc]init];
        _sequncedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"JobSequenceId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"JobTask"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SequenceNumber"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldtypeResult"])
    {
        _scaffoldtyperesultarray=[[NSMutableArray alloc]init];
        _scaffoldtypeDict=[[NSMutableDictionary alloc]init];
        _scaffoldidDict=[[NSMutableDictionary alloc]init];
        if(!_soapResults
           )
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"scaffoldId"])
    {
        
        if(!_soapResults)
        {
         
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"typename"])
    {
        
        if(!_soapResults)
        {
            
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"rate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftupto33"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftupto100"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftupto165"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftg165"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ft3upto1750"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3upto7000"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3upto18000"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3g18000"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ScaffoldinsertResponse"])
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
    if([elementName isEqualToString:@"SelectcheightResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"heightrate"])
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
    if([elementName isEqualToString:@"ProjectHeader"])
    {
        
        recordResults = FALSE;
        
        [_projectheaderarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Unit"])
    {
        recordResults = FALSE;
        
        [_unitarray addObject:_soapResults];
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"SubUnit"])
    {
        
        recordResults = FALSE;
        [_subunitarray addObject:_soapResults];
        _soapResults = nil;
        
        
        
    }
    if([elementName isEqualToString:@"Equipment"])
    {
        
        recordResults = FALSE;
        [_equipmentarray addObject:_soapResults];
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        phasestrg=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"PhaseName"])
    {
        
        recordResults = FALSE;
        [_phasearray addObject:_soapResults];
        [_phasedict setObject:phasestrg forKey:_soapResults];
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"JobSequenceId"])
    {
        
        recordResults = FALSE;
        jobsequnce=_soapResults;
        _soapResults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"JobTask"])
    {
        
        recordResults = FALSE;
        _sequencestring=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SequenceNumber"])
    {
        
        recordResults = FALSE;
        [_sequencearray addObject:[NSString stringWithFormat:@"%@-%@",_soapResults,_sequencestring]];
        [_sequncedict setObject:jobsequnce forKey:[NSString stringWithFormat:@"%@-%@",_soapResults,_sequencestring]];
        _soapResults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldtypeResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"scaffoldId"])
    {
        _typmdl=[[Scaffoldtypemdl alloc]init];
        recordResults = FALSE;
        _scaffoldtypestring=_soapResults;
        _typmdl.scaffoldid=[_soapResults integerValue];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"typename"])
    {
        
        recordResults = FALSE;
        _typmdl.typeName=_soapResults;
        [_scaffoldtypeDict setObject:_soapResults forKey:_scaffoldtypestring];
        [_scaffoldidDict setObject:_scaffoldtypestring forKey:_soapResults];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"rate"])
    {
        
        recordResults = FALSE;
        _typmdl.rate=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ftupto33"])
    {
        
        recordResults = FALSE;
        _typmdl.ftupto33=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ftupto100"])
    {
        
        recordResults = FALSE;
        _typmdl.ftupto100=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ftupto165"])
    {
        
        recordResults = FALSE;
        _typmdl.ftupto165=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ftg165"])
    {
        
        recordResults = FALSE;
        _typmdl.ftg165=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"ft3upto1750"])
    {
        
        recordResults = FALSE;
        _typmdl.ft3upto1750=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ft3upto7000"])
    {
        
        recordResults = FALSE;
        _typmdl.ft3upto7000=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ft3upto18000"])
    {
        
        recordResults = FALSE;
        _typmdl.ft3upto18000=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ft3g18000"])
    {
        
        recordResults = FALSE;
        _typmdl.ft3g18000=_soapResults;
        [_scaffoldtyperesultarray addObject:_typmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        
        recordResults = FALSE;
        _insertresultvalue=_soapResults;
        if(_optionidentifier==1)
        {
            _allctrl.delegate=self;
            
            self.allctrl=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];            _allctrl.newscfoldtypearry=_scaffoldtyperesultarray;
            _allctrl.len=_lengthtextfield.text;
            _allctrl.wid=_widthtextfield.text;
            _allctrl.height=_heighttextfield.text;
            _allctrl.ele=_elevationtextfield.text;
            _allctrl.sid=[_scaffoldidDict objectForKey:_scaffoldtypebtn.titleLabel.text];
            _allctrl.qty=_qtytextfield.text;
            _allctrl.ph=_phtextfield
            .text;
            _allctrl.sitefactor=_sitefactor;
            _allctrl.planid=_planid;
            _allctrl.Scfldid=_insertresultvalue;
            _allctrl.phaseid=[_phasedict objectForKey:_phasebtn.titleLabel.text];
            _allctrl.sequenceid=[_sequncedict objectForKey:_sequencebtn.titleLabel.text];
            _allctrl.subunit=_subunittextfield.text;
            _allctrl.optionidentifier=_optionidentifier;
            _allctrl.iwfcheck=ipw;
            _allctrl.ppecheck=ppe;
            _allctrl.upwcheck=upw;
            _allctrl.chightrate=chrate;
            _allctrl.qty=_qtytextfield.text;
            _allctrl.desvalue=_destextview.text;
            NSInteger scfid= [_allctrl.sid integerValue];
            switch (scfid) {
                case 1:
                    _allctrl.scaffoldtypeindex=0;
                    
                    break;
                    
                case 2:
                    _allctrl.scaffoldtypeindex=1;
                    
                    
                    break;
                case 3:
                    _allctrl.scaffoldtypeindex=2;
                    
                    break;
                case 4:
                    _allctrl.scaffoldtypeindex=3;
                    
                    break;
                case 5:
                    _allctrl.scaffoldtypeindex=4;
                    
                    break;
                    
                default:
                    
                    break;
            }
            
          
           
            
            [UIView transitionFromView:self.view
                                toView:self.allctrl.view
                              duration:1
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            completion:nil];
            _allctrl.modalPresentationStyle=UIModalPresentationCustom;
            [self.navigationController pushViewController:_allctrl animated:NO];
            _optionidentifier=0;
        }
               _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
       
     if([_soapResults isEqualToString:@"updatedscaffold"])
        {
            _allctrl.delegate=self;
            
            self.allctrl=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
            _allctrl.newscfoldtypearry=_scaffoldtyperesultarray;
            _allctrl.len=_lengthtextfield.text;
            _allctrl.wid=_widthtextfield.text;
            _allctrl.height=_heighttextfield.text;
            _allctrl.ele=_elevationtextfield.text;
            _allctrl.sid=[_scaffoldidDict objectForKey:_scaffoldtypebtn.titleLabel.text];
            _allctrl.qty=_qtytextfield.text;
            _allctrl.ph=_phtextfield.text;
            _allctrl.planid=_planid;
            _allctrl.Scfldid=_insertresultvalue;
            _allctrl.phaseid=[_phasedict objectForKey:_phasebtn.titleLabel.text];
            _allctrl.sequenceid=[_sequncedict objectForKey:_sequencebtn.titleLabel.text];
            _allctrl.subunit=_subunittextfield.text;
            _allctrl.optionidentifier=_optionidentifier;
             _allctrl.sitefactor=_sitefactor;
             _smdl=(Customscaffoldingplan*)[_sccfarray objectAtIndex:0];
            _allctrl.iwfcheck=_smdl.internalworkfactor;
            _allctrl.ppecheck=_smdl.ppe;
            _allctrl.upwcheck=_smdl.unplannedwork;
            _allctrl.chightrate=chrate;
            _allctrl.qty=_qtytextfield.text;
            _allctrl.desvalue=_destextview.text;
            NSInteger scfid= [_allctrl.sid integerValue];
            switch (scfid) {
                case 1:
                    _allctrl.scaffoldtypeindex=0;
                    
                    break;
                    
                case 2:
                    _allctrl.scaffoldtypeindex=1;
                    
                    
                    break;
                case 3:
                    _allctrl.scaffoldtypeindex=2;
                    
                    break;
                case 4:
                    _allctrl.scaffoldtypeindex=3;
                    
                    break;
                case 5:
                    _allctrl.scaffoldtypeindex=4;
                    
                    break;
                    
                default:
                    
                    break;
            }
            
            
            
            
            [UIView transitionFromView:self.view
                                toView:self.allctrl.view
                              duration:1
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            completion:nil];
            _allctrl.modalPresentationStyle=UIModalPresentationCustom;
            [self.navigationController pushViewController:_allctrl animated:NO];
            _optionidentifier=0;

        }

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"heightrate"])
    {
          recordResults = FALSE;
        chrate=[NSDecimalNumber decimalNumberWithString:_soapResults];
        [self calulatemanhrs];
        _soapResults = nil;
    }


}
#pragma mark-Textfield Delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(textField==_unittextfield)
    {
        txtfldtype=1;
        
        _autotable.hidden = NO;
        
        NSString *substring = [NSString stringWithString:_unittextfield.text];
        substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompleteEntriesWithSubstring:substring];
        NSUInteger newLength = [_unittextfield.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
        
        
        
    }
    
    if(textField==_subunittextfield)
    {
        txtfldtype=2;
        
        _autotable1.hidden = NO;
        
        
        
        NSString *substring = [NSString stringWithString:_subunittextfield.text];
        substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompleteEntriesWithSubstring:substring];
        NSUInteger newLength = [_subunittextfield.text length] + [string length] - range.length;
        return (newLength > 30) ? NO : YES;
        
    }
    
    if(textField==_equiptextfield)
    {
        txtfldtype=3;
        
        _autotable2.hidden = NO;
        
        
        NSString *substring = [NSString stringWithString:_equiptextfield.text];
        substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompleteEntriesWithSubstring:substring];
        NSUInteger newLength = [_equiptextfield.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
        
        
    }
    if(textField==_phtextfield)
    {
        txtfldtype=4;
        
        _autotable3.hidden = NO;
        
        
        
        NSString *substring = [NSString stringWithString:_phtextfield.text];
        substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompleteEntriesWithSubstring:substring];
        NSUInteger newLength = [_phtextfield.text length] + [string length] - range.length;
        return (newLength > 30) ? NO : YES;
    }
    
    
    
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    //Validation*val=[[Validation alloc]init];
    if(textField==_unittextfield)
    {
        
        _autotable.hidden = YES;
    }
    if(textField==_subunittextfield)
    {
        _autotable1.hidden = YES;
        
    }
    if(textField==_equiptextfield)
    {
        _autotable2.hidden = YES;
    }
    if(textField==_phtextfield)
    {
        _autotable3.hidden = YES;
    }
}
-(void)calulatemanhrs{
    NSString *rate;
    NSDecimalNumber *l=[NSDecimalNumber decimalNumberWithString:_lengthtextfield.text];
    NSDecimalNumber *w=[NSDecimalNumber decimalNumberWithString:_widthtextfield.text];
    NSDecimalNumber *h=[NSDecimalNumber decimalNumberWithString:_heighttextfield.text];
   // NSInteger sf=_sitefactor;
    Scaffoldtypemdl*typmdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:scaffoldtypeindex];
   
    NSString *sid=[_scaffoldidDict objectForKey:_scaffoldtypebtn.titleLabel.text];
   // NSDecimalNumber *sc=[NSDecimalNumber decimalNumberWithString:sid];
    //NSLog(@"%d",[sid integerValue]);
    NSDecimalNumber *a;
    NSDecimalNumber *b;
    NSDecimalNumber *c;
   
    if([sid integerValue]==1)
    {
        if([_heighttextfield.text integerValue]<=33)
        {
            rate=typmdl.ftupto33;
            NSLog(@"%@",typmdl.ftupto33);
            NSLog(@"%@",rate);
        }
        else if([_heighttextfield.text integerValue]>33 && [_heighttextfield.text integerValue]<=100)
        {
            rate=typmdl.ftupto100;
        }
        else if([_heighttextfield.text integerValue]>100 && [_heighttextfield.text integerValue]<=165)
        {
            rate=typmdl.ftupto165;
        }
        else if([_heighttextfield.text integerValue]>165)
        {
            rate=typmdl.ftg165;
        }
        
    }
    else if([sid integerValue]==2)
    {
        
        rate=typmdl.rate;
    }
    else if([sid integerValue]==3)
    {
        rate=typmdl.rate;
        NSLog(@"%@",typmdl.rate);
        
    }
    else if([sid integerValue]==4)
    {
        NSDecimalNumber *result=[[l decimalNumberByMultiplyingBy:w] decimalNumberByMultiplyingBy:h];
        if([result integerValue]<=1750)
        {
            rate=typmdl.ft3upto1750;
        }
        else if([result integerValue]>1750 && [result integerValue]<=1750)
        {
            rate=typmdl.ft3upto7000;
        }
        else if([result integerValue]>7000 && [result integerValue]<=18000)
        {
            rate=typmdl.ft3upto18000;
        }
        else if([result integerValue]>18000)
        {
            rate=typmdl.ft3g18000;
        }
        
        
    }
    else
    {
        rate=typmdl.rate;
        
    }
    if(ipw==1)
    {
        //a=0.40;
        a=[NSDecimalNumber decimalNumberWithString:@"0.40"];
           }
    else
    {
     a=[NSDecimalNumber decimalNumberWithString:@"0"];
       

    }
    if(ppe==1)
    {
       // b=1;
       b=[NSDecimalNumber decimalNumberWithString:@"1"];
       

    }
    else
    {
        b=[NSDecimalNumber decimalNumberWithString:@"0"];
    }
    if(upw==1)
    {
        //c=0.1;
        c=[NSDecimalNumber decimalNumberWithString:@"0.1"];
    }
    else
    {
      c=[NSDecimalNumber decimalNumberWithString:@"0"];
    }
    
    NSDecimalNumber *qty=[NSDecimalNumber decimalNumberWithString:_qtytextfield.text];
    NSDecimalNumber *r=[NSDecimalNumber decimalNumberWithString:rate];;
    
    NSDecimalNumber *lwhqr=[[[[[l decimalNumberByMultiplyingBy:w] decimalNumberByMultiplyingBy:h] decimalNumberByMultiplyingBy:qty]decimalNumberByMultiplyingBy:r]decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"1"]];
    NSDecimalNumber *checktot=[[[[a decimalNumberByAdding:b]decimalNumberByAdding:c]decimalNumberByAdding:[NSDecimalNumber decimalNumberWithString:@"1"]]decimalNumberByAdding:chrate];
    
    NSDecimalNumber *first=[checktot decimalNumberByMultiplyingBy:_sitefactor];
    NSLog(@"Subtotal: %@", [lwhqr decimalNumberByMultiplyingBy:first]);
    
   _manpwr=[lwhqr decimalNumberByMultiplyingBy:first];
    _dishr=[_manpwr decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"0.33"]];
    _erecrhr=[_manpwr decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"0.67"]];
    if (_optionidentifier==1) {
        
    
    [self Scaffoldinsert];
    }
        else
        {
            [self Scaffoldupdate];
        }
}

@end
