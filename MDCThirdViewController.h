//
//  MDCThirdViewController.h
//  Markdown Convert
//
//  Created by Dominic Kraetschmer on 11/13/12.
//  Copyright (c) 2012 roqet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDCThirdViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISwitch *useDefaultCSS;
@property (weak, nonatomic) IBOutlet UIButton *selectRestoreDefault;
@property (weak, nonatomic) IBOutlet UITextView *cssText;
- (IBAction)useDefaultCSS:(id)sender;
- (IBAction)selectRestoreDefault:(id)sender;

@end
