//
//  RotationVC.m
//  UIGestureRecognizerDemo
//
//  Created by 易博 on 2017/5/19.
//  Copyright © 2017年 易博. All rights reserved.
//

#import "RotationVC.h"
#define kViewWidth self.view.bounds.size.width

@interface RotationVC ()

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *infoLabel;

@end

@implementation RotationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"旋转";
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.infoLabel];
}

-(void)imageRotation:(UIRotationGestureRecognizer *)rotation
{
    self.infoLabel.text = @"";
    
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    self.infoLabel.text = [NSString stringWithFormat:@"rotation.rotation:%f",rotation.rotation];
    rotation.rotation = 0;
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, kViewWidth, 250)];
        _imageView.image = [UIImage imageNamed:@"r8.jpg"];
        _imageView.userInteractionEnabled = YES;
        
        UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(imageRotation:)];
        [_imageView addGestureRecognizer:rotation];
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
