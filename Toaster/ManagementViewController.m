//
//  ManagementViewController.m
//  Toaster
//
//  Created by edward on 7/21/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import "ManagementViewController.h"
#import "BusViewController.h"
#import "Utils.h"

@interface ManagementViewController ()

@end

@implementation ManagementViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DataClass *dc = [DataClass getInstance];
    [dc addObserver:self
         forKeyPath:@"cableConnected"
            options:NSKeyValueObservingOptionNew
            context:NULL];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    // toggle disconnected UILabel if cable is unplugged
//    DataClass *dc = [DataClass getInstance];
//    NSLog(@"cable Status %@", dc.cableConnected);
//    
//    if ([dc.cableConnected isEqualToString:@"TRUE"]) {
//        disconnected.text = @"Connected";
//        disconnected.textColor = [UIColor greenColor];
//    }
//    
//    else{
//        disconnected.text = @"Disconnected";
//        disconnected.textColor = [UIColor redColor];
//
//    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.       
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
            (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
}

- (IBAction)toggleOLEDS {
    
    NSLog(@"in ManagementViewController::toggleOLEDS");        
    
    // command to toggle OLEDs
    // 0 = sleep
    // 1 = wake
    NSString *toggleOLED = @"1";
        
	if (OLEDSwitch.on) {
        NSLog(@"OLEDSwitch on");
        
        toggleOLED = @"1";  // wake
        
    }
    else {
        toggleOLED = @"0";  // sleep        
    }
    
    NSString *commandString = @"";
    commandString = [NSString stringWithFormat:@"/8/%@/xxx", toggleOLED ];
    commandString = [NSString stringWithFormat:@"%@\n", commandString];
    NSLog(@"update command is: %@", commandString);
    
    Utils *utils = [Utils getInstance];
    [utils writeSerialData:commandString];
}

- (void)first24On:(NSString*)target {
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    NSInteger i;
    
    if ([target isEqualToString:@"channels"]) {
        // set channels to 1-48
        for(i = 1; i <= 24; i++) {
            NSString *str = [NSString stringWithFormat:@"%d", i];
            [dc.selectedChannels addObject:str];
        }      
    }
    else {
        // set busses to 1-48
        //for(i = 1; i <= 49; i++) {
        //    NSString *str = [NSString stringWithFormat:@"%d", i];
        //    [dc.selectedBusses addObject:str];
        //}
    }
}

- (void)last24On:(NSString*)target {
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    NSInteger i;
    
    if ([target isEqualToString:@"channels"]) {
        // set channels to 1-48      
        for(i = 25; i <= 48; i++) {
            NSString *str = [NSString stringWithFormat:@"%d", i];
            [dc.selectedChannels addObject:str];
        }
    }
    else {
        // set busses to 1-48
        //for(i = 1; i <= 49; i++) {
        //    NSString *str = [NSString stringWithFormat:@"%d", i];
        //    [dc.selectedBusses addObject:str];
        //}
    }
}

// TODO : move to Utils.m
- (void)clearAllChannels {
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    NSInteger i;
    
    for(i = 1; i <= 48; i++) {
        NSString *str = [NSString stringWithFormat:@"%d", i];
        [dc.selectedChannels removeObject:str];
    }
}

// TODO : move to Utils.m
- (void)clearAllBusses {
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    NSInteger i;
    
    for(i = 1; i <= 48; i++) {
        NSString *str = [NSString stringWithFormat:@"%d", i];
        [dc.selectedBusses removeObject:str];
    }
}

// TODO : move to Utils.m
- (void)clearAllSmallOutputRoutings {
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    [dc.smallOutputRoutings removeAllObjects];
}

// TODO : move to Utils.m
- (void)clearAllLargeOutputRoutings {
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    [dc.largeOutputRoutings removeAllObjects];
}

// TODO : move to Utils.m
- (void)clearAllSelections {
    
    [self clearAllChannels];
    [self clearAllBusses];
    [self clearAllSmallOutputRoutings];
    [self clearAllLargeOutputRoutings];
}

//-------------------------------------------
// set mix preset #1
//-------------------------------------------
- (IBAction)mixPreset1 {
    
    NSLog(@"%@", @"mixPreset1");
        
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];    

    // link channels to busses
    dc.linkChannelsToBusses = @"TRUE";
    
    // let sendData know we're a preset
    dc.presetUsed           = @"TRUE";

    // clear selections
    [self clearAllSelections];
    
    // enable all 48 channels
    [self first24On:@"channels"];
        
    // set small input
    dc.smallInputRouting = @"0";
    
    // set small output(s)
    [dc.smallOutputRoutings addObject:@"MTX"];
    
    // set large input
    dc.largeInputRouting = @"3";    
    
    // set large output(s)
    [dc.largeOutputRoutings addObject:@"STA"];
}

