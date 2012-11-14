//
//  Article.m
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import <objc/objc.h>
#import <objc/runtime.h>
#import "Article.h"

#define kPrefix	@"im:"

@implementation Article

@synthesize name, latitude, longitude, outline, address, access, opentime, phone, imagepath, detail, distance;

#pragma mark -
#pragma mark Object lifecycle

// インスタンスを初期化する
-(id)init {
	propertyDic = [[NSMutableDictionary alloc] initWithDictionary:[self makePropertyDictionary]];
	return self;
}

#pragma mark -
#pragma mark Property handling

// クラスのプロパティ名称の一覧辞書を作成する
-(NSMutableDictionary *)makePropertyDictionary {     
	unsigned int outCount;
	
	objc_property_t *propList = class_copyPropertyList([self class], &outCount);
	NSMutableDictionary *properties = [[NSMutableDictionary alloc] initWithCapacity:outCount];
	
	int i;
	for (i=0; i < outCount; i++) {
		objc_property_t* aProp = propList + i;
		NSString *propName = [[NSString alloc] initWithCString:property_getName(*aProp)];
		[properties setValue:propName forKey:propName];
		
	}
    
	// オブジェクトの解放に注意！
	return properties;
}

// RSSのエレメントに対応するインスタンスプロパティ名を得る
-(NSString*)getPropertyNameFor:(NSString*)elementName {
	
	NSString* propName = [propertyDic objectForKey:elementName];
	return propName;
}

@end
