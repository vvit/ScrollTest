//
//  ViewController.h
//  ScrollTest
//
//  Created by Vitaly on 10/15/14.
//  Copyright (c) 2014 Bla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SSPullToRefresh.h>

@interface ViewController : UIViewController <SSPullToRefreshViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tv;

@end

