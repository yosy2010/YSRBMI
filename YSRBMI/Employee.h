//
//  Employee.h
//  YSRBMI
//
//  Created by YASSER ALTAMIMI on 30/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import "Person.h"
@class Asset;// include this class

NS_ASSUME_NONNULL_BEGIN

@interface Employee : Person

// properties
@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSSet *assets;

// methods
-(void) addAsset:(Asset *) asset; // to add assets to an employee object
-(void) removeAsset:(Asset *) asset; // to remove assets to an employee object
-(unsigned int) valueOfAssets;





@end

NS_ASSUME_NONNULL_END
