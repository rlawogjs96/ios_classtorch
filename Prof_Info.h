//
//  Prof_Info.h
//  Class Torch
//
//  Created by Daniel Kim  on 11/24/19.
//  Copyright © 2019 Daniel Kim . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Prof_Info : NSObject

@property (strong, atomic) NSString *professorid; //Professor ID: Type (int)

@property (strong, atomic) NSString *professorname; //Professor Name

@property (strong, atomic) NSString *professordepartment; //Tisch, CAS, Gallatin, etc.

@property (assign) int dob; //Date of Birth

@end

NS_ASSUME_NONNULL_END
