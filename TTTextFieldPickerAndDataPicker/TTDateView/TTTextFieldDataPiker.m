//
//  TTTextFieldDataPiker.m
//  capliApp
//
//  Created by admin on 15/5/29.
//  Copyright (c) 2015年 mobisoft. All rights reserved.
//

#import "TTTextFieldDataPiker.h"
#import "NSDate+Extend.h"

@interface  TTTextFieldDataPiker()
{
    NSString* _value;
}
@end
@implementation TTTextFieldDataPiker

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self UpdateUI];
    }
    return self;
}


/**
 *  加载xib
 */
-(void)awakeFromNib
{
    [self UpdateUI];
}

/**
 *  初始化
 *
 *  @return
 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self UpdateUI];
    }
    return self;
}

/**
 *  布局
 */
-(void)UpdateUI{
    //  时间控件
    self.datapicker = [[UIDatePicker alloc] init];
    
    NSDate *currentTime  = [NSDate date];
    [self.datapicker setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+8"]];
    // 设置当前显示
    [self.datapicker setDate:currentTime animated:YES];
    // 设置显示最大时间（
    //[datePicker setMaximumDate:currentTime];
    // 显示模式
    // [self.datapicker setDatePickerMode:UIDatePickerModeDateAndTime];
    
    
    // 设置区域为中国简体中文
    self.datapicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    // 只显示日期
    self.datapicker.datePickerMode = UIDatePickerModeDate;
    self.datapicker.backgroundColor=[UIColor whiteColor];
    self.inputView=self.datapicker;
    //显示上午下午时间的
    // self.datapicker.datePickerMode = UIDatePickerModeCountDownTimer;
    
    
    UIView * viewdata=[self addKeyboardtopview];
    [self setInputAccessoryView:viewdata];
    
    [self.datapicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    _value=@"";
    
    
    self.textlabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 2, [UIScreen mainScreen].bounds.size.width-100, 40)];
    self.textlabel.textAlignment=NSTextAlignmentCenter;
    self.textlabel.center=viewdata.center;
    
    [viewdata addSubview:self.textlabel];
    [self setInputAccessoryView:viewdata];
    self.textlabel.text=_value;
    
    [self dateChange:self.datapicker];
    
    //        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //        formatter.dateFormat = @"yyyy-MM-dd";
    self.clearButtonMode=UITextFieldViewModeWhileEditing;
}






///创建
+(TTTextFieldDataPiker*)initWithCreateFram:(CGRect)fram font:(CGFloat)font text:(NSString*)text andAlignment:(NSTextAlignment)alignment andplaceholder:(NSString*)placeholder
{
    TTTextFieldDataPiker* dadatextfield=[[TTTextFieldDataPiker alloc]initWithFrame:fram];
    if(font) dadatextfield.font=[UIFont systemFontOfSize:font];
    if(text) dadatextfield.text=text;
    if(alignment) dadatextfield.textAlignment=alignment;
    if(placeholder) dadatextfield.placeholder=placeholder;
    
    return dadatextfield;
}




-(void)setTextlabeltext:(NSString *)textlabeltext
{
    _textlabeltext=textlabeltext;
    self.textlabel.text=textlabeltext;
}


#pragma mark-给pickerview 设置值
/**
 *  设置值
 *
 *  @param datapickertext
 */
-(void)setDatapickertext:(NSString *)datapickertext
{
    _datapickertext=datapickertext;
    NSDate * date= [NSDate dateFromString:self.datapickertext];
     [self.datapicker setDate:date animated:YES];
}


#pragma mark-增加中间显示的试图
/**
 *  增加中间显示的试图
 *
 *  @return
 */
-(UIView*)addKeyboardtopview
{
    // 4.4 增加生日键盘的工具视图
    UIView *accessView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    
    [accessView setBackgroundColor:[UIColor colorWithRed:(246)/255.0f green:(246)/255.0f blue:(246)/255.0f alpha:1]];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(0, 2, 70, 40)];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    button.tag=0;
    [button  setTitleColor:[UIColor colorWithRed:(237)/255.0f green:(85)/255.0f blue:(100)/255.0f alpha:1] forState:UIControlStateNormal];
    [accessView addSubview:button];
    button.titleLabel.font=[UIFont systemFontOfSize:17];
    
    
    [button addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-75, 2, 70, 40)];
    [button1 setTitle:@"确定" forState:UIControlStateNormal];
    button1.tag=1;
    
    [button1  setTitleColor:[UIColor colorWithRed:(0)/255.0f green:(146)/255.0f blue:(64)/255.0f alpha:1] forState:UIControlStateNormal];
    [accessView addSubview:button1];
    button1.titleLabel.font=[UIFont systemFontOfSize:17];
    [button1 addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return accessView;
}

