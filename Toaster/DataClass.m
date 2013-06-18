//
//  DataClass.m
//  Toaster
//
//  Created by edward on 8/22/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import "DataClass.h"

@implementation DataClass

@synthesize selectedPan;
@synthesize selectedChannels;
@synthesize selectedBusses;
@synthesize linkChannelsToBusses;
@synthesize smallInputRouting;
@synthesize largeInputRouting;
@synthesize smallOutputRoutings;
@synthesize largeOutputRoutings;
@synthesize cableConnected;
@synthesize str;

static DataClass *instance = nil;

+(DataClass *)getInstance {
    @synchronized(self) {
        if(instance == nil) {
            instance= [DataClass new];
        }
    }
    return instance;
}  

- (id)init {
    if (self = [super init]) {
        selectedChannels     = [[NSMutableArray alloc] initWithObjects:nil];
        selectedBusses       = [[NSMutableArray alloc] initWithObjects:nil];
        smallInputRouting    = [NSString alloc];
        largeInputRouting    = [NSString alloc];
        selectedPan          = [NSString alloc];
        presetUsed           = @"FALSE";
        linkChannelsToBusses = @"FALSE";
        smallOutputRoutings  = [[NSMutableArray alloc] initWithObjects:nil];
        largeOutputRoutings  = [[NSMutableArray alloc] initWithObjects:nil];
        smallInputRouting    = @"0";
        largeInputRouting    = @"3";
        cableConnected       = @"FALSE";
//        NSLog(@"%@", cableConnected); //this prints OK

    }
    return self;
}

@end