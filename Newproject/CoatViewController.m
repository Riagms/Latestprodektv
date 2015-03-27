//
//  CoatViewController.m
//  Prodektive
//
//  Created by Riya on 3/26/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "CoatViewController.h"

@interface CoatViewController ()

@end

@implementation CoatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
      self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.valveseditview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.valveview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

    _valvestitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    self.valvetable.layer.borderWidth=3.0;
    self.valvetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.valveview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    _factrtitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    self.factrtable.layer.borderWidth=3.0;
    self.factrtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
     self.otherfactrview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  
    _valveview.hidden=NO;
    _otherfactrview.hidden=YES;
    _valuesbtnlbl.tintColor=[UIColor whiteColor];
    _factrbtnlbl.tintColor=[UIColor blackColor];
  
    
    _typedict=[[NSMutableDictionary alloc]init];
    [_typedict setObject:@"1" forKey:@"Surface Preperation"];
     [_typedict setObject:@"2" forKey:@"Coating"];
    _Retypedict=[[NSMutableDictionary alloc]init];
    [_Retypedict setObject:@"Surface Preperation" forKey:@"1"];
    [_Retypedict setObject:@"Coating" forKey:@"2"];
    
      _cmdl=(CoatMdl *)[_CoatingArray objectAtIndex:0];
    if (_btntype==2) {
        [self ReadCoattingValvesDetailsss];
        _navtitle.title=@"Edit";
        coatingid=_cmdl.entryid;
        _planttxtfld.text=_cmdl.plant;
        _subtxtfld.text=_cmdl.subunit;
        _equtxtfld.text=_cmdl.equmnt;
        _phtxtfld.text=_cmdl.ph;
         _sqfttxtfld.text=_cmdl.legfeet;
        
        [_phasebtnlbl setTitle:_cmdl.phasename forState:UIControlStateNormal];
        [_sequncebtnlbl setTitle:_cmdl.sequencename  forState:UIControlStateNormal];
       [_surfacebtnlbl setTitle:_cmdl.surfacename forState:UIControlStateNormal];
        [_surfsubbtnlbl setTitle:_cmdl.surfacesubname  forState:UIControlStateNormal];
       [_thicknessbtnlbl setTitle:_cmdl.thicknessname forState:UIControlStateNormal];
        [_typebtnlbl setTitle:[_Retypedict objectForKey:_cmdl.type] forState:UIControlStateNormal];
        if ([_cmdl.islead isEqualToString:@"true"]) {
            [_leadcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
           
            
        }
        
        else{
            [_leadcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            
            
        }
        if ([_cmdl.isroof isEqualToString:@"true"]) {
            [_floatingcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
           
            
        }
        
        else{
            [_floatingcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        
        if ([_cmdl.isnonspray isEqualToString:@"true"]) {
            [_noncheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
           
            
        }
        
        else{
            [_noncheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        
        surfaceid=_cmdl.surface;
        [self SelectAllPhases];
        [self JobsequenceSelect];
        [self GetSurfaceType];
        [self GetSurfaceSubType];
        [self GetSurfaceCoattingThickness];

    }
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
        
        [self.popOverController presentPopoverFromRect:_phasebtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    if(poptype==2){
        
        [self.popOverController presentPopoverFromRect:_sequncebtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    if(poptype==3){
        
        [self.popOverController presentPopoverFromRect:_typebtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    if(poptype==4){
        
        [self.popOverController presentPopoverFromRect:_surfacebtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }
    if(poptype==5){
        
        [self.popOverController presentPopoverFromRect:_surfsubbtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }

    if(poptype==6){
        
        [self.popOverController presentPopoverFromRect:_thicknessbtnlbl.frame
                                                inView:self.scroll
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
    }

}
#pragma mark - Webservices
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
                   "</soap:Envelope>\n",5];
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
-(void)GetSurfaceType{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetSurfaceType xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</GetSurfaceType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetSurfaceType" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GetSurfaceSubType{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetSurfaceSubType xmlns=\"http://ios.kontract360.com/\">\n"
                   "<surfID>%@</surfID>\n"
                   "</GetSurfaceSubType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",surfaceid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetSurfaceSubType" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GetSurfaceCoattingThickness{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetSurfaceCoattingThickness xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</GetSurfaceCoattingThickness>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetSurfaceCoattingThickness" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CreateCoatting{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateCoatting xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<planCO>%@</planCO>\n"
                   "<workOCO>%@</workOCO>\n"
                   "<plantCO>%@</plantCO>\n"
                   "<equipmentCO>%@</equipmentCO>\n"
                   "<projectHeadCO>%@</projectHeadCO>\n"
                   "<subUnitCO>%@</subUnitCO>\n"
                   "<TypeCO>%d</TypeCO>\n"
                   "<surfaceCO>%d</surfaceCO>\n"
                   "<surfaceSubTyCO>%d</surfaceSubTyCO>\n"
                   "<thicknessCO>%d</thicknessCO>\n"
                   "<legFeetCO>%d</legFeetCO>\n"
                   "<phaseIDzCO>%d</phaseIDzCO>\n"
                   "<seqIDzCO>%d</seqIDzCO>\n"
                   "<isLead>%d</isLead>\n"
                   "<isRoof>%d</isRoof>\n"
                   "<isNonSpray>%d</isNonSpray>\n"
                   "</CreateCoatting>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"",_cmdl.plan,_cmdl.worko,_planttxtfld.text,_equtxtfld.text,_phtxtfld.text,_subtxtfld.text,[[_typedict objectForKey:_typebtnlbl.titleLabel.text]integerValue],[[_surfacedict objectForKey:_surfacebtnlbl.titleLabel.text]integerValue],[[_surfacesubdict objectForKey:_surfsubbtnlbl.titleLabel.text]integerValue],[[_thicknessdict objectForKey:_thicknessbtnlbl.titleLabel.text]integerValue],[_sqfttxtfld.text integerValue],[[_phasedict objectForKey:_phasebtnlbl.titleLabel.text]integerValue],[[_sequencedict objectForKey:_sequncebtnlbl.titleLabel.text]integerValue],lead,floating,spray];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreateCoatting" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateCoatting{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateCoatting xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<planCO>%@</planCO>\n"
                   "<workOCO>%@</workOCO>\n"
                   "<plantCO>%@</plantCO>\n"
                   "<equipmentCO>%@</equipmentCO>\n"
                   "<projectHeadCO>%@</projectHeadCO>\n"
                   "<subUnitCO>%@</subUnitCO>\n"
                   "<TypeCO>%d</TypeCO>\n"
                   "<surfaceCO>%d</surfaceCO>\n"
                   "<surfaceSubTyCO>%d</surfaceSubTyCO>\n"
                   "<thicknessCO>%d</thicknessCO>\n"
                   "<legFeetCO>%d</legFeetCO>\n"
                   "<phaseIDzCO>%d</phaseIDzCO>\n"
                   "<seqIDzCO>%d</seqIDzCO>\n"
                   "<isLead>%d</isLead>\n"
                   "<isRoof>%d</isRoof>\n"
                   "<isNonSpray>%d</isNonSpray>\n"
                   "</CreateCoatting>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",coatingid,_cmdl.plan,_cmdl.worko,_planttxtfld.text,_equtxtfld.text,_phtxtfld.text,_subtxtfld.text,[[_typedict objectForKey:_typebtnlbl.titleLabel.text]integerValue],[[_surfacedict objectForKey:_surfacebtnlbl.titleLabel.text]integerValue],[[_surfacesubdict objectForKey:_surfsubbtnlbl.titleLabel.text]integerValue],[[_thicknessdict objectForKey:_thicknessbtnlbl.titleLabel.text]integerValue],[_sqfttxtfld.text integerValue],[[_phasedict objectForKey:_phasebtnlbl.titleLabel.text]integerValue],[[_sequencedict objectForKey:_sequncebtnlbl.titleLabel.text]integerValue],lead,floating,spray];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreateCoatting" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadCoattingValvesDetailsss{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadCoattingValvesDetailsss xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%d</InsID>\n"
                   "</ReadCoattingValvesDetailsss>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[coatingid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadCoattingValvesDetailsss" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateCoattingValves{
    
    recordResults = FALSE;
      Valvemdl*v1=(Valvemdl *)[_ValveArray objectAtIndex:btnindex];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateCoattingValves xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<Entry>%d</Entry>\n"
                   "<Quan>%d</Quan>\n"
                   "</UpdateCoattingValves>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",coatingid,valuecheck,[v1.entryid integerValue],[_Vqtytxtfld.text integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateCoattingValves" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateCoattingValvesQunty{
    
    recordResults = FALSE;
    Valvemdl*v1=(Valvemdl *)[_ValveArray objectAtIndex:btnindex];
    NSInteger check;
    if([v1.ischeck isEqualToString:@"true"]){
        check=1;
    }
    else{
        
        check=0;
    }
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateCoattingValves xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<isCheck>%d</isCheck>\n"
                   "<Entry>%d</Entry>\n"
                   "<Quan>%d</Quan>\n"
                   "</UpdateCoattingValves>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",coatingid,check,[v1.entryid integerValue],[_Vqtytxtfld.text integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateCoattingValves" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadCoattingDualTypeDetailsss{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadCoattingDualTypeDetailsss xmlns=\"http://ios.kontract360.com/\">\n"
                   "<InsID>%@</InsID>\n"
                   "<TypeID>%@</TypeID>\n"
                   "</ReadCoattingDualTypeDetailsss>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",coatingid,[_typedict objectForKey:_typebtnlbl.titleLabel.text]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadCoattingDualTypeDetailsss" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateCoattingDualTypeGridSelect{
    
    recordResults = FALSE;
    Valvemdl*v1=(Valvemdl *)[_factorArray objectAtIndex:btnindex];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateCoattingDualTypeGridSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "<isPre>%d</isPre>\n"
                   "<InsuID>%@</InsuID>\n"
                   "<SurfCoat>%@</SurfCoat>\n"
                   "</UpdateCoattingDualTypeGridSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[v1.entryid integerValue],factorcheck,coatingid,[_surfacedict objectForKey:_surfacebtnlbl.titleLabel.text]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];;
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateCoattingDualTypeGridSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    [_valvetable reloadData];
    [_factrtable reloadData];
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllPhasesResponse"])
    {
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

    if([elementName isEqualToString:@"GetSurfaceTypeResponse"])
    {
        _surfacedict=[[NSMutableDictionary alloc]init];
        
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
    if([elementName isEqualToString:@"SurfName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"GetSurfaceSubTypeResponse"])
    {
        _surfacesubdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SurfSubName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"GetSurfaceCoattingThicknessResponse"])
    {
        _thicknessdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SurfTickness"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadCoattingValvesDetailsssResponse"])
    {
        _ValveArray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"CoattingID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"valveID"])
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

    if([elementName isEqualToString:@"ReadCoattingDualTypeDetailsssResponse"])
    {
        
        _factorArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"subTypeID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"masCheckID"])
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
    if([elementName isEqualToString:@"Id"])
    {
        
        recordResults=FALSE;
        typestrg=_soapResults;
        
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
    if([elementName isEqualToString:@"id"])
    {
        
        recordResults=FALSE;
        typestrg=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SurfName"])
    {
        
        recordResults=FALSE;
        [_surfacedict setObject:typestrg forKey:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SurfSubName"])
    {
        
        recordResults=FALSE;
        [_surfacesubdict setObject:typestrg forKey:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SurfTickness"])
    {
        recordResults=FALSE;
        [_thicknessdict setObject:typestrg forKey:_soapResults];
        _soapResults = nil;

    }

    if([elementName isEqualToString:@"Entry"])
    {
        
        recordResults=FALSE;
        _valmdl=[[Valvemdl alloc]init];
        _valmdl.entryid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Dec"])
    {
        
        recordResults=FALSE;
        _valmdl.dec=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"isCheck"])
    {
        
        recordResults=FALSE;
        
        _valmdl.ischeck=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Quan"])
    {
        
        recordResults=FALSE;
        _valmdl.quan=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CoattingID"])
    {
        
        recordResults=FALSE;
        _valmdl.coatgid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"valveID"])
    {
        
        recordResults=FALSE;
        _valmdl.valveid=_soapResults;
        [_ValveArray addObject:_valmdl];
        _soapResults = nil;
    }
       if([elementName isEqualToString:@"subTypeID"])
    {
        
       recordResults=FALSE;
        _valmdl.subtypeid=_soapResults;
         _soapResults = nil;
    }
    if([elementName isEqualToString:@"masCheckID"])
    {
        
        recordResults=FALSE;
         _valmdl.mascheckid=_soapResults;
        [_factorArray addObject:_valmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"records"])
    {
        
        
        recordResults=FALSE;
        if([_soapResults isEqualToString:@"Updated Successfully"]){
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _Vupdatebtnlbl.enabled=YES;
            [self ReadCoattingValvesDetailsss];
            [self ReadCoattingDualTypeDetailsss];
        }
        else if([_soapResults isEqualToString:@"Select current item"]){
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else{
            coatingid=_soapResults;
             [self ReadCoattingValvesDetailsss];
        }
        
        _soapResults = nil;
    }


}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        if (poptype==1) {
            return [_phasedict count];
        }
        
        if (poptype==2) {
            return [_sequencedict count];
        }
        if (poptype==3) {
            return [_typedict count];
        }
        if (poptype==4) {
            return [_surfacedict count];
        }
        if (poptype==5) {
            return [_surfacesubdict count];
        }

        if (poptype==6) {
            return [_thicknessdict count];
        }
        

    }
    
    if (tableView==_valvetable) {
        
        return [_ValveArray count];
    }
    if (tableView==_factrtable) {
        
       return [_factorArray count];
    }

    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        static NSString *CellIdentifier = @"mycell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        
         if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
             if (tableView==_valvetable) {
                 [[NSBundle mainBundle ]loadNibNamed:@"Valvescell" owner:self options:nil];
                 cell=_valvecell;
             }
             if(tableView==_factrtable){
                 [[NSBundle mainBundle ]loadNibNamed:@"ValOtherfactrcell" owner:self options:nil];
                 cell=_factorcell;
             }
         }
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        if (tableView==_popOverTableView) {
            if (poptype==1) {
                NSArray*array=[_phasedict allKeys];
                
                cell.textLabel.text=[array objectAtIndex:indexPath.row];
            }
            if (poptype==2) {
                NSArray*array=[_sequencedict allKeys];
                
                cell.textLabel.text=[array objectAtIndex:indexPath.row];
            }
            if (poptype==3) {
                NSArray*array=[_typedict allKeys];
                
                cell.textLabel.text=[array objectAtIndex:indexPath.row];
            }


        
        if (poptype==4) {
            NSArray*array=[_surfacedict allKeys];
            
            cell.textLabel.text=[array objectAtIndex:indexPath.row];
        }
            if (poptype==5) {
                NSArray*array=[_surfacesubdict allKeys];
                
                cell.textLabel.text=[array objectAtIndex:indexPath.row];
            }
            if (poptype==6) {
                NSArray*array=[_thicknessdict allKeys];
                
                cell.textLabel.text=[array objectAtIndex:indexPath.row];
            }


        
    }
         if (tableView==_valvetable) {
             
             Valvemdl*v1=(Valvemdl *)[_ValveArray objectAtIndex:indexPath.row];
             _otherfactrlbl=(UILabel *)[cell viewWithTag:1];
             _otherfactrlbl.text=v1.dec;
             _quntylbl=(UILabel *)[cell viewWithTag:2];
             _quntylbl.text=v1.quan;
             _vcheckbtnlbl=(UIButton *)[cell viewWithTag:3];
             if ([v1.ischeck isEqualToString:@"true"]) {
                 [_vcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
                 
                 
             }
             
             else{
                 [_vcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
                 
                 
             }

             
         }
          if(tableView==_factrtable){
               Valvemdl*v1=(Valvemdl *)[_factorArray objectAtIndex:indexPath.row];
              _otherlbl=(UILabel *)[cell viewWithTag:1];
                _otherlbl.text=v1.dec;
              _factrcheckbtnlbl=(UIButton *)[cell viewWithTag:2];

              if ([v1.ischeck isEqualToString:@"true"]) {
                  [_factrcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
                  
                  
              }
              
              else{
                  [_factrcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
                  
                  
              }

              
          }

          return cell;
        
    }
#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (poptype==1) {
        NSArray*array=[_phasedict allKeys];
        
        [_phasebtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    if (poptype==2) {
        NSArray*array=[_sequencedict allKeys];
        
        [_sequncebtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    if (poptype==3) {
        NSArray*array=[_typedict allKeys];
        
        [_typebtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    if (poptype==4) {
      
        NSArray*array=[_surfacedict allKeys];
        surfaceid=[[_surfacedict allValues] objectAtIndex:indexPath.row];
        [_surfacebtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    if (poptype==5) {
        NSArray*array=[_surfacesubdict allKeys];
        
        [_surfsubbtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    if (poptype==6) {
        NSArray*array=[_thicknessdict allKeys];
        
        [_thicknessbtnlbl setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];

    }


}

#pragma mark - Button Actions
- (IBAction)navbtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)phasebtn:(id)sender {
    poptype=1;
    [self createpopover];
    [self SelectAllPhases];
   }

- (IBAction)seqbtn:(id)sender {
    poptype=2;
    [self createpopover];
    [self JobsequenceSelect];


}

- (IBAction)typebtn:(id)sender {
    poptype=3;
      [self createpopover];
    [_popOverTableView reloadData];
}

- (IBAction)surfcebtn:(id)sender {
    poptype=4;
    [self createpopover];
    [self GetSurfaceType];
}

- (IBAction)surfsubbtn:(id)sender {
    poptype=5;
    [self createpopover];
    [self GetSurfaceSubType];
}

- (IBAction)thickbtn:(id)sender {
    poptype=6;
    [self createpopover];
    [self GetSurfaceCoattingThickness];

}

- (IBAction)leadbtn:(id)sender {
    if (lead==0) {
        [_leadcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        lead=1;
        
    }
    
    else{
        [_leadcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        lead=0;
        
    }

}

- (IBAction)floatbtn:(id)sender {
    if (floating==0) {
        [_floatingcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        floating=1;
        
    }
    
    else{
        [_floatingcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        floating=0;
        
    }

}

- (IBAction)spraybtn:(id)sender {
    if (spray==0) {
        [_noncheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        spray=1;
        
    }
    
    else{
        [_noncheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        spray=0;
        
    }

}

- (IBAction)updatebtn:(id)sender {
    if (_btntype==1) {
        [self CreateCoatting];
    }
    else{
        [self UpdateCoatting];
    }
}

- (IBAction)valvebtn:(id)sender {
    [self ReadCoattingValvesDetailsss];
    self.valuesbtnlbl.tintColor=[UIColor whiteColor];
    self.factrbtnlbl.tintColor=[UIColor blackColor];
    self.valveview.hidden=NO;
     self.otherfactrview.hidden=YES;
}

- (IBAction)Factrbtn:(id)sender {
    [self ReadCoattingDualTypeDetailsss];
    self.valuesbtnlbl.tintColor=[UIColor blackColor];
    self.factrbtnlbl.tintColor=[UIColor whiteColor];
    self.valveview.hidden=YES;
     self.otherfactrview.hidden=NO;
}
- (IBAction)Vupdatebtn:(id)sender {
    if([_Vqtytxtfld.text isEqualToString:@""]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Quantity is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{
        _Vupdatebtnlbl.enabled=NO;
    
    [self UpdateCoattingValvesQunty];
    }
}
- (IBAction)vclsebtn:(id)sender {
      _valveseditview.hidden=YES;
}
- (IBAction)vcheckbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.valvetable];
    NSIndexPath *textFieldIndexPath = [self.valvetable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;

    if (valuecheck==0) {
        [_vcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        valuecheck=1;
        
    }
    
    else{
        [_vcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        valuecheck=0;
        
    }

    [self UpdateCoattingValves];
    
}

- (IBAction)veditbtn:(id)sender {
    _valveseditview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.valvetable];
    NSIndexPath *textFieldIndexPath = [self.valvetable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    Valvemdl*v1=(Valvemdl *)[_ValveArray objectAtIndex:btnindex];
    _valvestxtfld.text=v1.dec;


}
- (IBAction)factrchckbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.factrtable];
    NSIndexPath *textFieldIndexPath = [self.factrtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;

    if (factorcheck==0) {
        [_factrcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        factorcheck=1;
        
    }
    
    else{
        [_factrcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        factorcheck=0;
        
    }
    
    [self UpdateCoattingDualTypeGridSelect];

}
@end
