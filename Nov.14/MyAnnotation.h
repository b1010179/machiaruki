//
//  MyAnnotation.h
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MyAnnotation : MKPointAnnotation 
{
    BOOL _isStart;
}
@property (nonatomic, assign) BOOL isStart;
@property (nonatomic, assign) int current_num;   ////IMPORTANT!!!!!!!!!!
@end

