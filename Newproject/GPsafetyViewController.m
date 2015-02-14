//
//  GPsafetyViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 14/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "GPsafetyViewController.h"

@interface GPsafetyViewController ()

@end

@implementation GPsafetyViewController
#define kCellHeight 44
#define kNavBarHeight 30

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _touchview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _Secondsafetyttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _Secondsafetyttable.layer.borderWidth=3.0f;
    _firstsafetytable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _firstsafetytable.layer.borderWidth=2.0f;
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=self;
    [self.touchview addGestureRecognizer:panGesture];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_saftygpbtn setTitle:@"Select" forState:UIControlStateNormal];
    [_servicebtn setTitle:@"Select" forState:UIControlStateNormal];
    
    [self setupSourceTableWithFrame:CGRectMake(0, 0, 266,610)];
    [self setupDestinationTableWithFrame:CGRectMake(0, 0, 460, 533)];
    [self AllSkills];
}
#pragma mark UIGestureRecognizer

- (void)handlePanning:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch ([gestureRecognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self startDragging:gestureRecognizer];
            break;
        case UIGestureRecognizerStateChanged:
            [self doDrag:gestureRecognizer];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self stopDragging:gestureRecognizer];
            break;
        default:
            break;
    }
}
- (void)initDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_firstsafetytable indexPathForRowAtPoint:point];
    //UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    // get rid of old cell, if it wasn't disposed already
    if(draggedCell != nil)
    {
        [draggedCell removeFromSuperview];
        // [draggedCell release];
        draggedCell = nil;
    }
    CGRect frame;
    if(point.y>=489){
        
        frame= CGRectMake(point.x, 250, cell.frame.size.width-5, cell.frame.size.height-10);
    }
    else{
        frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    }
    
    //CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    
    draggedCell = [[UITableViewCell alloc] init];
    draggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
    Manpwr*mmodel=(Manpwr *)[_firstsafetyarray objectAtIndex:indexPath.row];
    draggedCell.textLabel.text =mmodel.itemcode;
    draggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    draggedCell.textLabel.textColor = cell.textLabel.textColor;
    draggedCell.highlighted = YES;
    draggedCell.frame = frame;
    draggedCell.alpha = 0.8;
    
    [self.touchview addSubview:draggedCell];
}
#pragma mark Helper methods for dragging

- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    
    CGPoint pointInSrc = [gestureRecognizer locationInView:_firstsafetytable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_Secondsafetyttable];
    
    if([_firstsafetytable pointInside:pointInSrc withEvent:nil])
    {
        [self startDraggingFromSrcAtPoint:pointInSrc];
        dragFromSource = YES;
    }
    else if([_Secondsafetyttable pointInside:pointInDst withEvent:nil])
    {
        //[self startDraggingFromDstAtPoint:pointInDst];
        dragFromSource = NO;
    }
    
}

