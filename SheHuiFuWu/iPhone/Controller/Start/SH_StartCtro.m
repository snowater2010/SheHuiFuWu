//
//  SH_StartCtro.m
//  SheHuiFuWu
//
//  Created by lipeng11 on 13-6-3.
//  Copyright (c) 2013年 shehuifuwu. All rights reserved.
//

#import "SH_StartCtro.h"
#import "SH_MainCtro.h"

@interface SH_StartCtro ()

@end

@implementation SH_StartCtro

- (void)loadView
{
    [super loadView];
    CGRect frame = self.view.frame;
    
    self.view.backgroundColor = [UIColor flatWhiteColor];
    
    float image_w = 250.;
    float image_h = 300.;
    float image_x = (frame.size.width-image_w)*0.5;
    float image_y = (frame.size.height-image_h)*0.3;
    UIImageView *startImageView = [[UIImageView alloc] initWithFrame:CGRectMake(image_x, image_y, image_w, image_h)];
    startImageView.image = [UIImage imageNamed:@"start_logo.png"];
    [self.view addSubview:startImageView];
    [startImageView release];
    
    float label_x = 0.;
    float label_y = image_y + image_h;
    float label_w = frame.size.width;
    float label_h = 30;
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(label_x, label_y, label_w, label_h)];
    nameLabel.text = NSLocalizedString(@"title_app_name", nil);
    nameLabel.textAlignment = _ALIGN_CENTER;
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [self.view addSubview:nameLabel];
    [nameLabel release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(goMainView) userInfo:nil repeats:NO];
}

- (void)goMainView
{
    SH_MainCtro *mainCtro = [[SH_MainCtro alloc] init];
    UINavigationController *navigationCtro = [[UINavigationController alloc] initWithRootViewController:mainCtro];
    [mainCtro release];
//    navigationCtro.navigationBar.backgroundColor = [UIColor yellowColor];
    [self presentModalViewController:navigationCtro animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
