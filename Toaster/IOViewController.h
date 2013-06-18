//
//  IOViewController.h
//  Toaster
//
//  Created by edward on 7/21/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scene.h"
#import "DataClass.h"
#import "Utils.h"

#define BUFFER_LEN 1024

@class AppDelegate;

@interface IOViewController : UIViewController {
    
    AppDelegate *appDelegate;    

    // OSC setup vars
	IBOutlet UITextField		*receivingAddressField;
	IBOutlet UITextField		*receivingPortField;
	IBOutlet UITextView			*receivingTextView;	
	IBOutlet UITextField		*ipField;
	IBOutlet UITextField		*portField;
	IBOutlet UITextField		*oscAddressField;
	IBOutlet UIButton			*bundleMsgsButton;    
	IBOutlet UIButton			*smallInputMic;    
	IBOutlet UIButton			*smallInputLine;
	IBOutlet UIButton			*smallInputBus;
	IBOutlet UIButton			*smallInputTape;
	IBOutlet UIButton			*smallOutputStA;    
	IBOutlet UIButton			*smallOutputStB;
	IBOutlet UIButton			*smallOutputStC;
	IBOutlet UIButton			*smallOutputMtx;    
    
	IBOutlet UIButton			*largeInputMic;    
	IBOutlet UIButton			*largeInputLine;
	IBOutlet UIButton			*largeInputBus;
	IBOutlet UIButton			*largeInputTape;
	IBOutlet UIButton			*largeOutputStA;    
	IBOutlet UIButton			*largeOutputStB;
	IBOutlet UIButton			*largeOutputStC;
	IBOutlet UIButton			*largeOutputMtx;
    
    IBOutlet UIButton           *pan;
    IBOutlet UIButton           *link;
    IBOutlet UIButton           *setScene;

    IBOutlet UILabel            *disconnected;
    
	
    // toaster vars
    NSMutableDictionary *toasterScene;
}

// scene vars
@property (nonatomic, retain) NSMutableArray *sceneArray;
@property (nonatomic, retain) Scene *scene;


@end
