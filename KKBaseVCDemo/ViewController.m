//
//  ViewController.m
//  KKBaseVCDemo
//
//  Created by 干啥啥不行 吃饭第一名🥇 on 2019/11/14.
//  Copyright © 2019 干啥啥不行 吃饭第一名🥇. All rights reserved.
//

#import "ViewController.h"
#import "ToViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSMutableArray<NSArray*> *cellSource;
@property(nonatomic, strong) NSArray *headerSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerSource = @[@"push"];
    self.cellSource = [NSMutableArray array];
    NSArray *push = @[
        @"right",
        @"bottom"
    ];
    [self.cellSource addObject:push];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.headerSource[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellSource[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"baseVCCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.cellSource[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                ToViewController *vc = [[ToViewController alloc]init];
                [vc showInParentVC:self];
                break;
            }
            case 1:{
                ToViewController *vc = [[ToViewController alloc]init];
                vc.kkAnimationType = KKAnimationTypePushBottom;
                [vc showInParentVC:self];
                break;
            }
            default:
                break;
        }
    }
}


@end
