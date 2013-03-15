//
//  AppDelegate.h
//  BackgroudRunnging App
//
//  Created by Eworks on 27/02/13.
//  Copyright (c) 2013 Eworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>
{
    NSTimer *backgroundTimer;
    CLLocationManager *_locationmanager;
    UIAlertView *alert;
}
@property (strong, nonatomic) UIAlertView *alert;
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
