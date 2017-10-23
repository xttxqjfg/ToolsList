//
//  DateTimePickerVC.m
//  datePick
//
//  Created by 易博 on 2017/10/11.
//  Copyright © 2017年 易博. All rights reserved.
//

#import "DateTimePickerVC.h"

#import "DateTimePickerView.h"

@interface DateTimePickerVC ()<DateTimePickerViewDelegate>

@property (strong, nonatomic) UILabel *showMsgLabel;

@property (nonatomic,strong) DateTimePickerView *pickView;

@end

@implementation DateTimePickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.showMsgLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 200, 40)];
    
    [self.view addSubview:self.showMsgLabel];
    
    UIButton *btnDate = [[UIButton alloc]initWithFrame:CGRectMake(50, 160, 140, 60)];
    UIButton *btnTime = [[UIButton alloc]initWithFrame:CGRectMake(50, 270, 140, 60)];
    UIButton *btnDateAndTime = [[UIButton alloc]initWithFrame:CGRectMake(50, 380, 140, 60)];
    
    [btnDate setTitle:@"选取日期" forState:UIControlStateNormal];
    [btnTime setTitle:@"选取时间" forState:UIControlStateNormal];
    [btnDateAndTime setTitle:@"选取日期和时间" forState:UIControlStateNormal];
    
    btnDate.backgroundColor = [UIColor redColor];
    btnTime.backgroundColor = [UIColor redColor];
    btnDateAndTime.backgroundColor = [UIColor redColor];
    
    [btnDate addTarget:self action:@selector(getDateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnTime addTarget:self action:@selector(getTimeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnDateAndTime addTarget:self action:@selector(getDateAndTimeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnDate];
    [self.view addSubview:btnTime];
    [self.view addSubview:btnDateAndTime];
}

- (void)getDateBtnClick:(UIButton *)sender {
    self.pickView.pickerMode = UIDatePickerModeDate;
    [self.view addSubview:self.pickView];
}

- (void)getTimeBtnClick:(UIButton *)sender {
    self.pickView.pickerMode = UIDatePickerModeTime;
    [self.view addSubview:self.pickView];
}

- (void)getDateAndTimeBtnClick:(UIButton *)sender {
    self.pickView.pickerMode = UIDatePickerModeDateAndTime;
    [self.view addSubview:self.pickView];
}


-(void)onCancleClicked
{
    [self.pickView removeFromSuperview];
    self.pickView = nil;
}

-(void)onSureClicked:(NSString *)selectDateTime
{
    self.showMsgLabel.text = selectDateTime;
    [self.pickView removeFromSuperview];
    self.pickView = nil;
}

-(DateTimePickerView *)pickView
{
    if (!_pickView) {
        _pickView = [[DateTimePickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 216 - 30, self.view.bounds.size.width, 216 + 30)];
        _pickView.delegate = self;
    }
    return _pickView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