- (void)startDraggingFromSrcAtPoint:(CGPoint)point
{
    
    if ([_saftygpbtn.titleLabel.text isEqualToString:@"Select"]) {
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select Group Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{
        
        NSIndexPath* indexPath = [_firstsafetytable indexPathForRowAtPoint:point];
        UITableViewCell* cell = [_firstsafetytable cellForRowAtIndexPath:indexPath];
        
        if(cell != nil)
        {
            CGPoint origin = cell.frame.origin;
            origin.x += _firstsafetytable.frame.origin.x;
            origin.y += _firstsafetytable.frame.origin.y;
            
            [self initDraggedCellWithCell:cell AtPoint:origin];
            cell.highlighted = NO;
            
            if(draggedData != nil)
            {
                //[draggedData release];
                draggedData = nil;
            }
            
            crewpath=indexPath.row;
            
           Manpwr*mmodel=(Manpwr *)[_firstsafetyarray objectAtIndex:indexPath.row];
            
            draggedData = mmodel.itemcode;
            NSLog(@"%@",mmodel.itemdescptn);
        }
    }
    
}
- (void)doDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(draggedCell != nil && draggedData != nil)
    {
        CGPoint translation = [gestureRecognizer translationInView:[draggedCell superview]];
        [draggedCell setCenter:CGPointMake([draggedCell center].x + translation.x,
                                           [draggedCell center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[draggedCell superview]];
    }
}

- (void)stopDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
   // _existingstring=@"";
    if(draggedCell != nil && draggedData != nil)
    {
        
        
        
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_Secondsafetyttable indexPathForRowAtPoint:[gestureRecognizer locationInView:_Secondsafetyttable]];
            if(indexPath != nil)
            {
                Crewmodel *crewmdl1=(Crewmodel *)[_secsafetyarray objectAtIndex:indexPath.row];
                crewmdl1.manpower=draggedData;
                [_secsafetyarray addObject:crewmdl1];
                
                //  [_crewmembersarray insertObject:draggedData atIndex:indexPath.row];
                [_Secondsafetyttable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
                //[self UserLogcrewMove];
                //                Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
                //
                //                if (rightsmodel.EditModule==0) {
                //
                //                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to drag this item" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                //                    [alert show];
                //                }
                //                else
                //                {
                //
                
        ////        [self Othercrewinsert];
                //}
                
            }
            else
            {
                if ([_secsafetyarray count]==0) {
                    Crewmodel *crewmdl1=[[Crewmodel alloc]init];
                    crewmdl1.manpower=draggedData;
                    [_secsafetyarray addObject:crewmdl1];
                    
                }
                else{
                    Crewmodel *crewmdl1=(Crewmodel *)[_secsafetyarray objectAtIndex:indexPath.row];
                    crewmdl1.manpower=draggedData;
                    [_secsafetyarray addObject:crewmdl1];
                }
                //[self UserLogcrewMove];
                //                Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
                //
                //                if (rightsmodel.EditModule==0) {
                //
                //                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to drag this item" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                //                    [alert show];
                //                }
                //                else
                //                {
                
                
        ////  [self Othercrewinsert];
                //}
            }
        }
        else if(!dragFromSource && pathFromDstTable != nil)
        {
            // insert cell back where it came from
            [_secsafetyarray insertObject:draggedData atIndex:pathFromDstTable.row];
            [_Secondsafetyttable insertRowsAtIndexPaths:[NSArray arrayWithObject:pathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            pathFromDstTable = nil;
        }
        if ([_existingstring isEqualToString:@"This Safety material is  Already Exists"]) {
            [draggedCell removeFromSuperview];
            //[draggedCell release];
            draggedCell = nil;
            
            //[draggedData release];
            draggedData = nil;
        }
        else
        {
            
            [UIView animateWithDuration:0.3 animations:^
             {
                 CGRect frame = _Secondsafetyttable.frame;
                 //frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
                 _Secondsafetyttable.frame = frame;
             }];
            
            [draggedCell removeFromSuperview];
            //[draggedCell release];
            draggedCell = nil;
            
            //[draggedData release];
            draggedData = nil;
        }
    }
}


#pragma mark Helper methods for initialization

- (void)setupSourceTableWithFrame:(CGRect)frame
{
    
    [self.touchview addSubview:_firstsafetytable];
}
- (void)setupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect dropAreaFrame = frame;
    dropAreaFrame.origin.y = kNavBarHeight;
    dropAreaFrame.size.height -= kNavBarHeight;
    
    dropArea = [[UIView alloc] initWithFrame:CGRectMake(540, 30, 460, 700)];
    [dropArea setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]];
    [self.touchview addSubview:dropArea];
    
    CGRect contentFrame = dropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    dropAreaLabel.backgroundColor = [UIColor clearColor];
    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
    dropAreaLabel.textColor = [UIColor whiteColor];
    // dropAreaLabel.text = @"Drop items here...";
    [dropArea addSubview:dropAreaLabel];
    
    [dropArea addSubview:_Secondsafetyttable];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)safetygpselection:(id)sender {
    poptype=2;
    
    [self grouppopover];
}

- (IBAction)deletesafetygpaction:(id)sender {
}

- (IBAction)deleteallsafetyitems:(id)sender {
}

- (IBAction)deletesafetysingleitem:(id)sender {
}

- (IBAction)closesafetyform:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)createsafetygp:(id)sender {
}

- (IBAction)serviceselection:(id)sender {
    poptype=1;
    [self createpopover];
}
#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 250.0f);
    self.popOverController=_popOverController;
    
    
    
    [self.popOverController presentPopoverFromRect:_servicebtn.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}
-(void)grouppopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 250.0f);
    self.popOverController=_popOverController;
    
    
    
    
    [self.popOverController presentPopoverFromRect:_saftygpbtn.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}



