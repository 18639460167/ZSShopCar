//
//  ViewController.m
//  ZSShopCar
//
//  Created by tenpastnine-ios-dev on 16/8/18.
//  Copyright © 2016年 Black. All rights reserved.
//

#import "ViewController.h"
#import "CarTableViewCell.h"
#import "CarModel.h"

#define sWidth [UIScreen mainScreen].bounds.size.width
#define sHeight [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableview;
    NSMutableArray *dataArray;
}

@property (nonatomic, strong) UIButton *allSelectBtn;
@property (nonatomic, strong) UILabel *allMoneyLbl;
@property (nonatomic, strong) UIButton *settleBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
    [self setUpUI];
}

- (void)setUpUI
{
    self.title=@"购物车";
    self.automaticallyAdjustsScrollViewInsets =NO;
    self.view.backgroundColor=[UIColor whiteColor];
   tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, sWidth, sHeight-50-64) style:UITableViewStyleGrouped];
    tableview.dataSource=self;
    tableview.delegate=self;
    [tableview registerNib:[UINib nibWithNibName:@"CarTableViewCell" bundle:nil] forCellReuseIdentifier:@"CarTableViewCell"];
    [self.view addSubview:tableview];
    [self bottomView];
}

- (void)loadData
{
    dataArray=[NSMutableArray new];
    NSDictionary *dic1 = @{@"id": @"9323283",
                           @"name": @"马可波罗意面",
                           @"min_price": @"12.0",
                           @"praise_num": @"20",
                           @"picture":@"1.png",
                           @"month_saled":@"12"};
    
    NSDictionary *dic2 = @{@"id": @"9323284",
                           @"name": @"鲜珍焗面",
                           @"min_price": @"28.0",
                           @"praise_num": @"6",
                           @"picture":@"2.png",
                           @"month_saled":@"34"};
    
    NSDictionary *dic3 = @{@"id": @"9323285",
                           @"name": @"经典焗面",
                           @"min_price": @"28.0",
                           @"praise_num": @"8",
                           @"picture":@"3.png",
                           @"month_saled":@"16"};
    
    NSDictionary *dic4 = @{@"id": @"26844943",
                           @"name": @"摩洛哥烤肉焗饭",
                           @"min_price": @"32.0",
                           @"praise_num": @"1",
                           @"picture":@"4.png",
                           @"month_saled":@"56"};
    NSArray *mdataArray = [@[[dic1 mutableCopy],[dic2 mutableCopy],[dic3 mutableCopy],[dic4 mutableCopy]] mutableCopy];
    for (NSDictionary *dic  in mdataArray)
    {
        CarModel *mmodel=[[CarModel alloc]initWithDic:dic];
        [dataArray addObject:mmodel];
        
    }
}

- (void)bottomView
{
    UIView *bottomView=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(tableview.frame), sWidth, 50)];
    bottomView.backgroundColor=[UIColor whiteColor];
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, sWidth, 1)];
    lineView.backgroundColor=[UIColor lightGrayColor];
    [bottomView addSubview:lineView];
    
    self.allSelectBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.allSelectBtn.frame=CGRectMake(15, 15, 20, 20);
    [self.allSelectBtn setImage:[UIImage imageNamed:@"cart"] forState:UIControlStateNormal];
    [self.allSelectBtn setImage:[UIImage imageNamed:@"cart_1"] forState:UIControlStateSelected];
    [self.allSelectBtn addTarget:self action:@selector(selectAllAction) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:self.allSelectBtn];
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(37, 15, 30, 20)];
    lable.font=[UIFont systemFontOfSize:14];
    lable.textColor=[UIColor blackColor];
    lable.text=@"全选";
    [bottomView addSubview:lable];
    
    self.settleBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.settleBtn.backgroundColor=[UIColor redColor];
    [self.settleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.settleBtn setTitle:@"去结算(0)" forState:UIControlStateNormal];
    self.settleBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [self.settleBtn addTarget:self action:@selector(settleAction) forControlEvents:UIControlEventTouchUpInside];
        self.settleBtn.titleLabel.adjustsFontSizeToFitWidth=YES;
    self.settleBtn.frame=CGRectMake(sWidth-90, 0, 90, 50);
    [bottomView addSubview:self.settleBtn];
    
    self.allMoneyLbl=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lable.frame)+3, 15, sWidth-90-CGRectGetMaxX(lable.frame)-10, 20)];
    self.allMoneyLbl.textColor=[UIColor redColor];
    self.allMoneyLbl.text=@"合计￥0.00";
    self.allMoneyLbl.textAlignment=NSTextAlignmentRight;
    self.allMoneyLbl.font=[UIFont systemFontOfSize:13];
    [bottomView addSubview:self.allMoneyLbl];
    [self.view addSubview:bottomView];
    
}

// 全选
- (void)selectAllAction
{
    self.allSelectBtn.selected=!self.allSelectBtn.selected;
    if (self.allSelectBtn.selected)
    {
        for (int i=0;i<dataArray.count;i++)
        {
            CarModel *model=dataArray[i];
            model.isSelect=YES;
            [dataArray replaceObjectAtIndex:i withObject:model];
        }
        
    }
    else
    {
        for (int i=0;i<dataArray.count;i++)
        {
            CarModel *model=dataArray[i];
            model.isSelect=NO;
            [dataArray replaceObjectAtIndex:i withObject:model];
        }
    }
    [self saluateMoney];
    [tableview reloadData];
 
}

// 结算
- (void)settleAction
{
    
}
#pragma mark tableview delegate datasouce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarTableViewCell *cell=[tableview dequeueReusableCellWithIdentifier:@"CarTableViewCell"];
    [cell bindModel:dataArray[indexPath.section]];
    
     __weak __typeof(&*self)weakSelf =self;
    // 减少
    cell.reducehandler=^(CarModel *model)
    {
        [dataArray replaceObjectAtIndex:indexPath.section withObject:model];
        [weakSelf saluateMoney];
        
    };
    // 增加
    cell.addHandler=^(CarModel *model)
    {
        [dataArray replaceObjectAtIndex:indexPath.section withObject:model];
        [weakSelf saluateMoney];
    };
    // 选中
    cell.selectHaler=^(CarModel *model)
    {
        [dataArray replaceObjectAtIndex:indexPath.section withObject:model];
        [weakSelf saluateMoney];
    };
    return cell;
}

- (void)saluateMoney
{
    float money=0.00;
    for (CarModel *mode in dataArray)
    {
        if (mode.isSelect)
        {
            money=money+[mode.allPrice floatValue];
        }
    }
    if (money==0)
    {
        self.allSelectBtn.selected=NO;
    }
    self.allMoneyLbl.text=[NSString stringWithFormat:@"合集￥%2.f",money];
    [self.settleBtn setTitle:[NSString stringWithFormat:@"去结算(%.2f)",money] forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
