//
//  FirstViewController.m
//  GuideLoginDemo
//
//  Created by yfc on 17/5/10.
//  Copyright © 2017年 yfc. All rights reserved.
//

#import "FirstViewController.h"
#import "config.h"
#import "ZhuanZhangViewController.h"
#import "HuiKuanViewController.h"
#import "JieKuanViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //随机生成三个按钮
    int width = SCREEN_WIDTH_NEW - BALL_WIDTH;
    int height = SCREEN_HEIGHT_NEW - BALL_WIDTH;
    NSArray *titleArray = @[@"转账",@"汇款",@"借款"];
    for (int i = 0; i < 3; i++) {
        int cx = 0;
        int cy = 0;
        cx = arc4random() % width;
        cy = arc4random() % height;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"0%ddog",i]] forState:UIControlStateNormal];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        btn.tag = i;
        btn.centerY = cy;
        btn.centerX = cx;
        btn.width = 70;
        btn.height = 70;
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
}
//三个按钮的点击事件
- (void)btnClicked:(UIButton *)btnn{

    if (btnn.tag == 0) {
        //
        //判断是否登录 登录了直接进 没登录引导登录并登录成功后直接跳到对应业务
        //
        if (APPLICATION.isLogin == YES) {
            [self jumpToZhuanZhang];
        }else{
            //
            //先移除本通知，原因是：点击一个功能跳到登录界面，但是在登录界面点的取消，反复操作，再点这个功能，
            //相同的通知会增加多次，登陆成功后会多次进入相应的功能
            //
            APPLICATION.jumpType = ZHUANZHANG_HOME_LOGIN;
            [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LOGIN_ZZ" object:nil] ;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpToZhuanZhang) name:@"LOGIN_ZZ" object:nil];
            LoginViewController *loginVC = [[LoginViewController alloc]init];
            [self.navigationController presentViewController:loginVC animated:YES completion:^{}];
        }
        

    }else if(btnn.tag == 1){
        if (APPLICATION.isLogin == YES) {
            [self jumpToHuiKuan];
        }else{
            APPLICATION.jumpType = HUIKUAN_HOME_LOGIN;
            [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LOGIN_HK" object:nil] ;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpToHuiKuan) name:@"LOGIN_HK" object:nil];
            LoginViewController *loginVC = [[LoginViewController alloc]init];
            [self.navigationController presentViewController:loginVC animated:YES completion:^{
                
            }];
        }

    }else{
        if (APPLICATION.isLogin == YES) {
            [self jumpToJieKuan];
        }else{
            APPLICATION.jumpType = JIEKUAN_HOME_LOGIN;
            [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LOGIN_JK" object:nil] ;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpToJieKuan) name:@"LOGIN_JK" object:nil];
            LoginViewController *loginVC = [[LoginViewController alloc]init];
            [self.navigationController presentViewController:loginVC animated:YES completion:^{
                
            }];
        }

    }
    
}
-(void)jumpToZhuanZhang{
    ZhuanZhangViewController *vc = [[ZhuanZhangViewController alloc]init];
    vc.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)jumpToHuiKuan{
    HuiKuanViewController *vc = [[HuiKuanViewController alloc]init];
    vc.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)jumpToJieKuan{
    JieKuanViewController *vc = [[JieKuanViewController alloc]init];
    vc.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
