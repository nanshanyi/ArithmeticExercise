//
//  ViewController.m
//  ArithmeticExercise
//
//  Created by liguohuai on 2018/7/6.
//  Copyright © 2018年 liguohuai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self invertedString:@"I love you"];
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@7,@5,@1,@6,@8,@10,@4,@3,@9,@11,@2]];
    [self quickSortArray:array leftIndex:0 rightIndex:array.count - 1];
}
//字符串倒序
- (NSString *)invertedString:(NSString *)string{
    if (string.length <= 1) {
        return string;
    }
    
    NSMutableString *resultStr = [NSMutableString string];
    for (NSInteger index = string.length - 1; index >= 0; index--){
        NSString *str = [string substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:str];
    }
    NSLog(@"%@",resultStr);
    return resultStr;
}
//快速排序
- (void)quickSortArray:(NSMutableArray *)array leftIndex:(NSUInteger)leftIndex rightIndex:(NSUInteger)rightIndex{
    if (leftIndex >= rightIndex) {
        return ;
    }
    NSUInteger i = leftIndex;
    NSUInteger j = rightIndex;
    NSInteger key = [array[i] integerValue];
    while (i < j) {
        
        while (i < j && [array[j] integerValue] >= key) {
            j--;
        }
        array[i] = array[j];
        while (i < j && [array[i] integerValue] <= key) {
            i++;
        }
        array[j] = array[i];
    }
    array[i] = @(key);
    [self quickSortArray:array leftIndex:leftIndex rightIndex:i-1];
    [self quickSortArray:array leftIndex:i+1 rightIndex:rightIndex];
}

@end
