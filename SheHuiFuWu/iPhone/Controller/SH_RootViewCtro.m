//
//  SH_RootViewCtro.m
//  SheHuiFuWu
//
//  Created by lipeng11 on 13-6-3.
//  Copyright (c) 2013年 shehuifuwu. All rights reserved.
//

#import "SH_RootViewCtro.h"

@interface SH_RootViewCtro ()

@end

@implementation SH_RootViewCtro

- (void)loadView
{
    [super loadView];
}

- (void)loadView4NavTabPage
{
    //设置带有navbar和tabbar的页面
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _DEVICE_WIDTH, _DEVICE_TABNAV_HEIGHT)];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [super dealloc];
}

@end
