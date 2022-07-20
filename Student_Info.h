//
//  Student_Info.h
//  Class Torch
//
//  Created by Daniel Kim  on 11/24/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student_Info : NSObject

@property (strong, atomic) NSString *studentid; //Student ID: Type (int)

@property (strong, atomic) NSString *studentname; //Student Name

@property (strong, atomic) NSString *studentdepartment; //Tisch, CAS, Gallatin, etc.

@property (assign) int year; //Year

@property (assign) float GPA; //GPA

@property (assign) int dob; //Date of Birth 

@end

NS_ASSUME_NONNULL_END
