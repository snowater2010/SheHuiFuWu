//
//  SH_HomeCtro.m
//  SheHuiFuWu
//
//  Created by lipeng11 on 13-6-4.
//  Copyright (c) 2013年 shehuifuwu. All rights reserved.
//

#import "SH_HomeCtro.h"

@interface SH_HomeCtro ()

@end

@implementation SH_HomeCtro

- (void)loadView
{
    [super loadView4NavTabPage];
    self.view.backgroundColor = [UIColor flatBlueColor];
    
    CGRect frame = self.view.frame;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view1.backgroundColor = [UIColor flatRedColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height-50, 50, 50)];
    view2.backgroundColor = [UIColor flatRedColor];
    [self.view addSubview:view2];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	
    self.title = NSLocalizedString(@"title_app_name", nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
