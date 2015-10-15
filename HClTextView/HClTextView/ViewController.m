//
//  ViewController.m
//  HClTextView
//
//  Created by hcl on 15/10/9.
//  Copyright (c) 2015年 hcl. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.title = @"测试HClTextView";
}

#pragma mark - UITableView数据源和代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor orangeColor];
        cell.textLabel.text = @"基本功能";
    }
    else if (indexPath.row == 1) {
        cell.backgroundColor = [UIColor greenColor];
        cell.textLabel.text = @"高级功能";
    }
    else if (indexPath.row == 2) {
        cell.backgroundColor = [UIColor cyanColor];
        cell.textLabel.text = @"其他功能";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 选中后立即取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIViewController *vc = nil;
    
    if (indexPath.row == 0) {
        vc = [OneViewController new];
    }
    else if (indexPath.row == 1) {
        vc = [TwoViewController new];
    }
    else if (indexPath.row == 2) {
        vc = [ThreeViewController new];
    }
    [self.navigationController pushViewController:vc animated:YES];
}


@end
