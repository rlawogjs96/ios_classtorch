//
//  ViewController.h
//  Class Torch
//
//  Created by Daniel Kim  on 11/24/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UILabel *usernamelabel;

@property (weak, nonatomic) IBOutlet UITextField *password; 

@property (weak, nonatomic) IBOutlet UILabel *passwordlabel;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property  IBOutlet UISegmentedControl *segCon;


@end

