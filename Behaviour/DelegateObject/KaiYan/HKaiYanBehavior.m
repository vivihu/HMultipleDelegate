//
//  HKaiYanBehavior.m
//  MultipleDelegate
//
//  Created by dj-xxzx-10065 on 16/1/27.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//

#import "HKaiYanBehavior.h"

#define kRatio 2

@implementation HKaiYanBehavior

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray *array = [self.tableView visibleCells];
    [array enumerateObjectsUsingBlock:^(UITableViewCell * cell, NSUInteger idx, BOOL * stop) {
        [self cellOffSet:cell];
    }];
}

- (CGFloat)cellOffSet:(UITableViewCell *)cell
{
    /*
     将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
     这里用来获取cell在window上的位置
     */
    CGRect toWindow = [cell convertRect:cell.bounds toView:[UIApplication sharedApplication].keyWindow];
    
    //获取父视图的中心
    CGPoint windowCenter = cell.superview.center;
    
    //cell在y轴上的位移
    CGFloat cellOffsetY = CGRectGetMidY(toWindow) - windowCenter.y;
    
    //位移比例
    CGFloat offsetDig = kRatio * cellOffsetY / CGRectGetHeight(cell.superview.frame);
    
    //要补偿的位移
    CGFloat offset = -offsetDig * CGRectGetHeight(cell.frame)/kRatio;
    
    //让pictureViewY轴方向位移offset
    CGAffineTransform transY = CGAffineTransformMakeTranslation(0, offset);
    [(UIView *)[cell valueForKey:@"kaiyan"] setTransform:transY];
    
    return offset;
}

@end
