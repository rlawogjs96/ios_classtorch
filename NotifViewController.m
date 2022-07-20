//
//  NotifViewController.m
//  Class Torch
//
//  Created by Daniel Kim  on 11/25/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

#import "NotifViewController.h"
#import <OHMySQL/OHMySQL.h>

@interface NotifViewController ()

@end

@implementation NotifViewController




- (void)viewDidLoad {
    [super viewDidLoad];

   //Connect to database & set configuration
   OHMySQLUser * user = [[OHMySQLUser alloc] initWithUserName:@"nyu"
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
    
    //Retrieve Notifications Data from Notifications Table: SELECT * from noti;
    OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory SELECT:@"noti" condition:nil];
    NSError *error = nil;
    
    NSArray *tasks; //Execute Request from our Query and Fetch (obtain) our result
    tasks = [queryContext executeQueryRequestAndFetchResult:query error:&error];
    
    NSInteger cnt = tasks.count;
    
    NSString* noti_name; //Notification: Notification Name
    NSString* noti_cont; //Context: Notification notification context 
    
    //Initially display 5 notifications. 
    int i;
    if(cnt<5)
        i=0;
     //If there are over 5 notifications, display notifications starting from 5th. i.e. If we have 11 notifications, start displaying from 7 ~ 11.
    else
        i=(int)cnt-5;
    
    int start_pos = i;
    
    for(;i<cnt ; i++)
    {
        NSDictionary *temp = tasks[i];
        noti_name = [NSString stringWithFormat:@"%@%@",@"Notification ",[temp objectForKey:@"id"]];
        noti_cont =[NSString stringWithFormat:@"%@",[temp objectForKey:@"content"]];
        
        //Hard coded display of our notifications.
        if(i==start_pos)
        {
            _noti_name1.text = noti_name;
            _noti_cont1.text = noti_cont;
            _noti_name1.backgroundColor = [UIColor purpleColor];
            _noti_name1.textColor = [UIColor whiteColor];
            _noti_cont1.backgroundColor = [UIColor blackColor];
            _noti_cont1.textColor = [UIColor yellowColor];
        }
        else if(i==start_pos+1)
        {
            _noti_name2.text = noti_name;
            _noti_cont2.text = noti_cont;
            _noti_name2.backgroundColor = [UIColor purpleColor];
            _noti_name2.textColor = [UIColor whiteColor];
            _noti_cont2.backgroundColor = [UIColor blackColor];
            _noti_cont2.textColor = [UIColor yellowColor];
        }
        else if(i==start_pos+2)
        {
            _noti_name3.text = noti_name;
            _noti_cont3.text = noti_cont;
            _noti_name3.backgroundColor = [UIColor purpleColor];
            _noti_name3.textColor = [UIColor whiteColor];
            _noti_cont3.backgroundColor = [UIColor blackColor];
            _noti_cont3.textColor = [UIColor yellowColor];
        }
        else if(i==start_pos+3)
        {
            _noti_name4.text = noti_name;
            _noti_cont4.text = noti_cont;
            _noti_name4.backgroundColor = [UIColor purpleColor];
            _noti_name4.textColor = [UIColor whiteColor];
            _noti_cont4.backgroundColor = [UIColor blackColor];
            _noti_cont4.textColor = [UIColor yellowColor];
        }
        else if(i==start_pos+4)
        {
            _noti_name5.text = noti_name;
            _noti_cont5.text = noti_cont;
            _noti_name5.backgroundColor = [UIColor purpleColor];
            _noti_name5.textColor = [UIColor whiteColor];
            _noti_cont5.backgroundColor = [UIColor blackColor];
            _noti_cont5.textColor = [UIColor yellowColor];
        }
    }
    
    
    // Do any additional setup after loading the view.
}
- (IBAction)notificationsboard:(id)sender {
    [self performSegueWithIdentifier:@"notifications" sender:self];

}

- (IBAction)returnButton:(id)sender {
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
