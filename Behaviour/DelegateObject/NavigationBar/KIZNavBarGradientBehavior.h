//
//  KIZNavBarGradientBehavior.h
//  KIZParallaTableDemo https://github.com/zziking/KIZBehavior
//
//  Created by kingizz on 15/10/3.
//  Copyright © 2015年 kingizz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KIZNavBarGradientBehavior : NSObject<UIScrollViewDelegate>

/** 状态栏是否颜色是否动态改变，默认为YES，需要在info.plist中设置 View controller-based status bar appearance 为 NO才有效果 */
@property (nonatomic, assign) IBInspectable BOOL statusBarStyleChange;

/** 导航栏tintColor变化的临界值默认为200 */
@property (nonatomic, assign) IBInspectable CGFloat criticalOffset;

/** 导航栏渐变时的背景颜色，默认为navigationbar.barTintColor */
@property (nonatomic, strong) IBInspectable UIColor *barBackColor;

@property (nonatomic, weak) IBOutlet id owner;

- (void)onViewWillAppear;

- (void)onViewWillDisAppear;

@end
