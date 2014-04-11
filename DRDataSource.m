//
//  DRDataSource.m
//  Dr. Sounds
//
//  Created by Alecca on 2014-04-10.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import "DRDataSource.h"
static NSString *API_KEY = @"drsounds28";
@implementation DRDataSource
- (NSDictionary *)downloadJSON:(NSString *)uri {
    NSURL *url = [NSURL URLWithString:uri];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSDictionary *json = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        return nil;
    }
    json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (!error && json) {
        return json;
    }
    return nil;
    
}
- (NSArray *)genresByPage:(NSInteger)page {
    NSMutableArray *genres = [[NSMutableArray alloc] init];
    
    NSDictionary *json = [self downloadJSON:[NSString stringWithFormat:@"http://sounds.aleros.webfactional.com/api/v1/genre/?format=json"]];
    NSArray *items = [json objectForKey:@"objects"];
    for (NSInteger i = 0; i < [items count]; i++) {
        DRGenre *genre = [[DRGenre alloc] initWithJSON:[items objectAtIndex:i]];
        [genres addObject:genre];
    }
    return genres;

}
- (NSArray *)featured {
    NSMutableArray *features = [[NSMutableArray alloc] init];
    
    NSDictionary *json = [self downloadJSON:[NSString stringWithFormat:@"http://sounds.aleros.webfactional.com/api/v1/feature/?format=json"]];
    NSArray *items = [json objectForKey:@"objects"];
    for (NSInteger i = 0; i < [items count]; i++) {
        DRFeature *feature = [[DRFeature alloc] initWithJSON:[items objectAtIndex:i]];
        [features addObject:feature];
    }
    return features;
}
- (NSArray *)playlistsForGenre:(DRGenre *)genre page:(NSInteger)page {
    NSMutableArray *genres = [[NSMutableArray alloc] init];
    NSDictionary *json = [self downloadJSON:[NSString stringWithFormat:@"http://sounds.aleros.webfactional.com/api/v1/playlist/?format=json&agenre=%@", [genre identifier]]];
    NSArray *items = [json objectForKey:@"objects"];
    for (NSInteger i = 0; i < [items count]; i++) {
        DRGenre *genre = [[DRGenre alloc] initWithJSON:[items objectAtIndex:i]];
        [genres addObject:genre];
    }
    return genres;
}
- (NSArray *)tracksForAlbum:(DRRelease *)release page:(NSInteger)page {
    NSMutableArray *tracks = [[NSMutableArray alloc] init];
    
    NSDictionary *json = [self downloadJSON:[NSString stringWithFormat:@"http://sounds.aleros.webfactional.com/api/v1/track/?format=json&album=%@", [release identifier]]];
    NSArray *items = [json objectForKey:@"objects"];
    for (NSInteger i = 0; i < [items count]; i++) {
        DRTrack *track = [[DRTrack alloc] initWithJSON:[items objectAtIndex:i]];
        [tracks addObject:track];
    }
    return tracks;
    
}
- (NSArray *)releasesByGenre:(DRGenre *)genre page:(NSInteger)page {
    NSMutableArray *albums = [[NSMutableArray alloc] init];
    
    NSDictionary *json = [self downloadJSON:[NSString stringWithFormat:@"http://sounds.aleros.webfactional.com/api/v1/album/?format=json&genre=%@", [genre identifier]]];
    NSArray *releases = [json objectForKey:@"objects"];
    for (NSInteger i = 0; i < [releases count]; i++) {
        DRRelease *release = [[DRRelease alloc] initWithJSON:[releases objectAtIndex:i]];
        [albums addObject:release];
    }
    return albums;
    
}
@end
