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
      self.heatview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.heataddview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.subeditview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    _subtitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _othertitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
     _heattitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
      _wraptitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    
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
    _heatview.hidden=YES;
    _Insmdl=(InsulatnMdl *)[_insultnarray objectAtIndex:0];
    
    if (_btntype==2) {
        //_Insmdl=(InsulatnMdl *)[_insultnarray objectAtIndex:0];
    Insutnid=_Insmdl.entryid;
        _unittxtfld.text=_Insmdl.unit;
        _subunittxtfld.text=_Insmdl.subunit;
        _equpmnttxtfld.text=_Insmdl.equipment;
        _phtxtfld.text=_Insmdl.projectheader;
        _linearbtnlbl.text=_Insmdl.linearfleet;

        [_typebtnlbl setTitle:_Insmdl.type forState:UIControlStateNormal];
         [_pipebtnlbl setTitle:_Insmdl.pipesize forState:UIControlStateNormal];
           [_layerbtnlbl setTitle:_Insmdl.layertype forState:UIControlStateNormal];
              [_inslutnbtnlbl setTitle:_Insmdl.insulatntype forState:UIControlStateNormal];
                [_phasebtnlbl setTitle:_Insmdl.phase forState:UIControlStateNormal];
        [_sequbtnlbl setTitle:_Insmdl.sequence forState:UIControlStateNormal];
         [_streambtnlbl setTitle:_Insmdl.stream forState:UIControlStateNormal];

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
    
    if(poptype==8){
        
        [self.popOverController presentPopoverFromRect:_modebtnlbl.frame
                                                inView:self.heataddview
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    if(poptype==9){
        
        [self.popOverController presentPopoverFromRect:_heatsubtypebtnlbl.frame
                                                inView:self.heataddview
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    if(poptype==10){
        
        [self.popOverController presentPopoverFromRect:_wrapsizebtn.frame
                                                inView:self.heataddview
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
        if (poptype==8) {
            return [_modedict count];
        }

        if (poptype==9) {
            return [_subtypedict count];
        }
        if (poptype==10) {
            return [_sizedict count];
        }
       


    }
    
    else if(tableView==_subtable||tableView==_othertable){
        return [_SubtypeArray count];
    }
    else if(tableView==_heattable){
        return [_HeatArray count];
    }
    return YES;
        
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
   // if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        
        if(tableView==_subtable){
             [[NSBundle mainBundle]loadNibNamed:@"Isubcellview" owner:self options:nil];
            
            
            cell=_subcell;
        }
        if(tableView==_othertable){
            [[NSBundle mainBundle]loadNibNamed:@"IothercellView" owner:self options:nil];
            
            
            cell=_othercell;
        }
        if(tableView==_heattable){
            if(barbtntype==5){
            [[NSBundle mainBundle]loadNibNamed:@"HeatCellView" owner:self options:nil];
            
            
            cell=_heatcell;
            }
           else if(barbtntype==6){
                [[NSBundle mainBundle]loadNibNamed:@"wrapcellview" owner:self options:nil];
                
                
                cell=_wcell;
            }

            
       // }
        

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
         if (poptype==8) {
             NSArray*array=[_modedict allKeys];
             
             cell.textLabel.text=[array objectAtIndex:indexPath.row];
         }

         if (poptype==9) {
             NSArray*array=[_subtypedict allKeys];
             
             cell.textLabel.text=[array objectAtIndex:indexPath.row];
         }
         if (poptype==10) {
             NSArray*array=[_sizedict allKeys];
             
             cell.textLabel.text=[array objectAtIndex:indexPath.row];
         }


     }
     if(tableView==_subtable){
         
         Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:indexPath.row];
         //_subcheckbtnlbl.tag=indexPath.row;
          _subcheckbtnlbl=(UIButton *)[cell viewWithTag:3];
         if([submdl.ischeck isEqualToString:@"true"]) {
             
             [_subcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
         }
         else{
             [_subcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
         }
         

         _sublbl=(UILabel *)[cell viewWithTag:1];
         _sublbl.text=submdl.subdesptn;
         _quntylbl=(UILabel *)[cell viewWithTag:2];
         _quntylbl.text=submdl.quantity;
            //_checkbtn.tag=indexPath.row;
         
    
   
}
    
    if(tableView==_othertable){
           Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:indexPath.row];
        _othercheckbtnlbl=(UIButton *)[cell viewWithTag:2];
        if([submdl.ischeck isEqualToString:@"true"]) {
            
            [_othercheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else{
            [_othercheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }

        _otherlbl=(UILabel *)[cell viewWithTag:1];
        _otherlbl.text=submdl.subdesptn;

    }
      if(tableView==_heattable){
           if(barbtntype==5){
          Insubtypemdl *submdl=(Insubtypemdl *)[_HeatArray objectAtIndex:indexPath.row];

          _modelbl=(UILabel *)[cell viewWithTag:1];
          _modelbl.text=submdl.mode;
          _heatdescptnlbl=(UILabel *)[cell viewWithTag:2];
          _heatdescptnlbl.text=submdl.subdesptn;
          _heatquantylbl=(UILabel *)[cell viewWithTag:3];
          _heatquantylbl.text=submdl.quantity;
      }
   else if(barbtntype==6){
        Insubtypemdl *submdl=(Insubtypemdl *)[_HeatArray objectAtIndex:indexPath.row];
        _wsublbl=(UILabel *)[cell viewWithTag:1];
        _wsublbl.text=submdl.subdesptn;
        _wmodelbl=(UILabel *)[cell viewWithTag:2];
        _wmodelbl.text=submdl.mode;
      
        _wqtylbl=(UILabel *)[cell viewWithTag:3];
        _wqtylbl.text=submdl.quantity;
        _wsizelbl=(UILabel *)[cell viewWithTag:4];
        _wsizelbl.text=submdl.size;
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
        
        if (poptype==8) {
            NSArray*array=[_modedict allKeys];
            
               [_modebtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        }
        
        if (poptype==9) {
            NSArray*array=[_subtypedict allKeys];
            
              [_heatsubtypebtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        }
        if (poptype==10) {
            NSArray*array=[_sizedict allKeys];
            
              [_wrapsizebtn setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
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
-(void)ReadInsulationSubType{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadInsulationSubType xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "</ReadInsulationSubType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadInsulationSubType" forHTTPHeaderField:@"Soapaction"];
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
-(void)UpdateInsulationSubType{
    
    webtype=1;
    webbingtype=1;
    recordResults = FALSE;
    Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:subbtnIndex];
    NSInteger qunty;
    if (subcheck==1) {
        qunty=1;
    }
    else{
        qunty=0;
        
    }
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateInsulationSubType xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<Entry>%d</Entry>\n"
                   "<Quan>%d</Quan>\n"
                   "</UpdateInsulationSubType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid,subcheck,[submdl.entryid integerValue],qunty];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateInsulationSubType" forHTTPHeaderField:@"Soapaction"];
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
-(void)NewUpdateInsulationSubType{
    webbingtype=2;
    webtype=1;
    recordResults = FALSE;
    Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:subbtnIndex];
    NSInteger ischeck;
    if ([submdl.ischeck isEqualToString:@"true"]) {
        ischeck=1;
    }
    else{
        ischeck=0;
    }

          NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateInsulationSubType xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<Entry>%d</Entry>\n"
                   "<Quan>%d</Quan>\n"
                   "</UpdateInsulationSubType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid,ischeck,[submdl.entryid integerValue],[_quntytxtfld.text integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateInsulationSubType" forHTTPHeaderField:@"Soapaction"];
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

-(void)ReadInsulationOtherFactorDetailsss{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadInsulationOtherFactorDetailsss xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<InsuTypeID>%@</InsuTypeID>\n"
                   "<PiVe>%@</PiVe>\n"
                   "</ReadInsulationOtherFactorDetailsss>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid,[_insultndict objectForKey:_inslutnbtnlbl.titleLabel.text],[_Typedict objectForKey:_typebtnlbl.titleLabel.text]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadInsulationOtherFactorDetailsss" forHTTPHeaderField:@"Soapaction"];
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
-(void)UpdateInsulationOtherFactSelect{
    webtype=2;
    webbingtype=1;
    recordResults = FALSE;
    Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:otherbtnindex];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateInsulationOtherFactSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "<isPre>%d</isPre>\n"
                   "<InsuID>%@</InsuID>\n"
                   "</UpdateInsulationOtherFactSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[submdl.entryid integerValue],subcheck,Insutnid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateInsulationOtherFactSelect" forHTTPHeaderField:@"Soapaction"];
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
-(void)ReadInsulationInspectionPot{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadInsulationInspectionPot xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "</ReadInsulationInspectionPot>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadInsulationInspectionPot" forHTTPHeaderField:@"Soapaction"];
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
-(void)UpdateInsulationInspection{
    webtype=3;
    webbingtype=1;
    recordResults = FALSE;
     Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:subbtnIndex];
    NSInteger qunty;
    if (subcheck==1) {
        qunty=1;
    }
    else{
        qunty=0;
        
    }

    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateInsulationInspection xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<Entry_id>%d</Entry_id>\n"
                   "<quantity>%d</quantity>\n"
                   "<InsulationID>%d</InsulationID>\n"
                   "<description>%@</description>\n"
                   "</UpdateInsulationInspection>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid,subcheck,[submdl.entryid integerValue],qunty,[[_insultndict objectForKey:_inslutnbtnlbl.titleLabel.text]integerValue],submdl.subdesptn];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateInsulationInspection" forHTTPHeaderField:@"Soapaction"];
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
-(void)NewUpdateInsulationInspection{
    webtype=3;
    webbingtype=2;
    recordResults = FALSE;
    Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:subbtnIndex];
    
    NSInteger ischeck;
    if ([submdl.ischeck isEqualToString:@"true"]) {
        ischeck=1;
        }
    else{
        ischeck=0;
    }
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateInsulationInspection xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<Entry_id>%d</Entry_id>\n"
                   "<quantity>%d</quantity>\n"
                   "<InsulationID>%d</InsulationID>\n"
                   "<description>%@</description>\n"
                   "</UpdateInsulationInspection>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid,ischeck,[submdl.entryid integerValue],[_quntytxtfld.text integerValue],[[_insultndict objectForKey:_inslutnbtnlbl.titleLabel.text]integerValue],submdl.subdesptn];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateInsulationInspection" forHTTPHeaderField:@"Soapaction"];
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
-(void)ReadInsulationPersonalProtectDetailsss{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadInsulationPersonalProtectDetailsss xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "</ReadInsulationPersonalProtectDetailsss>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadInsulationPersonalProtectDetailsss" forHTTPHeaderField:@"Soapaction"];
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
-(void)UpdateInsulationPersonalProtectSelect{
    webtype=4;
    webbingtype=1;
    recordResults = FALSE;
    Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:subbtnIndex];
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateInsulationPersonalProtectSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "<isPre>%d</isPre>\n"
                   "<InsuID>%@</InsuID>\n"
                   "</UpdateInsulationPersonalProtectSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[submdl.entryid integerValue],subcheck,Insutnid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateInsulationPersonalProtectSelect" forHTTPHeaderField:@"Soapaction"];
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
-(void)UpdateInsulationPersonalProtect{
    webtype=4;
    webbingtype=2;
    recordResults = FALSE;
    Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:subbtnIndex];
    NSInteger ischeck;
    if ([submdl.ischeck isEqualToString:@"true"]) {
        ischeck=1;
    }
    else{
        ischeck=0;
    }

    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateInsulationPersonalProtect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<Entry>%d</Entry>\n"
                   "<Quan>%d</Quan>\n"
                   "</UpdateInsulationPersonalProtect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid,ischeck,[submdl.entryid integerValue],[_quntytxtfld.text integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateInsulationPersonalProtect" forHTTPHeaderField:@"Soapaction"];
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
-(void)ReadInsulationHeatTransfer{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadInsulationHeatTransfer xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "</ReadInsulationHeatTransfer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadInsulationHeatTransfer" forHTTPHeaderField:@"Soapaction"];
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
-(void)CreateInsulationHeatTransfer{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateInsulationHeatTransfer xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<Entry_id>%d</Entry_id>\n"
                   "<quantity>%d</quantity>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<removal>%d</removal>\n"
                   "<Mode1>%d</Mode1>\n"
                   "<SubTypeD>%d</SubTypeD>\n"
                   "</CreateInsulationHeatTransfer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid,0,[_heatquntytxtfld.text integerValue],0,removecheck,[[_modedict objectForKey:_modebtnlbl.titleLabel.text]integerValue],[[_subtypedict objectForKey:_heatsubtypebtnlbl.titleLabel.text]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreateInsulationHeatTransfer" forHTTPHeaderField:@"Soapaction"];
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
-(void)UpdateInsulationHeatTransfer{
    
    recordResults = FALSE;
     Insubtypemdl *submdl=(Insubtypemdl *)[_HeatArray objectAtIndex:newbtnindx];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateInsulationHeatTransfer xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<Entry_id>%d</Entry_id>\n"
                   "<quantity>%d</quantity>\n"
                   "<removal>%d</removal>\n"
                   "<Mode1>%d</Mode1>\n"
                   "<SubTypeD>%d</SubTypeD>\n"
                   "</UpdateInsulationHeatTransfer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid,1,[submdl.entryid integerValue],[_heatquntytxtfld.text integerValue],removecheck,[[_modedict objectForKey:_modebtnlbl.titleLabel.text]integerValue],[[_subtypedict objectForKey:_heatsubtypebtnlbl.titleLabel.text]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateInsulationHeatTransfer" forHTTPHeaderField:@"Soapaction"];
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
-(void)ReadInsulationWrapping{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadInsulationWrapping xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "</ReadInsulationWrapping>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid];
    
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadInsulationWrapping" forHTTPHeaderField:@"Soapaction"];
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
-(void)GetSize{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetSize xmlns=\"http://ios.kontract360.com/\">\n"
                  
                   "</GetSize>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetSize" forHTTPHeaderField:@"Soapaction"];
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
-(void)GetMode{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetMode xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</GetMode>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetMode" forHTTPHeaderField:@"Soapaction"];
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
-(void)GetSubtype{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetSubtype xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</GetSubtype>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetSubtype" forHTTPHeaderField:@"Soapaction"];
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
-(void)CreateInsulationWrapping{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateInsulationWrapping xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<Entry_id>%d</Entry_id>\n"
                   "<quantity>%d</quantity>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<removal>%d</removal>\n"
                   "<SizeD>%d</SizeD>\n"
                   "<SubTypeD>%d</SubTypeD>\n"
                   "<Mode1>%d</Mode1>\n"
                   "</CreateInsulationWrapping>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid,0,[_heatquntytxtfld.text integerValue],0,removecheck,[[_sizedict objectForKey:_wrapsizebtn.titleLabel.text]integerValue],[[_subtypedict objectForKey:_heatsubtypebtnlbl.titleLabel.text]integerValue],[[_modedict objectForKey:_modebtnlbl.titleLabel.text]integerValue]];
    
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreateInsulationWrapping" forHTTPHeaderField:@"Soapaction"];
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
-(void)UpdateInsulationWrapping{
    
    recordResults = FALSE;
    Insubtypemdl *submdl=(Insubtypemdl *)[_HeatArray objectAtIndex:newbtnindx];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateInsulationWrapping xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<quantity>%d</quantity>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<removal>%d</removal>\n"
                   "<Mode1>%d</Mode1>\n"
                   "<SizeD>%d</SizeD>\n"
                   "<SubTypeD>%d</SubTypeD>\n"
                   "<Entry_id>%d</Entry_id>\n"
                   "</UpdateInsulationWrapping>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Insutnid,[_heatquntytxtfld.text integerValue],1,removecheck,[[_modedict objectForKey:_modebtnlbl.titleLabel.text]integerValue],[[_sizedict objectForKey:_wrapsizebtn.titleLabel.text]integerValue],[[_subtypedict objectForKey:_heatsubtypebtnlbl.titleLabel.text]integerValue],[submdl.entryid integerValue]];
    
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateInsulationWrapping" forHTTPHeaderField:@"Soapaction"];
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
    
    if (webtype==1) {
        [self ReadInsulationSubType];
        webtype=0;

    }
    else if(webtype==2){
        [self ReadInsulationOtherFactorDetailsss];
        webtype=0;
    }
    else if(webtype==3){
        [self ReadInsulationInspectionPot];
        webtype=0;
    }
    else if(webtype==4){
        [self ReadInsulationPersonalProtectDetailsss];
        webtype=0;
    }

   
      [_subtable reloadData];
    [_othertable reloadData];
    [_heattable reloadData];

    
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
    if([elementName isEqualToString:@"ReadInsulationSubTypeResponse"])
    {
        _SubtypeArray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Entry"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Dec"])
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
    if([elementName isEqualToString:@"Quan"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InsulationID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"subID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"records1"]){
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ReadInsulationOtherFactorDetailsssResponse"]){
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ReadInsulationOtherFactorDetailsssResponse"]){
         _SubtypeArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ReadInsulationInspectionPotResponse"]){
        _SubtypeArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Entry_id"]){
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"description"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"MasterRate"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Factor"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"WrapID"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"quantity"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ReadInsulationPersonalProtectDetailsssResponse"]){
          _SubtypeArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ProteID"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ReadInsulationHeatTransferResponse"]){
        _HeatArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SubType"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"Mode"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Mode1"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SubTypeD"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"rate"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"removal"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ReadInsulationWrappingResponse"]){
         _HeatArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SizeD"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Size"]){
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    

    if([elementName isEqualToString:@"GetModeResponse"]){
        _modedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Mode"]){
               if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
       if([elementName isEqualToString:@"GetSubtypeResponse"]){
        _subtypedict=[[NSMutableDictionary alloc]init];
           _revsubtypedict=[[NSMutableDictionary alloc]init];
           
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"Subtype1"]){
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
        if([elementName isEqualToString:@"GetSizeResponse"]){
            _sizedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Size1"]){
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Id1"]){
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
//    if([elementName isEqualToString:@"Mode"]){
//        recordResults=FALSE;
//        [_modedict setObject:typestrg forKey:_soapResults];
//        _soapResults = nil;
//        
//    }
    if([elementName isEqualToString:@"Subtype1"]){
        recordResults=FALSE;
        [_subtypedict setObject:typestrg forKey:_soapResults];
        [_revsubtypedict setObject:_soapResults forKey:typestrg];
        _soapResults = nil;
        
    }

       if([elementName isEqualToString:@"Size1"]){
           recordResults=FALSE;
             [_sizedict setObject:typestrg forKey:_soapResults];
            _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Id1"]){
        recordResults=FALSE;
        typestrg=_soapResults;
        _soapResults = nil;
        
    }

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
        if([_soapResults isEqualToString:@"Updated Successfully"]){
            
            if (barbtntype==5||barbtntype==6) {
                msgstrg=_soapResults;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                //[self ReadInsulationSubType];
            }
            
            if (barbtntype==1||barbtntype==2||barbtntype==3||barbtntype==4) {
                if (webbingtype==1) {
                    
                    if (webtype==1) {
                        
                        [self ReadInsulationSubType];
                        webtype=0;
                        
                    }
                    else if(webtype==2){
                        [self ReadInsulationOtherFactorDetailsss];
                        webtype=0;
                    }
                    else if(webtype==3){
                        [self ReadInsulationInspectionPot];
                        webtype=0;
                    }
                    else if(webtype==4){
                        [self ReadInsulationPersonalProtectDetailsss];
                        webtype=0;
                    }

                    
                }
                else{
                msgstrg=_soapResults;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                //[self ReadInsulationSubType];
                    
            }


        }
        }
      else  if([_soapResults isEqualToString:@"Inserted Successfully"]){
            msgstrg=_soapResults;
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
       
            
        }

        else{
       Insutnid=_soapResults;
        msgstrg=@"Inserted Successfully";
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
         
            
        }
        
              _soapResults = nil;
    }

    
    if([elementName isEqualToString:@"Entry"])
    {
        _Subtypemdl=[[Insubtypemdl alloc]init];
        recordResults=FALSE;
        _Subtypemdl.entryid=_soapResults;
       _soapResults = nil;
    }
    if([elementName isEqualToString:@"Dec"])
    {
        
        recordResults=FALSE;
         _Subtypemdl.subdesptn=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"isCheck"])
    {
        
        recordResults=FALSE;
        _Subtypemdl.ischeck=_soapResults;
//         if([_soapResults isEqualToString:@"true"]) {
//               _Subtypemdl.ischeck=@"1";
//         }
//         else{
//             _Subtypemdl.ischeck=@"0";
//             
//             
//         }
      
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Quan"])
    {
        
        recordResults=FALSE;
         _Subtypemdl.quantity=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"InsulationID"])
    {
        recordResults=FALSE;
         _Subtypemdl.insultnid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"subID"])
    {
        
        recordResults=FALSE;
         _Subtypemdl.subid=_soapResults;
        [_SubtypeArray addObject:_Subtypemdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ProteID"]){
    
        recordResults=FALSE;
       _Subtypemdl.subid=_soapResults;
       [_SubtypeArray addObject:_Subtypemdl];
       _soapResults = nil;

     }
     if([elementName isEqualToString:@"SizeD"]){
         recordResults=FALSE;
         _Subtypemdl.sizeid=_soapResults;
         _soapResults = nil;

         
     }
    if([elementName isEqualToString:@"Size"]){
        
        recordResults=FALSE;
        _Subtypemdl.size=_soapResults;
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"records1"]){
            recordResults=FALSE;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
                 _soapResults = nil;
    }
    if([elementName isEqualToString:@"Entry_id"]){
        
        _Subtypemdl=[[Insubtypemdl alloc]init];
        recordResults=FALSE;
        _Subtypemdl.entryid=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"description"]){
        
        recordResults=FALSE;
          _Subtypemdl.subdesptn=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"MasterRate"]){
        recordResults=FALSE;
          _Subtypemdl.masterrate=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Factor"]){
        
        recordResults=FALSE;
          _Subtypemdl.factor=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"WrapID"]){
        
        recordResults=FALSE;
          _Subtypemdl.wrapid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"quantity"]){
        
        recordResults=FALSE;
          _Subtypemdl.quantity=_soapResults;
        [_SubtypeArray addObject:_Subtypemdl];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"SubType"]){
        
        recordResults=FALSE;
        _Subtypemdl.subdesptn=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"Mode"]){
        
        recordResults=FALSE;
        _Subtypemdl.mode=_soapResults;
        if (![typestrg isEqualToString:@""]) {
               [_modedict setObject:typestrg forKey:_soapResults];
        }
        
        
      
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Mode1"]){
        
        recordResults=FALSE;
        _Subtypemdl.mode1=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SubTypeD"]){
        
        recordResults=FALSE;
        _Subtypemdl.subid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"rate"]){
        
        recordResults=FALSE;
        _Subtypemdl.rate=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"removal"]){
        
        recordResults=FALSE;
        _Subtypemdl.removal=_soapResults;
        [_HeatArray addObject:_Subtypemdl];
        _soapResults = nil;
        
    }

}

