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
//二叉树
typedef struct BitNode{
    int data;
    struct BitNode *lchild;
    struct BitNode *rchild;
}BitNode, BiTree;
//栈
#define SIZE 100
typedef struct SQStack{
    BiTree *data[SIZE];
    int stackSize;
    int top;
}sqstack;

void push(sqstack *s, BiTree *t){
    if (s->top == SIZE) {
        printf("the stack is full");
    }else{
        s->top++;
        
    }
}
BitNode * pop(sqstack *s){
    
    if(s->top == -1){
        return NULL;
    }else{
        s->top--;
        return s->data[s->top+1];
    }
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
    //二叉树遍历

    [self traverseTree:[self initBitTree]];
}
- (BiTree *)initBitTree{
    BiTree *Head = [self initBitNodeWithData:1];
    Head->data = 1;
    [self creatBitNodeWith:Head left:2 right:3];
    [self creatBitNodeWith:Head->lchild left:4 right:5];
    [self creatBitNodeWith:Head->rchild left:6 right:7];
    [self creatBitNodeWith:Head->lchild->lchild left:8 right:9];
    [self creatBitNodeWith:Head->lchild->rchild left:10 right:11];
    [self creatBitNodeWith:Head->rchild->lchild left:12 right:13];
    [self creatBitNodeWith:Head->rchild->rchild left:14 right:15];
    return Head;
}
- (BitNode *)initBitNodeWithData:(int)data{
    BitNode *node = (BitNode *)malloc(sizeof(BitNode));
    node->data = data;
    node->lchild = NULL;
    node->rchild = NULL;
    return node;
}
//递归遍历二叉树
- (void)traverseTree:(BitNode *)binTree{
    if (binTree != NULL) {
        [self traverseTree:binTree->lchild];
        [self traverseTree:binTree->rchild];
        printf("++++++++++%d\n", binTree->data);
    }
}
//非递归遍历二叉树
- (void)traverseBitTree:(BitNode *)binTree{
    sqstack *s = NULL;
    s->top = -1;
    BitNode *p = binTree;
    if (!binTree) {
        printf("empty tree");
    }else{
        while (p || s->top != -1) {
            if (p) {
                push(s, p);
                p = p->lchild;
            }else{
                p = pop(s);
                printf("%d",p->data);
                p = p->rchild;
            }
        }
    }
}
- (void)creatBitNodeWith:(BitNode *)node left:(int)l right:(int)r{

    BitNode *L = [self initBitNodeWithData:l];
    BitNode *R = [self initBitNodeWithData:r];
    node->lchild = L;
    node->rchild = R;
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
