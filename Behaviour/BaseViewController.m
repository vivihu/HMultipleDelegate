//
//  BaseViewController.m
//  MultipleDelegate
//
//  Created by dj-xxzx-10065 on 16/3/3.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@ %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

@end
