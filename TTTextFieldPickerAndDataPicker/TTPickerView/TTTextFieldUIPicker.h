//
//  TTTextFieldUIPicker.h
//  capliApp
//
//  Created by admin on 15/5/29.
//  Copyright (c) 2015年 mobisoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 *       TTTextFieldUIPickerDelegate 代理
 */
@class TTTextFieldUIPicker;
@protocol TTTextFieldUIPickerDelegate <NSObject>

@optional
/**
 *       监听确定
 */
- (void)TTPickerView:(TTTextFieldUIPicker *)TextField confirm:(NSString *)value tag:(NSInteger)tag;

@optional
/**
 *       监听取消
 */
- (void)TTPickerView:(TTTextFieldUIPicker *)TextField cancel:(NSString*)value;
/**
 *       监听滚动
 */
- (void)TTPickerViewChange:(TTTextFieldUIPicker *)TextField confirm:(NSString *)changevalue row:(NSInteger)row;

@end





@interface TTTextFieldUIPicker : UITextField







/** *        显示数据   */
@property(nonatomic,strong)NSArray<NSString*>* dataarray;


/** *        pickerview   */
@property(nonatomic,strong)UIPickerView* pickerview;


/** *       代理   */
@property (nonatomic,weak) id<TTTextFieldUIPickerDelegate> ttdelegate;


/** *       提示文字控件   */
@property(nonatomic,strong)UILabel* textlabel;


/**
 *       显示数据
 */
+(TTTextFieldUIPicker*)initWithCreateFram:(CGRect)fram font:(CGFloat)font text:(NSString*)text andAlignment:(NSTextAlignment)alignment andplaceholder:(NSString*)placeholder;

/**
 *       设置默认的滚动
 */

-(void)setPickerScrollview;


@end
