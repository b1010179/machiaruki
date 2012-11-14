//
//  SpotDetailViewController.h
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"

@interface SpotDetailViewController : UIViewController {
    
    Article *anArticle;
    
}

@property (nonatomic, retain) Article *anArticle;

@end
