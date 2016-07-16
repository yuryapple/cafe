//
//  PrepareFoodListViewController.m
//  TimerSlider
//
//  Created by  Yury_apple_mini on 7/4/16.
//  Copyright © 2016 MyCompany. All rights reserved.
//

#import "PrepareFoodListViewController.h"

@interface PrepareFoodListViewController ()

@end

@implementation PrepareFoodListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _foodList = [NSMutableArray array];
    
    for (int i = 1; i <= 20; i++)
    {
        FoodItem *newFood = [[FoodItem alloc] init];
        newFood.timeCooking += (i*5);
        newFood.totalUnits = i;
        [_foodList addObject:newFood];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showTimeBoard:(id)sender {
    [self performSegueWithIdentifier:@"showTimeBoard" sender:self];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showTimeBoard"]) {
        TimeBoardViewController *controller = (TimeBoardViewController *)[segue destinationViewController];
        [controller setFoodList1:_foodList];
    }
}



@end
