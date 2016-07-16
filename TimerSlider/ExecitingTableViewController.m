//
//  ExecitingTableViewController.m
//  TimerSlider
//
//  Created by  Yury_apple_mini on 7/4/16.
//  Copyright © 2016 MyCompany. All rights reserved.
//

#import "ExecitingTableViewController.h"

@interface ExecitingTableViewController ()

@property (nonatomic, strong) NSDate *start;
@property (nonatomic, strong) NSMutableArray *foodsWasCooked;
@property (assign) NSInteger totalItems;

@end

@implementation ExecitingTableViewController

@synthesize executingFoodList = _executingFoodList;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _totalItems = _executingFoodList.count;
    
    self.tableView.rowHeight = 44;
    
    self.start = [NSDate date];
    
    
    
   
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self selector:@selector(updateFoodList:)
                                   userInfo:nil repeats:YES];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _executingFoodList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    FoodItem *currentFoodItem = [_executingFoodList objectAtIndex:indexPath.row];
    
    UILabel *timeCookingLabel = (UILabel*) [cell viewWithTag:100];
    timeCookingLabel.text = [self convertSecondsToMinutes: currentFoodItem.timeCooking];
    
    UILabel *totalUnitsLabel = (UILabel*) [cell viewWithTag:101];
    totalUnitsLabel.text = [@(currentFoodItem.totalUnits) stringValue];
    
    UILabel *foodNameLabel = (UILabel*) [cell viewWithTag:102];
    foodNameLabel.text =currentFoodItem.foodName;
    
    UILabel *weightUnitLabel = (UILabel*) [cell viewWithTag:103];
    weightUnitLabel.text = [@(currentFoodItem.weightUnit) stringValue];
    
    UILabel *timeRemainingCookingLabel = (UILabel*) [cell viewWithTag:104];
    timeRemainingCookingLabel.text = [self convertSecondsToMinutes: currentFoodItem.remainingTimeCooking];

    UIProgressView *progressView = (UIProgressView *) [cell viewWithTag:105];
    progressView.progress = currentFoodItem.progress;
    
    
    // Save index path for delaying remove
    currentFoodItem.currentPath = indexPath;
    
    return cell;
}








- (NSString *)convertSecondsToMinutes:(NSInteger)totalSeconds{
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = (int)totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}


-(void)updateFoodList:(NSTimer*) theTimer
{
    [self.delegate addCompletedItemsToList:_foodsWasCooked];
    
    // remove cooking foods from foodList (Order)
    [_executingFoodList removeObjectsInArray:_foodsWasCooked];
    [self.tableView deleteRowsAtIndexPaths:[_foodsWasCooked valueForKey:@"currentPath"] withRowAnimation:UITableViewRowAnimationRight];
    [self.tableView reloadData];
 
    
    NSInteger totalRowsInTable = _executingFoodList.count;
    
    if (_executingFoodList.count < 9) {
        self.preferredContentSize = CGSizeMake(400,44*totalRowsInTable);
    }
    

    
    
    if (totalRowsInTable) {
        [self calculeteProgress];
    } else {
        [theTimer invalidate];
        NSLog(@"Bon appetite");
    }
}


-(void)calculeteProgress {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            _foodsWasCooked = [NSMutableArray array];
        
            NSTimeInterval timeInterval = fabs([self.start timeIntervalSinceNow]);
        
            for (FoodItem *currentFoodItem in _executingFoodList) {
                
                float currentProgress = timeInterval / currentFoodItem.timeCooking;
                
                if (currentProgress >= 1) {
                      [_foodsWasCooked addObject:currentFoodItem];
                } else {
                    currentFoodItem.progress = currentProgress;
                    currentFoodItem.remainingTimeCooking = fabs(timeInterval - currentFoodItem.timeCooking);
                }
            }
    });
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
