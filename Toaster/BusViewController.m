//
//  BusViewController.m
//  Toaster
//
//  Created by edward on 7/21/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import "BusViewController.h"
#import "DataClass.h"
#import "Utils.h"

@interface BusViewController ()

@end

@implementation BusViewController

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
    
    // toggle disconnected UILabel if cable is unplugged
    DataClass *dc = [DataClass getInstance];
    if ([dc.cableConnected isEqualToString:@"TRUE"]) {
        disconnected.hidden = YES;
    }

    //self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    DataClass *dc = [DataClass getInstance];
    
    NSLog(@"%@", dc.selectedChannels);
    
    for (NSString* channel in dc.selectedChannels)
    {
        NSLog(@"%@", channel);
    }
    
    if ([dc.selectedChannels count] > 0) {
        NSLog(@"got channels");
        [setScene setEnabled:YES];
    }
    else {
        [setScene setEnabled:NO];
    }
    
    NSString *mtxString = @"MTX";
    
    // if we don't have busses selected and we don't have any small or large output routings, disable all busses
    if (([dc.selectedBusses count] == 0) && (![dc.smallOutputRoutings containsObject:mtxString] && ![dc.largeOutputRoutings containsObject:mtxString])) {

            // TODO: this is SOOO not optimal. need to split these buttons into an array at some point
        
            [bus1 setEnabled:NO];
            [bus2 setEnabled:NO];
            [bus3 setEnabled:NO];
            [bus4 setEnabled:NO];
            [bus5 setEnabled:NO];
            [bus6 setEnabled:NO];
            [bus7 setEnabled:NO];
            [bus8 setEnabled:NO];
            [bus9 setEnabled:NO];
            [bus10 setEnabled:NO];
            [bus11 setEnabled:NO];
            [bus12 setEnabled:NO];
            [bus13 setEnabled:NO];
            [bus14 setEnabled:NO];
            [bus15 setEnabled:NO];
            [bus16 setEnabled:NO];
            [bus17 setEnabled:NO];
            [bus18 setEnabled:NO];
            [bus19 setEnabled:NO];
            [bus20 setEnabled:NO];
            [bus21 setEnabled:NO];
            [bus22 setEnabled:NO];
            [bus23 setEnabled:NO];
            [bus24 setEnabled:NO];
            [bus25 setEnabled:NO];
            [bus26 setEnabled:NO];
            [bus27 setEnabled:NO];
            [bus28 setEnabled:NO];
            [bus29 setEnabled:NO];
            [bus30 setEnabled:NO];
            [bus31 setEnabled:NO];
            [bus32 setEnabled:NO];
            [bus33 setEnabled:NO];
            [bus34 setEnabled:NO];
            [bus35 setEnabled:NO];
            [bus36 setEnabled:NO];
            [bus37 setEnabled:NO];
            [bus38 setEnabled:NO];
            [bus39 setEnabled:NO];
            [bus40 setEnabled:NO];
            [bus41 setEnabled:NO];
            [bus42 setEnabled:NO];
            [bus43 setEnabled:NO];
            [bus44 setEnabled:NO];
            [bus45 setEnabled:NO];
            [bus46 setEnabled:NO];
            [bus47 setEnabled:NO];
            [bus48 setEnabled:NO];
    }
    else {
        
        [bus1 setEnabled:YES];
        [bus2 setEnabled:YES];
        [bus3 setEnabled:YES];
        [bus4 setEnabled:YES];
        [bus5 setEnabled:YES];
        [bus6 setEnabled:YES];
        [bus7 setEnabled:YES];
        [bus8 setEnabled:YES];
        [bus9 setEnabled:YES];
        [bus10 setEnabled:YES];
        [bus11 setEnabled:YES];
        [bus12 setEnabled:YES];
        [bus13 setEnabled:YES];
        [bus14 setEnabled:YES];
        [bus15 setEnabled:YES];
        [bus16 setEnabled:YES];
        [bus17 setEnabled:YES];
        [bus18 setEnabled:YES];
        [bus19 setEnabled:YES];
        [bus20 setEnabled:YES];
        [bus21 setEnabled:YES];
        [bus22 setEnabled:YES];
        [bus23 setEnabled:YES];
        [bus24 setEnabled:YES];
        [bus25 setEnabled:YES];
        [bus26 setEnabled:YES];
        [bus27 setEnabled:YES];
        [bus28 setEnabled:YES];
        [bus29 setEnabled:YES];
        [bus30 setEnabled:YES];
        [bus31 setEnabled:YES];
        [bus32 setEnabled:YES];
        [bus33 setEnabled:YES];
        [bus34 setEnabled:YES];
        [bus35 setEnabled:YES];
        [bus36 setEnabled:YES];
        [bus37 setEnabled:YES];
        [bus38 setEnabled:YES];
        [bus39 setEnabled:YES];
        [bus40 setEnabled:YES];
        [bus41 setEnabled:YES];
        [bus42 setEnabled:YES];
        [bus43 setEnabled:YES];
        [bus44 setEnabled:YES];
        [bus45 setEnabled:YES];
        [bus46 setEnabled:YES];
        [bus47 setEnabled:YES];
        [bus48 setEnabled:YES];
        
        if ([dc.selectedBusses containsObject:@"1"]) {
            NSLog(@"channel 1 set");
            bus1.selected = YES;
            bus1.highlighted = NO;
        }
        else {
            bus1.selected = NO;
            bus1.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"2"]) {
            NSLog(@"channel 2 set");
            bus2.selected = YES;
            bus2.highlighted = NO;
        }
        else {
            bus2.selected = NO;
            bus2.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"3"]) {
            NSLog(@"channel 3 set");
            bus3.selected = YES;
            bus3.highlighted = NO;
        }
        else {
            bus3.selected = NO;
            bus3.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"4"]) {
            NSLog(@"channel 4 set");
            bus4.selected = YES;
            bus4.highlighted = NO;
        }
        else {
            bus4.selected = NO;
            bus4.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"5"]) {
            NSLog(@"channel 5 set");
            bus5.selected = YES;
            bus5.highlighted = NO;
        }
        else {
            bus5.selected = NO;
            bus5.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"6"]) {
            NSLog(@"channel 6 set");
            bus6.selected = YES;
            bus6.highlighted = NO;
        }
        else {
            bus6.selected = NO;
            bus6.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"7"]) {
            NSLog(@"channel 7 set");
            bus7.selected = YES;
            bus7.highlighted = NO;
        }
        else {
            bus7.selected = NO;
            bus7.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"8"]) {
            NSLog(@"channel 8 set");
            bus8.selected = YES;
            bus8.highlighted = NO;
        }
        else {
            bus8.selected = NO;
            bus8.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"9"]) {
            NSLog(@"channel 9 set");
            bus9.selected = YES;
            bus9.highlighted = NO;
        }
        else {
            bus9.selected = NO;
            bus9.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"10"]) {
            NSLog(@"channel 10 set");
            bus10.selected = YES;
            bus10.highlighted = NO;
        }
        else {
            bus10.selected = NO;
            bus10.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"11"]) {
            NSLog(@"channel 11 set");
            bus11.selected = YES;
            bus11.highlighted = NO;
        }
        else {
            bus11.selected = NO;
            bus11.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"12"]) {
            NSLog(@"channel 12 set");
            bus12.selected = YES;
            bus12.highlighted = NO;
        }
        else {
            bus12.selected = NO;
            bus12.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"13"]) {
            NSLog(@"channel 13 set");
            bus13.selected = YES;
            bus13.highlighted = NO;
        }
        else {
            bus13.selected = NO;
            bus13.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"14"]) {
            NSLog(@"channel 14 set");
            bus14.selected = YES;
            bus14.highlighted = NO;
        }
        else {
            bus14.selected = NO;
            bus14.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"15"]) {
            NSLog(@"channel 15 set");
            bus15.selected = YES;
            bus15.highlighted = NO;
        }
        else {
            bus15.selected = NO;
            bus15.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"16"]) {
            NSLog(@"channel 16 set");
            bus16.selected = YES;
            bus16.highlighted = NO;
        }
        else {
            bus16.selected = NO;
            bus16.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"17"]) {
            NSLog(@"channel 17 set");
            bus17.selected = YES;
            bus17.highlighted = NO;
        }
        else {
            bus17.selected = NO;
            bus17.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"18"]) {
            NSLog(@"channel 18 set");
            bus18.selected = YES;
            bus18.highlighted = NO;
        }
        else {
            bus18.selected = NO;
            bus18.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"19"]) {
            NSLog(@"channel 19 set");
            bus19.selected = YES;
            bus19.highlighted = NO;
        }
        else {
            bus19.selected = NO;
            bus19.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"20"]) {
            NSLog(@"channel 20 set");
            bus20.selected = YES;
            bus20.highlighted = NO;
        }
        else {
            bus20.selected = NO;
            bus20.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"21"]) {
            NSLog(@"channel 21 set");
            bus21.selected = YES;
            bus21.highlighted = NO;
        }
        else {
            bus21.selected = NO;
            bus21.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"22"]) {
            NSLog(@"channel 22 set");
            bus22.selected = YES;
            bus22.highlighted = NO;
        }
        else {
            bus22.selected = NO;
            bus22.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"23"]) {
            NSLog(@"channel 23 set");
            bus23.selected = YES;
            bus23.highlighted = NO;
        }
        else {
            bus23.selected = NO;
            bus23.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"24"]) {
            NSLog(@"channel 24 set");
            bus24.selected = YES;
            bus24.highlighted = NO;
        }
        else {
            bus24.selected = NO;
            bus24.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"25"]) {
            NSLog(@"channel 25 set");
            bus25.selected = YES;
            bus25.highlighted = NO;
        }
        else {
            bus25.selected = NO;
            bus25.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"26"]) {
            NSLog(@"channel 26 set");
            bus26.selected = YES;
            bus26.highlighted = NO;
        }
        else {
            bus26.selected = NO;
            bus26.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"27"]) {
            NSLog(@"channel 27 set");
            bus27.selected = YES;
            bus27.highlighted = NO;
        }
        else {
            bus27.selected = NO;
            bus27.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"28"]) {
            NSLog(@"channel 28 set");
            bus28.selected = YES;
            bus28.highlighted = NO;
        }
        else {
            bus28.selected = NO;
            bus28.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"29"]) {
            NSLog(@"channel 29 set");
            bus29.selected = YES;
            bus29.highlighted = NO;
        }
        else {
            bus29.selected = NO;
            bus29.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"30"]) {
            NSLog(@"channel 30 set");
            bus30.selected = YES;
            bus30.highlighted = NO;
        }
        else {
            bus30.selected = NO;
            bus30.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"31"]) {
            NSLog(@"channel 31 set");
            bus31.selected = YES;
            bus31.highlighted = NO;
        }
        else {
            bus31.selected = NO;
            bus31.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"32"]) {
            NSLog(@"channel 32 set");
            bus32.selected = YES;
            bus32.highlighted = NO;
        }
        else {
            bus32.selected = NO;
            bus32.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"33"]) {
            NSLog(@"channel 33 set");
            bus33.selected = YES;
            bus33.highlighted = NO;
        }
        else {
            bus33.selected = NO;
            bus33.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"34"]) {
            NSLog(@"channel 34 set");
            bus34.selected = YES;
            bus34.highlighted = NO;
        }
        else {
            bus34.selected = NO;
            bus34.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"35"]) {
            NSLog(@"channel 35 set");
            bus35.selected = YES;
            bus35.highlighted = NO;
        }
        else {
            bus35.selected = NO;
            bus35.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"36"]) {
            NSLog(@"channel 36 set");
            bus36.selected = YES;
            bus36.highlighted = NO;
        }
        else {
            bus36.selected = NO;
            bus36.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"37"]) {
            NSLog(@"channel 37 set");
            bus37.selected = YES;
            bus37.highlighted = NO;
        }
        else {
            bus37.selected = NO;
            bus37.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"38"]) {
            NSLog(@"channel 38 set");
            bus38.selected = YES;
            bus38.highlighted = NO;
        }
        else {
            bus38.selected = NO;
            bus38.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"39"]) {
            NSLog(@"channel 39 set");
            bus39.selected = YES;
            bus39.highlighted = NO;
        }
        else {
            bus39.selected = NO;
            bus39.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"40"]) {
            NSLog(@"channel 40 set");
            bus40.selected = YES;
            bus40.highlighted = NO;
        }
        else {
            bus40.selected = NO;
            bus40.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"41"]) {
            NSLog(@"channel 41 set");
            bus41.selected = YES;
            bus41.highlighted = NO;
        }
        else {
            bus41.selected = NO;
            bus41.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"42"]) {
            NSLog(@"channel 42 set");
            bus42.selected = YES;
            bus42.highlighted = NO;
        }
        else {
            bus42.selected = NO;
            bus42.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"43"]) {
            NSLog(@"channel 43 set");
            bus43.selected = YES;
            bus43.highlighted = NO;
        }
        else {
            bus43.selected = NO;
            bus43.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"44"]) {
            NSLog(@"channel 44 set");
            bus44.selected = YES;
            bus44.highlighted = NO;
        }
        else {
            bus44.selected = NO;
            bus44.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"45"]) {
            NSLog(@"channel 45 set");
            bus45.selected = YES;
            bus45.highlighted = NO;
        }
        else {
            bus45.selected = NO;
            bus45.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"46"]) {
            NSLog(@"channel 46 set");
            bus46.selected = YES;
            bus46.highlighted = NO;
        }
        else {
            bus46.selected = NO;
            bus46.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"47"]) {
            NSLog(@"channel 47 set");
            bus47.selected = YES;
            bus47.highlighted = NO;
        }
        else {
            bus47.selected = NO;
            bus47.highlighted = NO;
        }
        if ([dc.selectedBusses containsObject:@"48"]) {
            NSLog(@"channel 48 set");
            bus48.selected = YES;
            bus48.highlighted = NO;
        }
        else {
            bus48.selected = NO;
            bus48.highlighted = NO;
        }
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
            (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
}

