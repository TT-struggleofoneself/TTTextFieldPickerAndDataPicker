//
//  TTTextFieldDataPiker.h
//  capliApp
//
//  Created by admin on 15/5/29.
//  Copyright (c) 2015年 mobisoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TTTextFieldDataPiker;
/**
 *       枚举，选择时间
 */
typedef NS_ENUM(NSUInteger, TTCuttenTimer)
{
     CuttenTodayTimer = 0,//今天
     CuttenYesterdayTimer,//昨天
     CuttenTomorrowTimer,//明天
     CuttenTimernone,//不设置
     CuttenTodaybeginTimer,//今天一天开始的时间
     CuttenTodayendTimer//今天一天结束的时间也就是明天开始的时间
};





/**
*       代理
 */
@protocol TTTextFieldDataPikerDelegate <NSObject>

@optional
/**
 *       选择确定监听
 */
- (void)TTDataPickerView:(TTTextFieldDataPiker *)TextField confirm:(NSString *)value;

@optional
/**
 *      取消监听
 */
- (void)TTDataPickerView:(TTTextFieldDataPiker *)TextField cancel:(NSString*)value;
/**
 *       滚动监听
 */
- (void)TTDataPickerViewChange:(TTTextFieldDataPiker *)TextField confirm:(NSString *)changevalue;


@end







@interface TTTextFieldDataPiker : UITextField






/**
 *  datapicker
 */
@property(nonatomic,strong)UIDatePicker* datapicker;
/** *  设置时间格式   */

@property(nonatomic,strong)NSString* dateFormat;



/** *  代理  */
@property (nonatomic,weak) id<TTTextFieldDataPikerDelegate> ttdelegate;



/** *  textlabel   显示中间文字控件  */
@property(nonatomic,strong)UILabel* textlabel;



/** *  textlabeltext提示文字  */
@property(nonatomic,strong)NSString* textlabeltext;



/** *  最小时间枚举-设置最小时间  */
@property(nonatomic)TTCuttenTimer mindata;



/** *  最大时间枚举-设置最大时间  */
@property(nonatomic)TTCuttenTimer maxdata;



/** *  给datapicker设置值  */
@property(nonatomic,strong)NSString* datapickertext;



/**
 *   创建
 */
+(TTTextFieldDataPiker*)initWithCreateFram:(CGRect)fram font:(CGFloat)font text:(NSString*)text andAlignment:(NSTextAlignment)alignment andplaceholder:(NSString*)placeholder;




@end
