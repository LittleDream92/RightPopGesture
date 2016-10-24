//
//  BaseNavigationController.m
//  RightPopGestureDemo
//
//  Created by Meng Fan on 16/10/24.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    //方法一：
//    self.interactivePopGestureRecognizer.delegate = (id)self;
    
    //方法二：
    // 打印系统自带的手势
    NSLog(@"%@",self.interactivePopGestureRecognizer);
    /**打印结果
    2016-10-24 11:41:37.390833 RightPopGestureDemo[887:325267] <UIScreenEdgePanGestureRecognizer: 0x100210df0; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x10020f100>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x100210cb0>)>>
     */
    
    // 设置代理
    id target = self.interactivePopGestureRecognizer.delegate;
    // 创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    // 设置pan手势的代理
    pan.delegate = self;
    // 添加手势
    [self.view addGestureRecognizer:pan];
    // 将系统自带的手势覆盖掉
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - 方法一：
//// 表示的意思是:当挡墙控制器是根控制器了,那么就不接收触摸事件,只有当不是根控制器时才需要接收事件.
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    return self.childViewControllers.count > 1;
//}


@end
