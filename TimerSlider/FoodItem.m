//
//  FoodItem.m
//  TimerSlider
//
//  Created by  Yury_apple_mini on 7/4/16.
//  Copyright © 2016 MyCompany. All rights reserved.
//

#import "FoodItem.h"

@implementation FoodItem


- (id)init {
    id newFood =[self initFoodWithName:@"Food" timeCooking:10 remainingTimeCooking:0 weightUnit:200 totalUnits:1 progress:0.0];
    return newFood;
}


-(id) initFoodWithName: (NSString *) foodName  timeCooking: (NSInteger) timeCooking remainingTimeCooking: (NSInteger) remainingTimeCooking weightUnit: (NSInteger) weightUnit totalUnits: (NSInteger) totalUnits progress: (float) progress {
    
    if (!(self = [super init])){
        return nil;
    }
    
    _foodName = foodName;
    _timeCooking = timeCooking;
    _remainingTimeCooking = remainingTimeCooking;
    _weightUnit = weightUnit;
    _totalUnits = totalUnits;
    _progress = progress;
    
    return self;
}


@end
