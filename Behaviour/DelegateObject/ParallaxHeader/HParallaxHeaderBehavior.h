//
//  HParallaxHeaderBehavior.h
//  MultipleDelegate
//
//  Created by dj-xxzx-10065 on 16/1/27.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//


/*
 设置：
    1. 设置targetView: 
        ^ contentMode = UIViewContentModeScaleAspectFill;
        ^ clipsToBounds = YES;
    2. 设置tableView的headView，高度与targetView一致
    3. tableView与headView的背景色为clearcolor
 */

#import <UIKit/UIKit.h>

@interface HParallaxHeaderBehavior : NSObject

/**
 *  视差效果视图
 */
@property (nonatomic, weak) IBOutlet UIView *targetView;

/**
 *   向上滚动时，背景与scrollview offsetY的视差倍率，默认0.6
 */
@property (nonatomic, assign) IBInspectable CGFloat offsetMultiple;

@end
