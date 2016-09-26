//
//  BlockerRule.m
//  iAdBlocker+
//
//  Created by Sami Sharaf on 3/17/16.
//  Copyright © 2016 Sami Sharaf. All rights reserved.
//

#import "BlockerRule.h"

@implementation BlockerRule

-(id)initWithUrlFiler:(NSString *) urlFiler actionType:(NSString *)actionType actionSelector:(NSString *)actionSelector {
    
    self = [super init];
    
    if (self) {
        
        self.urlFilter = urlFiler;
        self.actionType = actionType;
        self.actionSelector = actionSelector;
        
    }
    
    return self;
    
}

-(id)initWithDictionary:(NSDictionary *)dic {
    
    //Syntax of writing rules: https://www.webkit.org/blog/3476/content-blockers-first-look/
    
    self = [self initWithUrlFiler:dic[@"trigger"][@"url-filter"] actionType:dic[@"action"][@"type"] actionSelector:dic[@"action"][@"selector"]];
    
    return self;
    
}

@end
