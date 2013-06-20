//
//  DataClass.h
//  Toaster
//
//  Created by edward on 8/22/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataClass : NSObject {
    
    NSMutableArray *selectedChannels;
    NSMutableArray *selectedBusses;
    NSString       *smallInputRouting;
    NSString       *largeInputRouting;
    NSMutableArray *smallOutputRoutings;
    NSMutableArray *largeOutputRoutings;
    NSString       *selectedPan;
    NSString       *presetUsed;
    NSString       *linkChannelsToBusses;
    NSString       *str;
    NSString       *cableConnected;
}

@property (nonatomic, retain) NSMutableArray *selectedChannels;
@property (nonatomic, retain) NSMutableArray *selectedBusses;
@property (nonatomic, retain) NSString       *smallInputRouting;
@property (nonatomic, retain) NSString       *largeInputRouting;
@property (nonatomic, retain) NSMutableArray *smallOutputRoutings;
@property (nonatomic, retain) NSMutableArray *largeOutputRoutings;
@property (nonatomic, retain) NSString       *selectedPan;
@property (nonatomic, retain) NSString       *presetUsed;
@property (nonatomic, retain) NSString       *linkChannelsToBusses;
@property (nonatomic, retain) NSString       *str;
@property (nonatomic, retain) NSString       *cableConnected;//this is the instance varable we want to observe

+(DataClass*)getInstance;

@end  
