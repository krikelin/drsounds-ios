//
//  DRFeature.h
//  Dr. Sounds
//
//  Created by Alecca on 2014-04-10.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import "DRResource.h"

@interface DRFeature : DRResource
@property NSString *body;
@property NSString *imageURL;
- (id)initWithJSON:(NSDictionary *)json;
@end
