//
//  Article.h
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Article: NSObject {//検索したいタグ名宣言
	
	NSString *name;
    NSString *latitude;
    NSString *longitude;
    NSString *outline;
    NSString *address;
    NSString *access;
    NSString *opentime;
    NSString *phone;
    NSString *imagepath;
    NSString *detail;
    NSString *distance;
	
	NSMutableDictionary* propertyDic;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;
@property (nonatomic, retain) NSString *outline;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *access;
@property (nonatomic, retain) NSString *opentime;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *imagepath;
@property (nonatomic, retain) NSString *detail;
@property (nonatomic, retain) NSString *distance;

@property (nonatomic, retain) NSMutableDictionary *propertyDic;

-(NSMutableDictionary *) makePropertyDictionary;
-(NSString*) getPropertyNameFor:(NSString*)elementName;

@end

