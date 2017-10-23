//
//  TapVC.m
//  UIGestureRecognizerDemo
//
//  Created by 易博 on 2017/5/19.
//  Copyright © 2017年 易博. All rights reserved.
//

#import "TapVC.h"

#define kViewWidth self.view.bounds.size.width

@interface TapVC ()

@property (nonatomic, strong) UIView *leftView;

@property (nonatomic, strong) UIView *rightView;

@property (nonatomic, strong) UILabel *infoLabel;

@end

@implementation TapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"点击";
    
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.rightView];
    [self.view addSubview:self.infoLabel];

}

-(void)viewTaped:(UITapGestureRecognizer *)tap
{
    NSInteger tagValue = tap.view.tag;
    
    switch (tagValue) {
        case 1000:
        {
            self.infoLabel.text = @"点击了左边的view";
            break;
        }
        case 2000:
        {
            self.infoLabel.text = @"点击了右边的view";
            break;
        }
        default:
            break;
    }
}

-(UIView *)leftView
{
    if (!_leftView) {
        _leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kViewWidth / 2, 150)];
        _leftView.backgroundColor = [UIColor redColor];
        _leftView.tag = 1000;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTaped:)];
        [_leftView addGestureRecognizer:tap];
    }
    return _leftView;
}

-(UIView *)rightView
{
    if (!_rightView) {
        _rightView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.leftView.frame), 64, kViewWidth / 2, 150)];
        _rightView.backgroundColor = [UIColor greenColor];
        _rightView.tag = 2000;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTaped:)];
        [_rightView addGestureRecognizer:tap];
    }
    return _rightView;
}

-(UILabel *)infoLabel
{
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.leftView.frame) + 20, kViewWidth - 40, 100)];
        _infoLabel.backgroundColor = [UIColor whiteColor];
    }
    return _infoLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
