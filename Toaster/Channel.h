//
//  Channel.h
//  Toaster
//
//  Created by edward on 8/14/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bus, Output;

@interface Channel : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSString * smallInput;
@property (nonatomic, retain) NSString * largeInput;
@property (nonatomic, retain) NSNumber * pan;
@property (nonatomic, retain) NSSet *busses;
@property (nonatomic, retain) NSSet *large_outputs;
@property (nonatomic, retain) NSSet *small_outputs;
@end

@interface Channel (CoreDataGeneratedAccessors)

- (void)addBussesObject:(Bus *)value;
- (void)removeBussesObject:(Bus *)value;
- (void)addBusses:(NSSet *)values;
- (void)removeBusses:(NSSet *)values;

- (void)addLarge_outputsObject:(Output *)value;
- (void)removeLarge_outputsObject:(Output *)value;
- (void)addLarge_outputs:(NSSet *)values;
- (void)removeLarge_outputs:(NSSet *)values;

- (void)addSmall_outputsObject:(Output *)value;
- (void)removeSmall_outputsObject:(Output *)value;
- (void)addSmall_outputs:(NSSet *)values;
- (void)removeSmall_outputs:(NSSet *)values;

@end
