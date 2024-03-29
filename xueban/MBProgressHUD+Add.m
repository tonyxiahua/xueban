//
//  MBProgressHUD+Add.m
//  视频客户端
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+Add.h"

@implementation MBProgressHUD (Add)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil)
        view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // Looks a bit nicer if we make it square.
    hud.square = YES;

    hud.minSize = CGSizeMake(80.0f, 80.0f);
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒之后再消失
    [hud hide:YES afterDelay:1.5];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

+ (void)showMessage:(NSString *)text view:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.margin = 10.f;
    hud.yOffset = (SCREENHEIGHT/2)-40-49;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    return hud;
}

/**
 *  手动关闭MBProgressHUD
 */
+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

/**
 *  手动关闭MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (MBProgressHUD *)showProgress:(NSString *)title toView:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    //progress = [[MBProgressHUD alloc]initWithWindow:[UIApplication sharedApplication].keyWindow];
    MBProgressHUD *progress = [[MBProgressHUD alloc]initWithView:view];
    progress.labelText = title;
    [view addSubview:progress];
    [progress setMode:MBProgressHUDModeText];   //MBProgressHUDModeIndeterminate //圆盘的扇形进度显示
    progress.taskInProgress = YES;
    [progress show:YES];   //显示
    
    progress.yOffset = - 49.0f;
    
    [progress hide:YES afterDelay:delay]; //显示时间
    
    return progress;
}

+ (MBProgressHUD *)showProgress:(UIView *)view
{
    //progress = [[MBProgressHUD alloc]initWithWindow:[UIApplication sharedApplication].keyWindow];
    MBProgressHUD *progress = [[MBProgressHUD alloc]initWithView:view];
    [view addSubview:progress];
    [progress setMode:MBProgressHUDModeIndeterminate];   //MBProgressHUDModeIndeterminate //圆盘的扇形进度显示
    [progress show:YES];   //显示
    progress.yOffset = - 49.0f;
    return progress;
}

@end
