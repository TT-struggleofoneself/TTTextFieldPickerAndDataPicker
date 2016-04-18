//
//  TTTextFieldUIPicker.m
//  capliApp
//
//  Created by admin on 15/5/29.
//  Copyright (c) 2015年 mobisoft. All rights reserved.
//

#import "TTTextFieldUIPicker.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]



@interface  TTTextFieldUIPicker()<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    NSString* _value;
    NSInteger _oldindex;//当前数组的下标
}
@end

@implementation TTTextFieldUIPicker


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
 *  初始化方法啊
 *
 *  @param frame
 *
 *  @return
 */
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
 *  布局配置
 */
-(void)UpdateUI
{
    //  时间控件
    self.delegate=self;
    self.pickerview = [[UIPickerView alloc]init];
    self.pickerview.backgroundColor=[UIColor whiteColor];
    self.pickerview.delegate=self;
    self.pickerview.dataSource=self;
    [self.pickerview setShowsSelectionIndicator:YES];
    self.inputView=self.pickerview;
    
    UIView * viewdata=[self addKeyboardtopview];
    [self setInputAccessoryView:viewdata];
    self.font=[UIFont systemFontOfSize:15];
    
    self.textlabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 2, [UIScreen mainScreen].bounds.size.width-100, 40)];
    self.textlabel.textAlignment=NSTextAlignmentCenter;
    self.textlabel.center=viewdata.center;
    [viewdata addSubview:self.textlabel];
    [self setInputAccessoryView:viewdata];
    _value=@"";
    self.textlabel.text=_value;
    self.clearButtonMode=UITextFieldViewModeWhileEditing;
}




/**
 *  设置picker滚动
 */
-(void)setPickerScrollview
{
    //设置picker 滚动
  NSUInteger index=[self.dataarray indexOfObject:self.text];
  [self.pickerview selectRow:index inComponent:0 animated:YES];
    
}



/**
 *  创建
 *
 *  @param fram
 *  @param font
 *  @param text
 *  @param alignment
 *  @param placeholder
 *
 *  @return
 */
+(TTTextFieldUIPicker*)initWithCreateFram:(CGRect)fram font:(CGFloat)font text:(NSString*)text andAlignment:(NSTextAlignment)alignment andplaceholder:(NSString*)placeholder
{
    TTTextFieldUIPicker* dadatextfield=[[TTTextFieldUIPicker alloc]initWithFrame:fram];
  //  dadatextfield.delegate=self;
    if(font) dadatextfield.font=[UIFont systemFontOfSize:font];
    if(text) dadatextfield.text=text;
    if(alignment) dadatextfield.textAlignment=alignment;
    if(placeholder) dadatextfield.placeholder=placeholder;
    return dadatextfield;
}




/**
 *  设置显示的数组
 *
 *  @param dataarray
 */
-(void)setDataarray:(NSArray *)dataarray
{
    _dataarray=dataarray;
    if(dataarray.count>0)
    {
        int i=(int)self.dataarray.count/2;
        _value=dataarray[i];
        self.textlabel.text=_value;
        [self.pickerview selectRow: self.dataarray.count/2 inComponent:0 animated:YES];
        _oldindex=self.dataarray.count/2;
    }       
}



#pragma mark-取消
/**
 *  取消
 *
 *  @param sender
 */
- (void)cancelBtnClick:(UIButton *)sender
{
    [self resignFirstResponder];
    
    if ([self.ttdelegate respondsToSelector:@selector(TTPickerView:cancel:)])
    {
        if(![self isEmptyOrNULL:_value])
        {
            [self.ttdelegate TTPickerView:self cancel:_value];
        }
    }
}


#pragma mark-确定
/**
 *  确定
 *
 *  @param sender
 */
- (void)confirmBtnClick:(UIButton *)sender
{
    [self resignFirstResponder];
    self.text=_value;
    if ([self.ttdelegate respondsToSelector:@selector(TTPickerView:confirm:tag:)])
    {
        self.textlabel.text=_value;
        [self.ttdelegate TTPickerView:self confirm:_value tag:_oldindex];
    }
}


#pragma mark-空为yes  非空为NO
/**
 *  空为yes  非空为NO
 *
 *  @param string
 *
 *  @return
 */
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





#pragma mark-增加中间显示的试图
/**
 *  空为yes  非空为NO
 *
 *  @return
 */
-(UIView*)addKeyboardtopview
{
   
    // 4.4 增加生日键盘的工具视图
    UIView *accessView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    [accessView setBackgroundColor:RGBCOLOR(246, 246, 246)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(5, 2, 80, 40)];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    button.tag=0;
    
   [button  setTitleColor:[UIColor colorWithRed:(237)/255.0f green:(85)/255.0f blue:(100)/255.0f alpha:1] forState:UIControlStateNormal];
    [accessView addSubview:button];
    button.titleLabel.font=[UIFont systemFontOfSize:17];
    [button addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-90, 2, 80, 40)];
    [button1 setTitle:@"确定" forState:UIControlStateNormal];
    button1.tag=1;
    
   [button1  setTitleColor:[UIColor colorWithRed:(0)/255.0f green:(146)/255.0f blue:(64)/255.0f alpha:1] forState:UIControlStateNormal];
    [accessView addSubview:button1];
    button1.titleLabel.font=[UIFont systemFontOfSize:17];
    [button1 addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return accessView;
}




#pragma mark  pickerview的代理方法


/**
 *  pickerview的代理方法
 *
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return self.dataarray.count;
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.dataarray[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{    
  //  self.textlabel.text=self.dataarray[row];
    if(row>self.dataarray.count-1)
    {
        return;
    }
    _value=self.dataarray[row];
    _oldindex=row;
    if ([self.ttdelegate respondsToSelector:@selector(TTPickerViewChange:confirm:row:)])
    {
        if(![self isEmptyOrNULL:_value])
        {
            [self.ttdelegate TTPickerViewChange:self confirm:_value row:_oldindex];
        }
    }
}

/**
 *  监听
 *
 *  @param textField
 */
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //开始编辑
    
}

/**
 *  加载nib
 */
-(void)awakeFromNib
{
    [self UpdateUI];
}


@end
