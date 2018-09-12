//
//  Assets.m
//  YSRBMI
//
//  Created by YASSER ALTAMIMI on 30/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import "Asset.h"
#import "Employee.h"

@implementation Asset

// to remove the holder pointer
- (void)removeHolder
{
    [self setHolder:nil];
}

// override dealloc methods
- (void)dealloc
{
    //print the name of the object being deallocated
    NSLog(@"deallocating %@",self);
}

// override the discrption method
- (NSString *)description
{
    
    // get the label
    NSString *label = [self label];
    
    // get the resale value
    unsigned int resaleValue = [self resaleValue];
    
    // get the holder
    Employee *holder = [self holder];
    
    // does the wholder exist
    if (holder) {
        
        // give a description including the wholder
        return [NSString stringWithFormat:@"%@: $%d, assigned to %@", label, resaleValue, holder];
      
        // doesn't exist?
    } else {
        
        // just give the label and resale value
        return [NSString stringWithFormat:@"%@: $%u", label, resaleValue];
        
    }
    
    
    
}

@end
