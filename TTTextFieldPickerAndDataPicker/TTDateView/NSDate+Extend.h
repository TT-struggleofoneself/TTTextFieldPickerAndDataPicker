//
//  NSDate+Extend.h
//  BCMSystem
//
//  Created by ccg on 14-4-18.
//  Copyright (c) 2014年 mobisoft. All rights reserved.
//  NSDate分类扩展方法

#import <Foundation/Foundation.h>

@interface NSDate (Extend)

//返回多少分钟之前
+(NSString *)prettyDateWithReference:(NSInteger)timecuo;




/**
 *  @brief  获取年月日字符串
 *
 *  @param
 *
 *  @return NSString 比如19871127
 */

#pragma mark - 获取年月日字符串
/// 获取年月日字符串
- (NSString *)getFormatYearMonthDay;

/**
 *  @brief  该日期是该年的第几周
 *
 *  @param
 *
 *  @return
 */
#pragma mark - 该日期是该年的第几周
/// 该日期是该年的第几周
- (int)getWeekOfYear;

/**
 *  @brief  两个日期之间的天数
 *
 *  @param  startDay 开始时间
 *  @param  endDay   结束时间
 *
 *  @return
 */
#pragma mark - 两个日期之间的天数
///  两个日期之间的天数
- (NSUInteger)dateStartDay:(NSDate *)startDay endDay:(NSDate *)endDay;

/**
 *  @brief  返回day天后的日期
 *
 *  @param  day 天数
 *
 *  @return
 */
#pragma mark - 返回day天后的日期
///  返回day天后的日期
- (NSDate *)dateAfterDay:(int)day;

/**
 *  返回day天之前的日期
 *
 *  @param day 天数
 *
 *  @return NSDate
 */
#pragma mark - 返回day天之前的日期
///返回day天之前的日期
- (NSDate *)dateBeforeDay:(int)day;

/**
 *  返回week周之前的日期
 *
 *  @param week 周数
 *
 *  @return NSDate
 */
#pragma mark -  返回week周之前的日期
/// 返回week周之前的日期
- (NSDate *)dateBeforeWeek:(int)week;

/**
 *  返回month月之前的日期
 *
 *  @param month 月数
 *
 *  @return NSDate
 */
#pragma mark -  返回month月之前的日期
/// 返回month月之前的日期
- (NSDate *)dateBeforeMonth:(int)month;

/**
 *  返回year年之前的日期
 *
 *  @param year 年数
 *
 *  @return NSDate
 */
#pragma mark -  返回year年之前的日期
/// 返回year年之前的日期
- (NSDate *)dateBeforeYear:(int)year;

/**
 *  返回month月的最后一天
 *
 *  @param month 月数
 *
 *  @return NSDate
 */
#pragma mark -  返回month月的最后一天
/// 返回month月的最后一天
+ (NSDate *)date1stDayOfBeforeMonth:(int)month;


/**
 *  返回month月的最后一天
 *
 *  @param month 月数
 *
 *  @return NSDate
 */
#pragma mark -   返回month月的最后一天
/// 返回month月的最后一天
+ (NSDate *)dateLastDayOfBeforeMonth:(int)month;




/**
 *  @brief  month个月后的日期
 *
 *  @param  month 月数
 *
 *  @return
 */
#pragma mark -   month个月后的日期
///  month个月后的日期
- (NSDate *)dateafterMonth:(int)month;

/**
 *  @brief  获取日
 *
 *  @param
 *
 *  @return
 */
#pragma mark -  获取日
///  获取日
- (NSUInteger)getDay;

/**
 *  @brief  获取月
 *
 *  @param
 *
 *  @return
 */
#pragma mark -   获取月
/// 获取月
- (NSUInteger)getMonth;

/**
 *  @brief  获取年
 *
 *  @param
 *
 *  @return
 */
#pragma mark -   获取年
/// 获取年
- (NSUInteger)getYear;

/**
 *  @brief  获取小时
 *
 *  @param
 *
 *  @return
 */
#pragma mark -    获取小时
/// 获取小时
- (int )getHour;

/**
 *  @brief  获取分钟
 *
 *  @param
 *
 *  @return
 */
#pragma mark -    获取分钟
///  获取分钟
- (int)getMinute;

/**
 *  @brief  在当前日期前几天
 *
 *  @param
 *
 *  @return
 */
#pragma mark -    在当前日期前几天
/// 在当前日期前几天
- (NSUInteger)daysAgo;

/**
 *  @brief  午夜时间距今几天
 *
 *  @param
 *
 *  @return
 */
#pragma mark -     午夜时间距今几天
/// 午夜时间距今几天
- (NSUInteger)daysAgoAgainstMidnight;

