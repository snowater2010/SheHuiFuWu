//
//  macdefine.h
//  SheHuiFuWu
//
//  Created by lipeng11 on 13-6-3.
//  Copyright (c) 2013年 medical.review. All rights reserved.
//

#define SERVICE_URL         @"http://222.173.30.135:8088/ylgl/webif"

//tencent
#define TENCENT_APP_ID      @"100455456"

//iFly
#define IFLY_APPID @"51a57176"
#define IFLY_ENGINE_URL @"http://dev.voicecloud.cn:1028/index.htm"

//获取屏幕高度
#define _DEVICE_STATEBAR_HEIGHT 20
#define _DEVICE_HEIGHT ([UIScreen mainScreen].bounds.size.height - _DEVICE_STATEBAR_HEIGHT)
#define _DEVICE_WIDTH [UIScreen mainScreen].bounds.size.width
#define _DEVICE_TABNAV_HEIGHT (_DEVICE_HEIGHT - 49 - 44)
#define _DEVICE_NAV_HEIGHT (_DEVICE_HEIGHT - 44)
#define _DEVICE_TAB_HEIGHT (_DEVICE_HEIGHT - 49)

//对齐方式
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0 
    #define _ALIGN_LEFT      UITextAlignmentLeft
    #define _ALIGN_CENTER    UITextAlignmentCenter
    #define _ALIGN_RIGHT     UITextAlignmentRight
#else
    #define _ALIGN_LEFT      NSTextAlignmentLeft
    #define _ALIGN_CENTER    NSTextAlignmentCenter
    #define _ALIGN_RIGHT     NSTextAlignmentRight 
#endif

/**********************动画宏部分****************************/
//动画声明
#define _ANIMATIONS_INIT_BEGIN_(time)       [UIView beginAnimations:@"" context:nil];\
                                            [UIView setAnimationDuration:time]; \
                                            [UIView setAnimationDelegate:self];\
//动画结束语句
#define _ANIMATIONS_INIT_END_               [UIView commitAnimations];

//简单的警示框
#define _ALERT_SIMPLE_(_msg) \
        {\
            NSString* str_note   = NSLocalizedString(@"alert_note", nil);\
            NSString* str_cancel = NSLocalizedString(@"alert_sure", nil);\
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:str_note message:_msg delegate:nil cancelButtonTitle:str_cancel otherButtonTitles:nil, nil];\
            [alert show];\
            [alert release];\
        }\
//有确认的警示框(1个按钮)
#define _ALERT_CONFIRM_(_msg, _delegate, _tag) \
        {\
            NSString* str_note   = NSLocalizedString(@"alert_note", nil);\
            NSString* str_cancel = NSLocalizedString(@"alert_sure", nil);\
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:str_note message:_msg delegate:_delegate cancelButtonTitle:str_cancel otherButtonTitles:nil, nil];\
            alert.tag = _tag;    \
            [alert show];\
            [alert release];\
        }\
//有选择的警示框(2个按钮)
#define _ALERT_SELECT_(_msg, _delegate, _tag)\
        {\
            NSString* str_note   = NSLocalizedString(@"alert_note", nil);\
            NSString* str_cancel = NSLocalizedString(@"alert_sure", nil);\
            NSString* str_cancel   = NSLocalizedString(@"alert_cancel", nil);\
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:str_note message:_msg delegate:_delegate cancelButtonTitle:str_cancel otherButtonTitles:str_sure, nil];\
            alert.tag = _tag;\
            [alert show];\
            [alert release];\
        }\

//上锁，解锁
#define _lock       NSLock *lock = [[NSLock alloc] init];\
                    [lock lock];
#define _unlock     [lock unlock];\
                    [lock release];