-(void)setDateFormat:(NSString *)dateFormat
{
    _dateFormat=dateFormat;
    //设置默认时间
    [self dateChange:self.datapicker];
}


-(void)setMindata:(TTCuttenTimer)mindata
{
    _mindata=mindata;
    //获取前一天时间
    NSDate* minDate;
   
    if(self.mindata==CuttenTodayTimer) //今天
    {
        minDate=[[NSDate date] dateBeforeDay:0];
    }
    else if (self.mindata==CuttenTomorrowTimer)//明天
    {
        minDate=[[NSDate date] dateAfterDay:1];
    }
    else if (self.mindata==CuttenYesterdayTimer) //昨天
    {
        minDate=[[NSDate date] dateBeforeDay:1];
    }
    else if (self.mindata==CuttenTimernone) //不设限制
    {
        minDate=nil;
    }    
    else if (self.mindata==CuttenTodaybeginTimer) //今天一天开始的时间
    {
        minDate=[[NSDate date] beginningOfDay];
       
    }
    else if (self.mindata==CuttenTodayendTimer) //今天一天结束的时间
    {
        minDate=[[[NSDate date] dateAfterDay:1] beginningOfDay];
        
        minDate = [NSDate dateWithTimeIntervalSince1970:[minDate timeIntervalSince1970]-1] ;
    }
    self.datapicker.minimumDate=minDate;
}



-(void)setMaxdata:(TTCuttenTimer)maxdata
{
    _maxdata=maxdata;
    //获取前一天时间
    NSDate* maxDate;
    
    
    if(self.maxdata==CuttenTodayTimer) //今天
    {
        maxDate=[[NSDate date] dateBeforeDay:0];
    }
    else if (self.maxdata==CuttenTomorrowTimer)//明天
    {
        maxDate=[[NSDate date] dateAfterDay:1];
    }
    else if (self.maxdata==CuttenYesterdayTimer) //昨天
    {
        maxDate=[[NSDate date] dateBeforeDay:1];
    }
    else if (self.maxdata==CuttenTimernone) //不设限制
    {
        maxDate=nil;
    }
    
    else if (self.maxdata==CuttenTodaybeginTimer) //今天一天开始的时间
    {
        maxDate=[[NSDate date] beginningOfDay];
    }
    else if (self.maxdata==CuttenTodayendTimer) //今天一天结束的时间
    {
         maxDate=[[[NSDate date] dateAfterDay:1] beginningOfDay];
        maxDate = [NSDate dateWithTimeIntervalSince1970:[maxDate timeIntervalSince1970]-1] ;
       
    }
    self.datapicker.maximumDate = maxDate;
}






#pragma mark 日期选择控件的值改变了
- (void)dateChange:(UIDatePicker *)picker
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if([self isEmptyOrNULL:self.dateFormat])
    {
         formatter.dateFormat = @"yyyy-MM-dd";
    }
    else {
         formatter.dateFormat =self.dateFormat;
    }
    _value=[formatter stringFromDate:picker.date];
    
     NSLog(@"当前时间:%@",_value);
    if ([self.ttdelegate respondsToSelector:@selector(TTDataPickerViewChange:confirm:)])
    {
       if(![self isEmptyOrNULL:_value])
        {
            [self.ttdelegate TTDataPickerViewChange:self confirm:_value];
        }
    }
}


#pragma mark-取消
- (void)cancelBtnClick:(UIButton *)sender
{
    [self resignFirstResponder];
    [self dateChange:self.datapicker];
    
    if ([self.ttdelegate respondsToSelector:@selector(TTDataPickerView:cancel:)])
    {
        
        if(![self isEmptyOrNULL:_value])
        {
            [self.ttdelegate TTDataPickerView:self cancel:_value];
        }
    }
}


#pragma mark-确定
- (void)confirmBtnClick:(UIButton *)sender
{
    [self resignFirstResponder];
     [self dateChange:self.datapicker];
    
    if ([self.ttdelegate respondsToSelector:@selector(TTDataPickerView:confirm:)])
    {
        if(![self isEmptyOrNULL:_value])
        {
            self.text=_value;
           // self.textlabel.text=_value;
            [self.ttdelegate TTDataPickerView:self confirm:_value];
        }
    }
}


#pragma mark-空为yes  非空为NO
-(BOOL)isEmptyOrNULL:(NSString*)string
{
    if(string== NULL|| string == nil|| [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""] || [string isEqual:[NSNull null]] || [string isEqualToString:@"<null>"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
