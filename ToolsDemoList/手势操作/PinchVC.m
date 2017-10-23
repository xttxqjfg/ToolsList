//
//  PinchVC.m
//  UIGestureRecognizerDemo
//
//  Created by 易博 on 2017/5/19.
//  Copyright © 2017年 易博. All rights reserved.
//

#import "PinchVC.h"
#define kViewWidth self.view.bounds.size.width

@interface PinchVC ()

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *infoLabel;

@end

@implementation PinchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"缩放";
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.infoLabel];
}

-(void)imagePinch:(UIPinchGestureRecognizer *)pinch
{
    self.infoLabel.text = @"";
    
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    self.infoLabel.text = [NSString stringWithFormat:@"pinch.view.transform:%f,%f,%f,%f,%f,%f\npinch.scale:%f",pinch.view.transform.a,pinch.view.transform.b,pinch.view.transform.c,pinch.view.transform.d,pinch.view.transform.tx,pinch.view.transform.ty,pinch.scale];
    
    pinch.scale = 1;
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, kViewWidth, 250)];
        _imageView.image = [UIImage imageNamed:@"r8.jpg"];
        _imageView.userInteractionEnabled = YES;
        
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(imagePinch:)];
        [_imageView addGestureRecognizer:pinch];
    }
    return _imageView;
}

-(UILabel *)infoLabel
{
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.imageView.frame) + 20, kViewWidth - 40, 150)];
        _infoLabel.backgroundColor = [UIColor whiteColor];
        _infoLabel.numberOfLines = 0;
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
