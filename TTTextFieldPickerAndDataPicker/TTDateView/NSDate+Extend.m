//
//  NSDate+Extend.m
//  BCMSystem
//
//  Created by ccg on 14-4-18.
//  Copyright (c) 2014年 mobisoft. All rights reserved.
//

#import "NSDate+Extend.h"

@implementation NSDate (Extend)

+(NSString *)prettyDateWithReference:(NSInteger)timecuo{
    
    NSInteger currenttime=[NSDate GetCureentTimestamp];//获取当前时间错
    NSString* str=@"显示时间";
    NSInteger timecha=currenttime-timecuo;//时间差
    if(currenttime-timecuo<60)
    {
        str=@"刚刚";
    }else if (timecha>=60 && timecha<=60*60)
    {
        str=[NSString stringWithFormat:@"%ld分钟前",timecha/60];
    }else if ( timecha>=60*60 && timecuo<=60*60*24)
     {
         str=[NSString stringWithFormat:@"%ld小时前",timecha/60/60];
     }else if ( timecha>=60*60*24 && timecuo<=60*60*24*2)
     {
         str=@"1天前";
     }else{
         str=[NSDate CureentTimeTransformationDateTimestamp:timecuo dateFormatter:@"yyyy-MM-dd"];
     }  
    return str;
}


#pragma mark - Custom Method

// 获取年月日如:19871127.
- (NSString *)getFormatYearMonthDay
{
    NSString *string = [NSString stringWithFormat:@"%lu%02lu%02lu",(unsigned long)[self getYear],(unsigned long)[self getMonth],(unsigned long)[self getDay]];
    return string;
}

// 该日期是该年的第几周
- (int )getWeekOfYear
{
    int i;
    int year = (int)[self getYear];
    NSDate *date = [self endOfWeek];
    for (i = 1;[[date dateAfterDay:-7 * i] getYear] == year;i++)
    {
    }
    return i;
}

// 两个日期之间的天数
- (NSUInteger)dateStartDay:(NSDate *)startDay endDay:(NSDate *)endDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:startDay  toDate:endDay  options:0];
    int days = (int)[comps day];
    return days;
}

// 返回day天后的日期(若day为负数,则为|day|天前的日期)
- (NSDate *)dateAfterDay:(int)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    // NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:day];
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    
    return dateAfterDay;
}

#pragma mark 获取day天以前的日期
- (NSDate *)dateBeforeDay:(int)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [components setDay:([components day] - day)];
    
    NSDate *dateBefore = [calendar dateFromComponents:components];
    return dateBefore;
}

#pragma mark 返回week周之前的日期
- (NSDate *)dateBeforeWeek:(int)week
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [components setDay:([components day] - 7 * week)];
    NSDate *dateBefore = [calendar dateFromComponents:components];
    return dateBefore;
}

#pragma mark 返回month月之前的日期
- (NSDate *)dateBeforeMonth:(int)month
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [components setMonth:([components month] - month)];
    NSDate *dateBefore = [calendar dateFromComponents:components];
    return dateBefore;
}
#pragma mark 返回year年之前的日期
- (NSDate *)dateBeforeYear:(int)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [components setYear:([components year] - year)];
    NSDate *dateBefore = [calendar dateFromComponents:components];
    return dateBefore;
}
#pragma mark 返回month月的第一天
+ (NSDate *)date1stDayOfBeforeMonth:(int)month
{
    NSDate *date = [self dateLastDayOfBeforeMonth:month];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    [components setDay: ([components day] - [components day] + 1 ) ];
    
    NSDate *dateBefore = [calendar dateFromComponents:components];
    return dateBefore;
}

#pragma mark 返回month月的最后一天
+ (NSDate *)dateLastDayOfBeforeMonth:(int)month
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[[NSDate alloc] init]];
    [components setMonth:([components month] - month + 1)];
    [components setDay: ([components day] - [components day]  ) ];
    NSDate *dateBefore = [calendar dateFromComponents:components];
    return dateBefore;
}




// month个月后的日期
- (NSDate *)dateafterMonth:(int)month
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    
    return dateAfterMonth;
}

// 获取日
- (NSUInteger)getDay{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:self];
    return [dayComponents day];
    
}

// 获取月
- (NSUInteger)getMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:self];
    return [dayComponents month];
}

// 获取年
- (NSUInteger)getYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:self];
    return [dayComponents year];
}

