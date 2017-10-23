//
//  ViewController.m
//  UIGestureRecognizerDemo
//
//  Created by 易博 on 2017/5/19.
//  Copyright © 2017年 易博. All rights reserved.
//

#import "GestureVC.h"
#import "TapVC.h"
#import "PinchVC.h"
#import "RotationVC.h"
#import "SwipeVC.h"
#import "PanVC.h"
#import "LongPressVC.h"

@interface GestureVC ()

@end

@implementation GestureVC

- (void)btnClicked:(UIButton *)sender {
    switch (sender.tag) {
        case 1000:
        {
            TapVC *tapVC = [[TapVC alloc]init];
            [self.navigationController pushViewController:tapVC animated:YES];
            break;
        }
        case 1001:
        {
            PinchVC *pinchVC = [[PinchVC alloc]init];
            [self.navigationController pushViewController:pinchVC animated:YES];
            break;
        }
        case 1002:
        {
            RotationVC *rotationVC = [[RotationVC alloc]init];
            [self.navigationController pushViewController:rotationVC animated:YES];
            break;
        }
        case 1003:
        {
            SwipeVC *swipeVC = [[SwipeVC alloc]init];
            [self.navigationController pushViewController:swipeVC animated:YES];
            break;
        }
        case 1004:
        {
            PanVC *panVC = [[PanVC alloc]init];
            [self.navigationController pushViewController:panVC animated:YES];
            break;
        }
        case 1005:
        {
            LongPressVC *longPressVC = [[LongPressVC alloc]init];
            [self.navigationController pushViewController:longPressVC animated:YES];
            break;
        }
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"手势操作";
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(20, 80, 250, 40)];
    [btn1 setTitle:@"Tap(点一下)" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor lightGrayColor];
    btn1.tag = 1000;
    [btn1 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(20, 130, 250, 40)];
    [btn2 setTitle:@"Pinch(缩放)" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor lightGrayColor];
    btn2.tag = 1001;
    [btn2 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(20, 180, 250, 40)];
    [btn3 setTitle:@"Rotation(旋转)" forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor lightGrayColor];
    btn3.tag = 1002;
    [btn3 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(20, 230, 250, 40)];
    [btn4 setTitle:@"Swipe(滑动)" forState:UIControlStateNormal];
    btn4.backgroundColor = [UIColor lightGrayColor];
    btn4.tag = 1003;
    [btn4 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc]initWithFrame:CGRectMake(20, 280, 250, 40)];
    [btn5 setTitle:@"Pan(拖移)" forState:UIControlStateNormal];
    btn5.backgroundColor = [UIColor lightGrayColor];
    btn5.tag = 1004;
    [btn5 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
    UIButton *btn6 = [[UIButton alloc]initWithFrame:CGRectMake(20, 330, 250, 40)];
    [btn6 setTitle:@"LongPress(长按)" forState:UIControlStateNormal];
    btn6.backgroundColor = [UIColor lightGrayColor];
    btn6.tag = 1005;
    [btn6 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn6];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
