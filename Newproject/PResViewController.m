//
//  PResViewController.m
//  Prodektive
//
//  Created by Riya on 2/18/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "PResViewController.h"

@interface PResViewController ()

@end

@implementation PResViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    //_titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    self.crewview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.resurceview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
//    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
//    panGesture.delegate=self;
//    [self.dropview addGestureRecognizer:panGesture];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _crewbtnlbl.tintColor=[UIColor whiteColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    
    //[self setupSourceTableWithFrame:CGRectMake(0, 0, 384,489)];
   // [self setupDestinationTableWithFrame:CGRectMake(0, 0, 460, 493)];

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
    return 6;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if(tableView==_crewdroptable){
            [[NSBundle mainBundle]loadNibNamed:@"CrewDropCell" owner:self options:nil];
            cell=_crewdropcell;
        }
        if(tableView==_resurcetable){
              [[NSBundle mainBundle]loadNibNamed:@"ResurceDragCell" owner:self options:nil];
              cell=_Resourcedragcell;
        }
        if(tableView==_resurcedroptable){
              [[NSBundle mainBundle]loadNibNamed:@"ResourceDropCell" owner:self options:nil];
            cell=_resourcedropcell;
            
        }

        
        
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    
    
    
    return cell;
}

//#pragma mark -
//#pragma mark UIGestureRecognizer
//
//- (void)handlePanning:(UIPanGestureRecognizer *)gestureRecognizer
//{
//    switch ([gestureRecognizer state]) {
//        case UIGestureRecognizerStateBegan:
//            [self startDragging:gestureRecognizer];
//            break;
//        case UIGestureRecognizerStateChanged:
//            [self doDrag:gestureRecognizer];
//            break;
//        case UIGestureRecognizerStateEnded:
//        case UIGestureRecognizerStateCancelled:
//        case UIGestureRecognizerStateFailed:
//            [self stopDragging:gestureRecognizer];
//            break;
//        default:
//            break;
//    }
//}




