//
//  HMultipleDelegate.h
//  MultipleDelegate
//
//  Created by dj-xxzx-10065 on 16/1/26.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMultipleDelegate : NSObject

@property (nonatomic, strong) IBOutletCollection(id) NSArray* delegateTargets;

@end
