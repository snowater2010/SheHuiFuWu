//
//  SH_MoreCtro.m
//  SheHuiFuWu
//
//  Created by lipeng11 on 13-6-4.
//  Copyright (c) 2013年 shehuifuwu. All rights reserved.
//

#import "SH_MoreCtro.h"
#import "BMKMapView.h"

@interface SH_MoreCtro ()

@end

@implementation SH_MoreCtro

- (void)loadView
{
    [super loadView4NavTabPage];
    self.view.backgroundColor = [UIColor flatBlueColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
