//
//  GrayLand Class Template For BodyPlus
//  Version 1.0
//
//  BPBaseViewController.h
//  BodyPlus
//
//  Created by GrayLand on 2017/9/22.
//  Copyright © 2017年 BodyPlus. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UIViewController+BPHUD.h"

@class BPNavigationController;
@class BPBaseViewController;
typedef void (^BPBaseViewControllerWillPopHandler)(BPBaseViewController *controller);

@interface BPBaseViewController : UIViewController

#pragma mark - Property
@property (nonatomic, weak) BPNavigationController *bpNavigationControler;
@property (nonatomic, strong) BPBaseViewControllerWillPopHandler willPopHandler;
//@property (nonatomic, assign) BOOL enableRightSwipPop;///<当前界面是否使用右滑返回开关 Default:YES
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UILabel *bpNavigationTitleLabel;

#pragma mark - PublicFunction

//- (void)popBack;
//
//- (UIButton *)createCommonButton;
//- (void)setupDefaultBackButton;
//- (void)setupDefaultRightButton;
//
//- (void)setNavigationBGClearWithAutoRecover:(BOOL)autoRecover;
//- (void)setNavigationBackgroundImageWithImage:(UIImage *)image autoRecover:(BOOL)autoRecover;
//- (void)setNavigationBGClear;
//- (void)setNavigationBGWhite;
//
//- (void)setNaivationTitleWhiltStyle;
//- (void)setNavigationTitleDefaultStyle;
//- (void)setTitle:(NSString *)title;
//- (void)setTitleColor:(UIColor *)color;
//- (void)setTitleColor:(UIColor *)color withTitle:(NSString *)title;
//
//- (void)doSomething:(dispatch_block_t)block withDelayInSeconds:(double)delayInSeconds;
//
//#pragma mark - 虚函数
//- (void)rightButtonClicked:(UIButton *)sender;
//- (void)setupNavigationItem;
//- (void)setupViews;
//- (void)setupLayouts;
//- (void)onDidLoginSuccess;
//- (void)setWillPopHandler:(BPBaseViewControllerWillPopHandler)willPopHandler;
//
@end
