//
//  ViewController.m
//  BackgroudRunnging App
//
//  Created by Eworks on 27/02/13.
//  Copyright (c) 2013 Eworks. All rights reserved.
//

#import "ViewController.h"
#import "EGOCache.h"
#import <MessageUI/MessageUI.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[EGOCache globalCache] setObject:@"dsdsdqqqqqqqqsd" forKey:@"sdsdsdsdsd"];
//    NSLog(@"object from cache %@",[[EGOCache globalCache ] objectForKey:@"sdsdsdsdsd"]);
    
}
-(IBAction) sendInAppSMS:(id) sender
{
	MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init] ;
	if([MFMessageComposeViewController canSendText])
	{
		controller.body = @"Hello from Mugunth";
		controller.recipients = [NSArray arrayWithObjects:@"12345678", @"87654321", nil];
		controller.messageComposeDelegate = self;
		[self presentViewController:controller animated:YES completion:nil];
	}
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
	switch (result) {
		case MessageComposeResultCancelled:
			NSLog(@"Cancelled");
			break;
		case MessageComposeResultFailed:
        {
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MyApp" message:@"Unknown Error"
														   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[alert show];
        }
			break;
		case MessageComposeResultSent:
            
			break;
		default:
			break;
	}
    
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
