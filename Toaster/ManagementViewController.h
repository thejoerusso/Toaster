//
//  ManagementViewController.h
//  Toaster
//
//  Created by edward on 7/21/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagementViewController : UIViewController {
    
    IBOutlet UISwitch *OLEDSwitch;
    IBOutlet UIButton *presetMix1;
    IBOutlet UIButton *presetMix2;
    IBOutlet UIButton *presetMix3;
    IBOutlet UIButton *presetMix4;
    IBOutlet UIButton *presetMix5;
    IBOutlet UIButton *presetMix6;
    IBOutlet UIButton *setScene;    
    IBOutlet UILabel  *cableStatusLabel;//this is the outlet to be updated
    
}

@end
