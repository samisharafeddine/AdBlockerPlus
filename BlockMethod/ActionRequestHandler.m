//
//  ActionRequestHandler.m
//  iAdBlocker+
//
//  Created by Sami Sharaf on 3/17/16.
//  Copyright © 2016 Sami Sharaf. All rights reserved.
//

#import "ActionRequestHandler.h"
#import "AdBlockerPlusConstants.h"

@interface ActionRequestHandler ()

@end

@implementation ActionRequestHandler

-(void)beginRequestWithExtensionContext:(NSExtensionContext *)context {
    
    NSItemProvider *attachment;
    NSString *contentOfURL;
    if ([APP_DEFAULT_BLOCKS_URL length] != 0) {
        NSError *error;
        NSURL *url = [NSURL URLWithString:APP_DEFAULT_BLOCKS_URL]; //[[NSURL alloc] initWithString:APP_DEFAULT_BLOCKS_URL]
        contentOfURL = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
        
        if (error) {
            
            NSLog(@"Error reading remote json file: %@", error.localizedDescription);
            
        }
    }
    
    if (contentOfURL != (id)[NSNull null] && contentOfURL.length != 0) {
            
        attachment = [[NSItemProvider alloc] initWithItem:contentOfURL typeIdentifier:@"public.json"];
            
    } else {
            
        NSLog(@"URL not defined or accessible using local JSON");
        attachment = [[NSItemProvider alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:APP_DEFAULT_BLOCKS_FILE withExtension:@"json"]];
            
      }
    
    NSExtensionItem *item = [[NSExtensionItem alloc] init];
    item.attachments = @[attachment];
    
    [context completeRequestReturningItems:@[item] completionHandler:nil];
    
}

@end
