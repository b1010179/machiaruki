//
//  DetailViewController.m
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import "DetailViewController.h"
#import	"Annotation.h"
#import "AppData.h"
#import "Article.h"
#import "AppDelegate.h"
#import "MyAnnotation.h"
#import "SpotDetailViewController.h"
#import "RootViewController.h"


@implementation DetailViewController


//@synthesize detailButton;
//@synthesize mapView,currentAnnotation,anArticle,appData,appDelegate,detail,k,annotation;



#pragma mark -
#pragma mark viewController delegate

- (void)viewDidLoad {
    [super viewDidLoad];//画面に表示をする直前に行う処理
    NSLog(@"viewDidLoad");
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	appData = appDelegate.appData;
    
	self.title = @"";//店の名前
	currentAnnotation = nil;//annotationの変数
	mapView.delegate = self;
    annotation = nil;
    k = nil;
}

- (void)viewWillAppear:(BOOL)animated {//ビューコントローラのビューが可視状態になる時に通知
	[super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
	
	self.title = rootViewController.roottitle;
    
	MKCoordinateRegion zoom = mapView.region;//Mapkitの尺度
	zoom.span.latitudeDelta = 0.005;//表示中の地図の端から端までの緯度の差の絶対値
	zoom.span.longitudeDelta = 0.005;//表示中の地図の端から端までの経度の差の絶対値
	[mapView setRegion:zoom animated:NO];//ズームするとき動作をスムーズにするか
    
    //    if(currentAnnotation) {//annotationが
    //        [myMapView removeAnnotation:currentAnnotation];//ピンの削除
    //
    //        currentAnnotation = nil;
    //
    //    }
    
    CLLocationCoordinate2D center;
    center.latitude =41.764094;
    center.longitude= 140.711771;
	[mapView setCenterCoordinate:center animated:NO];//位置を移動したときの動作をスムーズにするか
}

- (void)viewDidAppear:(BOOL)animated {
	
    [super viewDidAppear:animated];//表示後の処理
    NSLog(@"viewDidAppear");
    
    int i;
    int j = [appDelegate.appData.articles count];
    for(i=0; i<j; i++){
        anArticle = [appDelegate.appData.articles objectAtIndex:i];
        
        CLLocationCoordinate2D point;//現在地の緯度軽度
        point.latitude  = [anArticle.latitude doubleValue];
        point.longitude = [anArticle.longitude doubleValue];
        
        NSLog(@"point.latitude %f", point.latitude);
        NSLog(@"point.longitude %f", point.longitude);
        
        MyAnnotation *annotation=[[MyAnnotation alloc] init];
//        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        [annotation setCoordinate:point];
        annotation.title = anArticle.name;
        annotation.subtitle = anArticle.outline;
        annotation.current_num = i;

        NSLog(@"current_num %d",annotation.current_num);
        [mapView addAnnotation:annotation]; //アノテーション追加
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {//画面ぐるっと系
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}




#pragma mark -
#pragma mark MapView

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
    
    NSLog(@"viewForAnnotation");
    
    NSString *PinIdentifier =@"Pin";
    
    //    MKPinAnnotationView *annotateView =(MKPinAnnotationView*)[myMapView dequeueReusableAnnotationViewWithIdentifier:PinIdentifier];
    
    //    if(annotateView==nil){
    //        annotateView=[[MKPinAnnotationView alloc] initWithAnnotation:annotateView reuseIdentifier:PinIdentifier];
    //        annotateView.animatesDrop=YES;
    //        annotateView.canShowCallout=YES;
    //        annotateView.pinColor=MKPinAnnotationColorPurple;
    //   //     detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    //        annotateView.rightCalloutAccessoryView = detailButton;
    //
    //    }
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier: @"my_annotation"];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"my_annotation"];
    } else {
        annotationView.annotation = annotation;
    }
    annotationView.animatesDrop=YES;
    annotationView.canShowCallout=YES;
    annotationView.pinColor=MKPinAnnotationColorPurple;
//    annotationView.rightCalloutAccessoryView=detailButton;
    
    MyAnnotation *MyAnn = (MyAnnotation *)annotationView.annotation;
    int array_num = MyAnn.current_num;
    NSLog(@"あれい%d",array_num);
    return annotationView;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"prepareForSegue");
    
    if ([[segue identifier] isEqualToString:@"move"]){
        SpotDetailViewController *spotDetailViewController = (SpotDetailViewController*)[segue destinationViewController];
        anArticle=[appDelegate.appData.articles objectAtIndex:k];
        spotDetailViewController.anArticle = anArticle;
        
        
        //       detailViewController.anArticle = [appDelegate.appData.articles objectAtIndex:k] ;
        spotDetailViewController.anArticle.name = currentAnnotation.title;
        NSLog(@"ZZZ=%@",currentAnnotation.title);
//  [detailscreensViewControler setAnArticle:anArticle];
        NSLog(@"art%@", detail.anArticle);
    }
    
}


//コールアウトのディスクロージャーボタンが押された
- (void) mapView:(MKMapView*)myMapView annotationView:(MKAnnotationView*)annotationView calloutAccessoryControlTapped:(UIControl*)control {
    
    NSLog(@"calloutAccessoryControlTaped");
    
    // 地図上のピンをタップしたときの処理
    // annotationView.annotation でどのアノテーションか判定可能
    
    MyAnnotation *MyAnn = (MyAnnotation *)annotationView.annotation;
    currentAnnotation = annotationView.annotation;
    k = MyAnn.current_num;
    anArticle=[appDelegate.appData.articles objectAtIndex:MyAnn.current_num];
    [self performSegueWithIdentifier:@"move" sender:self];
    
    //detail = [[DetailscreensViewController alloc] init];
    detail.anArticle = anArticle;
        
}


- (IBAction)tweetBtn:(id)sender {

TWTweetComposeViewController *tweetsheet = [[TWTweetComposeViewController alloc] init];
    [tweetsheet setInitialText:@""];
    [self presentModalViewController:tweetsheet animated:YES];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}



- (void)viewDidUnload {
    [super viewDidUnload];
}

@end
