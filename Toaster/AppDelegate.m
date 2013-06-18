//
//  AppDelegate.m
//  Toaster
//
//  Created by edward on 7/15/12.
//  Copyright (c) 2012 Downtown Music Labs. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window                     = _window;
@synthesize tabBarController           = _tabBarController;

@synthesize managedObjectContext       = __managedObjectContext;
@synthesize managedObjectModel         = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

-(void)saveContext {
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && !
            [managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@", error);
            abort();
        }
    }
}

-(NSManagedObjectContext *)managedObjectContext {
    if (__managedObjectContext !=  nil) {
        return __managedObjectContext;        
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

-(NSManagedObjectModel *)managedObjectModel {
 
    if (__managedObjectModel != nil) {
        return __managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Data Model" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return __managedObjectModel;
}

-(NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (__persistentStoreCoordinator != nil) {
        return __persistentStoreCoordinator;
    }
    
    NSURL   *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Data Model.sqlite"];
    NSError *error    = nil;

    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if ([__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error: &error ]) {
        NSLog(@"Unresolved error %@", error );
        abort();
    }
    
    return __persistentStoreCoordinator;
}

-(NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)vc {
    [vc viewWillAppear:YES];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.tabBarController.delegate = self;
    [self.window addSubview:[self.tabBarController view]];
    [self.window makeKeyAndVisible];
    return YES;
}  
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