// 获取小时
- (int )getHour {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self];
    NSInteger hour = [components hour];
    return (int)hour;
}

// 获取分钟
- (int)getMinute {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute;
    NSDateComponents *components = [calendar components:unitFlags fromDate:self];
    NSInteger minute = [components minute];
    return (int)minute;
}

// 在当前日期前几天
- (NSUInteger)daysAgo {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components day];
}

// 午夜时间距今几天
- (NSUInteger)daysAgoAgainstMidnight {
    // get a midnight version of ourself:
    NSDateFormatter *mdf = [[NSDateFormatter alloc] init];
    [mdf setDateFormat:@"yyyy-MM-dd"];
    NSDate *midnight = [mdf dateFromString:[mdf stringFromDate:self]];
    
    return (int)[midnight timeIntervalSinceNow] / (60*60*24) *-1;
}

- (NSString *)stringDaysAgo {
    return [self stringDaysAgoAgainstMidnight:YES];
}

- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag {
    NSUInteger daysAgo = (flag) ? [self daysAgoAgainstMidnight] : [self daysAgo];
    NSString *text = nil;
    switch (daysAgo) {
        case 0:
            text = @"Today";
            break;
        case 1:
            text = @"Yesterday";
            break;
        default:
            text = [NSString stringWithFormat:@"%lu days ago", (unsigned long)daysAgo];
    }
    return text;
}

// 返回一周的第几天(周末为第一天)
- (NSUInteger)getWeekday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitWeekday) fromDate:self];
    return [weekdayComponents weekday];
}
// 返回星期几的字符串
- (NSString *)getWeekString
{
    switch ([self getWeekday]) {
        case 1:
            return @"星期日";
        case 2:
            return @"星期一";
        case 3:
            return @"星期二";
        case 4:
            return @"星期三";
        case 5:
            return @"星期四";
        case 6:
            return @"星期五";
        case 7:
            return @"星期六";
            
    }
    return nil;
}
// 返回周日的的开始时间
- (NSDate *)beginningOfWeek {
    // largely borrowed from "Date and Time Programming Guide for Cocoa"
    // we'll use the default calendar and hope for the best
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *beginningOfWeek = nil;
    //    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitWeekday startDate:&beginningOfWeek
    //                           interval:NULL forDate:self];
    //    if (ok) {
    //        return beginningOfWeek;
    //    }
    
    // couldn't calc via range, so try to grab Sunday, assuming gregorian style
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    
    /*
     Create a date components to represent the number of days to subtract from the current date.
     The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today's Sunday, subtract 0 days.)
     */
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
    beginningOfWeek = nil;
    beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
    
    //normalize to midnight, extract the year, month, and day components and create a new date from those components.
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                                               fromDate:beginningOfWeek];
    return [calendar dateFromComponents:components];
}

// 返回当前天的开始时间.
- (NSDate *)beginningOfDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)  fromDate:self];
    return [calendar dateFromComponents:components];
}

// 返回该月的第一天
- (NSDate *)beginningOfMonth
{
    return [self dateAfterDay:-(int)[self getDay] + 1];
}
// 该月的最后一天
- (NSDate *)endOfMonth
{
    return [[[self beginningOfMonth] dateafterMonth:1] dateAfterDay:-1];
}
// 返回当前周的周末
- (NSDate *)endOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:(7 - [weekdayComponents weekday])];
    NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    
    return endOfWeek;
}

#pragma mark - NSDate Format

// 转为NSString类型的
+ (NSDate *)dateFromString:(NSString *)string {
    return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    
//    if(isEmptyOrNULL(string))
//    {
//        date=[NSDate date];
//    }
    
    NSDate* newdate= [NSDate dateWithTimeIntervalSince1970:[date timeIntervalSince1970]-7*3600] ;
    
    return newdate;
}

#pragma mark-不加8小时的
+ (NSDate *)dateNoFromString:(NSString *)string withFormat:(NSString *)format
{
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
//    
//    if(isEmptyOrNULL(string))
//    {
//        date=[NSDate date];
//    }
    
    NSDate* newdate= [NSDate dateWithTimeIntervalSince1970:[date timeIntervalSince1970]] ;
    
    return newdate;
}




+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    return [date stringWithFormat:format];
}

