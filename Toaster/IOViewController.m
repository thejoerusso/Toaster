//
//  IOViewController.m
//  Toaster
//
//  Created by edward on 7/21/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import "IOViewController.h"

@interface IOViewController ()

@end

@implementation IOViewController
@synthesize scene;
@synthesize sceneArray;

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
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];

    DataClass *dc = [DataClass getInstance];
    
    NSLog(@"%@", dc.selectedChannels);
    
    // pan shouldn't be enabled unless we have mtx
    if (largeOutputMtx.selected == YES || smallOutputMtx.selected == YES) {
        NSLog(@"mtx set");
        [pan setEnabled:YES];
    }
    else {
        
        NSLog(@"mtx not enabled");
        [pan setEnabled:NO];
    }
    
    if ([dc.selectedChannels count] > 0) {
        NSLog(@"got channels");
        [setScene setEnabled:YES];
    }
    else {
        [setScene setEnabled:NO];
    }
    
    // set small fader input to mic if we're booting up for the first time    
    if ([dc.smallInputRouting isEqualToString:@"0"]) {
        smallInputMic.selected = true;
    }
    
    // set large fader input to tape if we're booting up for the first time    
    if ([dc.largeInputRouting isEqualToString:@"3"]) {
        largeInputTape.selected = true;
    }
    
    if ([dc.smallOutputRoutings count] == 0) {

        smallOutputStA.selected = NO;
        smallOutputStA.highlighted = NO;
        smallOutputStB.selected = NO;
        smallOutputStB.highlighted = NO;
        smallOutputStC.selected = NO;
        smallOutputStC.highlighted = NO;
        smallOutputMtx.selected = NO;
        smallOutputMtx.highlighted = NO;
    }
    
    if ([dc.largeOutputRoutings count] == 0) {
    
        largeOutputStA.selected = NO;
        largeOutputStA.highlighted = NO;
        largeOutputStB.selected = NO;
        largeOutputStB.highlighted = NO;
        largeOutputStC.selected = NO;
        largeOutputStC.highlighted = NO;
        largeOutputMtx.selected = NO;
        largeOutputMtx.highlighted = NO;
    }
    
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
// set small fader input
//-------------------------------------------
- (IBAction)setSmallFaderInput:(id)sender {
            
    UIButton *button   = (UIButton *)sender;
    NSString *title    = button.titleLabel.text.uppercaseString;
    
    smallInputBus.selected  = NO;
    smallInputLine.selected = NO;
    smallInputMic.selected  = NO;
    smallInputTape.selected = NO;
    
    button.selected         = YES;
    button.highlighted      = YES;
    
    setScene.enabled        = YES;

    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
    
    // set active small input routing
    dc.smallInputRouting = title;
    
    if ([title isEqualToString:@"MIC"]) {
        dc.smallInputRouting = @"0";
    }
    else if ([title isEqualToString:@"LINE"]) {
        dc.smallInputRouting = @"1";
    }
    else if ([title isEqualToString:@"BUS"]) {
        dc.smallInputRouting = @"2";
    }
    else if ([title isEqualToString:@"TAPE"]) {
        dc.smallInputRouting = @"3";
    }
    
    NSLog(@"Setting small input to %@", title);
    
}

#pragma mark -

//-------------------------------------------
// set small fader input
//-------------------------------------------
- (IBAction)setSmallFaderOutput:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
    button.highlighted = !button.highlighted;
    NSString *title  = button.titleLabel.text.uppercaseString;
    
    NSLog(@"Setting small fader output to %@", title);

    // get dataclass instance
    DataClass *dc    = [DataClass getInstance];

    if ([title isEqualToString:@"MTX"]) {
        NSLog(@"equals MTX");
        
        [largeOutputMtx setSelected:NO];
        [ dc.largeOutputRoutings removeObject:@"MTX" ];
    }
        
    // remove if object is already selected, else add it
    if ([dc.smallOutputRoutings containsObject:title]) {
        [dc.smallOutputRoutings removeObject:title];
    }
    else {
        [dc.smallOutputRoutings addObject:title];
    }
    
    for (NSObject* routing in dc.smallOutputRoutings)
    {
        NSLog(@"%@", routing);
    }    
}

#pragma mark -

