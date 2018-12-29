//
//  GrayLand Class Template For BodyPlus
//  Version 1.0
//
//  BPBaseViewController.m
//  BodyPlus
//
//  Created by GrayLand on 2017/9/22.
//  Copyright © 2017年 BodyPlus. All rights reserved.
//

#import "BPBaseViewController.h"
//#import "BPNavigationController.h"
//#import "BPNotificationString.h"

//#import "BPUserManager.h"

@interface BPBaseViewController ()
{
    BOOL _autoRecoverNavigationBGImage;
    UIImage *_storeNavigationBGImage;
}
@end

@implementation BPBaseViewController

#pragma mark - System Inherited

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.view.backgroundColor = [UIColor whiteColor];
    /* 表示视图是否覆盖到四周的区域，默认是UIRectEdgeAll，即上下左右四个方向都会覆盖
     * UIRectEdgeNone 不要往四周边缘展开 ( 按照非 iOS7 的传统来展示 )
     * self.edgesForExtendedLayout = UIRectEdgeNone;
     */
    self.edgesForExtendedLayout = UIRectEdgeAll;
    /*其中这个属性指定了当Bar使用了不透明图片时，视图是否延伸至Bar所在区域，默认值时NO
     */
    self.extendedLayoutIncludesOpaqueBars = YES;
    /*此属性默认为YES，这样UIViewController下如果只有一个UIScollView或者其子类，那么会自动留出空白，让scollview滚动经过各种bar下面时能隐约看到内容。但是每个UIViewController只能有唯一一个UIScollView或者其子类，如果超过一个，需要将此属性设置为NO,自己去控制留白以及坐标问题。
     */
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    /*由于有的controller使用viewdid(will)apper和viewdid(will)disapper中执行相应的代码(eg:初始化时间...)，为避免出现不必要的问题，现默认不开启；
     */
//    self.enableRightSwipPop = YES;///默认关闭
    
//    [self setupNavigationTitleLabel];
//    [self setupNavigationItem];
    
//    if (self.navigationController.viewControllers.count > 1) {
//        [self setupDefaultBackButton];
//    }
//
//    if ([[BPUserManager defaultManager] isLogin]) {
//        [self onDidLoginSuccess];
//    }
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(onDidLoginSuccess)
//                                                 name:KNotificationDidLogin
//                                               object:nil];
}
//
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [MobClick beginLogPageView:NSStringFromClass([self class])];
//}
//
//#pragma mark - 虚函数
//- (void)setupNavigationItem{};
//- (void)setupViews{};
//- (void)setupLayouts{};
//- (void)onDidLoginSuccess{}
//#pragma mark - UI
//
//- (void)setupNavigationTitleLabel {
//    _bpNavigationTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 30)];
//    _bpNavigationTitleLabel.font = BPFont(@"451");
//    _bpNavigationTitleLabel.textColor = FONT_COLOR1;
//    _bpNavigationTitleLabel.backgroundColor = [UIColor clearColor];
//    _bpNavigationTitleLabel.textAlignment = NSTextAlignmentCenter;
//    _bpNavigationTitleLabel.text = self.title;
//    self.navigationItem.titleView = _bpNavigationTitleLabel;
//}
//
//#pragma mark - Network
//
//#pragma mark - Function
//
//- (void)setNaivationTitleWhiltStyle {
//    self.bpNavigationControler.titleTextAttributes = @{NSForegroundColorAttributeName:FONT_COLOR2,
//                                                       NSFontAttributeName:BPFont(@"451")};
//    
//    _bpNavigationTitleLabel.textColor = FONT_COLOR2;
//}
//
//- (void)setNavigationTitleDefaultStyle {
//    self.bpNavigationControler.titleTextAttributes = @{NSForegroundColorAttributeName:FONT_COLOR1,
//                                                       NSFontAttributeName:BPFont(@"451")};
//    _bpNavigationTitleLabel.textColor = FONT_COLOR1;
//}
//
//- (void)setTitle:(NSString *)title {
//    _bpNavigationTitleLabel.text = title;
//}
//
//- (void)setTitleColor:(UIColor *)color {
//    _bpNavigationTitleLabel.textColor = color;
//}
//
//- (void)setTitleColor:(UIColor *)color withTitle:(NSString *)title {
//    [self setTitle:title];
//    [self setTitleColor:color];
//}
//
//- (UIButton *)createCommonButton {
//    UIButton *commonBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    commonBtn.frame = CGRectMake( 0, 0, 60, 30);
//    commonBtn.tintColor = FONT_COLOR2;
//    commonBtn.titleLabel.font = BPFont(@"421");
//    [commonBtn setTitleColor:FONT_COLOR2 forState:UIControlStateNormal];
//    //[commonBtn setImage:nil forState:UIControlStateNormal];
//    return commonBtn;
//}
//
//- (void)setupDefaultBackButton {
//    UIButton *backBtn = [self createCommonButton];
//    [backBtn setImage:[UIImage imageNamed:@"icon_back_white"] forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    _leftButton = backBtn;
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = leftItem;
//}
//
//- (void)setupDefaultRightButton {
//    UIButton *rightBtn = [self createCommonButton];
////    [rightBtn setImage:[UIImage imageNamed:@"icon_add"] forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//    _rightButton = rightBtn;
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    self.navigationItem.rightBarButtonItem = rightItem;
//}
//
//- (void)rightButtonClicked:(UIButton *)sender {}
//
//- (void)popBack {
//    [NSObject cancelPreviousPerformRequestsWithTarget:self];
//    
//    [[UIApplication sharedApplication].keyWindow endEditing:YES];
//    
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    
//    if(_willPopHandler) {
//        _willPopHandler(self);
//    }
//    
//    if (!self.presentedViewController) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }else{
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self hideHud];
//    [MobClick endLogPageView:NSStringFromClass([self class])];
//    if (_autoRecoverNavigationBGImage) {
//        [self setNavigationBackgroundImageWithImage:_storeNavigationBGImage autoRecover:NO];
//    }
//}
//
//- (void)setNavigationBGClear {
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//}
//
//- (void)setNavigationBGClearWithAutoRecover:(BOOL)autoRecover {
//    [self setNavigationBackgroundImageWithImage:[UIImage new] autoRecover:autoRecover];
//}
//
//- (void)setNavigationBackgroundImageWithImage:(UIImage *)image autoRecover:(BOOL)autoRecover {
//    _autoRecoverNavigationBGImage = autoRecover;
//    if (_autoRecoverNavigationBGImage) {
//        _storeNavigationBGImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
//    }
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//}
//
//- (void)setNavigationBGWhite {
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navi_bg"] forBarMetrics:UIBarMetricsDefault];
//}
//
//#pragma mark - Private methods
//
//#pragma mark - Action
//- (void)doSomething:(dispatch_block_t)block withDelayInSeconds:(double)delayInSeconds {
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), block);
//}
//
//#pragma mark - Getter
//
//- (BPNavigationController *)bpNavigationControler {
//    if ([self.navigationController isKindOfClass:[BPNavigationController class]]) {
//        return (BPNavigationController *)self.navigationController;
//    }
//    return nil;
//}
//#pragma mark - Setter
//- (void)setEnableRightSwipPop:(BOOL)enableRightSwipPop {
//    _enableRightSwipPop = enableRightSwipPop;
//    if ([self.navigationController isKindOfClass:[BPNavigationController class]]) {
//        BPNavigationController *nvc = nil;
//        nvc = (BPNavigationController *)self.navigationController;
//        nvc.enableRightSwipeToPop = enableRightSwipPop;///< 默认开启右滑返回
//    }
//}
//
@end
