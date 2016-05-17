//
//  Baby_AudioViewController.m
//  BabyT
//
//  Created by Sincere on 16/5/17.
//  Copyright © 2016年 Sincere. All rights reserved.
//

#import "Baby_AudioViewController.h"
#import <AFSoundManager.h>


@interface Baby_AudioViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray      * _audioArray;
    AFSoundQueue * _queue;
}

@end

@implementation Baby_AudioViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setTabbarTitle:@"故事"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self audioRequest];
}

- (void)audioRequest
{
    NSString *URLString = @"http://120.76.136.195:20165/content/getMp3List";
    NSDictionary *parameters = @{@"mp3_id":@"1461569824637644126" , @"currentPage":@"1" , @"book_id":@"1"};
    
    NSURL *URL = [NSURL URLWithString:URLString];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:URL.absoluteString parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
        NSArray * dataArray = [responseObject objectForKey:@"data"];
        for (NSDictionary * d in dataArray)
        {
            NSString * fileName = [d objectForKey:@"file_name"];
            NSString * fileUrl = [d objectForKey:@"file_url"];
            NSString * mp3Id = [d objectForKey:@"mp3_id"];
            NSString * mp3Name = [d objectForKey:@"mp3_name"];
            
            NSLog(@"--------------");
            NSLog(@"%@",fileName);
            NSLog(@"%@",[fileUrl stringByRemovingPercentEncoding]);
            NSLog(@"%@",fileUrl);
            NSLog(@"%@",mp3Id);
            NSLog(@"%@",mp3Name);
            
        }
        _audioArray = dataArray;
        [self table];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)table
{
    UITableView * table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64-49) style:UITableViewStylePlain];
    [table setDelegate:self];
    [table setDataSource:self];
    [self.view addSubview:table];
}

# pragma mark - Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary * audioDict = _audioArray[indexPath.row];
    [self playAudioWithDict:audioDict];
}

- (void)playAudioWithDict:(id)sender
{
    AFSoundItem * item = [[AFSoundItem alloc] initWithStreamingURL:[NSURL URLWithString:[sender objectForKey:@"file_url"]]];
    
    if (!_queue)
    {
        _queue = [[AFSoundQueue alloc] initWithItems:@[item]];
    }
    else
    {
        [_queue playItem:item];
        
    }
    
    [_queue listenFeedbackUpdatesWithBlock:^(AFSoundItem *item) {
        
        NSLog(@"Item duration: %ld - time elapsed: %ld", (long)item.duration, (long)item.timePlayed);
    } andFinishedBlock:^(AFSoundItem *nextItem) {
        
        NSLog(@"Finished item, next one is %@", nextItem.title);
    }];
}



# pragma mark - DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _audioArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"audioCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"audioCell"];
    }
    NSDictionary * audioDict = _audioArray[indexPath.row];
    [cell.textLabel setText:[audioDict objectForKey:@"file_name"]];
    [cell.detailTextLabel setText:[audioDict objectForKey:@"mp3_name"]];
    return cell;
}

@end
