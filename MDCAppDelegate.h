//
//  MDCAppDelegate.h
//  Markdown Convert
//
//  Created by Dominic Kraetschmer on 11/12/12.
//  Copyright (c) 2012 roqet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, copy) NSString *markdownRawText;

@property (nonatomic, copy) NSString *cssRawText;

@property (nonatomic, assign) BOOL usingCSS;

@property (nonatomic, assign) BOOL markdownFromExternal;

@end
