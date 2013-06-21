//
//  ChannelViewController.m
//  Toaster
//
//  Created by edward on 7/21/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import "ChannelViewController.h"
#import "Utils.h"

@interface ChannelViewController ()
- (IBAction)handleSwipeRight:(UISwipeGestureRecognizer *)sender;
@end

@implementation ChannelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
    if ([dc.selectedChannels containsObject:@"1"]) {
        NSLog(@"channel 1 set");
        channel1.selected = YES;
        channel1.highlighted = NO;
    }
    else {
        channel1.selected = NO;
        channel1.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"2"]) {
        NSLog(@"channel 2 set");
        channel2.selected = YES;
        channel2.highlighted = NO;
    }
    else {
        channel2.selected = NO;
        channel2.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"3"]) {
        NSLog(@"channel 3 set");
        channel3.selected = YES;
        channel3.highlighted = NO;
    }
    else {
        channel3.selected = NO;
        channel3.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"4"]) {
        NSLog(@"channel 4 set");
        channel4.selected = YES;
        channel4.highlighted = NO;
    }
    else {
        channel4.selected = NO;
        channel4.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"5"]) {
        NSLog(@"channel 5 set");
        channel5.selected = YES;
        channel5.highlighted = NO;
    }
    else {
        channel5.selected = NO;
        channel5.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"6"]) {
        NSLog(@"channel 6 set");
        channel6.selected = YES;
        channel6.highlighted = NO;
    }
    else {
        channel6.selected = NO;
        channel6.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"7"]) {
        NSLog(@"channel 7 set");
        channel7.selected = YES;
        channel7.highlighted = NO;
    }
    else {
        channel7.selected = NO;
        channel7.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"8"]) {
        NSLog(@"channel 8 set");
        channel8.selected = YES;
        channel8.highlighted = NO;
    }
    else {
        channel8.selected = NO;
        channel8.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"9"]) {
        NSLog(@"channel 9 set");
        channel9.selected = YES;
        channel9.highlighted = NO;
    }
    else {
        channel9.selected = NO;
        channel9.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"10"]) {
        NSLog(@"channel 10 set");
        channel10.selected = YES;
        channel10.highlighted = NO;
    }
    else {
        channel10.selected = NO;
        channel10.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"11"]) {
        NSLog(@"channel 11 set");
        channel11.selected = YES;
        channel11.highlighted = NO;
    }
    else {
        channel11.selected = NO;
        channel11.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"12"]) {
        NSLog(@"channel 12 set");
        channel12.selected = YES;
        channel12.highlighted = NO;
    }
    else {
        channel12.selected = NO;
        channel12.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"13"]) {
        NSLog(@"channel 13 set");
        channel13.selected = YES;
        channel13.highlighted = NO;
    }
    else {
        channel13.selected = NO;
        channel13.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"14"]) {
        NSLog(@"channel 14 set");
        channel14.selected = YES;
        channel14.highlighted = NO;
    }
    else {
        channel14.selected = NO;
        channel14.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"15"]) {
        NSLog(@"channel 15 set");
        channel15.selected = YES;
        channel15.highlighted = NO;
    }
    else {
        channel15.selected = NO;
        channel15.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"16"]) {
        NSLog(@"channel 16 set");
        channel16.selected = YES;
        channel16.highlighted = NO;
    }
    else {
        channel16.selected = NO;
        channel16.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"17"]) {
        NSLog(@"channel 17 set");
        channel17.selected = YES;
        channel17.highlighted = NO;
    }
    else {
        channel17.selected = NO;
        channel17.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"18"]) {
        NSLog(@"channel 18 set");
        channel18.selected = YES;
        channel18.highlighted = NO;
    }
    else {
        channel18.selected = NO;
        channel18.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"19"]) {
        NSLog(@"channel 19 set");
        channel19.selected = YES;
        channel19.highlighted = NO;
    }
    else {
        channel19.selected = NO;
        channel19.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"20"]) {
        NSLog(@"channel 20 set");
        channel20.selected = YES;
        channel20.highlighted = NO;
    }
    else {
        channel20.selected = NO;
        channel20.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"21"]) {
        NSLog(@"channel 21 set");
        channel21.selected = YES;
        channel21.highlighted = NO;
    }
    else {
        channel21.selected = NO;
        channel21.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"22"]) {
        NSLog(@"channel 22 set");
        channel22.selected = YES;
        channel22.highlighted = NO;
    }
    else {
        channel22.selected = NO;
        channel22.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"23"]) {
        NSLog(@"channel 23 set");
        channel23.selected = YES;
        channel23.highlighted = NO;
    }
    else {
        channel23.selected = NO;
        channel23.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"24"]) {
        NSLog(@"channel 24 set");
        channel24.selected = YES;
        channel24.highlighted = NO;
    }
    else {
        channel24.selected = NO;
        channel24.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"25"]) {
        NSLog(@"channel 25 set");
        channel25.selected = YES;
        channel25.highlighted = NO;
    }
    else {
        channel25.selected = NO;
        channel25.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"26"]) {
        NSLog(@"channel 26 set");
        channel26.selected = YES;
        channel26.highlighted = NO;
    }
    else {
        channel26.selected = NO;
        channel26.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"27"]) {
        NSLog(@"channel 27 set");
        channel27.selected = YES;
        channel27.highlighted = NO;
    }
    else {
        channel27.selected = NO;
        channel27.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"28"]) {
        NSLog(@"channel 28 set");
        channel28.selected = YES;
        channel28.highlighted = NO;
    }
    else {
        channel28.selected = NO;
        channel28.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"29"]) {
        NSLog(@"channel 29 set");
        channel29.selected = YES;
        channel29.highlighted = NO;
    }
    else {
        channel29.selected = NO;
        channel29.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"30"]) {
        NSLog(@"channel 30 set");
        channel30.selected = YES;
        channel30.highlighted = NO;
    }
    else {
        channel30.selected = NO;
        channel30.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"31"]) {
        NSLog(@"channel 31 set");
        channel31.selected = YES;
        channel31.highlighted = NO;
    }
    else {
        channel31.selected = NO;
        channel31.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"32"]) {
        NSLog(@"channel 32 set");
        channel32.selected = YES;
        channel32.highlighted = NO;
    }
    else {
        channel32.selected = NO;
        channel32.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"33"]) {
        NSLog(@"channel 33 set");
        channel33.selected = YES;
        channel33.highlighted = NO;
    }
    else {
        channel33.selected = NO;
        channel33.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"34"]) {
        NSLog(@"channel 34 set");
        channel34.selected = YES;
        channel34.highlighted = NO;
    }
    else {
        channel34.selected = NO;
        channel34.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"35"]) {
        NSLog(@"channel 35 set");
        channel35.selected = YES;
        channel35.highlighted = NO;
    }
    else {
        channel35.selected = NO;
        channel35.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"36"]) {
        NSLog(@"channel 36 set");
        channel36.selected = YES;
        channel36.highlighted = NO;
    }
    else {
        channel36.selected = NO;
        channel36.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"37"]) {
        NSLog(@"channel 37 set");
        channel37.selected = YES;
        channel37.highlighted = NO;
    }
    else {
        channel37.selected = NO;
        channel37.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"38"]) {
        NSLog(@"channel 38 set");
        channel38.selected = YES;
        channel38.highlighted = NO;
    }
    else {
        channel38.selected = NO;
        channel38.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"39"]) {
        NSLog(@"channel 39 set");
        channel39.selected = YES;
        channel39.highlighted = NO;
    }
    else {
        channel39.selected = NO;
        channel39.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"40"]) {
        NSLog(@"channel 40 set");
        channel40.selected = YES;
        channel40.highlighted = NO;
    }
    else {
        channel40.selected = NO;
        channel40.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"41"]) {
        NSLog(@"channel 41 set");
        channel41.selected = YES;
        channel41.highlighted = NO;
    }
    else {
        channel41.selected = NO;
        channel41.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"42"]) {
        NSLog(@"channel 42 set");
        channel42.selected = YES;
        channel42.highlighted = NO;
    }
    else {
        channel42.selected = NO;
        channel42.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"43"]) {
        NSLog(@"channel 43 set");
        channel43.selected = YES;
        channel43.highlighted = NO;
    }
    else {
        channel43.selected = NO;
        channel43.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"44"]) {
        NSLog(@"channel 44 set");
        channel44.selected = YES;
        channel44.highlighted = NO;
    }
    else {
        channel44.selected = NO;
        channel44.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"45"]) {
        NSLog(@"channel 45 set");
        channel45.selected = YES;
        channel45.highlighted = NO;
    }
    else {
        channel45.selected = NO;
        channel45.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"46"]) {
        NSLog(@"channel 46 set");
        channel46.selected = YES;
        channel46.highlighted = NO;
    }
    else {
        channel46.selected = NO;
        channel46.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"47"]) {
        NSLog(@"channel 47 set");
        channel47.selected = YES;
        channel47.highlighted = NO;
    }
    else {
        channel47.selected = NO;
        channel47.highlighted = NO;
    }
    if ([dc.selectedChannels containsObject:@"48"]) {
        NSLog(@"channel 48 set");
        channel48.selected = YES;
        channel48.highlighted = NO;
    }
    else {
        channel48.selected = NO;
        channel48.highlighted = NO;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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

#pragma mark -

//-------------------------------------------
// set channel
//-------------------------------------------
- (IBAction)setChannel:(id)sender {
    
    // get dataclass instance
    DataClass *dc    = [DataClass getInstance];

    if (dc.smallInputRouting && dc.largeOutputRoutings) {

        UIButton *button = (UIButton *)sender;
        button.selected  = !button.selected;
        NSString *title  = button.titleLabel.text.uppercaseString;
        
        // remove if object is already selected, else add it
        if ([dc.selectedChannels containsObject:title]) {
            [dc.selectedChannels removeObject:title];
            
            // handle channel to bus mapping
            //NSLog(@"Setting channel before logic");
            //if ([dc.linkChannelsToBusses isEqualToString:@"TRUE"]) {
            //    NSLog(@"Setting channel link True - Step 1");
            //    if ([dc.selectedBusses containsObject:title]) {
            //        [dc.selectedBusses removeObject:title];
            //    }
            //}
        }
        else {
            NSLog(@"Setting channel before addObject section");
            
            [dc.selectedChannels addObject:title];

            // handle channel to bus mapping
            //NSLog(@"Setting channel before addObject logic");
            //if (dc.linkChannelsToBusses) {
            //    if ([dc.linkChannelsToBusses isEqualToString:@"TRUE"]) {
            //        NSLog(@"Setting channel before addObject call");
            //
            //        [dc.selectedBusses addObject:title];
            //    }
            //}
        }
        
        if ([dc.selectedChannels count] > 0) {
            setScene.enabled = YES;
        }
                    
        for (NSObject* channel in dc.selectedChannels)
        {
            NSLog(@"%@", channel);
        }
        
        //NSLog(@"Setting channel to %@", title);
    }
}

#pragma mark -

//-------------------------------------------
// toggle a row of channels
//-------------------------------------------
- (IBAction)toggleChannelRow:(id)sender {
    
    UIButton  *button  = (UIButton *)sender;
    button.selected    = !button.selected;
    button.highlighted = !button.highlighted;    
    NSInteger tag      = button.tag;
    
    // each tag represents a new row of channel buttons
    if (tag == 1) {        
        [self setChannel:channel1];
        [self setChannel:channel2];
        [self setChannel:channel3];
        [self setChannel:channel4];
        [self setChannel:channel5];
        [self setChannel:channel6];
        [self setChannel:channel7];
        [self setChannel:channel8];
    }
    else if (tag == 2) {
        [self setChannel:channel9];
        [self setChannel:channel10];
        [self setChannel:channel11];
        [self setChannel:channel12];
        [self setChannel:channel13];
        [self setChannel:channel14];
        [self setChannel:channel15];
        [self setChannel:channel16];
    }
    else if (tag == 3) {
        [self setChannel:channel17];
        [self setChannel:channel18];
        [self setChannel:channel19];
        [self setChannel:channel20];
        [self setChannel:channel21];
        [self setChannel:channel22];
        [self setChannel:channel23];
        [self setChannel:channel24];
    }
    else if (tag == 4) {
        [self setChannel:channel25];
        [self setChannel:channel26];
        [self setChannel:channel27];
        [self setChannel:channel28];
        [self setChannel:channel29];
        [self setChannel:channel30];
        [self setChannel:channel31];
        [self setChannel:channel32];
    }
    else if (tag == 5) {
        [self setChannel:channel33];
        [self setChannel:channel34];
        [self setChannel:channel35];
        [self setChannel:channel36];
        [self setChannel:channel37];
        [self setChannel:channel38];
        [self setChannel:channel39];
        [self setChannel:channel40];
    }
    else if (tag == 6) {
        [self setChannel:channel41];
        [self setChannel:channel42];
        [self setChannel:channel43];
        [self setChannel:channel44];
        [self setChannel:channel45];
        [self setChannel:channel46];
        [self setChannel:channel47];
        [self setChannel:channel48];
    }
}

#pragma mark -

- (IBAction)sendData: (id)sender {
    
    NSLog(@"in ChannelViewController::sendData");
    
    Utils *utils = [Utils getInstance];
    [utils sendData];
}

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController viewWillAppear:animated];
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController viewDidAppear:animated];
}

- (IBAction)handleSwipeRight:(UISwipeGestureRecognizer *)sender
{
    UIButton *button = (UIButton *)sender;
    NSLog(@"%@", button);
}

@end