+ (NSString *)stringFromDate:(NSDate *)date {
    return [date string];
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed {
    /*
     * if the date is in today, display 12-hour time with meridian,
     * if it is within the last 7 days, display weekday name (Friday)
     * if within the calendar year, display as Jan 23
     * else display as Nov 11, 2008
     */
    
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                                                     fromDate:today];
    
    NSDate *midnight = [calendar dateFromComponents:offsetComponents];
    
    NSDateFormatter *displayFormatter = [[NSDateFormatter alloc] init];
    NSString *displayString = nil;
    
    // comparing against midnight
    if ([date compare:midnight] == NSOrderedDescending) {
        if (prefixed) {
            [displayFormatter setDateFormat:@"'at' h:mm a"]; // at 11:30 am
        } else {
            [displayFormatter setDateFormat:@"h:mm a"]; // 11:30 am
        }
    } else {
        // check if date is within last 7 days
        NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
        [componentsToSubtract setDay:-7];
        NSDate *lastweek = [calendar dateByAddingComponents:componentsToSubtract toDate:today options:0];
        if ([date compare:lastweek] == NSOrderedDescending) {
            [displayFormatter setDateFormat:@"EEEE"]; // Tuesday
        } else {
            // check if same calendar year
            NSInteger thisYear = [offsetComponents year];
            
            NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
                                                           fromDate:date];
            NSInteger thatYear = [dateComponents year];
            if (thatYear >= thisYear) {
                [displayFormatter setDateFormat:@"MMM d"];
            } else {
                [displayFormatter setDateFormat:@"MMM d, yyyy"];
            }
        }
        if (prefixed) {
            NSString *dateFormat = [displayFormatter dateFormat];
            NSString *prefix = @"'on' ";
            [displayFormatter setDateFormat:[prefix stringByAppendingString:dateFormat]];
        }
    }
    
    // use display formatter to return formatted date string
    displayString = [displayFormatter stringFromDate:date];
    return displayString;
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date {
    return [self stringForDisplayFromDate:date prefixed:NO];
}
//yyyy-MM-dd
- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    NSString *timestamp_str = [outputFormatter stringFromDate:self];
    return timestamp_str;
}

- (NSString *)string {
    return [self stringWithFormat:[NSDate dbFormatString]];
}

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateStyle:dateStyle];
    [outputFormatter setTimeStyle:timeStyle];
    NSString *outputString = [outputFormatter stringFromDate:self];
    return outputString;
}

+ (NSString *)dateFormatString {
    return @"yyyy-MM-dd";
}

+ (NSString *)timeFormatString {
    return @"HH:mm:ss";
}

+ (NSString *)timestampFormatString {
    return @"yyyy-MM-dd HH:mm:ss";
}

// preserving for compatibility
+ (NSString *)dbFormatString {
    return [NSDate timestampFormatString];
}

+ (NSString *)getMonthString {
    return [[NSDate date] stringWithFormat:@"yyyy年MM月"];
}

- (NSString *)getMonthString {
    return [self stringWithFormat:@"yyyy年MM月"];
}

- (NSString *)getDateString
{
    return [self stringWithFormat:@"yyyyMM"];
}


- (NSString *)getYearMonthDayInChineseString
{
    return [self stringWithFormat:@"yyyy年MM月dd日"];
}


- (NSString *)getMonthStringInChinese{
    
    switch ([self getMonth]) {
            
        case 1:
            return @"一月";
            break;
        case 2:
            return @"二月";
            break;
        case 3:
            return @"三月";
            break;
        case 4:
            return @"四月";
            break;
        case 5:
            return @"五月";
            break;
        case 6:
            return @"六月";
            break;
        case 7:
            return @"七月";
            break;
        case 8:
            return @"八月";
            break;
        case 9:
            return @"九月";
            break;
        case 10:
            return @"十月";
            break;
        case 11:
            return @"十一月";
            break;
        case 12:
            return @"十二月";
            break;
        default:
            break;
    }
    
    
    
    return [self stringWithFormat:@"yyyy年MM月dd日"];
}



