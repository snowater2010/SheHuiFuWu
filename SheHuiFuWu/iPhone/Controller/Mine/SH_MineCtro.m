//
//  SH_MineCtro.m
//  SheHuiFuWu
//
//  Created by lipeng11 on 13-6-4.
//  Copyright (c) 2013年 shehuifuwu. All rights reserved.
//

#import "SH_MineCtro.h"

#import "iflyMSC/SpeechUser.h"
#import "iflyMSC/UpLoadController.h"
#import "iflyMSC/IFlyRecognizeControl.h"

#define H_CONTROL_ORIGIN CGPointMake(20, 70)

@interface SH_MineCtro () <IFlyRecognizeControlDelegate>
           // 识别控件

@property(nonatomic, retain) IFlyRecognizeControl *iFlyRecognizeControl;

@end

@implementation SH_MineCtro

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
    [loginButton setTitle:@"start" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(onButtonRecognize:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    NSString *initParam = [[NSString alloc] initWithFormat:
						   @"server_url=%@,appid=%@", IFLY_ENGINE_URL, IFLY_APPID];
    
	// init the RecognizeControl
    // 初始化语音识别控件
	self.iFlyRecognizeControl = [[IFlyRecognizeControl alloc] initWithOrigin:H_CONTROL_ORIGIN initParam:initParam];
	
    [self.view addSubview:_iFlyRecognizeControl];
    
    // Configure the RecognizeControl
    // 设置语音识别控件的参数,具体参数可参看开发文档
	[_iFlyRecognizeControl setEngine:@"sms" engineParam:nil grammarID:nil];
    
	[_iFlyRecognizeControl setSampleRate:16000];
    
	_iFlyRecognizeControl.delegate = self;
    
    //不显示log
	[_iFlyRecognizeControl setShowLog: NO];
    
    [initParam release];
    
    //注册unActive事件
    //如果应用程序不支持后台模式，则unActive事件时，需要执行cancel
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resignActive) name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.iFlyRecognizeControl = nil;
    [super dealloc];
}

#pragma mark-
#pragma Utilities
// 开始语音识别，
- (void)onButtonRecognize:(id)sender
{
    // begin to recognize
	if([_iFlyRecognizeControl start])
	{
//		[self disableButton];
	}
}

#pragma mark-
#pragma IFlyRecognizeControlDelegate

/*
 @function	onResult
 @abstract	回调返回识别结果
 @discussion
 @param     resultArray - 返回的识别结果，为一个数组，数组中存放的为字典，key值"NAME"对应的为返回结果
 */
- (void)onResult:(IFlyRecognizeControl *)iFlyRecognizeControl theResult:(NSArray *)resultArray
{
    NSString *resultStr = [[resultArray objectAtIndex:0] objectForKey:@"NAME"];
    _ALERT_SIMPLE_(resultStr);
}

/*
 @function	onRecognizeEnd
 @abstract	识别结束回调
 @discussion
 @param
 */
- (void)onRecognizeEnd:(IFlyRecognizeControl *)iFlyRecognizeControl theError:(SpeechError) error
{
    
}

@end
