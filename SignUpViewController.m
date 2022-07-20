//
//  SignUpViewController.m
//  Class Torch
//
//  Created by Daniel Kim  on 11/24/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

#import "SignUpViewController.h"
#import <OHMySQL/OHMySQL.h>

@interface SignUpViewController ()

//Department Array
@property (copy, nonatomic) NSArray *schools;


@end

@implementation SignUpViewController

NSString *sch =@"";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create school department array
    self.schools = @[@"Center for Urban Science and Progess", @"College of Arts and Science", @"College of Dentistry", @"College of Global Public Health", @"Gallatin School of Individualized Study", @"Leonard N. Stern School of Business", @"Liberal Studies", @"Robert F. Wagner Graduate School of Public Service", @"Rory Meyers College of Nursing", @"School of Professional Studies", @"Silver School of Social Work", @"Steinhardt School of Culture, Education, and Human Development", @"Tandon School of Engineering", @"Tisch School of the Arts"];
}

- (IBAction)returnButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//Add to database
- (IBAction)insertToDB:(id)sender {
    
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
        
    //Students
    if( _segCon.selectedSegmentIndex==0)
    {
        
        //If you are a student, insert student information into our students table.
        OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory INSERT:@"students2" set:@{ @"student_passwd": _passwd.text, @"student_name": _studentName.text,@"student_department": sch }];
        NSError *error = nil;
        
        [queryContext executeQueryRequest:query error:&error];

        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    //Instructors
    else
    {
        //If you are a professor, insert professor information into our professors table.
        OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory INSERT:@"professors2" set:@{ @"professor_passwd": _passwd.text, @"professor_name": _studentName.text,@"professor_department":sch }];
        NSError *error = nil;
        
        [queryContext executeQueryRequest:query error:&error];

        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

//Delegate: Set Number of Rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.schools count];
}

//Delegate: Give back a cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Create / Reuse a cell
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    
    //Set Cell Text
    cell.textLabel.text = self.schools[indexPath.row];
    
    //Set Cell Text Color
    cell.textLabel.textColor = [UIColor purpleColor];
    
    UIImage *myImage = [UIImage imageNamed:@"icon.jpg"];
    cell.imageView.image = myImage;
    
    return cell;
    
}

//Set size of TableView
-(CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    sch = self.schools[indexPath.row];
}


@end
