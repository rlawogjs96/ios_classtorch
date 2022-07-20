//
//  SignUpViewController.h
//  Class Torch
//
//  Created by Daniel Kim  on 11/24/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SignUpViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property  IBOutlet UISegmentedControl *segCon;

@property (weak, nonatomic) IBOutlet UITextField *studentName;

@property (weak, nonatomic) IBOutlet UITableView *school;

@property (weak, nonatomic) IBOutlet UITextField *profName;

@property (weak, nonatomic) IBOutlet UITextField *passwd;

@property (weak, nonatomic) IBOutlet UIButton *CreateAccount;

@end


