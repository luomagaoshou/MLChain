//
//  NSObject+ChainFileCreater.h
//  MLProject
//
//  Created by 妙龙赖 on 16/5/1.
//  Copyright © 2016年 妙龙赖. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ChainFileCreater)

/**
 生成链式文件到mac桌面，会同时生成父类的链式文件

 @param classNames 要生成的类名
 */
+ (void)mlc_chainCreateChainFileToDesktopWithClassNames:(NSArray *)classNames;

/**
 生成链式文件到pods文件MLChainContainer.h与MLChainContainer.m,会同时生成父类的链式文件

 @param classNames 要生成的类名
 */
+ (void)mlc_chainCreateChainFileToPodsWithClassNames:(NSArray *)classNames;

@end
