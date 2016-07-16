//
//  PrepareFoodListViewController.h
//  TimerSlider
//
//  Created by  Yury_apple_mini on 7/4/16.
//  Copyright © 2016 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItem.h"
#import "TimeBoardViewController.h"

@interface PrepareFoodListViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *foodList;

- (IBAction)showTimeBoard:(id)sender;

@end
