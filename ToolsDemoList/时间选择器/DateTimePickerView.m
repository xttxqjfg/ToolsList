//
//  DateTimePickerView.m
//  datePick
//
//  Created by 易博 on 2017/10/11.
//  Copyright © 2017年 易博. All rights reserved.
//

#import "DateTimePickerView.h"

@interface DateTimePickerView()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (nonatomic,strong) NSString *selectDateTime;

@end

@implementation DateTimePickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DateTimePickerView" owner:nil options:nil][0];
        self.frame = frame;
        
        [self.datePicker addTarget:self action:@selector(datePickerChanged) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (IBAction)cancleBtnClicked:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(onCancleClicked)]) {
        [self.delegate onCancleClicked];
    }
    
    self.datePicker = nil;
}

- (IBAction)sureBtnClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(onSureClicked:)]) {
        [self.delegate onSureClicked:self.selectDateTime];
    }
    
    self.datePicker = nil;
}

-(void)setPickerMode:(UIDatePickerMode)pickerMode
{
    _pickerMode = pickerMode;
    
    self.datePicker.datePickerMode = pickerMode;
    self.datePicker.minuteInterval = 15.0;
    
    //设置完毕后设置初始值
    [self datePickerChanged];
}

-(void)datePickerChanged
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    if (self.pickerMode == UIDatePickerModeDate) {
        //设置日期
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        self.selectDateTime = [dateFormatter stringFromDate:self.datePicker.date];
    }
    else if(self.pickerMode == UIDatePickerModeTime)
    {
        //设置时间
        [dateFormatter setDateFormat:@"HH:mm"];
        self.selectDateTime = [dateFormatter stringFromDate:self.datePicker.date];
    }
    else if(self.pickerMode == UIDatePickerModeDateAndTime)
    {
        //设置日期和时间
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        self.selectDateTime = [dateFormatter stringFromDate:self.datePicker.date];
    }
}

@end
