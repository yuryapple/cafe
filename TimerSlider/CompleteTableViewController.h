//
//  CompleteTableViewController.h
//  TimerSlider
//
//  Created by  Yury_apple_mini on 7/16/16.
//  Copyright © 2016 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExecitingTableViewController.h"


@interface CompleteTableViewController : UITableViewController <CompleteProtocolDelegate>

@property (nonatomic, strong) NSMutableArray *completeFoodList;


@end
