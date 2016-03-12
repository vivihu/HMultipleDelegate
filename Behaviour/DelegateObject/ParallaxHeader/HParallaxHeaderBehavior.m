//
//  HParallaxHeaderBehavior.m
//  MultipleDelegate
//
//  Created by dj-xxzx-10065 on 16/1/27.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//

#import "HParallaxHeaderBehavior.h"

@interface HParallaxHeaderBehavior () <UIScrollViewDelegate>

@property (nonatomic, assign) CGRect targetViewOriginFrame;
@property (nonatomic, assign) BOOL didInited;

@end

@implementation HParallaxHeaderBehavior

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //初始化
    if (!_didInited) [self inited];
    //计算
    [self calculateTargetViewFrameWithOffsetY:scrollView.contentOffset.y];
}

- (void)inited
{
    _didInited = YES;
    
    if (!_offsetMultiple) self.offsetMultiple = 0.6;
    _targetViewOriginFrame = _targetView.frame;
}

- (void)setOffsetMultiple:(CGFloat)offsetMultiple
{
    _offsetMultiple = MAX(MIN(offsetMultiple, 1), 0);
}

#pragma mark - 计算坐标
- (void)calculateTargetViewFrameWithOffsetY:(CGFloat)offsetY
{
    CGFloat x, y, width , height;
    if (offsetY >= 0) {
        //向上滚动
        x      = _targetViewOriginFrame.origin.x;
        y      = _targetViewOriginFrame.origin.y - (offsetY * _offsetMultiple);
        width  = _targetViewOriginFrame.size.width;
        height = _targetViewOriginFrame.size.height;
    }else{
        //向下滚动
        y      = _targetViewOriginFrame.origin.y;
        //按高度比例换算宽度和x轴坐标
        height = _targetViewOriginFrame.size.height + ABS(offsetY);
        width  = _targetViewOriginFrame.size.width / _targetViewOriginFrame.size.height * height;
        x      = _targetViewOriginFrame.origin.x - (width - _targetViewOriginFrame.size.width) / 2.0;
    }
    
    _targetView.frame = CGRectMake(x, y, width, height);
}

@end
