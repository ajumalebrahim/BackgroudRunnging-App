//
//  ViewController.h
//  BackgroudRunnging App
//
//  Created by Eworks on 27/02/13.
//  Copyright (c) 2013 Eworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface ViewController : UIViewController<MFMessageComposeViewControllerDelegate>
-(IBAction) sendInAppSMS:(id) sender;
@end
