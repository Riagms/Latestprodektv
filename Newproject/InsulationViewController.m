//
//  InsulationViewController.m
//  Prodektive
//
//  Created by Riya on 3/4/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "InsulationViewController.h"

@interface InsulationViewController ()

@end

@implementation InsulationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.subtypeview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.Otherview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _subtitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _othertitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    self.subtable.layer.borderWidth=3.0;
    self.subtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.othertable.layer.borderWidth=3.0;
    self.othertable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;


}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _scroll.bounds=CGRectMake(0, 44, 1024, 724);
    [_scroll setContentSize:CGSizeMake(1024,800)];
    _Otherview.hidden=YES;
    _subtypeview.hidden=NO;
    _Insmdl=(InsulatnMdl *)[_insultnarray objectAtIndex:0];
    
    if (_btntype==2) {
        //_Insmdl=(InsulatnMdl *)[_insultnarray objectAtIndex:0];
        _unittxtfld.text=_Insmdl.unit;
        _subunittxtfld.text=_Insmdl.subunit;
        _equpmnttxtfld.text=_Insmdl.equipment;
        _phtxtfld.text=_Insmdl.projectheader;
        _linearbtnlbl.text=_Insmdl.linearfleet;

        [_typebtnlbl setTitle:_Insmdl.type forState:UIControlStateNormal];
         [_pipebtnlbl setTitle:_Insmdl.pipesize forState:UIControlStateNormal];
           [_layerbtnlbl setTitle:_Insmdl.layertype forState:UIControlStateNormal];
              [_inslutnbtnlbl setTitle:_Insmdl.insulatntype forState:UIControlStateNormal];
                [_phasebtnlbl setTitle:[_phasedict objectForKey:_Insmdl.phase] forState:UIControlStateNormal];
        [_sequbtnlbl setTitle:[_sequencedict objectForKey:_Insmdl.sequence] forState:UIControlStateNormal];
         [_streambtnlbl setTitle:[_streamdict objectForKey:_Insmdl.stream] forState:UIControlStateNormal];

        [self SelectAllPhases];
        [self GetMasterInsulationInsulationType];
        [self GetMasterInsulationLayerType];
        [self GetMasterInsulationPipeSize];
        [self GetMasterInsulationSteamTraceDDL];
        [self GetMasterInsulationType];
        [self JobsequenceSelect];
        
   }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-popover
