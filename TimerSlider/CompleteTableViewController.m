//
//  CompleteTableViewController.m
//  TimerSlider
//
//  Created by  Yury_apple_mini on 7/16/16.
//  Copyright © 2016 MyCompany. All rights reserved.
//

#import "CompleteTableViewController.h"

@interface CompleteTableViewController ()

@end



@implementation CompleteTableViewController

@synthesize completeFoodList = _completeFoodList;

- (void)viewDidLoad {
    [super viewDidLoad];
    _completeFoodList = [NSMutableArray array];
    
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
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _completeFoodList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    FoodItem *currentFoodItem = [_completeFoodList objectAtIndex:indexPath.row];
    
    UILabel *foodNameLabel = (UILabel*) [cell viewWithTag:100];
    foodNameLabel.text =currentFoodItem.foodName;
    
    UILabel *totalUnitsLabel = (UILabel*) [cell viewWithTag:101];
    totalUnitsLabel.text = [@(currentFoodItem.totalUnits) stringValue];
    
    UILabel *weightUnitLabel = (UILabel*) [cell viewWithTag:103];
    weightUnitLabel.text = [@(currentFoodItem.weightUnit) stringValue];
    
    
    // Save index path for delaying remove
    currentFoodItem.currentPath = indexPath;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Delegate methods

- (void)addCompletedItemsToList: (NSArray *) completedItems{
    [_completeFoodList addObjectsFromArray:completedItems];
    [self.tableView reloadData];
    NSLog(@"height Table - %f", self.view.bounds.size.height );
    NSLog(@"height Container - %f", self.view.superview.bounds.size.height );
    NSLog(@"================" );
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
