//
//  ChatRoomViewController.m
//  Class Torch
//
//  Created by Daniel Kim  on 11/25/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

#import "ChatRoomViewController.h"
#import <OHMySQL/OHMySQL.h>

@interface ChatRoomViewController ()

@property NSArray *tasks;

@end

@implementation ChatRoomViewController

//Display previous chats using viewDidLoad 
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Connect to database & set configuration
    OHMySQLUser *user = [[OHMySQLUser alloc] initWithUserName:@"nyu"
                                 password:@"NYUdb!234"
                                   serverName:@"13.125.254.61"
                                   dbName:@"NYU_class"
                                     port:3306
                                   socket:@"/Applications/MAMP/tmp/mysql/mysql.sock"];
    
    //Set coordinator to connect
    OHMySQLStoreCoordinator *coordinator = [[OHMySQLStoreCoordinator alloc] initWithUser:user];
    [coordinator connect];
    
    //Set query context in order to execute query
    OHMySQLQueryContext *queryContext = [OHMySQLQueryContext new];
           queryContext.storeCoordinator = coordinator;
    
    //Retrieve Chat Data from Chatroom Table: SELECT * from chat; 
    OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory SELECT:@"chat" condition:nil];
    NSError *error = nil;
    self.tasks = [queryContext executeQueryRequestAndFetchResult:query error:&error];
    
    NSInteger cnt = _tasks.count;
    
    NSString* text;
    
    //Initially display up till 22 chats.
    int i;
    
    //If there are over 22 chat messages, display chats starting from 22nd If we have 33 chat messages, start displaying from 11 ~ 33.
    if( cnt > 22)
        i=(int)cnt-22;
    else
        i=0;
    
    for(; i< cnt ; i++)
    {
        NSDictionary *temp = _tasks[i];
        text = [NSString stringWithFormat:@"%@%@%@",_conv.text,@"\r\n",[temp objectForKey:@"content"]];
        _conv.text = text;
    }
    
    _conv.text = text;
    
}

- (IBAction)returnButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//send chats using sendButton and also display the chats from previous
- (IBAction)sendButton:(id)sender {
    //Connect to database & set configuration
    OHMySQLUser *user = [[OHMySQLUser alloc] initWithUserName:@"nyu"
                                 password:@"NYUdb!234"
                                   serverName:@"13.125.254.61"
                                   dbName:@"NYU_class"
                                     port:3306
                                   socket:@"/Applications/MAMP/tmp/mysql/mysql.sock"];
    
        //Set coordinator to connect
        OHMySQLStoreCoordinator *coordinator = [[OHMySQLStoreCoordinator alloc] initWithUser:user];
        [coordinator connect];
    
    //Insert Chat Data to Chatroom Table and set content;
    OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory INSERT:@"chat" set:@{ @"content": _input.text }];
    NSError *error = nil;
    
    //Set query context in order to execute query
    OHMySQLQueryContext *queryContext = [OHMySQLQueryContext new];
           queryContext.storeCoordinator = coordinator;
    
    [queryContext executeQueryRequest:query error:&error];
    
    //Retrieve Chat Data from Chatroom Table: SELECT * from chat;
    query = [OHMySQLQueryRequestFactory SELECT:@"chat" condition:nil];
    
    self.tasks = [queryContext executeQueryRequestAndFetchResult:query error:&error];
    
    NSInteger cnt = _tasks.count;
    
    NSString* text;
    
    //Add text saying message has been added when new message is sent.
    _conv.text=@"A new chat message has been added";
    int i;
    if( cnt > 22)
        i=(int)cnt-22;
    else
        i=0;
    for( ; i< cnt ; i++)
    {
        NSDictionary *temp = _tasks[i];
        text = [NSString stringWithFormat:@"%@%@%@",_conv.text,@"\r\n",[temp objectForKey:@"content"]];
        _conv.text = text;
    }
    
    _conv.text = text;
    _input.text = @"";
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
