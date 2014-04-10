//
//  DRDataSource.h
//  Dr. Sounds
//
//  Created by Alecca on 2014-04-10.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRRelease.h"
#import "DRTrack.h"
#import "DRFeature.h"
#import "DRGenre.h"
@interface DRDataSource : NSObject
- (NSArray *)genresByPage:(NSInteger)page;
- (NSArray *)releasesByGenre:(DRGenre *)genre page:(NSInteger)page;
- (NSArray *)tracksForAlbum:(DRRelease *)release page:(NSInteger)page;
- (NSDictionary *)downloadJSON:(NSString *)uri;
- (NSArray *)featured;
@end
