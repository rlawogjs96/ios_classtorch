//
//  ViewController.m
//  Class Torch
//
//  Created by Daniel Kim  on 11/24/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

#import "ViewController.h"
#import <OHMySQL/OHMySQL.h>

@interface ViewController ()


@end

@implementation ViewController
//Login Segmented Control
- (IBAction)landingpagesegmentedControl:(id)sender {
    [self performSegueWithIdentifier:@"Login" sender:self];
}
//Sign Up Segmented Control
- (IBAction)signuppagesegmentedControl:(id)sender {
    [self performSegueWithIdentifier:@"SignUp" sender:self];
}

-(IBAction)login:(id)sender {
        //Connect to database & Set Configuration
        OHMySQLUser *user = [[OHMySQLUser alloc] initWithUserName:@"nyu"
                                 password:@"NYUdb!234"
                                   serverName:@"13.125.254.61" //Hostname
                                   dbName:@"NYU_class"
                                     port:3306 //Port 
                                   socket:@"/Applications/MAMP/tmp/mysql/mysql.sock"];
    
        //Set coordinator to connect
        OHMySQLStoreCoordinator *coordinator = [[OHMySQLStoreCoordinator alloc] initWithUser:user];
        [coordinator connect];
    
        //Set query context in order to execute query
        OHMySQLQueryContext *queryContext = [OHMySQLQueryContext new];
        queryContext.storeCoordinator = coordinator;
    
    //If segmented index is 0, we are selecting student user
    if( _segCon.selectedSegmentIndex==0)
    {
        OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory SELECT:@"students2" condition:nil];
        NSError *error = nil;
        NSArray *tasks = [queryContext executeQueryRequestAndFetchResult:query error:&error];
        
        NSInteger cnt = tasks.count;
        NSLog(@"%ld",(long)cnt);
        
        //Check if student account loging in exists or not
        int is_found=0;
        
            for( int i=0 ; i< cnt ; i++)
            {
                NSDictionary *temp = tasks[i];
                if([_username.text isEqualToString:[temp objectForKey:@"student_name"]] ) //Check if student name exists within our keys
                {
                    if([_password.text isEqualToString:[temp objectForKey:@"student_passwd"]])
                    {
                        is_found=1; //increment 'is found'
                    }
                }
            }
        
        //If found, execute login
        if(is_found==1)
        {
            [self performSegueWithIdentifier:@"Login" sender:self];
        }
        //If not found, print user not found on console
        else
        {
            NSLog(@"User Not Found or Incorrect Password!!");
        }
    }
    //If segmented index is 1, we are selecting instructor user
    else{
        OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory SELECT:@"professors2" condition:nil];
        NSError *error = nil;
        NSArray *tasks = [queryContext executeQueryRequestAndFetchResult:query error:&error];
        
        NSInteger cnt = tasks.count;
        NSLog(@"%ld",(long)cnt);
        
        //Check if instructor account loging in exists or not
        int is_found=0; //User is found
        
            for( int i=0 ; i< cnt ; i++)
            {
                NSDictionary *temp = tasks[i];
                if([_username.text isEqualToString:[temp objectForKey:@"professor_name"]] ) //Check if professor name exists within our keys
                {
                    if([_password.text isEqualToString:[temp objectForKey:@"professor_passwd"]])
                    {
                        is_found=1;
                    }
                }
            }
        
        //If found, execute login
        if(is_found==1)
        {
            [self performSegueWithIdentifier:@"Login_inst" sender:self];
        }
        //If not found, print user not found on console
        else
        {
            NSLog(@"User Not Found or Incorrect Password!!");
        }
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
}



@end
