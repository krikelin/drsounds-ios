//
//  DRFirstViewController.m
//  Dr. Sounds
//
//  Created by Alecca on 2014-04-10.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import "DRFirstViewController.h"
#import "DRFeatureCollectionViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
@interface DRFirstViewController ()

@end

@implementation DRFirstViewController
@synthesize dataSource;
@synthesize items;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.featuredCollectionView setDataSource:self];
    [self.featuredCollectionView setDelegate:self];
    [self setDataSource:[[DRDataSource alloc] init]];
    [self setItems:[[NSMutableArray alloc] init]];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *_items = [self.dataSource featured];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.items addObjectsFromArray:_items];
            [self.featuredCollectionView reloadData];
        });
    });

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.items count];
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DRFeature *feature = (DRFeature *)[self.items objectAtIndex:indexPath.item];
    NSURL *url = [NSURL URLWithString:[feature url]];
    
    UIApplication *sharedApplication = [UIApplication sharedApplication];
    if ([sharedApplication canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Can't open link" message:@"You need Spotify to open the album" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alertView show];
    }

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DRFeature *feature = (DRFeature *)[self.items objectAtIndex:indexPath.item];
    DRFeatureCollectionViewCell *cell = (DRFeatureCollectionViewCell *)[self.featuredCollectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.imageView setImageWithURL:[NSURL URLWithString:[feature imageURL]]];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
