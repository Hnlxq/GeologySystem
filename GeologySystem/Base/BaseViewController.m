//
//  BaseViewController.m
//  Fundssystem
//
//  Created by Migoo on 16/6/15.
//  Copyright © 2016年 Migoo. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //设置navBar颜色
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    [self.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:5]} forState:UIControlStateNormal];
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
