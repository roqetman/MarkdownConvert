//
//  MDCSecondViewController.m
//  Markdown Convert
//
//  Created by Dominic Kraetschmer on 11/12/12.
//  Copyright (c) 2012 roqet. All rights reserved.
//

#import "MDCSecondViewController.h"
#import "MDCAppDelegate.h"
#include "markdown.h"
#include "buffer.h"
#include "html.h"

@interface MDCSecondViewController ()

@end

@implementation MDCSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    MDCAppDelegate *appdelegate1= (MDCAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSString *rawMarkdown = appdelegate1.markdownRawText;
    const char * prose = [rawMarkdown UTF8String];
    struct buf *ib, *ob;
    
    int length = [rawMarkdown lengthOfBytesUsingEncoding:NSUTF8StringEncoding] + 1;
    
    ib = bufnew(length);
    bufgrow(ib, length);
    memcpy(ib->data, prose, length);
    ib->size = length;
    
    ob = bufnew(64);
    
    struct sd_callbacks callbacks;
    struct html_renderopt options;
    struct sd_markdown *markdown;
    
    sdhtml_renderer(&callbacks, &options, 0);
    markdown = sd_markdown_new(0, 16, &callbacks, &options);
    
    sd_markdown_render(ob, ib->data, ib->size, markdown);
    sd_markdown_free(markdown);
    
    NSString* shinyNewHTML = [[NSString alloc] initWithBytes:ob->data length:ob->size encoding:NSASCIIStringEncoding];
    
    // load css
    NSString *pageContent = [NSString stringWithFormat:@"<style TYPE=\"text/css\"><!--%@--></style>%@", appdelegate1.cssRawText, shinyNewHTML];
    if (appdelegate1.usingCSS)
        [self.HTMLView loadHTMLString:pageContent baseURL:[[NSURL alloc] initWithString:@""]];
    else
        [self.HTMLView loadHTMLString:shinyNewHTML baseURL:[[NSURL alloc] initWithString:@""]];
    
    bufrelease(ib);
    bufrelease(ob);
}

@end