//#pragma mark -
//#pragma mark Helper methods for initialization
//
//- (void)setupSourceTableWithFrame:(CGRect)frame
//{
//    
//    [self.touchview addSubview:_manpwrtable];
//}
//
//- (void)setupDestinationTableWithFrame:(CGRect)frame
//{
//    
//    CGRect dropAreaFrame = frame;
//    dropAreaFrame.origin.y = kNavBarHeight;
//    dropAreaFrame.size.height -= kNavBarHeight;
//    
//    dropArea = [[UIView alloc] initWithFrame:CGRectMake(540, 30, 460, 700)];
//    [dropArea setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]];
//    [self.touchview addSubview:dropArea];
//    
//    CGRect contentFrame = dropAreaFrame;
//    contentFrame.origin = CGPointMake(0, 0);
//    
//    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
//    dropAreaLabel.backgroundColor = [UIColor clearColor];
//    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
//    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
//    dropAreaLabel.textColor = [UIColor whiteColor];
//    // dropAreaLabel.text = @"Drop items here...";
//    [dropArea addSubview:dropAreaLabel];
//    
//    [dropArea addSubview:_crewnametable];
//    
//}
//
//- (void)initDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
//{
//    NSIndexPath* indexPath = [_manpwrtable indexPathForRowAtPoint:point];
//    //UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
//    // get rid of old cell, if it wasn't disposed already
//    if(draggedCell != nil)
//    {
//        [draggedCell removeFromSuperview];
//        // [draggedCell release];
//        draggedCell = nil;
//    }
//    
//    //CGRect frame = CGRectMake(20, 250, cell.frame.size.width-5, cell.frame.size.height-10);
//    CGRect frame;
//    if(point.y>=489){
//        
//        frame= CGRectMake(point.x, 250, cell.frame.size.width-5, cell.frame.size.height-10);
//    }
//    else{
//        frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
//    }
//    
//    
//    draggedCell = [[UITableViewCell alloc] init];
//    draggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
//    //Manpwr*manmdl1=(Manpwr *)[_manpwrarray objectAtIndex:indexPath.row];
//    draggedCell.textLabel.text =manmdl1.itemcode;
//    draggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
//    
//    draggedCell.textLabel.textColor = cell.textLabel.textColor;
//    draggedCell.highlighted = YES;
//    draggedCell.frame = frame;
//    draggedCell.alpha = 0.8;
//    
//    [self.touchview addSubview:draggedCell];
//}
//
//
//#pragma mark Helper methods for dragging
//
//- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
//{
//    
//    
//    CGPoint pointInSrc = [gestureRecognizer locationInView:_manpwrtable];
//    CGPoint pointInDst = [gestureRecognizer locationInView:_crewnametable];
//    
//    if([_manpwrtable pointInside:pointInSrc withEvent:nil])
//    {
//        [self startDraggingFromSrcAtPoint:pointInSrc];
//        dragFromSource = YES;
//    }
//    else if([_crewnametable pointInside:pointInDst withEvent:nil])
//    {
//        //[self startDraggingFromDstAtPoint:pointInDst];
//        dragFromSource = NO;
//    }
//    
//}
//
//- (void)startDraggingFromSrcAtPoint:(CGPoint)point{
//    
//    if ([_crewbtnlbl.titleLabel.text isEqualToString:@"Select"]) {
//        
//        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select Crew Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//        
//    }
//    else{
//        
//        NSIndexPath* indexPath = [_manpwrtable indexPathForRowAtPoint:point];
//        UITableViewCell* cell = [_manpwrtable cellForRowAtIndexPath:indexPath];
//        
//        if(cell != nil)
//        {
//            CGPoint origin = cell.frame.origin;
//            origin.x += _manpwrtable.frame.origin.x;
//            origin.y += _manpwrtable.frame.origin.y-2;
//            // origin.y += 100;
//            
//            [self initDraggedCellWithCell:cell AtPoint:origin];
//            cell.highlighted = NO;
//            
//            if(draggedData != nil)
//            {
//                //[draggedData release];
//                draggedData = nil;
//            }
//            
//            crewpath=indexPath.row;
//            
//            Manpwr*manmdl1=(Manpwr *)[_manpwrarray objectAtIndex:crewpath];
//            
//            draggedData = manmdl1.itemcode;
//            NSLog(@"%@",manmdl1.itemdescptn);
//        }
//    }
//    
//}
//
//- (void)startDraggingFromDstAtPoint:(CGPoint)point
//{
//    
//    NSIndexPath* indexPath = [_crewnametable indexPathForRowAtPoint:point];
//    UITableViewCell* cell = [_crewnametable cellForRowAtIndexPath:indexPath];
//    if(cell != nil)
//    {
//        CGPoint origin = cell.frame.origin;
//        origin.x += dropArea.frame.origin.x;
//        origin.y += dropArea.frame.origin.y;
//        
//        [self initDraggedCellWithCell:cell AtPoint:origin];
//        cell.highlighted = NO;
//        
//        if(draggedData != nil)
//        {
//            //[draggedData release];
//            draggedData = nil;
//        }
//        Manpwr*manmdl1=(Manpwr *)[_manpwrarray objectAtIndex:indexPath.row];
//        draggedData = manmdl1.itemcode;
//        
//        // remove old cell
//        [_crewmembersarray removeObjectAtIndex:indexPath.row];
//        [_crewnametable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
//        pathFromDstTable = indexPath;
//        
//        [UIView animateWithDuration:0.2 animations:^
//         {
//             CGRect frame = _crewnametable.frame;
//             //frame.size.height = kCellHeight * [dstData count];
//             _crewnametable.frame = frame;
//         }];
//        
//    }
//    
//    
//}
//
//- (void)doDrag:(UIPanGestureRecognizer *)gestureRecognizer
//{
//    if(draggedCell != nil && draggedData != nil)
//    {
//        CGPoint translation = [gestureRecognizer translationInView:[draggedCell superview]];
//        [draggedCell setCenter:CGPointMake([draggedCell center].x + translation.x,
//                                           [draggedCell center].y + translation.y)];
//        [gestureRecognizer setTranslation:CGPointZero inView:[draggedCell superview]];
//    }
//}
//
//- (void)stopDragging:(UIPanGestureRecognizer *)gestureRecognizer
//{
//    _existstring=@"";
//    if(draggedCell != nil && draggedData != nil)
//    {
//        
//        //NSLog(@"%d",[gestureRecognizer state]);
//        //NSLog(@"%hhd",[dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil]);
//        
//        
//        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
//           && [dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil])
//        {
//            NSIndexPath* indexPath = [_crewnametable indexPathForRowAtPoint:[gestureRecognizer locationInView:_crewnametable]];
//            if(indexPath != nil)
//            {
//                
//                Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
//                crewmdl1.manpower=draggedData;
//                [_crewmembersarray addObject:crewmdl1];
//                
//                //  [_crewmembersarray insertObject:draggedData atIndex:indexPath.row];
//                [_crewnametable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
//                [self UserLogcrewMove];
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
//                    
//                    [self crewinsert];
//                }
//                
//            }
//            else
//            {
//                if ([_crewmembersarray count]==0) {
//                    Crewmodel *crewmdl1=[[Crewmodel alloc]init];
//                    crewmdl1.manpower=draggedData;
//                    [_crewmembersarray addObject:crewmdl1];
//                    
//                }
//                else{
//                    
//                    Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
//                    crewmdl1.manpower=draggedData;
//                    [_crewmembersarray addObject:crewmdl1];
//                }
//                [self UserLogcrewMove];
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
//                    
//                    [self crewinsert];
//                }
//            }
//        }
//        else if(!dragFromSource && pathFromDstTable != nil)
//        {
//            // insert cell back where it came from
//            [_crewmembersarray insertObject:draggedData atIndex:pathFromDstTable.row];
//            [_crewnametable insertRowsAtIndexPaths:[NSArray arrayWithObject:pathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
//            
//            //[pathFromDstTable release];
//            pathFromDstTable = nil;
//        }
//        if ([_existstring isEqualToString:@"This Man Power is  Already Exists"]) {
//            
//            [draggedCell removeFromSuperview];
//            //[draggedCell release];
//            draggedCell = nil;
//            
//            //[draggedData release];
//            draggedData = nil;
//        }
//        
//        else
//        {
//            
//            [UIView animateWithDuration:0.3 animations:^
//             {
//                 CGRect frame = _crewnametable.frame;
//                 //frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
//                 _crewnametable.frame = frame;
//             }];
//            
//            [draggedCell removeFromSuperview];
//            //[draggedCell release];
//            draggedCell = nil;
//            
//            //[draggedData release];
//            draggedData = nil;
//        }
//    }
//}
//
//

