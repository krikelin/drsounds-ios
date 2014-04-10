//
//  DRFeature.m
//  Dr. Sounds
//
//  Created by Alecca on 2014-04-10.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import "DRFeature.h"

@implementation DRFeature
@synthesize body;
@synthesize imageURL;
- (id)initWithJSON:(NSDictionary *)json {
    self = [super initWithJSON:json];
    if (self) {
        [self setBody:[json objectForKey:@"body"]];
        [self setImageURL:[json objectForKey:@"image_url"]];
    }
    return self;
}
@end
