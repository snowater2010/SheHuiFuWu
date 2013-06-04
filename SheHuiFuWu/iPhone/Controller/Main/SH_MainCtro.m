//
//  SH_MainCtro.m
//  SheHuiFuWu
//
//  Created by lipeng11 on 13-6-4.
//  Copyright (c) 2013年 shehuifuwu. All rights reserved.
//

#import "SH_MainCtro.h"
#import "SH_HomeCtro.h"
#import "SH_UsefulCtro.h"
#import "SH_MineCtro.h"
#import "SH_MoreCtro.h"

@interface SH_MainCtro ()

@end

@implementation SH_MainCtro

- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SH_HomeCtro *homeCtro = [[SH_HomeCtro alloc] init];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"menu_home.png"] tag:0];
    homeCtro.tabBarItem = item1;
    [item1 release];
    
    SH_UsefulCtro *usefulCtro = [[SH_UsefulCtro alloc] init];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"常用" image:[UIImage imageNamed:@"menu_use.png"] tag:1];
    usefulCtro.tabBarItem = item2;
    [item2 release];
    
    SH_MineCtro *mainCtro = [[SH_MineCtro alloc] init];
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"menu_mine.png"] tag:2];
    mainCtro.tabBarItem = item3;
    [item3 release];
    
    SH_MoreCtro *moreCtro = [[SH_MoreCtro alloc] init];
    UITabBarItem *item4 = [[UITabBarItem alloc] initWithTitle:@"更多" image:[UIImage imageNamed:@"menu_more.png"] tag:3];
    moreCtro.tabBarItem = item4;
    [item4 release];
    
    NSArray *ctroArray = [[NSArray alloc] initWithObjects:homeCtro, usefulCtro, mainCtro, moreCtro, nil];
    [homeCtro release];
    [usefulCtro release];
    [mainCtro release];
    [moreCtro release];
    
    self.viewControllers = ctroArray;
    
    [ctroArray release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