#pragma mark -

//-------------------------------------------
// set bus
//-------------------------------------------
- (IBAction)setBus:(id)sender {

    // get dataclass instance
    DataClass *dc = [DataClass getInstance];

    NSString *mtxString = @"MTX";
        
    if ([dc.smallOutputRoutings containsObject:mtxString] || [dc.largeOutputRoutings containsObject:mtxString]) {
        
        UIButton *button   = (UIButton *)sender;
        button.selected    = !button.selected;
        button.highlighted = !button.highlighted;    
        NSString *title    = button.titleLabel.text.uppercaseString;
        
        NSLog(@"Setting bus to %@", title);
        
        // remove if object is already selected, else add it
        if ([dc.selectedBusses containsObject:title]) {
            [dc.selectedBusses removeObject:title];
        }
        else {
            [dc.selectedBusses addObject:title];
        }
                
        for (NSObject* busses in dc.selectedBusses)
        {
            NSLog(@"%@", busses);
        }
    }
}

#pragma mark -

- (IBAction)sendData: (id)sender {
    
    NSLog(@"in BusViewController::sendData");
    
    Utils *utils = [Utils getInstance];
    [utils sendData];    
}

- (void) cableDisconnected {
    NSLog(@"CABLE DISCONNECTED!");
}

@end
