//
//  MangmntdetailsViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 4/3/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "MangmntdetailsViewController.h"

@interface MangmntdetailsViewController ()

@end

@implementation MangmntdetailsViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _paymentview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _volumeview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _labrview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _equpview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _othrtrmsview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _markupview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _baseview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _fuelview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _nonfuelview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _smrview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];    _othrratesview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _deliveryview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _srsview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _docuview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    [[self.clausetxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.clausetxtview layer] setBorderWidth:3];
    [[self.clausetxtview layer] setCornerRadius:10];
     self.volumetitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    [[self.vlumeclautxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.vlumeclautxtview layer] setBorderWidth:3];
    [[self.vlumeclautxtview layer] setCornerRadius:10];
    self.vlumetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.vlumetable.layer.borderWidth=2.0f;
    
    [[self.lbrclaustxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.lbrclaustxtview layer] setBorderWidth:3];
    [[self.lbrclaustxtview layer] setCornerRadius:10];
    [[self.labrview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.labrview layer] setBorderWidth:2];
    [[self.labrview layer] setCornerRadius:10];

    [[self.equpclause layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.equpclause layer] setBorderWidth:3];
    [[self.equpclause layer] setCornerRadius:10];
    self.cfetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.cfetable.layer.borderWidth=2.0f;
    self.tretable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.tretable.layer.borderWidth=2.0f;
    [[self.othrtermsclause layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.othrtermsclause layer] setBorderWidth:3];
    [[self.othrtermsclause layer] setCornerRadius:10];
    self.basetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.basetable.layer.borderWidth=2.0f;
    self.basetitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.fueltitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.fueltable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.fueltable.layer.borderWidth=2.0f;
    self.nonfueltitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.nonfueltable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.nonfueltable.layer.borderWidth=2.0f;
    self.smrtitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.smrtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.smrtable.layer.borderWidth=2.0f;
    [[self.deliveryclausetxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.deliveryclausetxtview layer] setBorderWidth:3];
    [[self.deliveryclausetxtview layer] setCornerRadius:10];
    [[self.srstxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.srstxtview layer] setBorderWidth:3];
    [[self.srstxtview layer] setCornerRadius:10];
    self.doctitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.docutable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.docutable.layer.borderWidth=2.0f;
    self.equptitle1.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.equptitle2.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];



}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self SelectMarkupMaster];
    
    _subcntrct=(subcontract *)[_detailsarray objectAtIndex:0];
    _clausetxtview.text=_subcntrct.Payementclause;
    _nettextfld.text=_subcntrct.NetDays;
    _vlumeclautxtview.text=_subcntrct.VolumeDisClause;
    _lbrclaustxtview.text=_subcntrct.LabourClause;
    _weekhrstxtfld.text=_subcntrct.WeeklyHours;
    _subcntrctbtn.text=_subcntrct.SubContractorMarkup;
    _equpclause.text=_subcntrct.EquipmentClause;
   
    _othrtermsclause.text=_subcntrct.OtherClause;
    _overtimetextfield.text=_subcntrct.OvertimeMarkupPer;
   // _premiumtimetxtfld.text=_subcntrct.
    _temtxtfld.text=_subcntrct.ThirdPartyequipmentMarkup;
    _leasemarkuptxtfld.text=_subcntrct.LeaseMarkup;
    _rentalmarkuptxtfld.text=_subcntrct.RentalMarkup;
    _materialpurchasetxtfld.text=_subcntrct.MaterialPurchaseMarkup;
    _deliveryclausetxtview.text=_subcntrct.DeliveryRatesClause;
    _srstxtview.text=_subcntrct.SpecialRatesStructure;
    
    if ([_subcntrct.LabourOverTime isEqualToString:@"false"]) {
        [_overtimechecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if([_subcntrct.LabourOverTime isEqualToString:@"true"]){
        [_overtimechecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    if ([_subcntrct.MinHrs isEqualToString:@"false"]) {
        [_minimumchecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if([_subcntrct.MinHrs isEqualToString:@"true"]){
        [_minimumchecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }

    if ([_subcntrct.HolidaysPaid isEqualToString:@"false"]) {
        [_holidayschecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if([_subcntrct.HolidaysPaid isEqualToString:@"true"]){
        [_holidayschecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    if ([_subcntrct.ShopWorkPermitted isEqualToString:@"false"]) {
        [_swpbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if([_subcntrct.ShopWorkPermitted isEqualToString:@"true"]){
        [_swpbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    if ([_subcntrct.SmallToolBilling isEqualToString:@"false"]) {
        [_smalltoolbillingbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if([_subcntrct.SmallToolBilling isEqualToString:@"true"]){
        [_smalltoolbillingbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    if ([_subcntrct.ConsumableBilling isEqualToString:@"false"]) {
        [_consumblebtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if([_subcntrct.ConsumableBilling isEqualToString:@"true"]){
        [_consumblebtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }


    
    NSLog(@"%@",_subcntrct.Payementclause);
    _paymntbtnlbl.tintColor=[UIColor whiteColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-webservice
-(void)VolumeDiscountselect{
    tabletype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<VolumeDiscountselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ContractId>%d</ContractId>\n"
                   "</VolumeDiscountselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_subcntrct.contractid];
    NSLog(@"soapmsg%@",soapMessage);
    
     NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   // NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/VolumeDiscountselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectMarkupMaster{
   // tabletype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectMarkupMaster xmlns=\"http://ios.kontract360.com/\">\n"
                 
                   "</SelectMarkupMaster>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
     NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   // NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectMarkupMaster" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BaseWagesselect{
    tabletype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BaseWagesselect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<ContractId>%d</ContractId>"
                   "</BaseWagesselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_subcntrct.contractid];
    NSLog(@"soapmsg%@",soapMessage);
    
     NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   // NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BaseWagesselect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ContractFuelesEquipmentselect{
    tabletype=4;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ContractFuelesEquipmentselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ContractId>%d</ContractId>\n"
                   "</ContractFuelesEquipmentselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_subcntrct.contractid];
    NSLog(@"soapmsg%@",soapMessage);
    
     NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ContractFuelesEquipmentselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ContractNonFuelesEquipmentselect{
    tabletype=5;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ContractNonFuelesEquipmentselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ContractId>%d</ContractId>\n"
                   "</ContractNonFuelesEquipmentselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_subcntrct.contractid];
    NSLog(@"soapmsg%@",soapMessage);
    
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ContractNonFuelesEquipmentselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ContractScaffoldRateselect{
    tabletype=6;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ContractScaffoldRateselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ContractId>%d</ContractId>\n"
                   "</ContractScaffoldRateselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_subcntrct.contractid];
    NSLog(@"soapmsg%@",soapMessage);
    
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ContractScaffoldRateselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Equipmenttermscontractorselect{
    tabletype=7;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Equipmenttermscontractorselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ContractId>%d</ContractId>\n"
                   "</Equipmenttermscontractorselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_subcntrct.contractid];
    NSLog(@"soapmsg%@",soapMessage);
    
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Equipmenttermscontractorselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EquipmenttermsThirdPartyselect{
    tabletype=8;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EquipmenttermsThirdPartyselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ContractId>%d</ContractId>\n"
                   "</EquipmenttermsThirdPartyselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_subcntrct.contractid];
    NSLog(@"soapmsg%@",soapMessage);
    
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmenttermsThirdPartyselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ContractDoumentselect{
    tabletype=9;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ContractDoumentselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ContractId>%d</ContractId>\n"
                   "</ContractDoumentselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_subcntrct.contractid];
    NSLog(@"soapmsg%@",soapMessage);
    
    NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ContractDoumentselect" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"ERROR with theConnection" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
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
  
      switch (tabletype) {
        case 1:
            [_vlumetable reloadData];

            
                       break;
        case 2:
            //return [_markupnamearray count];
            break;
        case 3:
             [_basetable reloadData];
            break;
            
        case 4:
            [_fueltable reloadData];
            break;
        case 5:
              [_nonfueltable reloadData];
            break;
        case 6:
            [_smrtable reloadData];
            break;
        case 7:
            [_cfetable reloadData];
            [self EquipmenttermsThirdPartyselect];

            break;
        case 8:
            [_tretable reloadData];
            break;
          case 9:
              [_docutable reloadData];
              break;

            
        default:
            break;
      }

    

    
    
}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"VolumeDiscountselectResponse"])
    {
        _volumearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"ContractID"])
    {
                if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"AmtFrom"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"AmtTo"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"Percentage"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    
    if ([elementName isEqualToString:@"SelectMarkupMasterResponse"])
    {
        _markupnamearray=[[NSMutableArray alloc]init];
        _markupdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MarkupEntryId"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MarkUpName"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"BaseWagesselectResponse"])
    {
        _basewagesarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"BaseWagesId"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"CraftName"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"CraftCode"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"BaseRate"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"Perdiem"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"TravelPay"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"OnesideOrBothside"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"ContractFuelesEquipmentselectResponse"])
    {
        _fuelarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"ItemCode"])
    {
       
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"Description"])
    {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"EquipmentRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"ContractNonFuelesEquipmentselectResponse"])
    {
        _nonfuelarray=[[NSMutableArray alloc]init];

        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"EquipmenttermscontractorselectResponse"])
    {
        _cequarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"EquipmentDescription"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"EquipmenttermsThirdPartyselectResponse"])
    {
        
        _tequparray=[[NSMutableArray alloc]init];

        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"ThirdPartyDescription"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"ContractDoumentselectResponse"])
    {
        _documentarray=[[NSMutableArray alloc]init];
        _documntdict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
   
    if ([elementName isEqualToString:@"DocumentName"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"FilePath"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
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
    if ([elementName isEqualToString:@"ContractID"])
    {
        _vlumemdl=[[Vlumedismdl alloc]init];
               recordResults = FALSE;
        _vlumemdl.contractid=_soapResults;
        _soapResults=nil;
        
    }
    if ([elementName isEqualToString:@"AmtFrom"])
    {
        recordResults = FALSE;
          _vlumemdl.amountfrom=_soapResults;
        _soapResults=nil;

        
    }
    if ([elementName isEqualToString:@"AmtTo"])
    {
        recordResults = FALSE;
          _vlumemdl.amountto=_soapResults;
        _soapResults=nil;

        
    }
    
    if ([elementName isEqualToString:@"Percentage"])
    {
        recordResults = FALSE;
          _vlumemdl.percentage=_soapResults;
        [_volumearray addObject:_vlumemdl];
        _soapResults=nil;

        
    }
    if ([elementName isEqualToString:@"MarkupEntryId"])
    {
       recordResults = FALSE;
        markup=_soapResults;
         _soapResults=nil;
        
    }
    if ([elementName isEqualToString:@"MarkUpName"])
    {
        recordResults = FALSE;
        [_markupnamearray addObject:_soapResults];
        [_markupdict setObject:markup forKey:_soapResults];
        _soapResults=nil;
        
    }
    if ([elementName isEqualToString:@"BaseWagesId"])
    {
        _wagemdl=[[Wagesmdl alloc]init];
        recordResults = FALSE;
    
        _wagemdl.basewagesid=_soapResults;
        _soapResults=nil;
        
    }
    if ([elementName isEqualToString:@"CraftName"])
    {
        recordResults = FALSE;
        
        _wagemdl.craftname=_soapResults;
        _soapResults=nil;
        
    }
    if ([elementName isEqualToString:@"CraftCode"])
    {
        recordResults = FALSE;
        
        _wagemdl.craftcode=_soapResults;
        _soapResults=nil;

        
    }
    
    if ([elementName isEqualToString:@"BaseRate"])
    {
        recordResults = FALSE;
        
        _wagemdl.baserate=_soapResults;
        _soapResults=nil;
        
    }
    
    if ([elementName isEqualToString:@"Perdiem"])
    {
        recordResults = FALSE;
        
        _wagemdl.perdiem=_soapResults;
        _soapResults=nil;
        
    }
    if ([elementName isEqualToString:@"TravelPay"])
    {
        recordResults = FALSE;
        
        _wagemdl.travelpay=_soapResults;
        _soapResults=nil;

        
    }
    
    if ([elementName isEqualToString:@"OnesideOrBothside"])
    {
        recordResults = FALSE;
        
        _wagemdl.oneorbothside=_soapResults;
        [_basewagesarray addObject:_wagemdl];
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"ItemCode"])
    {
        _fumdl=[[fuelmdl alloc]init];
        recordResults = FALSE;
        _fumdl.itemcode=_soapResults;
          _soapResults=nil;

        
    }
    
    if ([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
         _fumdl.fueldes=_soapResults;
        _soapResults=nil;
        
    }
    if ([elementName isEqualToString:@"EquipmentRate"])
    {
        
        recordResults = FALSE;
         _fumdl.EquipmentRate=_soapResults;
        [_fuelarray addObject:_fumdl];
        [_nonfuelarray addObject:_fumdl];
        _soapResults=nil;
        
    }
    if ([elementName isEqualToString:@"EquipmentId"])
    {
        
       
        recordResults = FALSE;
      
        _soapResults=nil;
        
    }


    if ([elementName isEqualToString:@"EquipmentDescription"])
    {
        
        
        recordResults = FALSE;
        [_cequarray addObject:_soapResults];
         _soapResults=nil;
        
    }

    if ([elementName isEqualToString:@"ThirdPartyDescription"])
    {
        
        
        recordResults = FALSE;
        [_tequparray addObject:_soapResults];
        _soapResults=nil;
        
    }
    if ([elementName isEqualToString:@"EntryId"])
    {
        recordResults = FALSE;
            _soapResults=nil;
        
        
    }
    if ([elementName isEqualToString:@"ContractId"])
    {
        recordResults = FALSE;
        _soapResults=nil;
        
        
    }
   

    
    if ([elementName isEqualToString:@"DocumentName"])
    {
        recordResults = FALSE;
        docuname=_soapResults;
        [_documentarray addObject:_soapResults];
             _soapResults=nil;
        
        
    }
    
    if ([elementName isEqualToString:@"FilePath"])
    {
        
        recordResults = FALSE;
        [_documntdict setObject:_soapResults forKey:docuname];
        _soapResults=nil;

        
    }
    if ([elementName isEqualToString:@"UserId"])
    {
        recordResults = FALSE;
        _soapResults=nil;
        
        
    }


}


#pragma mark-Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (tabletype) {
        case 1:
             return [_volumearray count];
            break;
        case 2:
            //return [_markupnamearray count];
            break;
        case 3:
            return [_basewagesarray count];
            break;

        case 4:
            return [_fuelarray count];
            break;
        case 5:
            return [_nonfuelarray count];
            break;
        case 6:
            return [_smrarray count];
            break;
        case 7:
            return [_cequarray count];
            break;
        case 8:
            return [_tequparray count];
            break;
        case 9:
            return [_documentarray count];
            break;


        default:
            break;
    }
    return YES;
    // Return the number of rows in the section.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];

        
         if(tableView==_vlumetable){
        [[NSBundle mainBundle]loadNibNamed:@"volumediscountcell" owner:self options:nil];
        cell=_volumecell;
         }
        if(tableView==_basetable){
            [[NSBundle mainBundle]loadNibNamed:@"Basewagecell" owner:self options:nil];
            cell=_basecell;
        }
        if(tableView==_fueltable||tableView==_nonfueltable){
            [[NSBundle mainBundle]loadNibNamed:@"fuelcell" owner:self options:nil];
            cell=_fuelcell;
        }
        
        if(tableView==_docutable){
            [[NSBundle mainBundle]loadNibNamed:@"Doccontrctcell" owner:self options:nil];
            cell=_documntcell;
        }

        
    }
    if(tableView==_vlumetable){
    Vlumedismdl *vlmdl=(Vlumedismdl *)[_volumearray objectAtIndex:indexPath.row];
    _amuntfrmlbl=(UILabel *)[cell viewWithTag:1];
    _amuntfrmlbl.text=vlmdl.amountfrom;
    _amunttolbl=(UILabel *)[cell viewWithTag:2];
    _amunttolbl.text=vlmdl.amountto;
    _percentagelbl=(UILabel *)[cell viewWithTag:3];
    _percentagelbl.text=vlmdl.percentage;
    }
//    if(tableView==_popovertableview){
//        cell.textLabel.text=[_markupnamearray objectAtIndex:indexPath.row];
//    }
    if(tableView==_basetable){
        Wagesmdl *wagemdl=(Wagesmdl*)[_basewagesarray objectAtIndex:indexPath.row];
        _namelbl=(UILabel *)[cell viewWithTag:1];
        _namelbl.text=wagemdl.craftname;
        _codelbl=(UILabel *)[cell viewWithTag:2];
        _codelbl.text=wagemdl.craftcode;
        _baseratelbl=(UILabel *)[cell viewWithTag:3];
        _baseratelbl.text=wagemdl.baserate;
        _prediemlbl=(UILabel *)[cell viewWithTag:4];
        _prediemlbl.text=wagemdl.perdiem;
        _travellbl=(UILabel *)[cell viewWithTag:5];
        _travellbl.text=wagemdl.travelpay;
        _oneorbthlbl=(UILabel *)[cell viewWithTag:6];
        _oneorbthlbl.text=wagemdl.oneorbothside;


}
    
 if(tableView==_fueltable){
     
     fuelmdl *fmdl=(fuelmdl *)[_fuelarray objectAtIndex:indexPath.row];
     _itmcdelbl=(UILabel *)[cell viewWithTag:1];
     _itmcdelbl.text=fmdl.itemcode;
     _itmdeslbl=(UILabel *)[cell viewWithTag:2];
     _itmdeslbl.text=fmdl.fueldes;
     _itmratlbl=(UILabel *)[cell viewWithTag:3];
     _itmratlbl.text=fmdl.EquipmentRate;

     
    }
    if(tableView==_nonfueltable){
        
        fuelmdl *fmdl=(fuelmdl *)[_nonfuelarray objectAtIndex:indexPath.row];
        _itmcdelbl=(UILabel *)[cell viewWithTag:1];
        _itmcdelbl.text=fmdl.itemcode;
        _itmdeslbl=(UILabel *)[cell viewWithTag:2];
        _itmdeslbl.text=fmdl.fueldes;
        _itmratlbl=(UILabel *)[cell viewWithTag:3];
        _itmratlbl.text=fmdl.EquipmentRate;
        
        
    }

    if(tableView==_cfetable){
        cell.textLabel.text=[_cequarray objectAtIndex:indexPath.row];
        }
    if(tableView==_tretable){
        cell.textLabel.text=[_tequparray objectAtIndex:indexPath.row];
    }
    if(tableView==_docutable){
        _docunamelbl=(UILabel *)[cell viewWithTag:1];
        _docunamelbl.text=[_documentarray objectAtIndex:indexPath.row];

    }
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
    }
}

#pragma mark-popover
-(void)createpopover
{
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_markupbtnlbl.frame inView:self.markupview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}

#pragma mark-Button Action
- (IBAction)paymntbtn:(id)sender {
    _paymentview.hidden=NO;
     _volumeview.hidden=YES;
    _labrview.hidden=YES;
       _equpview.hidden=YES;
      _othrtrmsview.hidden=YES;
       _markupview.hidden=YES;
      _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
   _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;
    
    _paymntbtnlbl.tintColor=[UIColor whiteColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];



}

- (IBAction)volumebtn:(id)sender {
    [self VolumeDiscountselect];
    _volumeview.hidden=NO;
    _paymentview.hidden=YES;
  
    _labrview.hidden=YES;
       _equpview.hidden=YES;
      _othrtrmsview.hidden=YES;
       _markupview.hidden=YES;
      _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;

    _paymntbtnlbl.tintColor=[UIColor blackColor];

    _vlumbtnlbl.tintColor=[UIColor whiteColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];


}

- (IBAction)laborbtn:(id)sender {
    _volumeview.hidden=YES;
    _paymentview.hidden=YES;
    _labrview.hidden=NO;
     _equpview.hidden=YES;
      _othrtrmsview.hidden=YES;
       _markupview.hidden=YES;
      _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
   _smrview.hidden=YES;

     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;


    _paymntbtnlbl.tintColor=[UIColor blackColor];

    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor whiteColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)equpbtn:(id)sender {
    [self Equipmenttermscontractorselect];
      _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=NO;
      _othrtrmsview.hidden=YES;
       _markupview.hidden=YES;
      _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;

    _srsview.hidden=YES;
    _docuview.hidden=YES;

    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor whiteColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];


}

- (IBAction)othrtermsbtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=NO;
    _markupview.hidden=YES;
      _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;

    
    _srsview.hidden=YES;
    _docuview.hidden=YES;

    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor whiteColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];


}

- (IBAction)markupbtn:(id)sender {
    [self SelectMarkupMaster];
    _markuptextfld.text=[_markupdict objectForKey:_subcntrct.MarkupId];

    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=NO;
     _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;


    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor whiteColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)basebtn:(id)sender {
    [self BaseWagesselect];
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=NO;
     _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;


    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor whiteColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)fuelbtn:(id)sender {
    [self ContractFuelesEquipmentselect];
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=NO;
      _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;
    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor whiteColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];


}

- (IBAction)nonfuelbtn:(id)sender {
    [self ContractNonFuelesEquipmentselect];
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=NO;
     _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;
    
    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor whiteColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];



}

- (IBAction)SMRbtn:(id)sender {
    [self ContractScaffoldRateselect];
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=YES;
    _smrview.hidden=NO;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;

    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor whiteColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];


}

- (IBAction)Orbtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=YES;
    _smrview.hidden=YES;
    _othrratesview.hidden=NO;
    _deliveryview.hidden=YES;

    _srsview.hidden=YES;
    _docuview.hidden=YES;
    
    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor whiteColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];



}

- (IBAction)deliveryratebtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=YES;
    _smrview.hidden=YES;
    _othrratesview.hidden=YES;
    _deliveryview.hidden=NO;
     _srsview.hidden=YES;
    _docuview.hidden=YES;

    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor whiteColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];


}

- (IBAction)srsbtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=YES;
    _smrview.hidden=YES;
    _othrratesview.hidden=YES;
    _deliveryview.hidden=YES;
    _srsview.hidden=NO;
     _docuview.hidden=YES;
    
    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor whiteColor];
    _docubtnlbl.tintColor=[UIColor blackColor];


}

- (IBAction)docubtn:(id)sender {
    [self ContractDoumentselect];
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=YES;
    _smrview.hidden=YES;
    _othrratesview.hidden=YES;
    _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=NO;
    _paymntbtnlbl.tintColor=[UIColor blackColor];
    _vlumbtnlbl.tintColor=[UIColor blackColor];
    _lbrbtnlbl.tintColor=[UIColor blackColor];
    _equpbtnlbl.tintColor=[UIColor blackColor];
    _othrtrmsbtnlbl.tintColor=[UIColor blackColor];
    _markuptablebtnlbl.tintColor=[UIColor blackColor];
    _basewagebtnlbl.tintColor=[UIColor blackColor];
    _fueledbtnlbl.tintColor=[UIColor blackColor];
    _nonfuelbtnlbl.tintColor=[UIColor blackColor];
    _smrbtnlbl.tintColor=[UIColor blackColor];
    _othrratesbtnlbl.tintColor=[UIColor blackColor];
    _deliverybtnlbl.tintColor=[UIColor blackColor];
    _srabtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor whiteColor];


}


/*btn outlets*/
- (IBAction)overcheckbtn:(id)sender {
}

- (IBAction)minimumhrsbtn:(id)sender {
}

- (IBAction)holidaysbtn:(id)sender {
}
- (IBAction)conequpbtn:(id)sender {
}

- (IBAction)thirdequpbtn:(id)sender {
}
- (IBAction)shopcheckbtn:(id)sender {
}

- (IBAction)consublebtn:(id)sender {
}

- (IBAction)smalltoolbtn:(id)sender {
}
- (IBAction)selectmarkupbtn:(id)sender {
    [self createpopover];
}
- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)viewbtn:(id)sender {
}
@end
