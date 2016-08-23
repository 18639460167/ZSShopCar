//
//  SelectTableViewCell.m
//  ZSShopCar
//
//  Created by tenpastnine-ios-dev on 16/8/22.
//  Copyright © 2016年 Black. All rights reserved.
//

#import "SelectTableViewCell.h"

@implementation SelectTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.selectBtn setImage:[UIImage imageNamed:@"cart"] forState:UIControlStateNormal];
    [self.selectBtn setImage:[UIImage imageNamed:@"cart_1"] forState:UIControlStateSelected];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
