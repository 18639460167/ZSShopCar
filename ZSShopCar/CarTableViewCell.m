//
//  CarTableViewCell.m
//  ZSShopCar
//
//  Created by tenpastnine-ios-dev on 16/8/18.
//  Copyright © 2016年 Black. All rights reserved.
//

#import "CarTableViewCell.h"

@implementation CarTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.lineView.layer.cornerRadius=2;
    self.lineView.layer.borderWidth=0.5;
    self.lineView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.lineView.layer.masksToBounds=YES;
    [self.selectBtn setImage:[UIImage imageNamed:@"cart_1"] forState:UIControlStateSelected];
    [self.selectBtn setImage:[UIImage imageNamed:@"cart"] forState:UIControlStateNormal];
    [self.topSelectBtn setImage:[UIImage imageNamed:@"cart_1"] forState:UIControlStateSelected];
    [self.topSelectBtn setImage:[UIImage imageNamed:@"cart"] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindModel:(CarModel *)model
{
    self.myModel=model;
    self.buyNumberLbl.text=model.buyNumber;
    self.PriceLbl.text=[NSString stringWithFormat:@"￥%@",model.price];
    self.selectBtn.selected=model.isSelect;
    self.topSelectBtn.selected=model.isSelect;
}

// 减少到1允许减少
- (IBAction)reduceBtn:(id)sender
{
    int value=[self.myModel.buyNumber intValue];
    if (value<=1)
    {
        return;
    }
    else
    {
        value=value-1;
    }
    self.buyNumberLbl.text=[NSString stringWithFormat:@"%d",value];
    self.myModel.buyNumber=[NSString stringWithFormat:@"%d",value];
    self.myModel.allPrice=[NSString stringWithFormat:@"%.2f",(value*[self.myModel.price floatValue])];
    self.reducehandler(self.myModel);
}
- (IBAction)addAction:(id)sender
{
    int value=[self.myModel.buyNumber intValue];
    value=value+1;
    NSLog(@"%d",value);
    self.reduceBtn.hidden=NO;
    self.buyNumberLbl.text=[NSString stringWithFormat:@"%d",value];
    self.myModel.buyNumber=[NSString stringWithFormat:@"%d",value];
    self.myModel.allPrice=[NSString stringWithFormat:@"%.2f",(value*[self.myModel.price floatValue])];
    self.addHandler(self.myModel);
}
- (IBAction)selectBtn:(UIButton *)sender
{
    self.myModel.isSelect=!self.myModel.isSelect;
    self.selectBtn.selected=self.myModel.isSelect;
    self.topSelectBtn.selected=self.myModel.isSelect;
    self.selectHaler(self.myModel);
}

@end
