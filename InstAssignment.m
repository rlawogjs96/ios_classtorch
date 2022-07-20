//
//  InstAssignment.m
//  Class Torch
//
//  Created by Daniel Kim  on 11/25/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

#import "InstAssignment.h"
#import <OHMySQL/OHMySQL.h>

@interface InstAssignment ()

@end

@implementation InstAssignment

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)returnButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)sendButton:(id)sender {
    OHMySQLUser *user = [[OHMySQLUser alloc] initWithUserName:@"nyu"
    password:@"NYUdb!234"
      serverName:@"13.125.254.61"
      dbName:@"NYU_class"
        port:3306
      socket:@"/Applications/MAMP/tmp/mysql/mysql.sock"];

    OHMySQLStoreCoordinator *coordinator = [[OHMySQLStoreCoordinator alloc] initWithUser:user];
    [coordinator connect];

    OHMySQLQueryContext *queryContext = [OHMySQLQueryContext new];
    queryContext.storeCoordinator = coordinator;
    
    NSString* noti_cont;

    //Set Assignment Name & Assignment Context as assignment notification context
    noti_cont = [NSString stringWithFormat:@"%@%@%@",_asmt_name.text,@" : ",_asmt_cont.text];
    
    //Insert Notifcations Data to Notifications Table and set content;
    OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory INSERT:@"noti" set:@{ @"content": noti_cont }];
    NSError *error = nil;


    [queryContext executeQueryRequest:query error:&error];
    
    [self dismissViewControllerAnimated:YES completion:nil];

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