//-------------------------------------------
// set mix preset #2
//-------------------------------------------
- (IBAction)mixPreset2 {
    
    NSLog(@"%@", @"mixPreset2");
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];

    // link channels to busses
    dc.linkChannelsToBusses = @"TRUE";
    
    // let sendData know we're a preset
    dc.presetUsed           = @"TRUE";
    
    // clear selections    
    [self clearAllSelections];
    
    // enable all 48 channels
    [self last24On:@"channels"];
    
    // set small input
    dc.smallInputRouting = @"0";
    
    // set small output(s)
    [dc.smallOutputRoutings addObject:@"MTX"];
    
    // set large input
    dc.largeInputRouting = @"3";
    
    // set large output(s)
    [dc.largeOutputRoutings addObject:@"STA"];
}

//-------------------------------------------
// set mix preset #3
//-------------------------------------------
- (IBAction)mixPreset3 {
    
    NSLog(@"%@", @"mixPreset3");
        
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    // link channels to busses
    dc.linkChannelsToBusses = @"TRUE";
    
    // let sendData know we're a preset
    dc.presetUsed           = @"TRUE";
    
    // clear selections    
    [self clearAllSelections]; 
    
    // enable all 48 channels
    [self first24On:@"channels"];
        
    // set small input
    dc.smallInputRouting = @"0";
        
    // set large input
    dc.largeInputRouting = @"3";
    
    // set large output(s)
    [dc.largeOutputRoutings addObject:@"MTX"];
    [dc.largeOutputRoutings addObject:@"STA"];
}

//-------------------------------------------
// set mix preset #4
//-------------------------------------------
- (IBAction)mixPreset4 {
    
    NSLog(@"%@", @"mixPreset4");
        
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    // link channels to busses
    dc.linkChannelsToBusses = @"TRUE";
    
    // let sendData know we're a preset
    dc.presetUsed           = @"TRUE";
    
    // clear selections
    [self clearAllSelections];
    
    // enable all 48 channels
    [self last24On:@"channels"];
    
    // set small input
    dc.smallInputRouting = @"0";
        
    // set large input
    dc.largeInputRouting = @"3";
    
    // set large output(s)
    [dc.largeOutputRoutings addObject:@"MTX"];
    [dc.largeOutputRoutings addObject:@"STA"];    
}

//-------------------------------------------
// set mix preset #5
//-------------------------------------------
- (IBAction)mixPreset5 {
    
    NSLog(@"%@", @"mixPreset5");
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    // link channels to busses
    dc.linkChannelsToBusses = @"TRUE";
    
    // let sendData know we're a preset
    dc.presetUsed           = @"TRUE";
    
    // clear selections
    [self clearAllSelections];
    
    // enable all 48 channels
    [self first24On:@"channels"];
    
    // set small input
    dc.smallInputRouting = @"3";
    
    // set small output(s)
    [dc.smallOutputRoutings addObject:@"STA"];
    
    // set large input
    dc.largeInputRouting = @"0";
    
    // set large output(s)
    [dc.largeOutputRoutings addObject:@"MTX"];
}

//-------------------------------------------
// set mix preset #6
//-------------------------------------------
- (IBAction)mixPreset6 {
    
    NSLog(@"%@", @"mixPreset6");
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    // link channels to busses
    dc.linkChannelsToBusses = @"TRUE";
    
    // let sendData know we're a preset
    dc.presetUsed           = @"TRUE";
    
    // clear selections
    [self clearAllSelections];
    
    // enable all 48 channels
    [self last24On:@"channels"];
    
    // set small input
    dc.smallInputRouting = @"3";
    
    // set small output(s)
    [dc.smallOutputRoutings addObject:@"STA"];
    
    // set large input
    dc.largeInputRouting = @"0";
    
    // set large output(s)
    [dc.largeOutputRoutings addObject:@"MTX"];
}

- (IBAction)sendData: (id)sender {
    
    NSLog(@"in BusViewController::sendData");
    
    Utils *utils = [Utils getInstance];
    [utils sendData];
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    if ([keyPath isEqual: @"cableConnected"]){
        DataClass *dc = [DataClass getInstance];
        if ([dc.cableConnected isEqualToString:@"TRUE"]) {
            disconnected.text = @"Connected";
            disconnected.textColor = [UIColor greenColor];
        }
        
        else{
            disconnected.text = @"Disconnected";
            disconnected.textColor = [UIColor redColor];
        }

    }
}



@end
