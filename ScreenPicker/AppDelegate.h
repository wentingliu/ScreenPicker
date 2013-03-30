//
//  AppDelegate.h
//  ScreenPicker
//
//  Created by durian on 3/26/13.
//  Copyright (c) 2013 durian. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ScreenPickerWindow.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate, ScreenPickerWindowDelegate> {
    ScreenPickerWindow *screenPickerWindow;
    IBOutlet NSColorWell *_colorWell;
    IBOutlet NSImageView *_imageView;
}

@property (assign) IBOutlet NSWindow *window;

-(IBAction)pickButtonClicked:(id)sender;

@end