+ (NSString *)getSelectMonthWithIndex:(int)index
{
    NSString *selectMonth;
    switch (index) {
        case 0:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"01"];
        }
            break;
        case 1:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"02"];
        }
            break;
        case 2:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"03"];
        }
            break;
        case 3:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"04"];
        }
            break;
        case 4:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"05"];
        }
            break;
        case 5:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"06"];
        }
            break;
        case 6:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"07"];
        }
            break;
        case 7:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"08"];
        }
            break;
        case 8:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"09"];
        }
            break;
        case 9:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"10"];
        }
            break;
        case 10:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"11"];
        }
            break;
        case 11:
        {
            selectMonth = [NSString stringWithFormat:@"%lu%@",(unsigned long)[[NSDate date] getYear],@"12"];
        }
            break;
            
        default:
            break;
    }
    return selectMonth;
}



+ (NSArray *)getLast4QuaterInChineseWithDate:(NSDate *)date{
    NSMutableArray *quaterArray = [NSMutableArray arrayWithCapacity:4];
    [date dateBeforeMonth:3];
    for (int i = 0; i <4 ; i++) {
        NSDate *qDate = [date dateBeforeMonth:3*i];
        
        [quaterArray addObject:[NSString stringWithFormat:@"%lu年第%lu季度",(unsigned long)[qDate getYear],(unsigned long)[qDate getQuater]]];
        
    }
    
    return quaterArray;
}

+ (NSArray *)getLast4QuaterWithDate:(NSDate *)date{
    NSMutableArray *quaterArray = [NSMutableArray arrayWithCapacity:4];
    [date dateBeforeMonth:3];
    for (int i = 0; i <4 ; i++) {
        NSDate *qDate = [date dateBeforeMonth:3*i];
        
        [quaterArray addObject:[NSString stringWithFormat:@"%lu0%lu",(unsigned long)[qDate getYear],(unsigned long)[qDate getQuater]]];
        
    }
    
    return quaterArray;
}


- (NSUInteger)getQuater{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:self];
    switch ([dayComponents month]) {
        case 1:
        case 2:
        case 3:
            return 1;
            break;
        case 4:
        case 5:
        case 6:
            return 2;
            break;
        case 7:
        case 8:
        case 9:
            return 3;
            break;
        case 10:
        case 11:
        case 12:
            return 4;
            break;
        default:
            return 0;
    }
}


#pragma mark-时间戳转换时间  string类型的0-------非常准确
//Formatter 时间格式:yyyy-MM-dd 或者:yyyy-MM-dd HH:mm:ss
+(NSString*)CureentTimeTransformationDateTimestamp:(NSInteger)Timestamp dateFormatter:(NSString*)Formatter
{
    //加8个小时  时间差
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:Timestamp];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setDateFormat:Formatter];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    return currentDateStr;
}

#pragma mark-获取当前时间戳
+(NSInteger)GetCureentTimestamp
{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a];
    return  timeString.integerValue;
}


#pragma mak-获取当前的时间戳------String类型的
+(NSString*)GetCureentTimestampTwo
{
    NSDate*  localeDate=[NSDate date];
    // 一，转化的方法为
    NSString *timeSp = [NSString stringWithFormat:@"%d", (int)[localeDate timeIntervalSince1970]];
    return timeSp;
}


#pragma mark-把nsdate转换为时间戳
+(NSInteger)GetTimestamp:(NSDate*)newdate
{
    //NSTimeInterval a= (long)[newdate timeIntervalSince1970];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[newdate timeIntervalSince1970]];
    
    NSString *timeString = [NSString stringWithFormat:@"%.ld", (long)timeSp.integerValue];
    return  timeString.integerValue-8*60*60;
}


#pragma mark-获取当前的时间
+(NSDate*)GetTimeDate
{
    //二，把获取的时间转化为当前时间
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:datenow];
    NSDate *localeDates = [datenow  dateByAddingTimeInterval: interval];
    NSLog(@"转换之后的时间：%@", localeDates);
    return localeDates;
}



#pragma mark-获取当前的时间
+(NSString*)GetMorninghours
{
   // NSDate* localeDate=[NSDate date];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init] ;
    [dateFormatter1 setDateFormat:@"yyyy-MM-dd 00:00:00"];
    NSString *currentDateStr1 = [dateFormatter1 stringFromDate:[NSDate date]];
    NSLog(@"凌晨时间:%@",currentDateStr1);
    return currentDateStr1;
}

#pragma mark-获取当前的时间--NSDate
+(NSDate*)GetMorninghoursReturnDate
{
    NSString* currentmorninghours=[NSDate GetMorninghours];
    NSDate* newdate=[NSDate dateFromString:currentmorninghours];
    return newdate;
}



@end
