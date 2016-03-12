//
//  DataSourceObject.m
//  MultipleDelegate
//

#import "HDataSourceObject.h"

@interface HDataSourceObject ()

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation HDataSourceObject

+ (id)items:(NSArray *)items cellIdentifier:(NSString *)cellID configureCellBlock:(TableViewCellConfigureBlock)block
{
    return [[self alloc] initWithItems:items cellIdentifier:cellID configureCellBlock:block];
}

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        self.items = [anItems copy];
        self.identifier = [aCellIdentifier copy];
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

@end
