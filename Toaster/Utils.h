//
//  Utils.h
//  Toaster
//
//  Created by edward on 9/22/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RscMgr.h"
#import "DataClass.h"

#define BUFFER_LEN 1024

@interface Utils : NSObject <RscMgrDelegate> {

// redpark serial cable vars
    RscMgr *rscMgr;
    UInt8 rxBuffer[BUFFER_LEN];
    UInt8 txBuffer[BUFFER_LEN];

}

+(Utils*)getInstance;
-(void)sendData;
//-(void)writeSerialData;
-(void)clearAllSelections;
-(void)writeSerialData:(NSString *)serialData;


@end
