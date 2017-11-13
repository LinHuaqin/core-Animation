//
//  ViewController.m
//  core Animation
//
//  Created by 拉拉货 on 2017/9/21.
//  Copyright © 2017年 拉拉货. All rights reserved.
//

#import "ViewController.h"
#define WS(weakSelf)  __weak typeof(self) weakSelf = self

@interface ViewController ()<CAAnimationDelegate>

@property(nonatomic,strong)CALayer  *myLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    __weak typeof(self) weakSelf = self;
    
    //创建caLayer
    CALayer *myLayer = [CALayer layer];
    myLayer.bounds = CGRectMake(0, 0, 50, 50);
    myLayer.backgroundColor = [UIColor yellowColor].CGColor;
    myLayer.position = CGPointMake(50, 50);
    myLayer.anchorPoint = CGPointMake(0.5, 0.5);//锚点
//    myLayer.cornerRadius = 20;
    //添加caLayer
    [self.view.layer addSublayer:myLayer];
    self.myLayer = myLayer;
    //position的左上角需与anchor重叠

}

//设置动画
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1.创建核心动画
    CABasicAnimation *anima = [CABasicAnimation animation];
    //1.1 告诉系统要执行什么动画
    anima.keyPath = @"position";
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    //1.2 设置动画执行完毕后不删除动画
    anima.removedOnCompletion = NO;
    anima.delegate = self;
    //1.3 设置保存动画的最新状态
    anima.fillMode = kCAFillModeForwards;
    
    //2.添加动画到layer
    [self.myLayer addAnimation:anima forKey:nil];
    
}
#pragma mark -- CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"开始执行动画");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSString *str = NSStringFromCGPoint(self.myLayer.position);
    NSLog(@"执行后 %@",str);
}


@end
