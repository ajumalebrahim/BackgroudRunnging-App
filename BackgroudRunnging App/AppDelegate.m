//
//  AppDelegate.m
//  BackgroudRunnging App
//
//  Created by Eworks on 27/02/13.
//  Copyright (c) 2013 Eworks. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

//#import 
@implementation AppDelegate
@synthesize alert;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"background Task" delegate:self cancelButtonTitle:@"oK" otherButtonTitles:nil , nil];
    [alert show];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)backgroundTask{
    NSLog(@"backgroundTask");
    alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"background Task" delegate:self cancelButtonTitle:@"oK" otherButtonTitles:nil , nil];
    [alert show];
    
   
    

        // Do the work associated with the task.

    _locationmanager = [[CLLocationManager alloc] init];
    _locationmanager.delegate = self;
    _locationmanager.distanceFilter = kCLDistanceFilterNone;
    _locationmanager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationmanager startUpdatingLocation];

//        NSLog(@"App staus: applicationDidEnterBackground");
        // Synchronize the cleanup call on the main thread in case
        // the expiration handler is fired at the same time.
        

//    NSLog(@"backgroundTimeRemaining: %.0f", [[UIApplication sharedApplication] backgroundTimeRemaining]);

    
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    NSLog(@"to background");
    UIApplication *app = [UIApplication sharedApplication];
    UIBackgroundTaskIdentifier bgTask = 0;
    
    backgroundTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self  selector:@selector(backgroundTask) userInfo:nil repeats:YES];
    
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{

        [app endBackgroundTask:bgTask];
    }];
    
//    UIBackgroundTaskIdentifier bgTask=1 ;
////    app.isInBackground = TRUE;
//    
//    UIApplication *app = [UIApplication sharedApplication];
//    
//    // Request permission to run in the background. Provide an
//    // expiration handler in case the task runs long.
//    NSAssert(bgTask == UIBackgroundTaskInvalid, nil);
//    
//    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
//        // Synchronize the cleanup call on the main thread in case
//        // the task actually finishes at around the same time.
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            if (bgTask != UIBackgroundTaskInvalid)
//            {
////                [app endBackgroundTask:bgTask];
////                bgTask=UIBackgroundTaskInvalid;
//            }
//        });
//    }];
//    
//    // Start the long-running task and return immediately.
//    CLLocationManager *locationManager;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        // Do the work associated with the task.
//        
//        locationManager.distanceFilter = 100;
//        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
//        [locationManager startMonitoringSignificantLocationChanges];
//        [locationManager startUpdatingLocation];
//        
//        NSLog(@"App staus: applicationDidEnterBackground");
//        // Synchronize the cleanup call on the main thread in case
//        // the expiration handler is fired at the same time.
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (bgTask != UIBackgroundTaskInvalid)
//            {
////                [app endBackgroundTask:bgTask];
////                bgTask = UIBackgroundTaskInvalid;
//            }
//        });
//    });
//    
//    NSLog(@"backgroundTimeRemaining: %.0f", [[UIApplication sharedApplication] backgroundTimeRemaining]);

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
#pragma mark - CLLocationManagerDelegate

- (void)startUpdatingCurrentLocation
{
    // if location services are restricted do nothing
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied ||
        [CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted )
    {
        return;
    }
    
    // if locationManager does not currently exist, create it
    if (!_locationmanager)
    {
        _locationmanager = [[CLLocationManager alloc] init];
        [_locationmanager setDelegate:self];
        _locationmanager.distanceFilter = 100.0f; // we don't need to be any more accurate than 10m
//        _locationmanager.purpose = @"This may be used to obtain your reverse geocoded address";
    }
    
    [_locationmanager startUpdatingLocation];
    
    
}

- (void)stopUpdatingCurrentLocation
{
    [_locationmanager stopUpdatingLocation];
    
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    NSLog(@"locaion location%@",newLocation);
    alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"background Task" delegate:self cancelButtonTitle:@"oK" otherButtonTitles:nil , nil];
    [alert show];
//    // if the location is older than 30s ignore
//    if (fabs([newLocation.timestamp timeIntervalSinceDate:[NSDate date]]) > 30)
//    {
//        return;
//    }
//    
//    _currentUserCoordinate = [newLocation coordinate];
//    MKCoordinateRegion region = self.mapView.region;
//    region.center = _currentUserCoordinate;
//    region.span.longitudeDelta = 10; // Bigger the value, closer the map view
//    region.span.latitudeDelta = 10;
//    [self.mapView setRegion:region animated:YES];
    
    // after recieving a location, stop updating
    [self stopUpdatingCurrentLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    
    // stop updating
    [self stopUpdatingCurrentLocation];
    
    // since we got an error, set selected location to invalid location
//    _currentUserCoordinate = kCLLocationCoordinate2DInvalid;
    
    // show the error alert
    alert= [[UIAlertView alloc] initWithTitle:@"alert " message:@"dfddfdkfjdkfjdkfj" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] ;
    alert.title = @"Error updating location";
    alert.message = [error localizedDescription];
    [alert addButtonWithTitle:@"OK"];
    [alert show];
}




@end
