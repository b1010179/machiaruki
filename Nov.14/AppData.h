//
//  AppData.h
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface AppData : NSObject {

	CLLocationCoordinate2D	coordinate;	// 現在の緯度経度
	CLLocationDirection		heading;	// 　　　方角
	CLLocationDirection		course;		// 　　　進行方向
	CLLocationSpeed			speed;		// 　　　進行速度

	NSMutableArray			*articles;
}

@property (nonatomic)			CLLocationCoordinate2D	coordinate;
@property (nonatomic)			CLLocationDirection		heading;
@property (nonatomic)			CLLocationDirection		course;
@property (nonatomic)			CLLocationSpeed			speed;
@property (nonatomic, retain)	NSMutableArray			*articles;

@end
