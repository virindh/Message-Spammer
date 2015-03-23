//
//  AppDelegate.h
//  Message Spammer
//
//  Created by Virindh Borra on 3/23/15.
//  Copyright (c) 2015 Virindh Borra. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

//The property for the message text field
@property (weak) IBOutlet NSTextField *messageTextBox;

//The property for the recipient text box
@property (weak) IBOutlet NSTextField *buddyTextBox;

//Property for the number of texts to send
@property (weak) IBOutlet NSTextField *numOfTextsTextBox;

//Property for the delay text box
@property (weak) IBOutlet NSTextField *delaytextBox;

//Called when the start button is pressed, initiates the process
- (IBAction)startButton:(id)sender;

// The label that shows the # of texts sent
@property (weak) IBOutlet NSTextField *textsLabel;

//A progress bar to show...progress
@property (weak) IBOutlet NSProgressIndicator *progressBar;

//To keep track of the # of texts alreday sent
@property int numOfTextsSent;

/*
 The Local machines service ID from the messages app. This is machine specific, and service specific(eg. Text v. iMessage). You can get these ID's by running this Apple Script:
 
 Apple Script:
 tell application "Messages"
 get id of every service
 end tell
 
*/
@property (weak) NSString *serviceID;

@end

