//
//  MeNavigationController.m
//  GeologySystem
//
//  Created by Migoo on 16/6/15.
//  Copyright © 2016年 Migoo. All rights reserved.
//

#import "MeNavigationController.h"
#import "UIBarButtonItem+Extension.h"

@interface MeNavigationController ()

@end

@implementation MeNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置navBar颜色
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
}

/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count == 0) {
        
        UIButton *leftButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 27, 27)];
        [leftButton setImage:[UIImage imageNamed:@"zsyou_logo"] forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * leftItem =[[UIBarButtonItem alloc]initWithCustomView:leftButton];
        viewController.navigationItem.leftBarButtonItem = leftItem;
        
        
    }else { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
        
        // 设置右边的更多按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"tabbar_discover" highImage:@"tabbar_discover_selected"];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)leftAction{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationLeftSlide object:nil];
    
}

- (void)back
{
    //#warning 这里要用self，不是self.navigationController
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}


@end