#pragma mark-Bar button
- (IBAction)subtypebtn:(id)sender {
    barbtntype=1;
    [self ReadInsulationSubType];
    if ([_typebtnlbl.titleLabel.text isEqualToString:@"Pipe"]) {
        
        _personalbtnlbl.enabled=NO;
        
    }
    else{
        
        _personalbtnlbl.enabled=YES;
    }

    _Otherview.hidden=YES;
    _subtypeview.hidden=NO;
       _heatview.hidden=YES;
    _subtypebtnlbl.tintColor=[UIColor whiteColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    _insptnbtnlbl.tintColor=[UIColor blackColor];
      _heatbtnlbl.tintColor=[UIColor blackColor];
      _wrapbtnlbl.tintColor=[UIColor blackColor];
     _personalbtnlbl.tintColor=[UIColor blackColor];
    _subtypetitlelbl.text=@"Sub Type";
    _lineartitlelbl.text=@"Linear Fleet";
    
    
}
- (IBAction)otherbtn:(id)sender {
    barbtntype=2;
    if ([_typebtnlbl.titleLabel.text isEqualToString:@"Pipe"]) {
        
        _personalbtnlbl.enabled=NO;
        
    }
    else{
        
        _personalbtnlbl.enabled=YES;
    }

    _Otherview.hidden=NO;
    _subtypeview.hidden=YES;
       _heatview.hidden=YES;
    _otherbtnlbl.tintColor=[UIColor whiteColor];
    _subtypebtnlbl.tintColor=[UIColor blackColor];
    _insptnbtnlbl.tintColor=[UIColor blackColor];
      _heatbtnlbl.tintColor=[UIColor blackColor];
      _wrapbtnlbl.tintColor=[UIColor blackColor];
     _personalbtnlbl.tintColor=[UIColor blackColor];
    [self ReadInsulationOtherFactorDetailsss];
    
    
    
}
- (IBAction)Insptnportbtn:(id)sender {
    barbtntype=3;
    if ([_typebtnlbl.titleLabel.text isEqualToString:@"Pipe"]) {
        
        _personalbtnlbl.enabled=NO;
        
    }
    else{
        
        _personalbtnlbl.enabled=YES;
    }

    _Otherview.hidden=YES;
    _subtypeview.hidden=NO;
       _heatview.hidden=YES;
    _subtypetitlelbl.text=@"Inspection Port";
    _lineartitlelbl.text=@"Quantity";
    _subtypebtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    _insptnbtnlbl.tintColor=[UIColor whiteColor];
      _heatbtnlbl.tintColor=[UIColor blackColor];
      _wrapbtnlbl.tintColor=[UIColor blackColor];
     _personalbtnlbl.tintColor=[UIColor blackColor];
    [self ReadInsulationInspectionPot];
    
}
- (IBAction)personalbtn:(id)sender {
    barbtntype=4;
   [self ReadInsulationPersonalProtectDetailsss];
    
    if ([_typebtnlbl.titleLabel.text isEqualToString:@"Pipe"]) {
        
        _personalbtnlbl.enabled=NO;
        
    }
    else{
        
         _personalbtnlbl.enabled=YES;
    }
    _Otherview.hidden=YES;
    _subtypeview.hidden=NO;
     _heatview.hidden=YES;
    _subtypebtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    _insptnbtnlbl.tintColor=[UIColor blackColor];
    _personalbtnlbl.tintColor=[UIColor whiteColor];
     _heatbtnlbl.tintColor=[UIColor blackColor];
      _wrapbtnlbl.tintColor=[UIColor blackColor];
    _subtypetitlelbl.text=@"Sub Type";
    _lineartitlelbl.text=@"Linear Fleet";
}
- (IBAction)heatbtn:(id)sender {
    barbtntype=5;
    [self ReadInsulationHeatTransfer];
    [self GetSubtype];
    [self GetMode];
    if ([_typebtnlbl.titleLabel.text isEqualToString:@"Pipe"]) {
        
        _personalbtnlbl.enabled=NO;
        
    }
    else{
        
        _personalbtnlbl.enabled=YES;
    }

    _Otherview.hidden=YES;
    _subtypeview.hidden=YES;
    _heatview.hidden=NO;
    _heattitle.hidden=NO;
    _wraptitle.hidden=YES;
    _subtypebtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    _insptnbtnlbl.tintColor=[UIColor blackColor];
    _personalbtnlbl.tintColor=[UIColor blackColor];
    _heatbtnlbl.tintColor=[UIColor whiteColor];
    _wrapbtnlbl.tintColor=[UIColor blackColor];
    
}
- (IBAction)wrapbtn:(id)sender {
    if ([_typebtnlbl.titleLabel.text isEqualToString:@"Pipe"]) {
    
    _personalbtnlbl.enabled=NO;
    
}
else{
    
    _personalbtnlbl.enabled=YES;
}

    barbtntype=6;
    [self ReadInsulationWrapping];
    [self GetSubtype];
    [self GetMode];
    [self GetSize];
    _Otherview.hidden=YES;
    _subtypeview.hidden=YES;
    _heatview.hidden=NO;
    _heattitle.hidden=YES;
    _wraptitle.hidden=NO;
    _subtypebtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    _insptnbtnlbl.tintColor=[UIColor blackColor];
    _personalbtnlbl.tintColor=[UIColor blackColor];
    _heatbtnlbl.tintColor=[UIColor blackColor];
    _wrapbtnlbl.tintColor=[UIColor whiteColor];
}

#pragma mark-IBActions
- (IBAction)clsebtn:(id)sender {
    
  
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
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
    
    Validation*val=[[Validation alloc]init];
    int value1=[val isNumeric:_linearbtnlbl.text];
    if ([_unittxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Unit is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_subunittxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Sub Unit is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_equpmnttxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Equipment is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_phtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Project Header is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_linearbtnlbl.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Linear Fleet is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    else if(value1==0)
    {
        
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Linear Fleet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        
        
    }
    else{

    
    if (_btntype==1) {
        [self CreateInsulation];
    }
    else   if (_btntype==2) {
         [self Updateinsulation];
    }
        
    }
}



- (IBAction)subeditbtn:(id)sender {
    _subeditview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.subtable];
    NSIndexPath *textFieldIndexPath = [self.subtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    subbtnIndex=textFieldIndexPath.row;
    
    Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:textFieldIndexPath.row];
    
    _subtypetxtfld.text=submdl.subdesptn;
    _quntytxtfld.text=submdl.quantity;

}

- (IBAction)subupdatebtn:(id)sender {
    if (barbtntype==1) {
         [self NewUpdateInsulationSubType];
    }
    else if (barbtntype==3){
        [self NewUpdateInsulationInspection];
    }
    else if (barbtntype==4){
        [self UpdateInsulationPersonalProtect];
    }
    

}
- (IBAction)subclsebtn:(id)sender {
     _subeditview.hidden=YES;
}

- (IBAction)subcheckbtn:(id)sender {
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
   
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.subtable];
    NSIndexPath *textFieldIndexPath = [self.subtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
   subbtnIndex=textFieldIndexPath.row;
    
    
     Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:textFieldIndexPath.row];
    if ([submdl.ischeck isEqualToString:@"false"])
        
        
    {
        
        [_subcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
       subcheck=1;
        
        
    }
    else
    {
        [_subcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        subcheck=0;
        
    }
    if (barbtntype==1) {
        [_subtable reloadData];
        [self UpdateInsulationSubType];
    }
    else if(barbtntype==3){
        [_subtable reloadData];
        [self UpdateInsulationInspection];
        
    }
    else if(barbtntype==4){
        [_subtable reloadData];
        [self UpdateInsulationPersonalProtectSelect];
        
    }

    

}
- (IBAction)othercheckbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.othertable];
    NSIndexPath *textFieldIndexPath = [self.othertable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    otherbtnindex=textFieldIndexPath.row;
    
    
    Insubtypemdl *submdl=(Insubtypemdl *)[_SubtypeArray objectAtIndex:otherbtnindex];
    if ([submdl.ischeck isEqualToString:@"false"])
        
        
    {
        
        [_othercheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        subcheck=1;
        
        
    }
    else
    {
        [_othercheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        subcheck=0;
        
    }
    [_othertable reloadData];
    [self UpdateInsulationOtherFactSelect];

    
}

- (IBAction)Addheat:(id)sender {
    optnidntfr=1;
    _heataddview.hidden=NO;
    _wsizelbl.hidden=YES;
    _wrapsizebtn.hidden=YES;
}

- (IBAction)heatclsebtn:(id)sender {
    _heataddview.hidden=YES;
}
- (IBAction)modebtn:(id)sender {
    poptype=8;
    [self createpopover];
    [self GetMode];
}

- (IBAction)Hsubtypebtn:(id)sender {
    poptype=9;
    [self createpopover];
    [self GetSubtype];
}

- (IBAction)wsizebtn:(id)sender {
    poptype=10;

    [self createpopover];
    [self GetSize];
}
- (IBAction)heatupdatebtn:(id)sender {
    
    
    if (optnidntfr==1 &&barbtntype==5) {
        
         [self CreateInsulationHeatTransfer];
        
    }
    else if (optnidntfr==2 &&barbtntype==5) {
        
        [self UpdateInsulationHeatTransfer];
        
    }
   else if (optnidntfr==1 &&barbtntype==6) {
        
        [self CreateInsulationWrapping];
        
    }
   else if (optnidntfr==2 &&barbtntype==6) {
        
        [self UpdateInsulationWrapping];
        
    }


   
}

- (IBAction)cancelbtn:(id)sender {
}
- (IBAction)remvechckbtn:(id)sender {
    
    btnclck++;
    if (!btnclck%2==0)
        
        
    {
        
        [_remveckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        removecheck=1;
        
        
    }
    else
    {
        [_remveckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        removecheck=0;
        
    }

}

- (IBAction)heateditbtn:(id)sender {
     _heataddview.hidden=NO;
    optnidntfr=2;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.heattable];
    NSIndexPath *textFieldIndexPath = [self.heattable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    newbtnindx=textFieldIndexPath.row;
    
    
    Insubtypemdl *submdl=(Insubtypemdl *)[_HeatArray objectAtIndex:newbtnindx];
    [_modebtnlbl setTitle:submdl.mode forState:UIControlStateNormal];
    
    [_heatsubtypebtnlbl setTitle:[_revsubtypedict objectForKey:submdl.subid] forState:UIControlStateNormal];
    _heatquntytxtfld.text=submdl.quantity;
    
    if ([submdl.removal isEqualToString:@"true"]) {
         [_remveckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
    }
    else{
        [_remveckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];

    }
    

    

    _wsizelbl.hidden=YES;
    _wrapsizebtn.hidden=YES;
}
- (IBAction)weditbtn:(id)sender {
      _heataddview.hidden=NO;
    _wsizelbl.hidden=NO;
    _wrapsizebtn.hidden=NO;
    optnidntfr=2;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.heattable];
    NSIndexPath *textFieldIndexPath = [self.heattable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    newbtnindx=textFieldIndexPath.row;
    
    
    Insubtypemdl *submdl=(Insubtypemdl *)[_HeatArray objectAtIndex:newbtnindx];
    [_modebtnlbl setTitle:submdl.mode forState:UIControlStateNormal];
        [_wrapsizebtn setTitle:submdl.size forState:UIControlStateNormal];
    [_heatsubtypebtnlbl setTitle:[_revsubtypedict objectForKey:submdl.subid] forState:UIControlStateNormal];
    _heatquntytxtfld.text=submdl.quantity;
    
    if ([submdl.removal isEqualToString:@"true"]) {
        [_remveckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
    }
    else{
        [_remveckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }

}

- (IBAction)wrapaddbtn:(id)sender {
    _heataddview.hidden=NO;
    _wsizelbl.hidden=NO;
    _wrapsizebtn.hidden=NO;
    optnidntfr=1;

}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    
    
    if ([alertView.message isEqualToString:msgstrg]) {
        
        
        if([msgstrg isEqualToString:@"Inserted Successfully"]){
            
            
            //            if (barbtntype==1) {
            //
            //            }
            switch (barbtntype) {
                case 1:
                    [self ReadInsulationSubType];
                    break;
                case 2:
                    [self ReadInsulationOtherFactorDetailsss];
                    break;
                case 3:
                    [self ReadInsulationInspectionPot];
                    break;
                    
                case 4:
                    [self ReadInsulationPersonalProtectDetailsss];
                    break;
                case 5:
                    [self ReadInsulationHeatTransfer];
                    break;
                case 6:
                    [self ReadInsulationWrapping];
                    break;
                    
                    
                default:
                    break;
            }
            
        }
        else  if([msgstrg isEqualToString:@"Updated Successfully"]){
             _heataddview.hidden=YES;
            _subeditview.hidden=YES;
            //        _unittxtfld.text=@"";
            //        _subunittxtfld.text=@"";
            //        _equpmnttxtfld.text=@"";
            //        _phtxtfld.text=@"";
            //        _linearbtnlbl.text=@"";
            //
            //        [_typebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            //        [_pipebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            //        [_layerbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            //        [_inslutnbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            //        [_phasebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            //        [_sequbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            //        [_streambtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            
            switch (barbtntype) {
                case 1:
                    [self ReadInsulationSubType];
                    break;
                case 2:
                    [self ReadInsulationOtherFactorDetailsss];
                    break;
                case 3:
                    [self ReadInsulationInspectionPot];
                    break;
                    
                case 4:
                    [self ReadInsulationPersonalProtectDetailsss];
                    break;
                case 5:
                    [self ReadInsulationHeatTransfer];
                    break;
                case 6:
                    [self ReadInsulationWrapping];
                    break;
                    
                    
                default:
                    break;
            }
            
            
            
            
        }
        
    }
}

@end
