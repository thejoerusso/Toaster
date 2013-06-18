//
//  Bus.h
//  Toaster
//
//  Created by edward on 8/14/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Bus : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSNumber * enabled;

@end
