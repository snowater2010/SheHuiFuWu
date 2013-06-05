//
//  SH_UsefulCtro.m
//  SheHuiFuWu
//
//  Created by lipeng11 on 13-6-4.
//  Copyright (c) 2013年 shehuifuwu. All rights reserved.
//

#import "SH_UsefulCtro.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface SH_UsefulCtro () <TencentSessionDelegate>

@property(nonatomic, retain) TencentOAuth *tencentOAuth;
@property(nonatomic, retain) NSMutableArray* permissions;

@end

@implementation SH_UsefulCtro

- (void)loadView
{
    [super loadView4NavTabPage];
    self.view.backgroundColor = [UIColor flatBlueColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
	loginButton.backgroundColor = [UIColor purpleColor];
    [loginButton setTitle:@"login" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(doLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    self.permissions = [NSArray arrayWithObjects:
                     kOPEN_PERMISSION_GET_USER_INFO,
                     kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                     kOPEN_PERMISSION_ADD_ALBUM,
                     kOPEN_PERMISSION_ADD_IDOL,
                     kOPEN_PERMISSION_ADD_ONE_BLOG,
                     kOPEN_PERMISSION_ADD_PIC_T,
                     kOPEN_PERMISSION_ADD_SHARE,
                     kOPEN_PERMISSION_ADD_TOPIC,
                     kOPEN_PERMISSION_CHECK_PAGE_FANS,
                     kOPEN_PERMISSION_DEL_IDOL,
                     kOPEN_PERMISSION_DEL_T,
                     kOPEN_PERMISSION_GET_FANSLIST,
                     kOPEN_PERMISSION_GET_IDOLLIST,
                     kOPEN_PERMISSION_GET_INFO,
                     kOPEN_PERMISSION_GET_OTHER_INFO,
                     kOPEN_PERMISSION_GET_REPOST_LIST,
                     kOPEN_PERMISSION_LIST_ALBUM,
                     kOPEN_PERMISSION_UPLOAD_PIC,
                     kOPEN_PERMISSION_GET_VIP_INFO,
                     kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                     kOPEN_PERMISSION_GET_INTIMATE_FRIENDS_WEIBO,
                     kOPEN_PERMISSION_MATCH_NICK_TIPS_WEIBO,
                     nil];
    
    self.tencentOAuth = [[TencentOAuth alloc] initWithAppId:TENCENT_APP_ID andDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.tencentOAuth = nil;
    self.permissions = nil;
    [super dealloc];
}

#pragma mark-
#pragma Utilities
- (void)doLogin:(id)sender
{
    [_tencentOAuth authorize:_permissions inSafari:NO];
}

#pragma mark-
#pragma TencentSessionDelegate
/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin
{
    NSString *message = @"";
    if (_tencentOAuth.accessToken
        && 0 != [_tencentOAuth.accessToken length])
    {
        message = [NSString stringWithFormat:@"登录成功 accesstoken:%@", _tencentOAuth.accessToken];
    }
    else
    {
        message = @"登录不成功 没有获取accesstoken";
    }
    _ALERT_SIMPLE_(message);
}

/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    
}

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork
{
    
}

@end
