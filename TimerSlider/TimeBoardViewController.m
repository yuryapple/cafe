//
//  TimeBoardViewController.m
//  TimerSlider
//
//  Created by  Yury_apple_mini on 7/4/16.
//  Copyright © 2016 MyCompany. All rights reserved.
//

#import "TimeBoardViewController.h"
#import "ExecitingTableViewController.h"
#import "CompleteTableViewController.h"

@interface TimeBoardViewController ()

@end

@implementation TimeBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ExecitingTableViewController *executeTVC = (ExecitingTableViewController *) [self.childViewControllers objectAtIndex:0];
    
    CompleteTableViewController *completeTVC = (CompleteTableViewController *) [self.childViewControllers objectAtIndex:1];
    
    NSLog(@"Containers %@ ", self.childViewControllers);
    
    
    executeTVC.delegate = completeTVC;
  
  
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ExecutingListFoods"]) {
    //    _heightOfInnerTable = [NSMutableArray arrayWithObject:[NSMutableString stringWithFormat:@"10"]];
        ExecitingTableViewController *controller = (ExecitingTableViewController *)[segue destinationViewController] ;
        [controller setExecutingFoodList: _foodList1];
        [controller setHeightSuperView: (int)self.view.frame.size.height];
        
       // NSLog(@"Containers %@ ", self.childViewControllers);
        
   //     [controller setDelegate:[self.childViewControllers objectAtIndex:0]];
    }
}




-(void)preferredContentSizeDidChangeForChildContentContainer:(id<UIContentContainer>)container {
    
    ExecitingTableViewController * container1 = (ExecitingTableViewController*)container;

 //   NSLog(@"preferredContentSize %f", container1.preferredContentSize.height);

    
 //   NSLog(@"_heightOfInnerTable %ld", [[self.heightOfInnerTable objectAtIndex:0] integerValue]);
    
     UIView *containerSubView = (UIView*) [self.view viewWithTag:100];

    [containerSubView removeConstraint: _constraintHeight];
 
     _constraintHeight = [NSLayoutConstraint
                                  constraintWithItem:containerSubView
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:nil
                                  attribute:0
                                  multiplier:0
                                  constant:container1.preferredContentSize.height];
    
     [containerSubView addConstraint:_constraintHeight];
    
    NSLog(@"ConstraintHeight Main table  %f", containerSubView.bounds.size.height);
}

@end
