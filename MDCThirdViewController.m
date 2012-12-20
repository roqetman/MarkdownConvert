//
//  MDCThirdViewController.m
//  Markdown Convert
//
//  Created by Dominic Kraetschmer on 11/13/12.
//  Copyright (c) 2012 roqet. All rights reserved.
//

#import "MDCThirdViewController.h"
#import "MDCAppDelegate.h"

@interface MDCThirdViewController ()

@end

@implementation MDCThirdViewController

@synthesize cssText;
@synthesize useDefaultCSS;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.cssText setAutoresizesSubviews:YES];
    [self.cssText setAutoresizingMask: UIViewAutoresizingFlexibleRightMargin |
     UIViewAutoresizingFlexibleWidth |
     UIViewAutoresizingFlexibleHeight];

    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.tableView addGestureRecognizer:gestureRecognizer];
    MDCAppDelegate *appdelegate1= (MDCAppDelegate *)[[UIApplication sharedApplication] delegate];
    useDefaultCSS.on = appdelegate1.usingCSS;
    
    //NSLog(@"Is Kind of NSString: %d", appdelegate1.usingCSS);
    //NSLog(@"Is Kind of NSString: %@", appdelegate1.usingCSS ? @"YES" : @"NO");
}

- (void) hideKeyboard {
    [cssText resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    NSString *valueOfSwitch;
    MDCAppDelegate *appdelegate1= (MDCAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    appdelegate1.cssRawText= [cssText text];
    if (useDefaultCSS.on) {
        appdelegate1.usingCSS = YES;
        valueOfSwitch = [NSString stringWithFormat:@"ON"];
    } else {
        appdelegate1.usingCSS = NO;
        valueOfSwitch = [NSString stringWithFormat:@"OFF"];
    }
    [userDefaults setObject:valueOfSwitch forKey:@"use_css"];
    [userDefaults synchronize];
    
    //NSLog(@"in viewWillDisappear0: %@", valueOfSwitch);
    //NSLog(@"in viewWillDisappear: %@", appdelegate1.usingCSS ? @"YES" : @"NO");
    
    //NSLog(@"in viewWillDisappear1: %@", [cssText text]);
    //NSLog(@"in viewWillDisappear2: %@", appdelegate1.cssRawText);
}

- (IBAction)useDefaultCSS:(id)sender {
    // no action at this time
}

- (IBAction)selectRestoreDefault:(id)sender {
    // load default css stylesheet
    NSString *cssPath = [[NSBundle mainBundle] pathForResource:@"style"
                                                        ofType:@"css"];
    NSData *cssData = [NSData dataWithContentsOfFile:cssPath];
    NSString *cssString = [[NSString alloc] initWithData:cssData
                                                encoding:NSASCIIStringEncoding];
    cssText.text = cssString;
    //useDefaultCSS.on = YES;
}
@end
