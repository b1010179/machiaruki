//
//  Annotation.h
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import <Foundation/Foundation.h>
#import	<MapKit/MapKit.h>


@interface Annotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D	coordinate;//緯度経度
	NSString				*title;
	NSString				*subtitle;
	BOOL					isMyAnnotation;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;


@end

