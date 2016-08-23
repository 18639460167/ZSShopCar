//
//  CarModel.h
//  ZSShopCar
//
//  Created by tenpastnine-ios-dev on 16/8/18.
//  Copyright © 2016年 Black. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarModel : NSObject

@property (nonatomic, copy) NSString *photoUrl;
@property (nonatomic, copy) NSString *shopName;

@property (nonatomic, copy) NSString *price; // 价格
@property (nonatomic, copy) NSString *buyNumber; // 数量

@property (nonatomic, copy) NSString *goodId;

@property (nonatomic, copy) NSString *allPrice; // 商品总价

@property (nonatomic, assign) BOOL isSelect; // 是否被选中

- (id)initWithDic:(NSDictionary *)dic;

@end
