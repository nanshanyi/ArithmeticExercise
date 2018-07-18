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

void swap(NSMutableArray *array, NSInteger i, NSInteger j){
    NSNumber *temp = array[i];
    array[i] = array[j];
    array[j] = temp;
}

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //字符串倒序
    [self invertedString:@"I love you"];
    NSMutableArray *quickArray = [NSMutableArray arrayWithArray:@[@7,@5,@1,@6,@8,@10,@4,@3,@9,@11,@2]];
    //快速排序
    [self quickSortArray:quickArray leftIndex:0 rightIndex:quickArray.count - 1];
    NSMutableArray *bubbleArray = [NSMutableArray arrayWithArray:@[@7,@5,@1,@6,@8,@10,@4,@3,@9,@11,@2]];
    //冒泡排序
    [self bubbleSortArray:bubbleArray];
    
    NSMutableArray *selectArray = [NSMutableArray arrayWithArray:@[@7,@5,@1,@6,@8,@10,@4,@3,@9,@11,@2]];
    //选择排序
    [self selectSortArray:selectArray];
    NSMutableArray *insertArray = [NSMutableArray arrayWithArray:@[@7,@5,@1,@6,@8,@10,@4,@3,@9,@11,@2]];
    //插入排序
    [self insertSortArray:insertArray];
}
- (void)insertSortArray:(NSMutableArray *)array{
    if (array.count <= 1) return;
    for (NSInteger i = 1; i < array.count; i++) {
        NSInteger get = [array[i] integerValue];
        NSInteger j = i - 1;
        while (j >= 0 && [array[j] integerValue] > get) {
            array[j + 1] = array[j];
            j--;
        }
        array[j + 1] = @(get);
    }
}
- (void)selectSortArray:(NSMutableArray *)array{
    if (array.count <= 1) return;
    for (NSInteger i = 0; i < array.count - 1; i++) {
        NSInteger minIndex = i;
        for (NSInteger j = i + 1; j < array.count; j++) {
            NSInteger tempI = [array[minIndex] integerValue];
            NSInteger tempJ = [array[j] integerValue];
            if (tempI > tempJ) {
                minIndex = j;
            }
        }
        if (minIndex != i) {
            swap(array,i,minIndex);
        }
    }
}
//冒泡排序
- (void)bubbleSortArray:(NSMutableArray *)array{
    if (array.count <= 1) return;
    for (NSInteger i = 0; i < array.count - 1; i++) {
        for (NSInteger j = i + 1; j < array.count; j++) {
            NSInteger tempI = [array[i] integerValue];
            NSInteger tempJ = [array[j] integerValue];
            if (tempI > tempJ) {
                swap(array, i, j);
            }
        }
    }
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
    if (array.count <= 1) return;
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
