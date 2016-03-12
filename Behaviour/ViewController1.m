//
//  ViewController1.m
//  MultipleDelegate
//
//  Created by dj-xxzx-10065 on 16/1/27.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//

#import "ViewController1.h"
#import "HParallaxHeaderBehavior.h"
#import "HMultipleDelegate.h"
#import "HDataSourceObject.h"
#import "KIZNavBarGradientBehavior.h"

@interface ViewController1 ()

@property (nonatomic, strong) NSMutableArray *tableData;

/* 行为 */
@property (nonatomic, strong) IBOutlet KIZNavBarGradientBehavior *navBarBehavior;
@property (nonatomic, strong) HDataSourceObject *dataSource;
//@property (nonatomic, strong) HMultipleDelegate *multipleDelegate;
//@property (nonatomic, strong) HParallaxHeaderBehavior *parallaxBehavior;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self.dataSource;

//    self.navBarBehavior.barBackColor = [UIColor whiteColor];
//    self.parallaxBehavior = [HParallaxHeaderBehavior new];
//    self.parallaxBehavior.targetView = self.imageView;
//
//    self.multipleDelegate = [HMultipleDelegate new];
//    self.multipleDelegate.delegateTargets = @[self, self.parallaxBehavior];
//    
//    self.tableView.delegate = self.multipleDelegate;
}

#pragma mark - lazy loading
- (HDataSourceObject *)dataSource
{
    if (!_dataSource) {
        _dataSource = [HDataSourceObject items:self.tableData
                                cellIdentifier:@"cell1"
                            configureCellBlock:^(UITableViewCell *cell, id item) {
                                cell.textLabel.text = item;
                            }];
    }
    return _dataSource;
}

- (NSMutableArray *)tableData
{
    if (!_tableData) {
        _tableData = [NSMutableArray arrayWithCapacity:0];
        for (NSInteger i = 0; i < 20; i++) {
            NSString *string = [NSString stringWithFormat:@"%zd", i];
            [_tableData addObject:string];
        }
    }
    return _tableData;
}

#pragma mark - 导航栏渐变
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navBarBehavior onViewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navBarBehavior onViewWillDisAppear];
}

@end
