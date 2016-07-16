//
//  ExecitingTableViewController.h
//  TimerSlider
//
//  Created by  Yury_apple_mini on 7/4/16.
//  Copyright © 2016 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItem.h"

@protocol CompleteProtocolDelegate

- (void)addCompletedItemsToList: (NSArray *) completedItems;

@end



@interface ExecitingTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *executingFoodList;
@property (nonatomic, weak)   id<CompleteProtocolDelegate> delegate;
@property (assign) int heightSuperView;

@end
