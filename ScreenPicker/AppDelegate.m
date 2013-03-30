//
//  AppDelegate.m
//  ScreenPicker
//
//  Created by durian on 3/26/13.
//  Copyright (c) 2013 durian. All rights reserved.
//

#import "AppDelegate.h"
#import "ScreenPickerWindow.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    screenPickerWindow = [[ScreenPickerWindow alloc] initWithContentRect:NSMakeRect(0, 0, 63, 63) styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:YES];
    screenPickerWindow.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidBecomeKey:) name:NSWindowDidBecomeKeyNotification object:screenPickerWindow];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidResignKey:) name:NSWindowDidResignKeyNotification object:screenPickerWindow];
}

-(IBAction)pickButtonClicked:(id)sender {
    [[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
    [screenPickerWindow makeKeyAndOrderFront:self];
    [screenPickerWindow setOrderedIndex:0];
}

- (void)windowDidBecomeKey:(NSNotification *)notification {
    if ([notification object] == screenPickerWindow) {
        NSLog(@"windowDidBecomeKey");
        [screenPickerWindow setAcceptsMouseMovedEvents:YES];
        [NSCursor hide];
    }
}

- (void)windowDidResignKey:(NSNotification *)notification {
    if ([notification object] == screenPickerWindow) {
        NSLog(@"windowDidResignKey");
        [screenPickerWindow setAcceptsMouseMovedEvents:NO];
        [NSCursor unhide];
    }
}

#pragma mark -
#pragma mark ScreenPickerWindowDelegate

- (void)window:(ScreenPickerWindow *)window clickedAtPoint:(CGPoint)point withColor:(NSColor *)color {
    NSLog(@"color well set color");
    [_colorWell setColor:color];
}

- (void)window:(ScreenPickerWindow *)window moveToPoint:(CGPoint)point withImage:(NSImage *)image {
    [image setSize:NSMakeSize(_imageView.frame.size.width, _imageView.frame.size.height)];
    [_imageView setImage:image];
}

@end
