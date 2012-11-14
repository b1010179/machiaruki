//
//  XMLParser.h
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDelegate, Article;

@interface XMLParser : NSObject {//宣言
    
	NSMutableString *currentElement;
	
	AppDelegate *appDelegate;
	Article *anArticle; 
}

- (XMLParser *) init;

@end

