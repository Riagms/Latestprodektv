//
//  DPCalendarMonthlyCell.h
//  DPCalendar
//
//  Created by Ethan Fang on 19/12/13.
//  Copyright (c) 2013 Ethan Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPCalendarMonthlyCell.h"
#import "DateTable.h"

typedef enum
{
    DPCalendarMonthlyViewEventDrawingStyleUnderline,
    DPCalendarMonthlyViewEventDrawingStyleBar,
    DPCalendarMonthlyViewEventDrawingStyleButton
} DPCalendarMonthlyViewEventDrawingStyle;

@interface DPCalendarMonthlySingleMonthCell : DPCalendarMonthlyCell

-(void) setDate:(NSDate *)date calendar:(NSCalendar *)calendar events:(NSArray *)events iconEvents:(NSArray *)iconEvents;
-(void)selectoneevent;

@property (nonatomic) NSDate *firstVisiableDateOfMonth;
@property (nonatomic) BOOL isInSameMonth;

@property (nonatomic, strong) UIColor *todayBannerBkgColor;

@property (nonatomic, strong) UIFont *dayFont;
@property (nonatomic, strong) UIColor *dayTextColor;
@property (nonatomic, strong) UIFont *eventFont;
@property (nonatomic) CGFloat rowHeight;
@property (nonatomic, strong) NSArray *eventColors;
@property (nonatomic, strong) UIFont *iconEventFont;
@property (nonatomic, strong) NSArray *iconEventBkgColors;

@property (nonatomic, strong) UIColor *noInSameMonthColor;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *highlightedColor;

@property (nonatomic) DPCalendarMonthlyViewEventDrawingStyle eventDrawingStyle;

@property (nonatomic, setter = setIsPreviousSelectedCell:) BOOL isPreviousSelectedCell;
@end
