//
//  Employee.m
//  YSRBMI
//
//  Created by YASSER ALTAMIMI on 30/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import "Employee.h"
#import "Asset.h"

// class extention
@interface Employee ()

// instance variables
{
    NSDictionary *timeSinceEmplyment;
    NSMutableSet *_assets; // the one behinde the scenes
}

// properties that should be private
@property (nonatomic) unsigned int officeAlarmCode;;

@end

@implementation Employee

// setter and getter for NSArray Assets
-(void)setAssets:(NSSet *)assets
{
    _assets = [assets mutableCopy];
}

- (NSArray *)assets
{
    return [_assets copy];
}

// calculate the year of emplyment
-(NSDictionary *)yearsOfEmplyment
{
    if (self.hireDate) {
        
        // get hire date
        NSDate *hireDate = [self hireDate];
        
        // date now
        NSDate *now = [NSDate date];
        
        // get system calendar
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        // units to get
        NSCalendarUnit units = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
        
        // get the info broken down
        NSDateComponents *breakdownInfo = [calendar components:units fromDate:hireDate toDate:now options:0];
        
        // store them
        NSInteger days = [breakdownInfo day];
        NSInteger months = [breakdownInfo month];
        NSInteger years = [breakdownInfo year];
        
        //convert them to objects aka "NSNumber
        NSNumber *oDays = @(days);
        NSNumber *oMonths = @(months);
        NSNumber *oYears = @(years);
        
        // add them to the dictionary
        NSDictionary *timeSinceEmplyment = @{@"days":oDays , @"months":oMonths, @"years":oYears};
        
        // return the dictonary back
        return timeSinceEmplyment;
        
    }
    NSDictionary *emptyDictionary = @{@"error":@"error"};
    return emptyDictionary;
}

// to add assets to the assets array
- (void)addAsset:(Asset *)asset
{
    
    // is it the first time we are adding an asset?
    // yes? then go ahead and create an array
    if (!_assets) {
        _assets = [[NSMutableSet alloc]init];
    }
    
    // then add the object
    [_assets addObject:asset];
    [asset setHolder:self];
    
}

// remove an asset from assets array

- (void)removeAsset:(Asset *)asset
{
    if (!_assets) {
        NSLog(@"there are no assets to remove");
    }
    
    [_assets removeObject:asset];
    [asset removeHolder];
    
}

// calculate sum of the assts values
- (unsigned int)valueOfAssets
{
    // to hold the sum amount
    unsigned int sum = 0;
    
    // iterate over every asset in the assets array
    for (Asset *asset in _assets) {
        
        // add the value of each to the sum variable
        sum += [asset resaleValue];
    }
    
    // then return it
    return sum;
}

// custom init
-(instancetype)init
{
    // get proprties
    NSString *name = [self name];
    unsigned int weight = [self weight];
    float height = [self height];
    
    // return the super init
    return [super initWithName:name andWeight:weight andHeight:height];
}

// override descrption
-(NSString *)description
{
//    // get the name, weight and height to describe the person
//    NSString *name = [self name];
//    unsigned int weight = [self weight];
//    float height = [self height];
//    unsigned int bmi = [self bmi];
//    unsigned int employeeID = [self employeeID];
//    unsigned int officeAlarmCode = [self officeAlarmCode];
//    NSDate *hireDate = [self hireDate];
//    
//    // get time since hiredate
//    NSDictionary *timeSinceHireDate = [self yearsOfEmplyment];
//    
//    // get the hire date broken so we can log it
//    NSNumber *day = timeSinceHireDate[@"days"];
//    NSNumber *month = timeSinceHireDate[@"months"];
//    NSNumber *years = timeSinceHireDate[@"years"];
//    
//    // description
//    return [NSString stringWithFormat:@"\n Name: %@\n Weight: %u\n Height: %.2f\n BMI: %u\n Emplyee ID: %u\n Office Alarm Code: %u\n,Hire Date: %@\n %@ is employed for : %@ years,  %@ months and %@ days ", name, weight, height, bmi, employeeID, officeAlarmCode, hireDate, name, years, month, day];

    return [NSString stringWithFormat:@"<Employee %u: $%u in assets", [self employeeID]
            , [self valueOfAssets]];
}

// overriding the dealloc method to track deallocation of objects
- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
