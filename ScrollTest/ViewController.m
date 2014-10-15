//
//  ViewController.m
//  ScrollTest
//
//  Created by Vitaly on 10/15/14.
//  Copyright (c) 2014 Bla. All rights reserved.
//

#import "ViewController.h"
#import <UIViewController+ScrollingNavbar.h>

@interface ViewController ()
@property (strong, nonatomic) SSPullToRefreshView *pullToRefreshView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _pullToRefreshView = [[SSPullToRefreshView alloc] initWithScrollView:_tv delegate:self];
    _pullToRefreshView.contentView = [[SSPullToRefreshSimpleContentView alloc] initWithFrame:CGRectZero];

    [self followScrollView:_tv];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", indexPath.row];

    return cell;
}

- (void)pullToRefreshViewDidStartLoading:(SSPullToRefreshView *)view
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_pullToRefreshView finishLoading];
    });
}

@end