-(void)createpopover{
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
        
        [self.popOverController presentPopoverFromRect:_typebtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    if(poptype==2){
        
        [self.popOverController presentPopoverFromRect:_pipebtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    
    if(poptype==3){
        
        [self.popOverController presentPopoverFromRect:_layerbtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    if(poptype==4){
        
        [self.popOverController presentPopoverFromRect:_inslutnbtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }

    if(poptype==5){
        
        [self.popOverController presentPopoverFromRect:_phasebtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    
    if(poptype==6){
        
        [self.popOverController presentPopoverFromRect:_sequbtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    

    if(poptype==7){
        
        [self.popOverController presentPopoverFromRect:_streambtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
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
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        if (poptype==1) {
               return [_Typedict count];
        }
       
        if (poptype==2) {
            return [_pipedict count];
        }
        if (poptype==3) {
            return [_layerdict count];
        }
        if (poptype==4) {
            return [_insultndict count];
        }
        if (poptype==7) {
            return [_streamdict count];
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
        
       
    }
     cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
     if (tableView==_popOverTableView) {
     if (poptype==1) {
         NSArray*array=[_Typedict allKeys];
         
         cell.textLabel.text=[array objectAtIndex:indexPath.row];
     }
         if (poptype==2) {
             NSArray*array=[_pipedict allKeys];
             
             cell.textLabel.text=[array objectAtIndex:indexPath.row];
         }
         if (poptype==3) {
             NSArray*array=[_layerdict allKeys];
             
             cell.textLabel.text=[array objectAtIndex:indexPath.row];
         }
         if (poptype==4) {
             NSArray*array=[_insultndict allKeys];
             
             cell.textLabel.text=[array objectAtIndex:indexPath.row];
         }
         if (poptype==5) {
             NSArray*array=[_phasedict allKeys];
             
          cell.textLabel.text=[array objectAtIndex:indexPath.row];
         }
         if (poptype==6) {
             NSArray*array=[_sequencedict allKeys];
             
            cell.textLabel.text=[array objectAtIndex:indexPath.row];
         }

         if (poptype==7) {
             NSArray*array=[_streamdict allKeys];
             
             cell.textLabel.text=[array objectAtIndex:indexPath.row];
         }
         

     }
    
    
    
    
    return cell;
}
#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popOverTableView) {
        
        if (poptype==1) {
            NSArray*array=[_Typedict allKeys];
            
            //cell.textLabel.text=[array objectAtIndex:indexPath.row];
            [_typebtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        }
        if (poptype==2) {
            NSArray*array=[_pipedict allKeys];
            
                    [_pipebtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];

        }
        if (poptype==3) {
            NSArray*array=[_layerdict allKeys];
            
             [_layerbtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        }
        if (poptype==4) {
            NSArray*array=[_insultndict allKeys];
            
            [_inslutnbtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        }
        if (poptype==5) {
            NSArray*array=[_phasedict allKeys];
            
            [_phasebtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        }
        if (poptype==6) {
            NSArray*array=[_sequencedict allKeys];
            
            [_sequbtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        }

        if (poptype==7) {
            NSArray*array=[_streamdict allKeys];
            
             [_streambtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        }

    }
}

#pragma mark- WebService
-(void)ReadInsulation
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadInsulation xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</ReadInsulation>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadInsulation" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GetMasterInsulationType
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetMasterInsulationType xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</GetMasterInsulationType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetMasterInsulationType" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GetMasterInsulationPipeSize
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetMasterInsulationPipeSize xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</GetMasterInsulationPipeSize>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetMasterInsulationPipeSize" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GetMasterInsulationLayerType
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetMasterInsulationLayerType xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</GetMasterInsulationLayerType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetMasterInsulationLayerType" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GetMasterInsulationInsulationType
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetMasterInsulationInsulationType xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</GetMasterInsulationInsulationType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetMasterInsulationInsulationType" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GetMasterInsulationSteamTraceDDL
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetMasterInsulationSteamTraceDDL xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</GetMasterInsulationSteamTraceDDL>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetMasterInsulationSteamTraceDDL" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllPhases{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllPhases xmlns=\"http://ios.kontract360.com/\">\n"
               
                   "</SelectAllPhases>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllPhases" forHTTPHeaderField:@"Soapaction"];
    
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
                   "</soap:Envelope>\n",2];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
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
-(void)CreateInsulation{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateInsulation xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<plan>%@</plan>\n"
                   "<workO>%@</workO>\n"
                   "<plant>%@</plant>\n"
                   "<equipment>%@</equipment>\n"
                   "<projectHead>%@</projectHead>\n"
                   "<subUnit>%@</subUnit>\n"
                   "<Type>%d</Type>\n"
                   "<pageSize>%d</pageSize>\n"
                   "<layerSize>%d</layerSize>\n"
                   "<insulatnType>%d</insulatnType>\n"
                   "<legFeet>%d</legFeet>\n"
                   "<phaseIDz>%d</phaseIDz>\n"
                   "<seqIDz>%d</seqIDz>\n"
                   "<steamTrace>%d</steamTrace>\n"
                   "</CreateInsulation>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"",_Insmdl.plan,_Insmdl.workorder,_unittxtfld.text,_equpmnttxtfld.text,_phtxtfld.text,_subunittxtfld.text,[[_Typedict objectForKey:_typebtnlbl.titleLabel.text]integerValue ],[[_pipedict objectForKey:_pipebtnlbl.titleLabel.text]integerValue ],[[_layerdict objectForKey:_layerbtnlbl.titleLabel.text]integerValue ],[[_insultndict objectForKey:_inslutnbtnlbl.titleLabel.text]integerValue ],[_linearbtnlbl.text integerValue],[[_phasedict objectForKey:_phasebtnlbl.titleLabel.text]integerValue],[[_sequencedict objectForKey:_sequbtnlbl.titleLabel.text]integerValue],[[_streamdict objectForKey:_streambtnlbl.titleLabel.text]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreateInsulation" forHTTPHeaderField:@"Soapaction"];
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
-(void)Updateinsulation{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateInsulation xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<plan>%@</plan>\n"
                   "<workO>%@</workO>\n"
                   "<plant>%@</plant>\n"
                   "<equipment>%@</equipment>\n"
                   "<projectHead>%@</projectHead>\n"
                   "<subUnit>%@</subUnit>\n"
                   "<Type>%d</Type>\n"
                   "<pageSize>%d</pageSize>\n"
                   "<layerSize>%d</layerSize>\n"
                   "<insulatnType>%d</insulatnType>\n"
                   "<legFeet>%d</legFeet>\n"
                   "<phaseIDz>%d</phaseIDz>\n"
                   "<seqIDz>%d</seqIDz>\n"
                   "<steamTrace>%d</steamTrace>\n"
                   "</CreateInsulation>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Insmdl.entryid,_Insmdl.plan,_Insmdl.workorder,_unittxtfld.text,_equpmnttxtfld.text,_phtxtfld.text,_subunittxtfld.text,[[_Typedict objectForKey:_typebtnlbl.titleLabel.text]integerValue ],[[_pipedict objectForKey:_pipebtnlbl.titleLabel.text]integerValue ],[[_layerdict objectForKey:_layerbtnlbl.titleLabel.text]integerValue ],[[_insultndict objectForKey:_inslutnbtnlbl.titleLabel.text]integerValue ],[_linearbtnlbl.text integerValue],[[_phasedict objectForKey:_phasebtnlbl.titleLabel.text]integerValue],[[_sequencedict objectForKey:_sequbtnlbl.titleLabel.text]integerValue],[[_streamdict objectForKey:_streambtnlbl.titleLabel.text]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreateInsulation" forHTTPHeaderField:@"Soapaction"];
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
    [_popOverTableView reloadData];

    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    if([elementName isEqualToString:@"GetMasterInsulationTypeResponse"])
    {
        _Typedict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"TypeName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"GetMasterInsulationPipeSizeResponse"])
    {
        _pipedict=[[NSMutableDictionary alloc]init];

        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PipeName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"GetMasterInsulationLayerTypeResponse"])
    {
        _layerdict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LayerName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"GetMasterInsulationInsulationTypeResponse"])
    {
        _insultndict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InsulationName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"GetMasterInsulationSteamTraceDDLResponse"])
    {
        _streamdict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InsulationName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllPhasesResponse"])
    {
        _phasedict=[[NSMutableDictionary alloc]init];
        
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
    if([elementName isEqualToString:@"GetMasterInsulationSteamTraceDDLResponse"])
    {
        _streamdict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TraceName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ServiceJobSequenceselectResponse"])
    {
        _sequencedict=[[NSMutableDictionary alloc]init];
        
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
    if([elementName isEqualToString:@"Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }
    if([elementName isEqualToString:@"CreateInsulationResponse"])
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
    if([elementName isEqualToString:@"id"])
    {
        
        recordResults=FALSE;
        typestrg=_soapResults;
        
       
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        recordResults=FALSE;
        typestrg=_soapResults;
        
        
        
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"TypeName"])
    {
        
        recordResults=FALSE;
        [_Typedict setObject:typestrg forKey:_soapResults];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"PipeName"])
    {
        
        recordResults=FALSE;
        [_pipedict setObject:typestrg forKey:_soapResults];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"LayerName"])
    {
        
        recordResults=FALSE;
        [_layerdict setObject:typestrg forKey:_soapResults];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"InsulationName"])
    {
        
        recordResults=FALSE;
        [_insultndict setObject:typestrg forKey:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TraceName"])
    {
        
        recordResults=FALSE;
        [_streamdict setObject:typestrg forKey:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PhaseName"])
    {
        
        recordResults=FALSE;
        [_phasedict setObject:typestrg forKey:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobSequenceId"])
    {
        
        recordResults=FALSE;
        typestrg=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobTask"])
    {
        
        recordResults=FALSE;
        [_sequencedict setObject:typestrg forKey:_soapResults];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"records"])
    {
        
       recordResults=FALSE;
        msgstrg=_soapResults;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _soapResults = nil;
    }

}

- (IBAction)clsebtn:(id)sender {
    
  
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
- (IBAction)subtypebtn:(id)sender {
    
    _Otherview.hidden=YES;
    _subtypeview.hidden=NO;
     _subtypebtnlbl.tintColor=[UIColor whiteColor];
     _otherbtnlbl.tintColor=[UIColor blackColor];
   
    
}
- (IBAction)otherbtn:(id)sender {
    _Otherview.hidden=NO;
    _subtypeview.hidden=YES;
     _otherbtnlbl.tintColor=[UIColor whiteColor];
    _subtypebtnlbl.tintColor=[UIColor blackColor];

   
    
}
- (IBAction)typebtn:(id)sender {
    poptype=1;
    [self createpopover];
    [self GetMasterInsulationType];
}

- (IBAction)pipebtn:(id)sender {
    poptype=2;
    [self createpopover];
    [self GetMasterInsulationPipeSize];
}

- (IBAction)layerbtn:(id)sender {
    poptype=3;
    [self createpopover];
    [self GetMasterInsulationLayerType];
}

- (IBAction)insultnbtn:(id)sender {
    poptype=4;
    [self createpopover];
    [self GetMasterInsulationInsulationType];


}

- (IBAction)phasebtn:(id)sender {
     poptype=5;
     [self createpopover];
    [self SelectAllPhases];
}

- (IBAction)sequencebtn:(id)sender {
     poptype=6;
     [self createpopover];
    [self JobsequenceSelect];
}

- (IBAction)streambtn:(id)sender {
    poptype=7;
    [self createpopover];
    [self GetMasterInsulationSteamTraceDDL];
}

- (IBAction)updatebtn:(id)sender {
    if (_btntype==1) {
        [self CreateInsulation];
    }
    else   if (_btntype==2) {
         [self Updateinsulation];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.message isEqualToString:msgstrg]) {
        _unittxtfld.text=@"";
        _subunittxtfld.text=@"";
        _equpmnttxtfld.text=@"";
        _phtxtfld.text=@"";
        _linearbtnlbl.text=@"";
        
        [_typebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_pipebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_layerbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_inslutnbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_phasebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_sequbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_streambtnlbl setTitle:@"Select" forState:UIControlStateNormal];

    }
}

@end
