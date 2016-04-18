//
//  ViewController.m
//  TTTextFieldPickerAndDataPicker
//
//  Created by TT_code on 16/4/18.
//  Copyright © 2016年 TT_code. All rights reserved.
//

#import "ViewController.h"
#import "TTTextFieldDataPiker.h"
#import "TTTextFieldUIPicker.h"

@interface ViewController ()<TTTextFieldDataPikerDelegate,TTTextFieldUIPickerDelegate>
@property (weak, nonatomic) IBOutlet TTTextFieldDataPiker *mindatapicker;
@property (weak, nonatomic) IBOutlet TTTextFieldDataPiker *maxdatapicker;

@property (weak, nonatomic) IBOutlet TTTextFieldUIPicker *textfieldpicker;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置最小时间
    self.mindatapicker.dateFormat = @"yyyy-MM-dd";
    self.mindatapicker.ttdelegate=self;//设置代理
    self.mindatapicker.mindata=CuttenTomorrowTimer;
    
    
    //设置最大时间
    self.maxdatapicker.dateFormat = @"yyyy-MM-dd";
     self.mindatapicker.ttdelegate=self;//设置代理
    self.maxdatapicker.maxdata=CuttenTodayTimer;
    
    
    
    //设置picker 显示的数据源
    self.textfieldpicker.dataarray=@[@"IOS",@"JAVA",@"c",@"PHP",@"Html",@"C#"];
    self.textfieldpicker.ttdelegate=self;//设置代理
    
}




//==========================datapicker 监听

/**
 *       选择确定监听
 */
- (void)TTDataPickerView:(TTTextFieldDataPiker *)TextField confirm:(NSString *)value
{
    
}


/**
 *      取消监听
 */
- (void)TTDataPickerView:(TTTextFieldDataPiker *)TextField cancel:(NSString*)value{
    
}
/**
 *       滚动监听
 */
- (void)TTDataPickerViewChange:(TTTextFieldDataPiker *)TextField confirm:(NSString *)changevalue;
{
    
}




//==========================UIpicker 监听

/**
 *       监听确定
 */
- (void)TTPickerView:(TTTextFieldUIPicker *)TextField confirm:(NSString *)value tag:(NSInteger)tag
{
   
}
/**
 *       监听取消
 */
- (void)TTPickerView:(TTTextFieldUIPicker *)TextField cancel:(NSString*)value
{
    
}
/**
 *       监听滚动
 */
- (void)TTPickerViewChange:(TTTextFieldUIPicker *)TextField confirm:(NSString *)changevalue row:(NSInteger)row
{
   
}


@end
