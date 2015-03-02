//
//  PriorityViewController.m
//  Prodektive
//
//  Created by Riya on 2/18/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "PrirityViewController.h"

@interface PrirityViewController ()

@end

@implementation PrirityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    self.addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
       // Do any additional setup after loading the view from its nib.
    _prioritytable.layer.borderWidth=3.0;
    _prioritytable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self ReadPriority];
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
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       return [_priorityarray count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if(tableView==_prioritytable){
            
            [[NSBundle mainBundle]loadNibNamed:@"PrirityCell" owner:self options:nil];
            cell=_prioritycell;
        }
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    _pmdl=(prioritymodel*)[_priorityarray objectAtIndex:indexPath.row];
    _prioritylbl=(UILabel*)[cell viewWithTag:1];
    _prioritylbl.text=_pmdl.priorityname;
    _prioritylevellbl=(UILabel*)[cell viewWithTag:2];
    _prioritylevellbl.text=_pmdl.level;

    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        deleteindex=indexPath.row;
        
            [self DestroyPriority];
            [_priorityarray removeObject:indexPath];
    }
    
}


- (IBAction)clsebtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addclsebtn:(id)sender {
  
    _addview.hidden=YES;
}
- (IBAction)updatebtn:(id)sender {
    if (optionidentifier==1) {
        if ([_prioritytxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Priority is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if ([_priorityleveltxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Priority Level is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {

        [self CreatePriority];
        _updatebtn.enabled=NO;
        }
    }
    else if(optionidentifier==2)
    {
        if ([_prioritytxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Priority is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if ([_priorityleveltxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Priority Level is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {

        [self Updatepriority];
        _updatebtn.enabled=NO;
        }
    }
    
    
}
- (IBAction)addbtn:(id)sender {
      _navitem.title=@"Create";
    optionidentifier=1;
    _addview.hidden=NO;
}
- (IBAction)editbtn:(id)sender {
      _navitem.title=@"Edit";
    optionidentifier=2;
    _addview.hidden=NO;
    button=(UIButton*)sender;
    CGPoint center=button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.prioritytable];
    NSIndexPath *textFieldIndexPath = [self.prioritytable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    _pmdl=(prioritymodel*)[_priorityarray objectAtIndex:btnindex];
    _prioritytxtfld.text=_pmdl.priorityname;
    _priorityleveltxtfld.text=_pmdl.level;

}

- (IBAction)Deletebtn:(id)sender {
    
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_prioritytable setEditing:NO animated:NO];
        [_prioritytable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_prioritytable setEditing:YES animated:YES];
        [_prioritytable reloadData];
        
    }

}
#pragma mark -webservices
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
-(void)CreatePriority
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreatePriority xmlns=\"http://ios.kontract360.com/\">\n"
                   "<priority>%@</priority>\n"
                   "<level>%d</level>\n"
                   "</CreatePriority>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_prioritytxtfld.text,[_priorityleveltxtfld.text integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreatePriority" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Updatepriority
{
    recordResults = FALSE;
    NSString *soapMessage;
    _pmdl=(prioritymodel*)[_priorityarray objectAtIndex:btnindex];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Updatepriority xmlns=\"http://ios.kontract360.com/\">\n"
                   "<priority>%@</priority>\n"
                   "<level>%d</level>\n"
                   "<EntryId>%d</EntryId>\n"
                   "</Updatepriority>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_prioritytxtfld.text,[_priorityleveltxtfld.text integerValue],[_pmdl.Pentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Updatepriority" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DestroyPriority
{
    recordResults = FALSE;
    NSString *soapMessage;
    _pmdl=(prioritymodel*)[_priorityarray objectAtIndex:deleteindex];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DestroyPriority xmlns=\"http://ios.kontract360.com/\">\n"
                    "<EntryId>%d</EntryId>\n"
                   "</DestroyPriority>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_pmdl.Pentryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/DestroyPriority" forHTTPHeaderField:@"Soapaction"];
    
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
    [_prioritytable reloadData];
}


#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"DestroyPriorityResponse"])
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

    if([elementName isEqualToString:@"CreatePriorityResponse"])
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

    if([elementName isEqualToString:@"ReadPriorityResponse"])
    {
        _priorityarray=[[NSMutableArray alloc]init];
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
        
        _pmdl=[[prioritymodel alloc]init];
        _pmdl.Pentryid=_soapResults;
        
        _soapResults=nil;
        
        
    }
    
    if([elementName isEqualToString:@"priority"])
    {
        recordResults = FALSE;
        
        
        _pmdl.priorityname=_soapResults;
        
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"level"])
    {
        recordResults = FALSE;
        
        
        _pmdl.level=_soapResults;
        [_priorityarray addObject:_pmdl];
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
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        _result=_soapResults;
        if ([_soapResults isEqualToString:@"Deleted"]) {
            
        }
        else
        {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        }
        
        [self ReadPriority];
        _soapResults=nil;
        
        
    }


    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.message isEqualToString:_result]) {
        _prioritytxtfld.text=@"";
        _priorityleveltxtfld.text=@"";
        _updatebtn.enabled=YES;
        if (optionidentifier==2) {
            _addview.hidden=YES;
            _updatebtn.enabled=YES;
        }
        [self ReadPriority];
    }
      if ([alertView.message isEqualToString:@"Invalid Priority Level"]) {
          
          _priorityleveltxtfld.text=@"";
      }
 }
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField==_priorityleveltxtfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_priorityleveltxtfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Priority Level" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
}

@end
