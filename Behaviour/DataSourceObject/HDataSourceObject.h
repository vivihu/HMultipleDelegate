//
//  DataSourceObject.h
//  MultipleDelegate
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface HDataSourceObject : NSObject <UITableViewDataSource>

+ (id)items:(NSArray *)items cellIdentifier:(NSString *)cellID configureCellBlock:(TableViewCellConfigureBlock)block;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
