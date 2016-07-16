//
//  FoodItem.h
//  TimerSlider
//
//  Created by  Yury_apple_mini on 7/4/16.
//  Copyright © 2016 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodItem : NSObject

@property (nonatomic, strong) NSString *foodName;
@property (nonatomic, strong) NSIndexPath *currentPath;
@property (assign) NSInteger timeCooking;
@property (assign) NSInteger remainingTimeCooking;
@property (assign) NSInteger weightUnit;
@property (assign) NSInteger totalUnits;
@property (assign) float progress;


@end