#pragma mark-button Action
- (IBAction)closeresources:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)resucebt:(id)sender {
    
    
   
}

- (IBAction)crewdeletebtn:(id)sender {
    
}






- (IBAction)crewbtn:(id)sender {
    
     _crewview.hidden=NO;
    _resurceview.hidden=YES;
    
    _crewbtnlbl.tintColor=[UIColor whiteColor];
    _manpowerbtn.tintColor=[UIColor blackColor];
    
    _equmntbutnlbl.tintColor=[UIColor blackColor];
    _materialsbtnlbl.tintColor=[UIColor blackColor];
    _fleetbtnlbl.tintColor=[UIColor blackColor];
    _thirdpartybtnlbl.tintColor=[UIColor blackColor];
    _consumblebtnlbl.tintColor=[UIColor blackColor];
    _smallbtnlbl.tintColor=[UIColor blackColor];
    _safetybtnlbl.tintColor=[UIColor blackColor];
    _otherbtnlbl.tintColor=[UIColor blackColor];
    
}

- (IBAction)manbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
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

- (IBAction)equbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
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

- (IBAction)matbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    
    _crewbtnlbl.tintColor=[UIColor blackColor];
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

- (IBAction)fleetbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
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

- (IBAction)thirdbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
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

- (IBAction)consubtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
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

- (IBAction)Smallbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
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

- (IBAction)Safetybtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
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

- (IBAction)othersbtn:(id)sender {
    _crewview.hidden=YES;
    _resurceview.hidden=NO;
    _crewbtnlbl.tintColor=[UIColor blackColor];
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
@end
