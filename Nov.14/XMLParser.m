//
//  XMLParser.m
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import "XMLParser.h"
#import "AppDelegate.h"
#import "Article.h"
#import "AppData.h"

@implementation XMLParser

#pragma mark -
#pragma mark Object lifecycle

- (XMLParser *) init {
    
	appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.appData.articles = [[NSMutableArray alloc] init];
	anArticle = nil;
	
	return self;
}

- (void) dealloc {
	
    
}


#pragma mark -
#pragma mark Parse delegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {//エレメントを読み込みはじめる？
	
	// "<>"タグが出現するまで読み飛ばす
	if([elementName isEqualToString:@"Spot"]) {
		// Articleインスタンスの初期化
		anArticle = [[Article alloc] init];
		[appDelegate.appData.articles addObject:anArticle];
	}
    
	NSString* elName;
	// Articleクラスに対応するプロパティがある場合のみ文字列の格納領域を用意する
	if(anArticle) {
		if(elName = [anArticle getPropertyNameFor:elementName]) {
			currentElement = [[NSMutableString alloc] initWithString:@""];
		}
	}
	
	NSLog(@"タグエレメント: %@", elementName);//下に表示されるタグ
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { //要素の中で文字列が見つかった時に呼ばれる
	
	if(currentElement) 
		[currentElement appendString:string];//文字列を結合する
	NSLog(@"値: %@", currentElement);//下に表示されるタグ
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {//エレメントを読み込みおわったら？
    
	NSString* elName;
	// Musicクラスに対応するプロパティがある場合のみ処理する
	if(currentElement) {
		if(elName = [anArticle getPropertyNameFor:elementName]) {
			[anArticle setValue:currentElement forKey:elName];
		}
    
		
		currentElement = nil;
	}
}

@end

