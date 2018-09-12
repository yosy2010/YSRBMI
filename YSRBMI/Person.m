//
//  Person.m
//  YSRBMI
//
//  Created by YASSER ALTAMIMI on 30/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import "Person.h"

@implementation Person

// get BMI method
- (int)getBMI
{
    // get hte height
    float height = [self height];
    
    //get hte weight
    unsigned int weight = [self weight];
    
    // return the BMI
    return weight / (height * height);
}

// custom init
- (instancetype)initWithName:(NSString *)name andWeight:(unsigned int)weight andHeight:(float)height
{
    // if object exists
    if ((self = [super init])) {
        
        // assign all the info on the init
        _name = name;
        _weight = weight;
        _height = height;
        _bmi = [self getBMI];
    }
    return self;
}

- (NSString *)description
{
    // get the name, weight and height to describe the person
    NSString *name = [self name];
    unsigned int weight = [self weight];
    float height = [self height];
    unsigned int bmi = [self getBMI];
    
    return [NSString stringWithFormat:@"\n Name: %@\n Weight: %u\n Height: %.2f\n BMI: %u", name, weight, height, bmi];
}

@end