/**
 *  @brief  获取距现在几天的字符串
 *
 *  @param
 *
 *  @return NSString Today、Yesterday等
 */
#pragma mark -     获取距现在几天的字符串
/// 获取距现在几天的字符串
- (NSString *)stringDaysAgo;

/**
 *  @brief  返回一周的第几天(周末为第一天)
 *
 *  @param
 *
 *  @return
 */

#pragma mark -     返回一周的第几天(周末为第一天)
/// 返回一周的第几天(周末为第一天)
- (NSUInteger)getWeekday;

/**
 *  @brief  返回星期几的字符串
 *
 *  @param
 *
 *  @return
 */

#pragma mark - 返回星期几的字符串
/// 返回星期几的字符串
- (NSString *)getWeekString;

/**
 *  @brief  返回该天的开始时间
 *
 *  @param
 *
 *  @return
 */

#pragma mark - 返回该天的开始时间-(重要)
/// 返回该天的开始时间-(重要)
- (NSDate *)beginningOfDay;

/**
 *  @brief  返回该月的第一天
 *
 *  @param
 *
 *  @return
 */

#pragma mark - 返回该月的第一天
/// 返回该月的第一天
- (NSDate *)beginningOfMonth;

/**
 *  @brief  返回该月的最后一天
 *
 *  @param
 *
 *  @return
 */

#pragma mark - 返回该月的最后一天
/// 返回该月的最后一天
- (NSDate *)endOfMonth;

/**
 *  @brief  返回该周的第一天
 *
 *  @param
 *
 *  @return
 */

#pragma mark - 返回该周的第一天
/// 返回该周的第一天
- (NSDate *)beginningOfWeek;

/**
 *  @brief  返回该周的周末
 *
 *  @param
 *
 *  @return
 */

#pragma mark - 返回该周的周末
/// 返回该周的周末
- (NSDate *)endOfWeek;

#pragma mark - NSDate Format

/**
 *  @brief  将字符串转换成时间
 *
 *  @param  string 时间的字符串(默认为timestamp格式)
 *
 *  @return
 */

#pragma mark - 将字符串转换成时间
/// 将字符串转换成时间
+ (NSDate *)dateFromString:(NSString *)string;

/**
 *  @brief  根据时间格式将字符串转换成时间
 *
 *  @param  string 时间的字符串
 *  @param  format 时间格式的字符串
 *
 *  @return
 */

#pragma mark - 根据时间格式将字符串转换成时间
/// 根据时间格式将字符串转换成时间
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;


#pragma mark-不加8小时的
+ (NSDate *)dateNoFromString:(NSString *)string withFormat:(NSString *)format;


/**
 *  @brief  根据时间格式将时间转换成字符串（类方法）
 *
 *  @param  date   时间
 *  @param  format 时间格式的字符串
 *
 *  @return
 */

#pragma mark - 根据时间格式将时间转换成字符串（类方法）
///  根据时间格式将时间转换成字符串（类方法）
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;

/**
 *  @brief  将时间转换成字符串（类方法）
 *
 *  @param  date 时间(默认为timestamp格式)
 *
 *  @return
 */

#pragma mark - 将时间转换成字符串（类方法）
/// 将时间转换成字符串（类方法）
+ (NSString *)stringFromDate:(NSDate *)date;

/**
 *  @brief  将时间转换成外国时间字符串
 *
 *  @param  date     时间
 *  @param  prefixed 是否有前缀
 *
 *  @return
 */

#pragma mark - 将时间转换成外国时间字符串
///  将时间转换成外国时间字符串
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed;

/**
 *  @brief  将时间转换成外国时间字符串
 *
 *  @param  date     时间(没有前缀)
 *
 *  @return
 */

#pragma mark - 将时间转换成外国时间字符串
/// 将时间转换成外国时间字符串
+ (NSString *)stringForDisplayFromDate:(NSDate *)date;

/**
 *  @brief  根据时间格式将时间转换成字符串(对象方法)
 *
 *  @param  format 时间格式
 *
 *  @return
 */

#pragma mark - 根据时间格式将时间转换成字符串(对象方法)
/// 根据时间格式将时间转换成字符串(对象方法)
- (NSString *)stringWithFormat:(NSString *)format;

/**
 *  @brief  将时间转成字符串(对象方法，默认为timestamp格式)
 *
 *  @param
 *
 *  @return
 */

#pragma mark - 将时间转成字符串(对象方法，默认为timestamp格式)
///将时间转成字符串(对象方法，默认为timestamp格式)
- (NSString *)string;