#pragma mark-Webservices
-(void)AllSkills
{
    
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
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
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
    if (webpath==1) {
        [_firstsafetytable reloadData];
        webpath=0;
    }
    
    if (webpath==2) {
        [_Secondsafetyttable reloadData];
        
    }
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    if([elementName isEqualToString:@"AllSkillsResult"])
    {
        _servicedict=[[NSMutableDictionary alloc]init];
        _Servicelistarray=[[NSMutableArray alloc]init];
        //_revskilldict=[[NSMutableDictionary alloc]init];
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
    
    if([elementName isEqualToString:@"SkillId"])
    {
        recordResults = FALSE;
        skill=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SkillName"])
    {        recordResults =FALSE;
        
        [_servicedict setObject:skill forKey:_soapResults];
        
        [_Servicelistarray addObject:_soapResults];
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
        switch (poptype) {
            case 1:
                return [_Servicelistarray count];
                break;
            case 2:
                return [_gplistarray count];
                break;
                
            default:
                break;
        }
        
        
        
        
    }
    
    if (tableView==_firstsafetytable) {
        return [_firstsafetyarray count];
        
        
    }
    if (tableView==_Secondsafetyttable) {
        
        return [_secsafetyarray count];
        
    }
    
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_firstsafetytable) {
            [[NSBundle mainBundle]loadNibNamed:@"FSafe" owner:self options:nil];
            cell=_firstcell;
            
        }
        if (tableView==_Secondsafetyttable) {
            [[NSBundle mainBundle]loadNibNamed:@"Ssafe" owner:self options:nil];
            
            cell=_seccell;
        }
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
    
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                cell.textLabel.text = [_Servicelistarray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text = [_gplistarray objectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
        
        
        
        
    }
    
    
    if (tableView==_firstsafetytable) {
  //      Manpwr *manpwr=(Manpwr *)[_firstsafetyarray objectAtIndex:indexPath.row];
//        _materialitemlabel=(UILabel *)[cell viewWithTag:1];
//        _materialitemlabel.text=manpwr.itemcode;
//        UITapGestureRecognizer *tapGesture =
//        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)];
//        [_materialitemlabel addGestureRecognizer:tapGesture];
//        
//        _matdesclabel=(UILabel *)[cell viewWithTag:2];
//        _matdesclabel.text=manpwr.itemdescptn;
//        _hourlylabel=(UILabel *)[cell viewWithTag:3];
//        _hourlylabel.text=[NSString stringWithFormat:@"$%@",manpwr.unitcost];
        
        
    }
    
    if (tableView==_Secondsafetyttable) {
        
   //     Crewmodel *crewmdl1=(Crewmodel *)[_secsafetyarray objectAtIndex:indexPath.row];
//        _crewitemlabel=(UILabel *)[cell viewWithTag:1];
//        _crewitemlabel.text=crewmdl1.manpower;
//        UITapGestureRecognizer *tapGesture =
//        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap1:)];
//        [_crewitemlabel addGestureRecognizer:tapGesture];
//        
//        
//        _crewdesclabel=(UILabel *)[cell viewWithTag:2];
//        _crewdesclabel.text=crewmdl1.mandescptn;
//        _crewnamelabel=(UILabel *)[cell viewWithTag:3];
//        
//        
//        _crewnamelabel.text=crewmdl1.crewname;
        
        
    }
    return cell;
}
#pragma mark UITableViewDelegate methods
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_Secondsafetyttable) {
        
        if (editingStyle==UITableViewCellEditingStyleDelete) {
            deletepath=indexPath.row;
            
            //[self OtherCrewdelete];
            [_secsafetyarray removeObject:indexPath];
            
            
        }
        
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_firstsafetytable||tableView==_Secondsafetyttable)
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                
                [_servicebtn setTitle:[_Servicelistarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                //[self CrewOtherSelect];
                
                break;
            case 2:
                
              //  [_saftygpbtn setTitle:[_gplistarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
               // [self OtherCrewNameSelect];
                
                break;
                
            default:
                break;
        }
        
        [self.popOverController dismissPopoverAnimated:YES];
        
        
        
    }
    
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_firstsafetytable||tableView==_popOverTableView)
        
    {
        return self.editing ;
    }
    return YES;
    
}



@end
