//
//  DateTimePickerView.h
//  datePick
//
//  Created by 易博 on 2017/10/11.
//  Copyright © 2017年 易博. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DateTimePickerViewDelegate <NSObject>

//点击了取消按钮
-(void)onCancleClicked;

//点击了确认按钮
-(void)onSureClicked:(NSString *)selectDateTime;

@end

@interface DateTimePickerView : UIView

@property (nonatomic,assign) UIDatePickerMode pickerMode;

@property (nonatomic,assign) id<DateTimePickerViewDelegate> delegate;

@end
