//
//  CarTableViewCell.h
//  ZSShopCar
//
//  Created by tenpastnine-ios-dev on 16/8/18.
//  Copyright © 2016年 Black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarModel.h"

typedef void (^ObjectHandler)(CarModel *result);
typedef void (^SelectHandler)(BOOL isSelect);
@interface CarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIButton *topSelectBtn;

@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *buyNumberLbl;
@property (weak, nonatomic) IBOutlet UILabel *PriceLbl;
@property (weak, nonatomic) IBOutlet UIButton *reduceBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (nonatomic, copy) ObjectHandler reducehandler; // 减少
@property (nonatomic, copy) ObjectHandler addHandler; // 增加

@property (nonatomic, copy) ObjectHandler selectHaler; // 是否被选中
// 加减处理之后的model
@property (nonatomic, strong) CarModel *myModel;

- (void)bindModel:(CarModel *)model;

@end