//-------------------------------------------
// set large fader input
//-------------------------------------------
- (IBAction)setLargeFaderInput:(id)sender {
            
    UIButton *button = (UIButton *)sender;
    NSString *title  = button.titleLabel.text.uppercaseString;

    largeInputBus.selected  = NO;
    largeInputLine.selected = NO;
    largeInputMic.selected  = NO;
    largeInputTape.selected = NO;
    
    button.selected         = YES;
    button.highlighted      = YES;
    
    // get dataclass instance
    DataClass *dc = [DataClass getInstance];
        
    // set active large input routing
    dc.largeInputRouting = title;

    if ([title isEqualToString:@"MIC"]) {
        dc.largeInputRouting = @"0";
    }
    else if ([title isEqualToString:@"LINE"]) {
        dc.largeInputRouting = @"1";
    }
    else if ([title isEqualToString:@"BUS"]) {
        dc.largeInputRouting = @"2";
    }
    else if ([title isEqualToString:@"TAPE"]) {
        dc.largeInputRouting = @"3";
    }
    
    NSLog(@"Setting large fader input to %@", title);
}

#pragma mark -

//-------------------------------------------
// set large fader input
//-------------------------------------------
- (IBAction)setLargeFaderOutput:(id)sender {
            
    UIButton *button = (UIButton *)sender;
    button.selected = !button.selected;
    button.highlighted = !button.highlighted;    
    NSString *title  = button.titleLabel.text.uppercaseString;
    
    NSLog(@"Setting large fader output to %@", title);

    // get dataclass instance
    DataClass *dc    = [DataClass getInstance];
    
    if ([title isEqualToString:@"MTX"]) {
        [smallOutputMtx setSelected:NO];
        [ dc.smallOutputRoutings removeObject:@"MTX" ];
    }
    
    // remove if object is already selected, else add it
    if ([dc.largeOutputRoutings containsObject:title]) {
        [dc.largeOutputRoutings removeObject:title];
    }
    else {
        [dc.largeOutputRoutings addObject:title];
    }
    
    if (title == @"MTX" && !button.isSelected) {
                
        [dc.selectedBusses removeAllObjects];
        // deselectAllBusButtons();
    }
        
    if (!largeOutputMtx.isSelected && !smallOutputMtx.isSelected) {
        [pan setEnabled:NO];
    }
    
    for (NSObject* routing in dc.largeOutputRoutings)
    {
        NSLog(@"%@", routing);
    }    
}

#pragma mark -

//-------------------------------------------
// set pan
//-------------------------------------------
- (IBAction)setPan:(id)sender {
    
    // get dataclass instance
    DataClass *dc    = [DataClass getInstance];
    
    UIButton *button = (UIButton *)sender;
    NSString *title  = button.titleLabel.text.uppercaseString;

    if (largeOutputMtx.selected == YES || smallOutputMtx.selected == YES) {
        
        NSLog(@"Enabling pan %@", title);
        
        button.selected    = !button.selected;
        button.highlighted = !button.highlighted;
    }
    else {
        
        button.selected    = NO;
        button.highlighted = NO;
    }
    
    if (button.isSelected == TRUE) {
        
        dc.selectedPan = @"TRUE";
    }
    else {
        dc.selectedPan = @"FALSE";        
    }
}

//-------------------------------------------
// set pan
//-------------------------------------------
- (IBAction)linkChannelsToBusses:(id)sender {
    
    // get dataclass instance
    DataClass *dc    = [DataClass getInstance];
    
    UIButton *button = (UIButton *)sender;
    NSString *title  = button.titleLabel.text.uppercaseString;    
    
    if (largeOutputMtx.selected == YES || smallOutputMtx.selected == YES) {
        
        NSLog(@"Enabling linkChannelsToBusses %@", title);
        
        button.selected    = !button.selected;
        button.highlighted = !button.highlighted;
    }
    else {
        
        button.selected    = NO;
        button.highlighted = NO;
    }
        
    if (button.isSelected == TRUE) {
        
        dc.linkChannelsToBusses = @"TRUE";
    }
    else {
        dc.linkChannelsToBusses = @"FALSE";
    }
}

#pragma mark -

- (IBAction)sendData: (id)sender {
    
    NSLog(@"in IOViewController::sendData");
    
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

- (void)findRecordForDate:(NSDate*)date inManagedObjectContext:(NSManagedObjectContext*)moc {
    
}

@end
