//
//  ZSViewController.m
//  ZSShopCar
//
//  Created by tenpastnine-ios-dev on 16/8/22.
//  Copyright © 2016年 Black. All rights reserved.
//

#import "ZSViewController.h"
#import "SelectTableViewCell.h"
#import "CarModel.h"

@interface ZSViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *boolArray;
    UITableView *tableview;
    int lastSelect;
}

@end

@implementation ZSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
    [self loadData];
}
- (void)setUpUI
{
    tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    tableview.dataSource=self;
    tableview.delegate=self;
    tableview.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    [tableview registerNib:[UINib nibWithNibName:@"SelectTableViewCell" bundle:nil] forCellReuseIdentifier:@"SelectTableViewCell"];
    [self.view addSubview:tableview];
}
- (void)loadData
{
    lastSelect=-1;
    boolArray=[NSMutableArray new];
    for (int i=0; i<6; i++)
    {
        NSDictionary *dic=[NSDictionary new];
        CarModel*model=[[CarModel alloc]initWithDic:dic];
        [boolArray addObject:model];
    }
    [tableview reloadData];
    
}
#pragma mark tableview datasource delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return boolArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelectTableViewCell *cell=[tableview dequeueReusableCellWithIdentifier:@"SelectTableViewCell"];
    CarModel *model=boolArray[indexPath.row];
    cell.selectBtn.selected=model.isSelect;
    [cell.selectBtn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)selectAction:(UIButton *)button
{
    SelectTableViewCell *cell=(SelectTableViewCell *)button.superview.superview;
    NSIndexPath *index=[tableview indexPathForCell:cell];
    CarModel *model=boolArray[index.row];
    
    if (lastSelect==-1)
    {
        model.isSelect=YES;
        [boolArray replaceObjectAtIndex:index.row withObject:model];
        lastSelect=index.row;
        [tableview reloadData];
    }
    else
    {
        if (lastSelect==index.row && model.isSelect==YES)
        {
            model.isSelect=NO;
            [boolArray replaceObjectAtIndex:index.row withObject:model];
            [tableview reloadData];
        }
        else
        {
            CarModel *myModel=boolArray[lastSelect];
            myModel.isSelect=NO;
            [boolArray replaceObjectAtIndex:lastSelect withObject:myModel];
            model.isSelect=YES;
            [boolArray replaceObjectAtIndex:index.row withObject:model];
            lastSelect=index.row;
            [tableview reloadData];
        }
    }
//    // 之前选中再点击取消选中
//    if (model.isSelect==YES)
//    {
//        model.isSelect=NO;
//        [boolArray replaceObjectAtIndex:index.row withObject:model];
//        [tableview reloadData];
//    }
//    else
//    {
//        for (int i=0; i<boolArray.count; i++)
//        {
//            CarModel *model1=boolArray[i];
//            model1.isSelect=NO;
//            [boolArray replaceObjectAtIndex:i withObject:model1];
//            
//        }
//        model.isSelect=YES;
//        [boolArray replaceObjectAtIndex:index.row withObject:model];
//        [tableview reloadData];
//    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
