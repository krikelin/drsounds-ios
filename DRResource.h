//
//  DRResource.h
//  Dr. Sounds
//
//  Created by Alecca on 2014-04-10.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRResource : NSObject
@property NSString *name;
@property NSString *url;
@property NSString *identifier;
- (id)initWithJSON:(NSDictionary *)json;
@end
