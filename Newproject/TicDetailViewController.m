//
//  TicDetailViewController.m
//  Prodektive
//
//  Created by Riya on 2/25/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "TicDetailViewController.h"

@interface TicDetailViewController ()

@end

@implementation TicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
       _title1.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _title2.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.manpwrview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.otherview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];


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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _manpwrview.hidden=NO;
    _otherview.hidden=YES;
    _manpowerbtn.tintColor=[UIColor whiteColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    [self ReadmanpowerNew];
}
#pragma mark-Webservice
-(void)ReadmanpowerNew{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadmanpowerNew xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<PId>%@</PId>\n"
                   "<woid>%@</woid>\n"
                   "</ReadmanpowerNew>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorder];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadmanpowerNew" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ReadScaffoldEquipmentNew{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldEquipmentNew xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<PlanId>%@</PlanId>\n"
                   "<woid>%@</woid>\n"
                   "</ReadScaffoldEquipmentNew>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorder];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldEquipmentNew" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ReadScaffoldFleetNew{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldFleetNew xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<PlanId>%@</PlanId>\n"
                   "<woid>%@</woid>\n"
                   "</ReadScaffoldFleetNew>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorder];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldFleetNew" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldThirdPartyNew{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldThirdPartyNew xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<PlanId>%@</PlanId>\n"
                   "<woid>%@</woid>\n"
                   "</ReadScaffoldThirdPartyNew>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorder];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldThirdPartyNew" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldMaterialNew{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldMaterialNew xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<PlanId>%@</PlanId>\n"
                   "<woid>%@</woid>\n"
                   "</ReadScaffoldMaterialNew>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorder];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldMaterialNew" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldConsumeblesNew{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldConsumeblesNew xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<PlanId>%@</PlanId>\n"
                   "<woid>%@</woid>\n"
                   "</ReadScaffoldConsumeblesNew>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorder];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldConsumeblesNew" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldSmallToolsNew{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldSmallToolsNew xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<PlanId>%@</PlanId>\n"
                   "<woid>%@</woid>\n"
                   "</ReadScaffoldSmallToolsNew>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorder];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldSmallToolsNew" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldSafetyNew{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldSafetyNew xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<PlanId>%@</PlanId>\n"
                   "<woid>%@</woid>\n"
                   "</ReadScaffoldSafetyNew>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorder];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldSafetyNew" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReadScaffoldOthersNew{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReadScaffoldOthersNew xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<PlanId>%@</PlanId>\n"
                   "<woid>%@</woid>\n"
                   "</ReadScaffoldOthersNew>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid,_workorder];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://tools.prodektive.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReadScaffoldOthersNew" forHTTPHeaderField:@"Soapaction"];
    
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
     [_manpwertable reloadData];
    [_othertable reloadData];
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
      if([elementName isEqualToString:@"ReadmanpowerNewResponse"])
    {
        _manpwrarry=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"FirstName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LastName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"craft"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Present"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"isPresent"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldEquipmentNewResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"EntryIdeq"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"itemCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UsedQuantity"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"AllowedQuantity"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ResourceDesc"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"type"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ReadScaffoldMaterialNewResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdMt"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldFleetNewResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdft"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldConsumeblesNewResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdCon"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldSafetyNewResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdSM"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldOthersNewResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdOther"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReadScaffoldThirdPartyNewResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdtp"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ReadScaffoldSmallToolsNewResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryIdST"])
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
        _Manpwrmdl=[[TSManpwrmdl alloc]init];
        _Manpwrmdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FirstName"])
    {
        recordResults = FALSE;
        _Manpwrmdl.firstname=_soapResults;
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LastName"])
    {
        recordResults = FALSE;
        _Manpwrmdl.lastname=_soapResults;
        
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"craft"])
    {
        recordResults = FALSE;
        _Manpwrmdl.craft=_soapResults;
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"Present"])
    {
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"isPresent"])
    {
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            
            _Manpwrmdl.ispresent=@"1";
        }
        else{
            _Manpwrmdl.ispresent=@"0";
        }
        
        [_manpwrarry addObject:_Manpwrmdl];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"EntryIdeq"])
    {
        recordResults = FALSE;
        
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"itemCode"])
    {
        recordResults = FALSE;
        _Othermdl=[[TSOtherMdl alloc]init];
        _Othermdl.itemcode=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"UsedQuantity"])
    {
        recordResults = FALSE;
        _Othermdl.usedquantity=_soapResults;
        _soapResults = nil;
        
    }
    
    
    if([elementName isEqualToString:@"AllowedQuantity"])
    {
        recordResults = FALSE;
        _Othermdl.allowedquantity=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"ResourceDesc"])
    {
        recordResults = FALSE;
        _Othermdl.resurcedesc=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"type"])
    {
        recordResults = FALSE;
        _Othermdl.type=_soapResults;
        [_otherarray addObject:_Othermdl];
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"EntryIdMt"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryIdft"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryIdCon"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryIdSM"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryIdOther"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"EntryIdtp"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"EntryIdST"])
    {
        recordResults = FALSE;
        _Othermdl.entryid=_soapResults;
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
       if(tableView==_manpwertable){
        return [_manpwrarry count];
    }
    if(tableView==_othertable){
        return [_otherarray count];
    }
    
    return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        
        if(tableView==_manpwertable){
            [[NSBundle mainBundle]loadNibNamed:@"TcrewCell" owner:self options:nil];
            cell=_manpwrcell;
        }
        if(tableView==_othertable){
            [[NSBundle mainBundle]loadNibNamed:@"TiallCell" owner:self options:nil];
            cell=_othercell;
        }
        
        
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        if(tableView==_manpwertable){
        
        
        TSManpwrmdl*mdl=(TSManpwrmdl *)[_manpwrarry objectAtIndex:indexPath.row];
        
        
        if ([mdl.ispresent isEqualToString:@"1"]) {
            [_manCheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else{
            [_manCheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }
        _firstnamelbl=(UILabel*)[cell viewWithTag:2];
        _firstnamelbl.text=mdl.firstname;
        _lastnamelbl=(UILabel*)[cell viewWithTag:3];
        _lastnamelbl.text=mdl.lastname;
        
        _craftlbl=(UILabel*)[cell viewWithTag:4];
        _craftlbl.text=mdl.craft;
        
        
        
        
    }
    if(tableView==_othertable){
        
        
        TSOtherMdl*othrmdl=(TSOtherMdl *)[_otherarray objectAtIndex:indexPath.row];
        
        
        _Namelbl=(UILabel*)[cell viewWithTag:1];
        _Namelbl.text=othrmdl.itemcode;
        _quntyalloclbl=(UILabel*)[cell viewWithTag:2];
        _quntyalloclbl.text=othrmdl.allowedquantity;
        
        _quantyused=(UITextField*)[cell viewWithTag:3
                                   ];
        _quantyused.text=othrmdl.usedquantity;
        
        
        
        
    }
    
    
    
    
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


- (IBAction)clsebutn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)crewbtn:(id)sender {
    [self ReadmanpowerNew];
    _manpwrview.hidden=NO;
    _otherview.hidden=YES;
    _manpowerbtn.tintColor=[UIColor whiteColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)equipmntbtn:(id)sender {
    [self ReadScaffoldEquipmentNew];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor whiteColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)mtbtn:(id)sender {
    [self ReadScaffoldMaterialNew];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor whiteColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    

}

- (IBAction)ftbtn:(id)sender {
    [self ReadScaffoldFleetNew];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor whiteColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)tpbtn:(id)sender {
    [self ReadScaffoldThirdPartyNew];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor whiteColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)cobtn:(id)sender {
    [self ReadScaffoldConsumeblesNew];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor whiteColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)smbtn:(id)sender {
    [self ReadScaffoldSmallToolsNew];
    
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor whiteColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
}
- (IBAction)sfbtn:(id)sender {
    [self ReadScaffoldSafetyNew];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor whiteColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];

}

- (IBAction)ocbtn:(id)sender {
    
    [self ReadScaffoldOthersNew];
    _manpwrview.hidden=YES;
    _otherview.hidden=NO;
    
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor whiteColor];

}
- (IBAction)mancheckbtn:(id)sender{
    
//    btnidf++;
//    if (btnidf%2==0)
//        
//        
//    {
//        
//        [_manCheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//        
//        
//        
//        
//        
//    }
//    else
//    {
//        [_manCheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        
//    }

}
@end
