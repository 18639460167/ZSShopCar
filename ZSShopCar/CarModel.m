//
//  CarModel.m
//  ZSShopCar
//
//  Created by tenpastnine-ios-dev on 16/8/18.
//  Copyright © 2016年 Black. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel

- (id)initWithDic:(NSDictionary *)dic
{
    if (self=[super init])
    {
        self.photoUrl=[dic objectForKey:@"picture"];
        self.price=[dic objectForKey:@"min_price"];
        self.buyNumber=[dic objectForKey:@"month_saled"];
        self.shopName=[dic objectForKey:@"name"];
        float price =[self.buyNumber intValue]*[self.price floatValue];
        self.allPrice=[NSString stringWithFormat:@"%.2f",price];
        self.goodId=[dic objectForKey:@"id"];
        self.isSelect=NO;
    }
    return self;
    
}

@end
