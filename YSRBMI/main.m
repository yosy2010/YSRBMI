//
//  main.m
//  YSRBMI
//
//  Created by YASSER ALTAMIMI on 30/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Asset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        // create a person with name, height and weight
//        Person *halah = [[Person alloc]initWithName:@"Halah" andWeight:55 andHeight:1.64];
//
//        // create an employee
//        Employee *yasser = [[Employee alloc]initWithName:@"Yasser" andWeight:67 andHeight:1.75];
//
//        // create NSDateComponent to assign it to hire date for yasser
//        NSDateComponents *hireDateComponent = [[NSDateComponents alloc]init];
//
//        // set the date and time of components for yasser
//        [hireDateComponent setYear:2015];
//        [hireDateComponent setMonth:1];
//        [hireDateComponent setDay:29];
//        [hireDateComponent setHour:8];
//
//        // instance of calendar to use to set the date
//        NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//
//        // create the hire date for Yasser from the components
//        NSDate *hireDate = [calendar dateFromComponents:hireDateComponent];
//
//        // set the hire date for Yasser
//        [yasser setHireDate:hireDate];
//
//        // set yasser's emplyee id
//        [yasser setEmployeeID:401819];
//
//        // set yasser's office alarm code
//        [yasser setOfficeAlarmCode:17];
//
//        //log Halah description
//        NSLog(@"%@", halah);
//
//        //log Yasser description
//        NSLog(@"%@", yasser);
//
//
//
//
           ///   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///
        ///   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///
           //////////* **********/*****//*************/////******//////////////
        /////////////* **********/* * *//* ********* *////* */* *///////////
           //////////* *//////////*****//* **     ** *///* *//* *//////////////
        /////////////* *///////////* *///* **     ** *//* *///* *///////////
           //////////* ******//////* *///* ********* *////////* *//////////////
        /////////////* ******//////* *///* ***********////////* *///////////
           //////////* *///////////* *///* *///* *////////////* *//////////////
        /////////////* *///////////* *///* *////* *///////////* *///////////
           //////////* *///////////* *///* */////* *//////////* *//////////////
        /////////////* *///////////* *///* *//////* *//////**** ****////////
           //////////* *///////////* *///* *///////* */////*********///////////
        ///   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///   //
        ///   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///   //
        
        
        
        // create an array of emplyee
        NSMutableArray *employees = [[NSMutableArray alloc]init];
        
        // create a dictionary to add excutives to it
        NSMutableDictionary *excutives = [[NSMutableDictionary alloc] init];
        
        // creat 10 employees an them to the array of employee and excutives if they are
        for (int i = 0; i < 10; i++) {
            
            // create an employee
            Employee *yasser = [[Employee alloc] init];
            
            // use the i to give different values for the instance variables
            [yasser setWeight:90 + i];
            [yasser setHeight:1.80 - i/10.0];
            [yasser setEmployeeID:i];
            
            
            // add him to employee array
            [employees addObject:yasser];
            
            // add excutives
            // is this the first employee?
            // yes? then put him as CEO
            if (i == 0) {
                [excutives setObject:yasser forKey:@"CEO"];
            }
            
            // is this the second employee?
            // yes? then put him as CTO
            [excutives setObject:yasser forKey:@"CTO"];
            
        }
        
        // array of all the assets
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        // create 10 assets and add them to random employees
        for (int i = 0; i < 10; i++) {
            
            // create an asset
            Asset *asset = [[Asset alloc] init];
            
            // use the i to give it random values fot its intance variables
            NSString *label = [NSString stringWithFormat:@"Laptop %d", i];
            [asset setLabel:label];
            [asset setResaleValue:350 + i * 17];
            
            // get random number in range with the number of employee in the array
            NSUInteger randomNumber = random() % [employees count];
            
            // find that employee in the random number position and give him this assit
            Employee *randomEmployee = [employees objectAtIndex:randomNumber];
            [randomEmployee addAsset:asset];
            
            // add the asset to the array of all the assets
            [allAssets addObject:asset];
            
        }
        
        // log all the employees in the list
        NSLog(@"Employees before sorting: %@", employees);
        
        // create 2 decriptors to sort employees arrat with
        NSSortDescriptor *sortByValueOfAssets = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *sortById = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        
        // sort the employees list using the above sort descriptor
        [employees sortUsingDescriptors:@[sortByValueOfAssets, sortById]];
        
        // log all the employees in the list
        NSLog(@"Employees after sorting: %@", employees);
        
        // pick an employee
        Employee *employeeToBeRemoved = [employees objectAtIndex:7];
        
        // create an asset to give hime
        Asset *asset = [[Asset alloc] init];
        
        //label to be used
        NSString *label = [NSString stringWithFormat:@"Iphone x"];
        
        // give the asset some values
        [asset setLabel:label];
        [asset setResaleValue:400 * 12];
        
        // give him an asset
        [employeeToBeRemoved addAsset:asset];
        
        // log what's going on
        NSLog(@"employee: %@ has assts %@ and those assets will be removed from his assets", employeeToBeRemoved, asset);
        
        // remove the assets
        [employeeToBeRemoved removeAsset:asset];
        
        // log his assets after removal
        NSLog(@"after removeing his assets he now has: %@ assets", [employeeToBeRemoved assets]);
        
        
        
        // log all the employees in the list
        NSLog(@"Employees: %@", employees);
        
        
        
        // logging that we are going to get rid of employee at index 5 "6th"
        NSLog(@"giving ownership of employee at index 5");
        
        // getting rid of him
        [employees removeObjectAtIndex:5];
        
        // log all the assets
        NSLog(@"allAssets: %@", allAssets);
        
        // log the excutives dictionary
        NSLog(@"Excutives: %@", excutives);
        
        
        // log the CEO info
        NSLog(@"CEO: %@", excutives[@"CEO"]);
        
        // get rid of the excutives
        excutives = nil;
        
        // logging that we are going to get rid of all the employees
        NSLog(@"getting rid of all the employees");
        
        // filter employee with value of assets more than 70$ and put them into an array
        NSPredicate *filter = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
        
        // create the array
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:filter];
        
        // log the assets to be reclaimed
        NSLog(@"to be reclaimed: %@", toBeReclaimed);
        
        // getting rid of all of them
        employees = nil;
        allAssets = nil;
        toBeReclaimed = nil;
        
        
    }
    sleep(100);
    return 0;
}
