//
//  ViewController.m
//  MultipleDelegate
//
//  Created by dj-xxzx-10065 on 16/1/26.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//

#import "ViewController.h"

#import "HDataSourceObject.h"
#import "HMultipleDelegate.h"
#import "HKaiYanBehavior.h"
#import "KYCell.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *tableData;

/* 行为 */
@property (strong, nonatomic) HDataSourceObject *dataSource;
//@property (strong, nonatomic) HMultipleDelegate *multipleDelegate;
//@property (strong, nonatomic) HKaiYanBehavior *kaiyanDelegate;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.dataSource = self.dataSource;

//    self.kaiyanDelegate = [[HKaiYanBehavior alloc] init];
//    self.kaiyanDelegate.tableView = self.tableView;
//    
//    self.multipleDelegate = [[HMultipleDelegate alloc] init];
//    self.multipleDelegate.delegateTargets = @[self, self.kaiyanDelegate];
//    
//    self.tableView.delegate = self.multipleDelegate;
}

#pragma mark - lazy loading
- (HDataSourceObject *)dataSource
{
    if (!_dataSource) {
        _dataSource = [HDataSourceObject items:self.tableData
                                cellIdentifier:@"cell"
                            configureCellBlock:^(KYCell *cell, id item) {
                                cell.kaiyan.image = item;
                            }];
    }
    return _dataSource;
}

- (NSMutableArray *)tableData
{
    if (!_tableData) {
        _tableData = [NSMutableArray arrayWithCapacity:0];
        for (NSInteger i = 0; i < 21; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd",i]];
            [_tableData addObject:image];
        }
    }
    return _tableData;
}

@end
