//
//  AppDelegate.h
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class AppData;

@interface AppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
    CLLocationManager *locationManager;
    AppData *appData;
    BOOL isLocationChanged;
    
}



@property (retain, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) AppData *appData;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic) BOOL isLocationChanged;

@end
