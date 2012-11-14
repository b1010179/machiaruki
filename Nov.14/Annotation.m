//
//  Annotation.m
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import "Annotation.h"


@implementation Annotation

@synthesize	coordinate, title, subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord {
	coordinate = coord;//座標
	isMyAnnotation = YES;
	return self;
}


@end
