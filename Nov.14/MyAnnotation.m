//
//  MyAnnotation.m
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import "MyAnnotation.h"

// 「MyAnnotation」クラスの実装
@implementation MyAnnotation

// プロパティとメンバー変数の設定
@synthesize isStart = _isStart;
@synthesize current_num;

// イニシャライザ
- (id)init
{
    self = [super init];
    if (self)
    {
        // メンバー変数を初期化する
        _isStart = NO;
    }
    return self;
}

@end