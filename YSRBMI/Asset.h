//
//  Assets.h
//  YSRBMI
//
//  Created by YASSER ALTAMIMI on 30/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Employee;

NS_ASSUME_NONNULL_BEGIN

@interface Asset : NSObject

// properties
@property (nonatomic, copy) NSString *label;
@property (nonatomic) unsigned int resaleValue;
@property (nonatomic, weak) Employee *holder; // to hold a pointer to who owns it


-(void)removeHolder;
@end

NS_ASSUME_NONNULL_END
