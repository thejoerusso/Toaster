//
//  Utils.m
//  Toaster
//
//  Created by edward on 9/22/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import "Utils.h"

@implementation Utils

static Utils *instance = nil;

+(Utils *)getInstance {
    @synchronized(self) {
        if(instance == nil) {
            instance= [Utils new];
        }
    }
    return instance;
}

- (id)init {
    if (self = [super init]) {
        
        NSLog(@"init rscMgr");
        
        rscMgr = [[RscMgr alloc] init];
        [rscMgr setDelegate:(id)self];
    }
    return self;
}

//-------------------------------------------
// send data
// TODO : should move this to a central class
//-------------------------------------------
- (void)sendData {
    
    NSLog(@"in Utils::sendData");
    
    NSString *commandString = @"";
    
    // loop through channels
    
    DataClass *dc = [DataClass getInstance];
    
    NSLog(@"%@", dc.smallInputRouting);
    
    for (NSString* channel in dc.selectedChannels)
    {
        
        // clear settings for channel
        NSMutableArray *commandArgs = [NSMutableArray arrayWithObjects:@"0", channel, @"1", nil];
        commandString               = [commandArgs componentsJoinedByString:@"/"];
        commandString               = [NSString stringWithFormat:@"/%@\n", commandString];
        
        [self writeSerialData:commandString];
        
        // small input
        commandString               = @"";
        commandArgs = [NSMutableArray arrayWithObjects:@"1", channel, dc.smallInputRouting, nil];
        commandString               = [commandArgs componentsJoinedByString:@"/"];
        commandString               = [NSString stringWithFormat:@"/%@\n", commandString];
        
        [self writeSerialData:commandString];
        
        // large input
        commandString               = @"";
        commandArgs                 = [NSMutableArray arrayWithObjects:@"2", channel, dc.largeInputRouting, nil];
        commandString               = [commandArgs componentsJoinedByString:@"/"];
        commandString               = [NSString stringWithFormat:@"/%@\n", commandString];
        
        [self writeSerialData:commandString];
        
        // pan
        if (dc.selectedPan == @"TRUE") {
            commandString               = @"";
            commandArgs                 = [NSMutableArray arrayWithObjects:@"3", channel, @"1", nil];
            commandString               = [commandArgs componentsJoinedByString:@"/"];
            commandString               = [NSString stringWithFormat:@"/%@\n", commandString];
            
            [self writeSerialData:commandString];
        }            
        
        // small outputs
        if ([dc.smallOutputRoutings count] > 0) {
            commandString               = @"";
            NSString *smallOutputs      = [dc.smallOutputRoutings componentsJoinedByString:@","];
            commandArgs                 = [NSMutableArray arrayWithObjects:@"4", channel, smallOutputs, nil];
            commandString               = [commandArgs componentsJoinedByString:@"/"];
            commandString               = [NSString stringWithFormat:@"/%@\n", commandString];
            
            [self writeSerialData:commandString];
        }
        
        // large outputs
        if ([dc.largeOutputRoutings count] > 0) {
            
            commandString               = @"";
            NSString *largeOutputs      = [dc.largeOutputRoutings componentsJoinedByString:@","];
            commandArgs                 = [NSMutableArray arrayWithObjects:@"5", channel, largeOutputs, nil];
            commandString               = [commandArgs componentsJoinedByString:@"/"];
            commandString               = [NSString stringWithFormat:@"/%@\n", commandString];
            
            [self writeSerialData:commandString];
        }
        
        // busses
        
        commandString = @"";
    
        if ([dc.presetUsed isEqualToString:@"TRUE"]) {
            NSLog(@"------------------------------------");
            NSLog(@"in bus handling for preset!");
            commandArgs                 = [NSMutableArray arrayWithObjects:@"6", channel, channel, nil];
            commandString               = [commandArgs componentsJoinedByString:@"/"];
            commandString               = [NSString stringWithFormat:@"/%@\n", commandString];
        }
        else {
            if ([dc.selectedBusses count] > 0) {

                NSLog(@"------------------------------------");
                NSLog(@"in normal bus handling!");                
                NSString *busOutputs        = [dc.selectedBusses componentsJoinedByString:@","];
                commandArgs                 = [NSMutableArray arrayWithObjects:@"6", channel, busOutputs, nil];
                commandString               = [commandArgs componentsJoinedByString:@"/"];
                commandString               = [NSString stringWithFormat:@"/%@\n", commandString];
            }
        }
        [self writeSerialData:commandString];
    }
    
    // update console
    
    NSLog(@"updating console!");
    commandString = @"/7/1/xxx";
    commandString = [NSString stringWithFormat:@"%@\n", commandString];
    NSLog(@"update command is: %@", commandString);
    [self writeSerialData:commandString];

    if (dc.presetUsed == @"TRUE") {
    
        [self clearAllSelections];
    }
    
    // reset presetUsed
    dc.presetUsed = @"FALSE";
}

- (void)writeSerialData:(NSString *)serialData {
    
    NSData *commandData      = [serialData dataUsingEncoding:NSUTF8StringEncoding];
    const void *commandBytes = [commandData bytes];
    int commandLength        = [commandData length];
    
    NSLog(@"command %@", serialData);
    
    [rscMgr write:(UInt8 *)commandBytes Length:commandLength];
}

- (void)clearAllChannels {
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    NSInteger i;
    
    for(i = 1; i <= 48; i++) {
        NSString *str = [NSString stringWithFormat:@"%d", i];
        [dc.selectedChannels removeObject:str];
    }
}

- (void)clearAllBusses {
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    NSInteger i;
    
    for(i = 1; i <= 48; i++) {
        NSString *str = [NSString stringWithFormat:@"%d", i];
        [dc.selectedBusses removeObject:str];
    }
}

- (void)clearAllSmallOutputRoutings {
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    [dc.smallOutputRoutings removeAllObjects];
}

- (void)clearAllLargeOutputRoutings {
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    [dc.largeOutputRoutings removeAllObjects];
}

- (void)clearAllSelections {
    
    [self clearAllChannels];
    [self clearAllBusses];
    [self clearAllSmallOutputRoutings];
    [self clearAllLargeOutputRoutings];
}

#pragma mark - RscMgrDelegate methods

- (void) cableConnected:(NSString *)protocol {
    NSLog(@"Cable Connected: %@", protocol);
    [rscMgr setBaud:28800];
	[rscMgr open];
    DataClass *dc = [DataClass getInstance];
    dc.cableStatus = @"Connected";
    
}

- (void) cableDisconnected {
    NSLog(@"Cable disconnected");
    DataClass *dc = [DataClass getInstance];
    dc.cableStatus = @"Disconnected";
    
}

- (void) portStatusChanged {
    NSLog(@"portStatusChanged");
    
}

- (void) readBytesAvailable:(UInt32)numBytes {
    NSLog(@"readBytesAvailable:");
    int bytesRead = [rscMgr read:rxBuffer Length:numBytes];
    NSLog( @"Read %d bytes from serial cable.", bytesRead );
    
    NSString *string = nil;
    for(int i = 0;i < numBytes;++i) {
        if ( string ) {
            string =  [NSString stringWithFormat:@"%@%c", string, rxBuffer[i]];
        } else {
            string =  [NSString stringWithFormat:@"%c", rxBuffer[i]];
        }
    }
}

- (BOOL) rscMessageReceived:(UInt8 *)msg TotalLength:(int)len {
    NSLog(@"rscMessageRecieved:TotalLength:");
    return FALSE;
}

- (void) didReceivePortConfig {
    NSLog(@"didRecievePortConfig");
    
}


@end
