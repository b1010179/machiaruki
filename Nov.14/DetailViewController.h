//
//  DetailViewController.h
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Twitter/Twitter.h>

@class Article, AppData, Annotation, AppDelegate, MyAnnotation, SpotDetailViewController, RootViewController;

@interface DetailViewController : UIViewController <MKMapViewDelegate> {
    
    IBOutlet UITableView *tableView;
    IBOutlet MKMapView *mapView;
    
    AppData *appData;
    Article *anArticle;
    Annotation *currentAnnotation;
    AppDelegate *appDelegate;
    MyAnnotation *annotation;
    SpotDetailViewController *detail;
    RootViewController *rootViewController;
    int k;
    
}

@property (nonatomic, retain) AppData *appData;
@property (nonatomic, retain) Article *anArticle;
@property (nonatomic, retain) Annotation *currentAnnotation;
@property (nonatomic, retain) MyAnnotation *annotation;
@property (nonatomic) int k;
@property (nonatomic, retain) SpotDetailViewController *spotDetailViewController;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)tweetBtn:(id)sender;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
