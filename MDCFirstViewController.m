//
//  MDCFirstViewController.m
//  Markdown Convert
//
//  Created by Dominic Kraetschmer on 11/12/12.
//  Copyright (c) 2012 roqet. All rights reserved.
//

#import "MDCFirstViewController.h"
#import "MDCAppDelegate.h"

@interface MDCFirstViewController ()

@end

@implementation MDCFirstViewController

@synthesize markdownText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.navMarkDown addGestureRecognizer:gestureRecognizer];
}

- (void) hideKeyboard {
    [markdownText resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    MDCAppDelegate *appdelegate1= (MDCAppDelegate *)[[UIApplication sharedApplication] delegate];
    if (appdelegate1.markdownFromExternal)
    {
        markdownText.text = appdelegate1.markdownRawText;
        appdelegate1.markdownFromExternal = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    MDCAppDelegate *appdelegate1= (MDCAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appdelegate1.markdownRawText= [markdownText text];
    //NSLog(@"in viewWillDisappear1: %@", [markdownText text]);
    //NSLog(@"in viewWillDisappear2: %@", appdelegate1.markdownRawText);
}

@end
