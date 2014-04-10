//
//  DRResource.m
//  Dr. Sounds
//
//  Created by Alecca on 2014-04-10.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import "DRResource.h"

@implementation DRResource
@synthesize url;
@synthesize identifier;
@synthesize name;
@synthesize imageURL;
- (id)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        [self setIdentifier:[json objectForKey:@"id"]];
        [self setName:[json objectForKey:@"name"]];
        [self setUrl:[json objectForKey:@"url"]];
        [self setImageURL:[json objectForKey:@"image_url"]];
    }
    return self;
}
@end
