//
//  InformationViewController.m
//  GeologySystem
//
//  Created by Migoo on 16/6/15.
//  Copyright © 2016年 Migoo. All rights reserved.
//

#import "InformationViewController.h"
#import "DetailViewController.h"

@interface InformationViewController ()
/** 标语 */
@property (nonatomic, weak) UIImageView *sloganImageView;

/** 按钮 */
@property (nonatomic, strong) NSMutableArray *buttons;
/**
 *顶部半透明的左边按钮
 */
@property(nonatomic,strong)UIButton* leftBtn;
@end

@implementation InformationViewController


//懒加载创建button
- (NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置背景文字
    [self setupSloganView];
    
    //设置button
    [self setupButtons];
    //创建左边button
    [self setLeftButton];
    
    
    // Do any additional setup after loading the view.
}
- (void)setLeftButton{
    
    
    // 设置左边的返回按钮
    UIButton *leftButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 27, 27)];
    [leftButton setImage:[UIImage imageNamed:@"zsyou_logo"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem =[[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
}

//设置背景图
- (void)setupSloganView
{
    // CGFloat sloganY = SCREENHEIGHT * 0.2;
    
    // 添加
    UIImageView *sloganView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    sloganView.y = SCREENHEIGHT * 0.15;
    sloganView.centerX = SCREENWIDTH * 0.5;
    //sloganView.frame = CGRectMake(0, 64, self.view.width, 100);
    [self.view addSubview:sloganView];
    self.sloganImageView = sloganView;
}

/*
 * 创建多个按钮
 */
- (void)setupButtons
{
    // 数据
    NSArray *images = @[@"icon_homepage_moreCategory", @"icon_homepage_moreCategory", @"icon_homepage_moreCategory", @"icon_homepage_moreCategory", @"icon_homepage_moreCategory", @"icon_homepage_moreCategory", @"icon_homepage_moreCategory", @"icon_homepage_moreCategory", @"icon_homepage_moreCategory", @"icon_homepage_moreCategory"];
    NSArray *titles = @[@"井基本数据",@"井下作业施工纪录",@"井压测试资料",@"流压测试资料",@"取芯情况统计",@"试油成果数据",@"水井单井水质取样分析结果",@"水井年生产情况摘要",@"天然气分析结果",@"压灰压降测试资料"];
    
    // 一些参数
    NSUInteger count = images.count;
    int maxColsCount = 4; // 一行的列数
    
    // 按钮尺寸
    CGFloat buttonW = SCREENWIDTH / maxColsCount;
    // CGFloat buttonH = buttonW * 0.7;
    
    
    for (int i = 0; i < count; i++) {
        //创建button
        LiButton *button = [LiButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:button];
        [self.view addSubview:button];
        //内容
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        //frame
        
        button.frame = CGRectMake(i%maxColsCount * buttonW, (i)/maxColsCount * buttonW * 1.5 + SCREENHEIGHT *0.25, buttonW, buttonW * 1.5);
        
        
        
        
    }
}
//点击事件
- (void)leftAction{
    
    //发送通知，执行侧滑
    // [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationLeftSlide object:nil];
    
    
    
    
}

-(void)buttonClick:(UIButton *)sender{
    if (sender == self.buttons[0]) {
        DetailViewController *detail = [[DetailViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
        
    }else if (sender == self.buttons[1]){
        DetailViewController *detail = [[DetailViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
    }else if (sender == self.buttons[2]){
        DetailViewController *detail = [[DetailViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
        
    }else{
        DetailViewController *detail = [[DetailViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
        
    }
}


@end
