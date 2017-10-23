//
//  PanVC.m
//  UIGestureRecognizerDemo
//
//  Created by 易博 on 2017/5/19.
//  Copyright © 2017年 易博. All rights reserved.
//

#import "PanVC.h"
#define kViewWidth self.view.bounds.size.width

@interface PanVC ()

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *infoLabel;

@end

@implementation PanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"慢速拖拽";
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.infoLabel];
}

-(void)imagePan:(UIPanGestureRecognizer *)pan
{
    CGPoint translation = [pan translationInView:self.view];
    pan.view.center = CGPointMake(pan.view.center.x + translation.x,
                                         pan.view.center.y + translation.y);
    [pan setTranslation:CGPointZero inView:self.view];
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [pan velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        self.infoLabel.text = [NSString stringWithFormat:@"magnitude: %f, slideMult: %f", magnitude, slideMult];
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(pan.view.center.x + (velocity.x * slideFactor),
                                         pan.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            pan.view.center = finalPoint;
        } completion:nil];
    }
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, kViewWidth, 250)];
        _imageView.image = [UIImage imageNamed:@"r8.jpg"];
        _imageView.userInteractionEnabled = YES;
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(imagePan:)];
        [_imageView addGestureRecognizer:pan];
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
