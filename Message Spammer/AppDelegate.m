//
//  AppDelegate.m
//  Message Spammer
//
//  Created by Virindh Borra on 3/23/15.
//  Copyright (c) 2015 Virindh Borra. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

//Synthesize variables, obviously not needed with auto-synthesize, but i'm old school like that 😎. Complain to me @virindh.
@synthesize progressBar;
@synthesize textsLabel;
@synthesize delaytextBox;
@synthesize numOfTextsTextBox;
@synthesize numOfTextsSent;
@synthesize messageTextBox;
@synthesize buddyTextBox;
@synthesize serviceID;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    //Set the service ID to the service you want to spam.
   serviceID = @"4D1FA49E-1095-4D0E-BEBA-FD9FB2D02A64";//This is just a sample, replace with the ID you want.

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (IBAction)startButton:(id)sender
{
    //Start the progress bar at 0
    [progressBar setDoubleValue:0];
    
    //Get the number of texts to send
    int numOfTextsToSend = [numOfTextsTextBox intValue];
    
    //Get the delay between each text
    int delayInSeconds = [delaytextBox intValue];
    
    //Set the progress bar's max value to be the number of texts to send to get the progression correct
    [progressBar setMaxValue:numOfTextsToSend];
    for (int i = 1; i <= numOfTextsToSend; i++)
    {
        //Send one text
        [self sendText];
        
        //Update the progress bar
        [progressBar setDoubleValue:i];
        
        //Update the UI(the label)
        [textsLabel setStringValue:[NSString stringWithFormat:@"%i Texts", i]];
        
        //Delay between the next tezt, default is 0
        [NSThread sleepForTimeInterval:delayInSeconds];
        
    }
}
//Sends one text
-(void)sendText
{
    //The message to send
    NSString *messageToSend = messageTextBox.stringValue;
    
    //The person to send the message to
    NSString *buddyToSend = buddyTextBox.stringValue;
    
    //Creates the source code for the apple script
    NSString *sourceCodeForAppleScript = [NSString stringWithFormat:@"tell application \"Messages\" \n" @"set theBuddy to buddy \"%@\" of service id \"%@\"\n" @"send \"%@\" to theBuddy \n" @"end tell \n",buddyToSend,serviceID, messageToSend];
    //Create the NSAppleScript Object
    NSAppleScript *appleScript = [[NSAppleScript alloc] initWithSource:sourceCodeForAppleScript];
    
    //Run the Apple Script
    [appleScript executeAndReturnError:nil];
}
@end
