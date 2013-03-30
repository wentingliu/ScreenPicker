//
//  ScreenWindow.h
//  ScreenPicker
//
//  Created by durian on 3/26/13.
//  Copyright (c) 2013 durian. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol ScreenPickerWindowDelegate;

@interface ScreenPickerWindow : NSWindow {
    CGImageRef imageRef;
}

@end

@protocol ScreenPickerWindowDelegate <NSWindowDelegate>

@optional

- (void)window:(ScreenPickerWindow *)window clickedAtPoint:(CGPoint)point withColor:(NSColor *)color;

- (void)window:(ScreenPickerWindow *)window moveToPoint:(CGPoint)point withImage:(NSImage *)image;

@end
