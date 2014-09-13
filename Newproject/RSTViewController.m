//
//  SubtypViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 12/09/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "RSTViewController.h"

@interface RSTViewController ()

@end

@implementation RSTViewController

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
    //new line
     self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    //_addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    _subtypetable.layer.borderWidth=3.0;
    _subtypetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if (_moduleid==27) {
        
    
    [self Equipmentsubtypeselect];
    }
    else if (_moduleid==28)
    {
       [self Materialsubtypeselect];
    }
    else if (_moduleid==34)
    {
        [self ThirdpartySubTypeselect];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 200);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_subtypebutton.frame
                                            inView:self.addview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}

-(IBAction)closesubtype:(id)sender
{
    _subtypetable.userInteractionEnabled=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)updatebtn:(id)sender
{
    if ([_subtypebutton.titleLabel.text isEqualToString:@"Select"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Subtype is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        if (_moduleid==27) {
            
        
        [self Equipmentsubtypeinsert];
        }
        else if (_moduleid==28)
        {
            [self Materialsubtypeinsert];
        }
        else if (_moduleid==34)
        {
            [self ThirdPartysubtypeinsert];
        }

    }

}
- (IBAction)addclsebtn:(id)sender
{
    _addview.hidden=YES;
    _subtypetable.userInteractionEnabled=YES;

}
- (IBAction)subtpebtn:(id)sender
{
    [self createpopover];
    if (_moduleid==27) {
        
    
    [self Multiequsubtypeselect];
    }
    else if(_moduleid==28)
    {
        [self MultiMaterialsubtypeselect];
    }
    else if(_moduleid==34)
    {
        [self MultiThirdpartysubtypeselect];
    }


}

- (IBAction)addbtn:(id)sender
{
    [_subtypetable setEditing:NO animated:NO];
    _subtypetable.userInteractionEnabled=NO;

    _addview.hidden=NO;
}
- (IBAction)deletebtn:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_subtypetable setEditing:NO animated:NO];
        [_subtypetable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_subtypetable setEditing:YES animated:YES];
        [_subtypetable reloadData];
        
        
        
        
    }

}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_popOverTableView){
        
        return [_Subtypelistarray count];
        
    }else{
        return [_selectedsubtypearray count];
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        if(tableView==_subtypetable){
            
            [[NSBundle mainBundle]loadNibNamed:@"Subcell" owner:self options:nil];
            cell=_subcell;
        }

        
        //        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    if(tableView==_popOverTableView){
        cell.textLabel.text=[_Subtypelistarray objectAtIndex:indexPath.row];
        
    }
    else{
        Craftreqmtmdl*submdl=(Craftreqmtmdl *)[_selectedsubtypearray objectAtIndex:indexPath.row];
        
        _subtypelabel=(UILabel *)[cell viewWithTag:1];
        _subtypelabel.text=submdl.Brdescriptn;
        //cell.textLabel.text=@"Servicename";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popOverTableView) {
        path=indexPath.row;
         [_subtypebutton setTitle:[_Subtypelistarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        
    }
    [self.popOverController dismissPopoverAnimated:YES];
}

#pragma mark-Tableview UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (tableView==_subtypetable) {
        
        
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
        deletepath=indexPath.row;
        if (_moduleid==27) {
            [self EquipmentsubtypeDelete];
             [_selectedsubtypearray removeObject:indexPath];
        }
        else if (_moduleid==28)
        {
            [self MaterialsubtypeDelete];
             [_selectedsubtypearray removeObject:indexPath];
        }
        else if (_moduleid==34)
        {
            [self ThirdPartysubtypeDelete];
            [_selectedsubtypearray removeObject:indexPath];
        }
       
        
        
        
    }
    
}
#pragma mark- WebService
-(void)Equipmentsubtypeselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Equipmentsubtypeselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EqStEquipmentId>%d</EqStEquipmentId>\n"
                   "</Equipmentsubtypeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_equipmainid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Equipmentsubtypeselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Multiequsubtypeselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Multiequsubtypeselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EqStEquipmentId>%d</EqStEquipmentId>\n"
                   "</Multiequsubtypeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_equipmainid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Multiequsubtypeselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Equipmentsubtypeinsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Equipmentsubtypeinsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EqStEquipmentId>%d</EqStEquipmentId>\n"
                   "<BRVaEqStSubTypeId>%d</BRVaEqStSubTypeId>\n"
                   "<EqStDescription>%@</EqStDescription>\n"
                   "</Equipmentsubtypeinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_equipmainid,[[_subtypelistdictionary objectForKey:[_Subtypelistarray objectAtIndex:path]]integerValue],[_Subtypelistarray objectAtIndex:path]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Equipmentsubtypeinsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EquipmentsubtypeDelete{
    recordResults = FALSE;
    NSString *soapMessage;
    Craftreqmtmdl*subtypemdl=(Craftreqmtmdl *)[_selectedsubtypearray objectAtIndex:deletepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EquipmentsubtypeDelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EqStEquipmentId>%d</EqStEquipmentId>\n"
                   "</EquipmentsubtypeDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[subtypemdl.Brentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmentsubtypeDelete" forHTTPHeaderField:@"Soapaction"];
    
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
#pragma mark-Materials
-(void)Materialsubtypeselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Materialsubtypeselect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<MTStEquipmentId>%d</MTStEquipmentId>\n"
                   "</Materialsubtypeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_materialmainid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Materialsubtypeselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)MultiMaterialsubtypeselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<MultiMaterialsubtypeselect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<MTStEquipmentId>%d</MTStEquipmentId>\n"
                   "</MultiMaterialsubtypeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_materialmainid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/MultiMaterialsubtypeselect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)Materialsubtypeinsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Materialsubtypeinsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MTStEquipmentId>%d</MTStEquipmentId>\n"
                   "<MTStSubTypeId>%d</MTStSubTypeId>\n"
                   "<MTStDescription>%@</MTStDescription>\n"
                   "</Materialsubtypeinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_materialmainid,[[_subtypelistdictionary objectForKey:[_Subtypelistarray objectAtIndex:path]]integerValue],[_Subtypelistarray objectAtIndex:path]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Materialsubtypeinsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)MaterialsubtypeDelete{
    recordResults = FALSE;
    NSString *soapMessage;
    Craftreqmtmdl*subtypemdl=(Craftreqmtmdl *)[_selectedsubtypearray objectAtIndex:deletepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<MaterialsubtypeDelete xmlns=\"http://ios.kontract360.com/\">\n"
                    "<MTStEquipmentId>%d</MTStEquipmentId>\n"
                   "</MaterialsubtypeDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[subtypemdl.Brentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/MaterialsubtypeDelete" forHTTPHeaderField:@"Soapaction"];
    
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
#pragma mark-Thirdparty

