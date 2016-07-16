//
//  TimeBoardViewController.h
//  TimerSlider
//
//  Created by  Yury_apple_mini on 7/4/16.
//  Copyright © 2016 MyCompany. All rights reserved.
//


#import "ExecitingTableViewController.h"

@interface TimeBoardViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *foodList1;
@property (nonatomic, strong) NSMutableArray *heightOfInnerTable;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeight;

@end
