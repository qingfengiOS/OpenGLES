//
//  ViewController.m
//  OpenGLES
//
//  Created by 李一平 on 2018/5/25.
//  Copyright © 2018年 slwy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 数据源数组
 */
@property (nonatomic, strong) NSArray *dataArray;
@end

static NSString *const kCellIdentifier = @"UITableViewCell";

@implementation ViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initializeDataSource];
    [self initializeAppreaence];
}

#pragma mark - InitializeDataSource
- (void)initializeDataSource {
    self.dataArray = @[@"OpenGLESEnvironment",
                       @"DrawTriangle",
                       @"Shader",
                       @"DrawMoreSahpe",
                       ];
}

#pragma mark - InitializeAppreaence
- (void)initializeAppreaence {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
}

#pragma mark - TableViewDelegate/dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *className = self.dataArray[indexPath.row];
    Class class = NSClassFromString(className);
    id viewContrlooer = [[class alloc]init];
    [self.navigationController pushViewController:viewContrlooer animated:YES];
}

@end
