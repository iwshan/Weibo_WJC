//
//  TAppDelegate.m
//  Weibo_WJC
//
//  Created by TRALIN on 13-3-7.
//  Copyright (c) 2013年 TRALIN. All rights reserved.
//

#import "TAppDelegate.h"
#import "SystemCenter.h"

#ifndef kWBSDKDemoAppKey
#define kWBSDKDemoAppKey @"3545595960"
#endif

#ifndef kWBSDKDemoAppSecret
#define  kWBSDKDemoAppSecret @"1e96a5153178b53821f14a7bf2def26f"
#endif

@implementation TAppDelegate

//问题 有机会问问 @synthesize managedObjectContext , managedObjectModel , persistentStoreCoordinator;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (void)dealloc
{
    [_managedObjectContext release];
    [_managedObjectModel release];
    [_persistentStoreCoordinator release];

    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    NSString * file = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    file = [file stringByAppendingString:@"System Info.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:file]) {//1){//
        NSDictionary * sysInfoDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"System Info_model" ofType:@"plist"]];
        [sysInfoDic writeToFile:file atomically:YES];
    }
//    20 52 15
    //239 244 250     13 73 163
    NSDictionary * sysInfoDic = [NSDictionary dictionaryWithContentsOfFile:file];

    T_System_Setting * sysSetting = [T_System_Setting shareSystemInfo];
    
    if (!sysSetting.faceDic) {
        sysSetting.faceDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"emotionImage" ofType:@"plist"]];
    }
    if (!sysSetting.setColor) {
        sysSetting.setColor = [sysInfoDic valueForKey:@"color"];
    }
//    NSLog(@"%@",sysSetting.faceDic);
//    NSLog(@"%@",sysSetting.setColor);

    ///吴比
    /**/
    self.mySina = [[[SinaWeibo alloc]initWithAppKey:kWBSDKDemoAppKey appSecret:kWBSDKDemoAppSecret appRedirectURI:@"http://www.sina.com"  andDelegate:nil]autorelease];
    
    [self.mySina setDidLogInBlock:^(SinaWeibo *sinaweibo) {
        NSLog(@"登录成功！");
        
        //储存一个新浪对象
        SystemCenter * sysSina = [SystemCenter getInstance];
        sysSina.SysSina = self.mySina ;
        
        NSDictionary * authData = [NSDictionary dictionaryWithObjectsAndKeys:
                                   sinaweibo.accessToken, @"AccessTokenKey",
                                   sinaweibo.expirationDate, @"ExpirationDateKey",
                                   sinaweibo.userID, @"UserIDKey",
                                   sinaweibo.refreshToken, @"refresh_token", nil];
        
        [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"SinaWeiboAuthData"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        TMainViewController * mainVC = [[TMainViewController new]autorelease];
        self.window.rootViewController = mainVC;
        
    }];
    [self.mySina setlogInDidFailBlock:^(SinaWeibo *sinaweibo, NSError *error) {
        NSLog(@"登陆失败： error = %@",error);
    }];
    
    NSUserDefaults * Defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary * sinaweiboInfo = [Defaults objectForKey:@"SinaWeiboAuthData"];
    
    self.mySina.accessToken = [sinaweiboInfo objectForKey:@"AccessTokenKey"];
    self.mySina.expirationDate = [sinaweiboInfo objectForKey:@"ExpirationDateKey"];
    self.mySina.userID = [sinaweiboInfo objectForKey:@"UserIDKey"];
    
    [self.mySina logIn];
    
//    TMainViewController * mainVC = [[TMainViewController new]autorelease];
//    self.window.rootViewController = mainVC;
    
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

#pragma mark - Core Data SaveFunction

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreData.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
