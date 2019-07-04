//
//  AppDelegate.h
//  GuideLoginDemo
//
//  Created by yfc on 17/5/10.
//  Copyright © 2017年 yfc. All rights reserved.
//
#import <UIKit/UIKit.h>


typedef enum JumpType
{
    ZHUANZHANG_HOME_LOGIN = 0,
    HUIKUAN_HOME_LOGIN ,
    JIEKUAN_HOME_LOGIN ,
    
}MYJumpType;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (assign, nonatomic) BOOL isLogin;
@property (assign, nonatomic)MYJumpType jumpType;

@end

