//
//  BlockerRule.h
//  iAdBlocker+
//
//  Created by Sami Sharaf on 3/17/16.
//  Copyright © 2016 Sami Sharaf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockerRule : NSObject

//supports only mandatory fields
@property (strong, nonatomic) NSString *urlFilter;
@property (strong, nonatomic) NSString *actionType;
@property (strong, nonatomic) NSString *actionSelector;

-(id)initWithDictionary:(NSDictionary *)dic;

@end
