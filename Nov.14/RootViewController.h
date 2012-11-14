//
//  RootViewController.h
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController, AppDelegate, AppData;

@interface RootViewController : UITableViewController {

    NSArray *roots;
    NSArray *images;
    NSArray *subtitle;
    NSArray *spotID;
    NSArray *testPosition;
    NSURL *url;
    NSString *roottitle;
    UINavigationController *navigationController;
    DetailViewController *detailViewController;
    AppDelegate *appDelegate;
    AppData *appData;

    //abc
    
}

@property (nonatomic, retain) NSString *roottitle;
@property (nonatomic, retain) NSArray *roots;

@end
