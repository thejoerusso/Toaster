//
//  AppDelegate.h
//  Toaster
//
//  Created by edward on 7/15/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class MasterViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    MasterViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (weak, nonatomic)   IBOutlet UITextField        *inputText;
@property (weak, nonatomic)   IBOutlet UITextView         *outputResult;

// core data vars
@property (readonly, strong, nonatomic) NSManagedObjectContext       *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel         *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
