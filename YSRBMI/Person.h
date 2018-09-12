//
//  Person.h
//  YSRBMI
//
//  Created by YASSER ALTAMIMI on 30/12/1439 AH.
//  Copyright © 1439 YASSER ALTAMIMI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

// properties
@property (nonatomic) NSString *name;
@property (nonatomic) float height;
@property (nonatomic) unsigned int weight;
@property (nonatomic, readonly) unsigned int bmi;


// custom init
-(instancetype) initWithName :(NSString *) name andWeight :  (unsigned int) weight andHeight : (float) height;

@end

NS_ASSUME_NONNULL_END
