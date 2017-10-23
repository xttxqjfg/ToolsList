//
//  ViewController.m
//  ToolsDemoList
//
//  Created by 易博 on 2017/10/23.
//  Copyright © 2017年 易博. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *modelListTable;

@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.modelListTable];
    
    self.title = @"造轮子集合";
}

#pragma mark  UITableViewDelegate,UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    }
    cell.textLabel.text = [[self.dataArr objectAtIndex:indexPath.row] objectForKey:@"name"];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = [[self.dataArr objectAtIndex:indexPath.row] objectForKey:@"className"];
    
    UIViewController *vc = [NSClassFromString(className) new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(UITableView *)modelListTable
{
    if (!_modelListTable) {
        _modelListTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _modelListTable.delegate = self;
        _modelListTable.dataSource = self;
        _modelListTable.tableFooterView = [UIView new];
    }
    return _modelListTable;
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DemoListName.plist" ofType:nil]];
    }
    return _dataArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
