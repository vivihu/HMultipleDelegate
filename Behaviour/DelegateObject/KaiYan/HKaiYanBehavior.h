//
//  HKaiYanBehavior.h
//  MultipleDelegate
//
//  Created by dj-xxzx-10065 on 16/1/27.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//


/*使用此类需要设置：
 1. 设置tableView
 2. 效果视图（一般是UIImageView）设置：
    ^ 效果视图名称为kaiyan，否则程序会崩溃
    ^ 效果视图高度默认为cell的2倍
 */


#import <UIKit/UIKit.h>

@interface HKaiYanBehavior : NSObject <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