-(void)ThirdpartySubTypeselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ThirdpartySubTypeselect xmlns=\"http://ios.kontract360.com/\">\n"
                  "<TPStEquipmentId>%d</TPStEquipmentId>\n"
                   "</ThirdpartySubTypeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_equipmainid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ThirdpartySubTypeselect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)MultiThirdpartysubtypeselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<MultiThirdpartysubtypeselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<TPStEquipmentId>%d</TPStEquipmentId>\n"
                   "</MultiThirdpartysubtypeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_equipmainid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/MultiThirdpartysubtypeselect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ThirdPartysubtypeinsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ThirdPartysubtypeinsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<TPStEquipmentId>%d</TPStEquipmentId>\n"
                   "<TPStSubTypeId>%d</TPStSubTypeId>\n"
                   "<TPStDescription>%@</TPStDescription>\n"
                   "</ThirdPartysubtypeinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_equipmainid,[[_subtypelistdictionary objectForKey:[_Subtypelistarray objectAtIndex:path]]integerValue],[_Subtypelistarray objectAtIndex:path]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ThirdPartysubtypeinsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ThirdPartysubtypeDelete{
    recordResults = FALSE;
    NSString *soapMessage;
    Craftreqmtmdl*subtypemdl=(Craftreqmtmdl *)[_selectedsubtypearray objectAtIndex:deletepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ThirdPartysubtypeDelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<TPStEquipmentId>%d</TPStEquipmentId>\n"
                   "</ThirdPartysubtypeDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[subtypemdl.Brentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ThirdPartysubtypeDelete" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    
    [_subtypetable reloadData];
    [_popOverTableView reloadData];
    //    if(webtype==1||webtype==2)
    //    {
    //        [self SelectAllRequirements];
    //        webtype=0;
    //    }
    //    [_basicreqtable reloadData];
    
    //
    
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    if([elementName isEqualToString:@"EquipmentsubtypeselectResponse"])
    {
        _selectedsubtypearray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MaterialsubtypeselectResponse"])
    {
        _selectedsubtypearray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ThirdpartySubTypeselectResponse"])
    {
        _selectedsubtypearray=[[NSMutableArray alloc]init];
        
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
    if([elementName isEqualToString:@"EqId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SubtypeId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"description"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MultiequsubtypeselectResponse"])
    {
        
        _Subtypelistarray=[[NSMutableArray alloc]init];
        _subtypelistdictionary=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MultiMaterialsubtypeselectResponse"])
    {
        
        _Subtypelistarray=[[NSMutableArray alloc]init];
        _subtypelistdictionary=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MultiThirdpartysubtypeselectResponse"])
    {
        
        _Subtypelistarray=[[NSMutableArray alloc]init];
        _subtypelistdictionary=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"Abbrevation"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SkillNumber"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"EquipmentsubtypeinsertResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MaterialsubtypeinsertResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ThirdPartysubtypeinsertResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EquipmentsubtypeDeleteResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MaterialsubtypeDeleteResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ThirdPartysubtypeDeleteResponse"])
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
        
        recordResults=FALSE;
        
        _subtypemdl=[[Craftreqmtmdl alloc]init];
        _subtypemdl.Brentryid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"EqId"])
    {
        
        recordResults=FALSE;
        
        
         _subtypemdl.BRreqid=_soapResults;

        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SubtypeId"])
    {
        
        recordResults=FALSE;
        
        
        _subtypemdl.BRvalue=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"description"])
    {
        
        recordResults=FALSE;
        
        _subtypemdl.Brdescriptn=_soapResults;

        [_selectedsubtypearray addObject:_subtypemdl];
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SkillId"])
    {
        
        recordResults=FALSE;
        
        
        _skillstring=_soapResults;
        
        _soapResults = nil;
      
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        recordResults=FALSE;
        
        [_subtypelistdictionary setObject:_skillstring forKey:_soapResults];
          [_Subtypelistarray addObject:_soapResults];
        
        _soapResults = nil;
        
           }
    if([elementName isEqualToString:@"Abbrevation"])
    {
        
        recordResults=FALSE;
        
        
        
        
        _soapResults = nil;
      
    }
    if([elementName isEqualToString:@"SkillNumber"])
    {
        
        recordResults=FALSE;
        
        
        
        
        _soapResults = nil;

        
    }
    
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        if([_soapResults isEqualToString:@"deleted"]){
            if (_moduleid==27) {
                
            
            [self Equipmentsubtypeselect];
            }
            else if (_moduleid==28)
            {
                [self Materialsubtypeselect];
            }
            else if (_moduleid==34)
            {
                [self ThirdpartySubTypeselect];
            }
        }else{
            msgstring=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:msgstring delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        _soapResults = nil;
        
    }



}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if([alertView.message isEqualToString:msgstring]){
        if (_moduleid==27) {
            
        
        [self Equipmentsubtypeselect];
        }
        else if (_moduleid==28)
        {
              [self Materialsubtypeselect];
        }
        else if (_moduleid==34)
        {
            [self ThirdpartySubTypeselect];
        }
        
        [_subtypebutton setTitle:@"Select" forState:UIControlStateNormal];
        
        //_addview.hidden=YES;
    }
}


@end