/**
 *  @brief  将时间转成字符串(对象方法)
 *
 *  @param  dateStyle 时间格式的枚举
 *  @param  timeStyle 时间格式的枚举
 *
 *  @return
 */

#pragma mark - 将时间转成字符串(对象方法)
/// 将时间转成字符串(对象方法)
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

/**
 *  @brief  返回日期格式的字符串
 *
 *  @param
 *
 *  @return NSString yyyy-MM-dd
 */

#pragma mark - 返回日期格式的字符串
/// 返回日期格式的字符串
+ (NSString *)dateFormatString;

/**
 *  @brief  返回时间格式的字符串
 *
 *  @param
 *
 *  @return NSString HH:mm:ss
 */

#pragma mark - 返回时间格式的字符串
/// 返回时间格式的字符串
+ (NSString *)timeFormatString;

/**
 *  @brief  返回时间戳格式的字符串
 *
 *  @param
 *
 *  @return NSString yyyy-MM-dd HH:mm:ss
 */

#pragma mark - 返回时间戳格式的字符串
/// 返回时间戳格式的字符串
+ (NSString *)timestampFormatString;

/**
 *  @brief  获取当前时间的费用月份(类方法)
 *
 *  @param
 *
 *  @return NSString yyyy年MM月
 */

#pragma mark -  获取当前时间的费用月份(类方法)
/// 获取当前时间的费用月份(类方法)
+ (NSString *)getMonthString;

/**
 *  @brief  获取指定时间的费用月份(对象方法)
 *
 *  @param
 *
 *  @return NSString yyyy年MM月
 */


#pragma mark -  获取指定时间的费用月份(对象方法)
/// 获取指定时间的费用月份(对象方法)
- (NSString *)getMonthString;


/**
 *  @brief  获取指定时间的中文月份
 *
 *  @param
 *
 *  @return NSString  八月
 */

#pragma mark -  获取指定时间的中文月份
/// 获取指定时间的中文月份
- (NSString *)getMonthStringInChinese;


/**
 *  @brief  获取指定时间的费用月份(对象方法)
 *
 *  @param
 *
 *  @return NSString yyyyMM
 */

#pragma mark -  获取指定时间的费用月份(对象方法)
/// 获取指定时间的费用月份(对象方法)
- (NSString *)getDateString;

/**
 *  @brief  获取指定时间的年月日(对象方法)
 *
 *  @param
 *
 *  @return NSString yyyy年MM月dd日
 */

#pragma mark -  获取指定时间的年月日(对象方法)
/// 获取指定时间的年月日(对象方法)
- (NSString *)getYearMonthDayInChineseString;

/**
 *  @brief  根据月份获取当前年月(对象方法)
 *
 *  @param
 *
 *  @return NSString yyyyMM
 */

#pragma mark -  根据月份获取当前年月(对象方法)
/// 根据月份获取当前年月(对象方法)
+ (NSString *)getSelectMonthWithIndex:(int)index;

/**
 *  @brief 某时间前4个季度
 *
 *  @param date 时间
 *
 *  @return 季度列表 201401
 */

#pragma mark -  某时间前4个季度
/// 某时间前4个季度
+ (NSArray *)getLast4QuaterWithDate:(NSDate *)date;


/**
 *  @brief 某时间前4个季度
 *
 *  @param date 时间
 *
 *  @return 季度列表 2014年第1季度
 */

#pragma mark -  某时间前4个季度
/// 某时间前4个季度
+ (NSArray *)getLast4QuaterInChineseWithDate:(NSDate *)date;


/**
 *  @brief 根据时间取当前季度
 *
 *  @return 1,2,3,4 季度
 */

#pragma mark - 根据时间取当前季度
/// 根据时间取当前季度
- (NSUInteger)getQuater;


#pragma mark-时间戳转换时间  string类型的0-------非常准确
//Formatter 时间格式:yyyy-MM-dd 或者:yyyy-MM-dd HH:mm
+(NSString*)CureentTimeTransformationDateTimestamp:(NSInteger)Timestamp dateFormatter:(NSString*)Formatter;


#pragma mark-获取当前时间戳
+(NSInteger)GetCureentTimestamp;


#pragma mak-获取当前的时间戳------String类型的
+(NSString*)GetCureentTimestampTwo;


#pragma mark-把nsdate转换为时间戳
+(NSInteger)GetTimestamp:(NSDate*)newdate;


#pragma mark-获取当前的时间
+(NSDate*)GetTimeDate;

#pragma mark-获取当前的时间--String
+(NSString*)GetMorninghours;

#pragma mark-获取当前的时间--NSDate
+(NSDate*)GetMorninghoursReturnDate;

@end
