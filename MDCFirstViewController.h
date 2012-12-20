//
//  MDCFirstViewController.h
//  Markdown Convert
//
//  Created by Dominic Kraetschmer on 11/12/12.
//  Copyright (c) 2012 roqet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDCFirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationBar *navMarkDown;
@property (weak, nonatomic) IBOutlet UITextView *markdownText;

@end
