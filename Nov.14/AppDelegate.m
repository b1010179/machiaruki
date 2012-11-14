//
//  AppDelegate.m
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import "AppDelegate.h"
#import "XMLParser.h"
#import "AppData.h"
#import "Article.h"
#import "ViewController.h"


@implementation AppDelegate

@synthesize window;
@synthesize navigationController, locationManager, appData, isLocationChanged;


#pragma mark-　//functionメニューに表示されるようになる（動作自体には関係ない）
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {//パラメータの初期化、
    
    // アプリケーションで扱うデータを管理するオブジェクトを生成
	appData = [[AppData alloc] init];
    
	// CLLocationManagerのインスタンスを作成
	isLocationChanged = NO;
	locationManager = [[CLLocationManager alloc] init];//位置情報の取得
	if ([locationManager locationServicesEnabled]) {//ロケーションサービスが利用出来るかのBOOL値
		locationManager.delegate = self;//データの送信先を自分に設定
		locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;//データの正確さを指定
		locationManager.distanceFilter = 1000.0;//通知更新のしきり値
		[locationManager startUpdatingLocation];//GPSの利用開始
		[locationManager startUpdatingHeading];//電子コンパスの利用開始
	} else {
		NSLog(@"ロケーションサービスが利用できない");
	}
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}



#pragma mark -
#pragma mark Sort Function

NSComparisonResult DistanceSortClosestFirst(Article *a1, Article *a2, void *ignore) {
    long d1 = [a1.distance longLongValue];
	long d2 = [a2.distance longLongValue];
    
    if (d1 < d2) {
		return NSOrderedAscending;
	} else if (d1 > d2) {
		return NSOrderedDescending;
	} else {
		return NSOrderedSame;
	}
}

#pragma mark -
#pragma mark Information handling

//- (void)getAndParseInfomation {
//    
//	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    
//    //	NSURL *url = [[NSURL alloc] initWithString:
//    //				  [NSString stringWithFormat:
//    //				   @"http://www.geocities.jp/arufa20052000/tourism.xml"]
//    //				  ];
//    //	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
//    
//    int	nearbyDistance = 5;
//	NSURL *url = [[NSURL alloc] initWithString:
//				  [NSString stringWithFormat:
//				   @"http://www.geocities.jp/arufa20052000/tourism.xml",
//                   appData.coordinate.latitude,appData.coordinate.longitude,nearbyDistance]];
//    
//    
//    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
//	XMLParser *parser = [[XMLParser alloc] init];
//	[xmlParser setDelegate:parser];
//	if([xmlParser parse]) {
//		[appData.articles sortUsingFunction:DistanceSortClosestFirst context:NULL];
//		[[[navigationController viewControllers] objectAtIndex:0] viewControllers];
//        NSLog(@"%@",appData.articles);
//        
//        //        if(ViewController == nil) {
//        //            ViewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:[NSBundle mainBundle]];
//        //            ViewController.appData = appData;
//        //        }
//        //
//        //
//        //        Article *anArticle = [appData.articles objectAtIndex:2];
//        //        ViewController.anArticle = anArticle;
//        
//	}
//	else {
//		NSLog(@"パースに失敗");
//	}
//    
//	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//}

#pragma mark -
#pragma mark CoreLocation delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    
	// 緯度経度取得に成功した場合
	appData.coordinate = newLocation.coordinate;
    
	CLLocationCoordinate2D tmpCood;
	tmpCood.latitude = 41.773746;
	tmpCood.longitude = 140.726399;
    appData.coordinate = tmpCood;
    
    appData.course = newLocation.course;
	appData.speed = newLocation.speed;
    
	
    
	if(isLocationChanged == NO) {
		//[self getAndParseInfomation];
		isLocationChanged = YES;
	}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	// 緯度経度取得に失敗した場合
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
	appData.heading = newHeading.trueHeading;	// 北が0.0、東が90.0（倍精度浮動小数点）
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager {
	return YES;
}


@end
