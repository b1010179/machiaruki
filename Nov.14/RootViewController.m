//
//  RootViewController.m
//  Nov.14
//
//  Created by プロジェクト15 on 12/11/14.
//  Copyright (c) 2012年 プロジェクト15. All rights reserved.
//

#import "RootViewController.h"
#import "XMLParser.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "AppData.h"

@interface RootViewController () {
    NSMutableArray *_objects;
}
@end

@implementation RootViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"まちあるきマップ";
    //self.tableView.rowHeight = 75;
    
    roots = [NSArray arrayWithObjects:
             @"これぞ王道！函館の魅力凝縮コース",
             @"てくてく坂道大三坂・八幡坂編",
             @"きらめきのライトアップ教会編",
             @"きらめきのライトアップ海辺編",
             @"湯の川あったか散歩道",
             @"幕末の志士達が駆け抜けた箱館①",
             @"箱館はじめて物語",
             @"函館寺社巡り",
             @"北の豪商高田屋嘉兵衛物語",
             @"ペリーが見たHAKODADI",
             @"きらめきのライトアップ古き佳き函館編",
             @"函館まちなか美術館五稜郭編",
             @"絵になる函館ロケ地巡り",
             @"てくてく坂道姿見坂・弥生坂編",
             @"真説・五稜郭物語",
             @"幕末の志士達が駆け抜けた箱館②",
             @"歌人石川啄木が魅せられた函館",
             @"新島襄ヒストリート",
             @"もう一つの函館山",
             @"美しき祈りの山「恵山",
             @"しあわせの隠れ場所を探しに",
             @"再生した「蔵」めぐり～現在に息づく古き佳きもの～", nil];
    
    subtitle = [NSArray arrayWithObjects:
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.3km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",
                @"[駅前・元町] 1.5km 60分",nil];
    
    images = [NSArray arrayWithObjects:
              [UIImage imageNamed:@"01.png"],
              [UIImage imageNamed:@"02.png"],
              [UIImage imageNamed:@"03.png"],
              [UIImage imageNamed:@"04.png"],
              [UIImage imageNamed:@"05.png"],
              [UIImage imageNamed:@"06.png"],
              [UIImage imageNamed:@"07.png"],
              [UIImage imageNamed:@"08.png"],
              [UIImage imageNamed:@"09.png"],
              [UIImage imageNamed:@"10.png"],
              [UIImage imageNamed:@"11.png"],
              [UIImage imageNamed:@"12.png"],
              [UIImage imageNamed:@"13.png"],
              [UIImage imageNamed:@"14.png"],
              [UIImage imageNamed:@"15.png"],
              [UIImage imageNamed:@"16.png"],
              [UIImage imageNamed:@"17.png"],
              [UIImage imageNamed:@"18.png"],
              [UIImage imageNamed:@"19.png"],
              [UIImage imageNamed:@"20.png"],
              [UIImage imageNamed:@"21.png"],
              [UIImage imageNamed:@"22.png"],nil];
    
	// Do any additional setup after loading the view, typically from a nib.
    //    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    //
    //    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //    self.navigationItem.rightBarButtonItem = addButton;
    
    NSLog(@"%@", [testPosition objectAtIndex:0]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //セルの数を決める
    return [roots count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //セルのスタイルの決定
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [roots objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:12.5];
    cell.detailTextLabel.text = [subtitle objectAtIndex:indexPath.row];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
    cell.imageView.image = [images objectAtIndex:indexPath.row];
    
    return cell;
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //
    //    NSDate *object = _objects[indexPath.row];
    //    cell.textLabel.text = [object description];
    //    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)getURL {
    url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://codepro3.c.fun.ac.jp/hakoburaAPI_dummy/test/spot/?Key=1192&spotid=%@,%@,%@,%@,%@",[spotID objectAtIndex:0], [spotID objectAtIndex:1], [spotID objectAtIndex:2], [spotID objectAtIndex:3], [spotID objectAtIndex:4]]];
}

- (void)getAndParseInfomation {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSLog(@"getAndParseInfomation");
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    XMLParser *parser = [[XMLParser alloc] init];
    [xmlParser setDelegate:parser];
    if([xmlParser parse]) {
        [[[navigationController viewControllers] objectAtIndex:0] viewControllers];
        NSLog(@"パースに成功");
    }
    else {
        NSLog(@"パースに失敗");
    }
    
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) { //1個目のセクション
        if (indexPath.row == 0) {
            spotID = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
            roottitle = @"これぞ王道！函館の魅力凝縮コース";
            //testPosition = [NSArray arrayWithObjects:@"41.773746", @"140.726399", nil];
            NSLog(@"%@", spotID);
            NSLog(@"%@", roottitle);
            
            [self getURL];
            
            NSLog(@"%@",url);
            
            [self getAndParseInfomation];
            
        } else if (indexPath.row == 1) {
            
            spotID = [NSArray arrayWithObjects:@"6", @"7", @"8", @"9", @"10", nil];
            roottitle = @"これぞ王道！函館の魅力凝縮コース";
            //testPosition = [NSArray arrayWithObjects:@"41.773746", @"140.726399", nil];
            NSLog(@"%@", spotID);
            NSLog(@"%@", roottitle);
            
            [self getURL];
            
            NSLog(@"%@",url);
            
            [self getAndParseInfomation];
            
        } else if (indexPath.row == 2) {
            
        } else if (indexPath.row == 3) {
            
        } else if (indexPath.row == 4) {
            
        } else if (indexPath.row == 5) {
            
        } else if (indexPath.row == 6) {
            
        } else if (indexPath.row == 7) {
            
        } else if (indexPath.row == 8) {
            
        } else if (indexPath.row == 9) {
            
        } else if (indexPath.row == 10) {
            
        } else if (indexPath.row == 11) {
            
        } else if (indexPath.row == 12) {
            
        } else if (indexPath.row == 13) {
            
        } else if (indexPath.row == 14) {
            
        } else if (indexPath.row == 15) {
            
        } else if (indexPath.row == 16) {
            
        } else if (indexPath.row == 17) {
            
        } else if (indexPath.row == 18) {
            
        } else if (indexPath.row == 19) {
            
        } else if (indexPath.row == 20) {
            
        } else if (indexPath.row == 21) {
            
        } else if (indexPath.row == 22) {
            
        }
    }
    
//    if(detailViewController == nil) {
//		detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
//		detailViewController.appData = appData;
//	}
//    
//	Article *anArticle = [appDelegate.appData.articles objectAtIndex:indexPath.row];
//	detailViewController.anArticle = anArticle;
//	[self.navigationController pushViewController:detailViewController animated:YES];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setValue:[NSString stringWithFormat:@"%d", indexPath.row] forKey:@"num"];
    
    [self performSegueWithIdentifier:@"rowNumber" sender:self];

}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
//}

@end
