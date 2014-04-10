//
//  DRReleasesFlowViewController.m
//  Dr. Sounds
//
//  Created by Alecca on 2014-04-10.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//
#import <AFNetworking/UIImageView+AFNetworking.h>

#import "DRReleasesFlowViewController.h"
#import "DRFeatureCollectionViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "DRDataSource.h"
@interface DRReleasesFlowViewController ()
@property DRDataSource *dataSource;
@property DRGenre *genre;
@property NSMutableArray *items;
@end

@implementation DRReleasesFlowViewController
@synthesize dataSource;
@synthesize genre;
@synthesize items;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setDataSource:[[DRDataSource alloc] init]];
    // Do any additional setup after loading the view.
    [self setItems:[[NSMutableArray alloc] init]];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *_items = [self.dataSource releasesByGenre:genre page:0];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.items addObjectsFromArray:_items];
            [self.collectionView reloadData];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.items count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DRRelease *release = (DRRelease *)[self.items objectAtIndex:indexPath.item];
    DRFeatureCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.imageView setImageWithURL:[NSURL URLWithString:[release imageURL]]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DRRelease *release = [self.items objectAtIndex:indexPath.item];
    NSURL *url = [NSURL URLWithString:[release url]];
    
    UIApplication *sharedApplication = [UIApplication sharedApplication];
    if ([sharedApplication canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Can't open link" message:@"You need Spotify to open the album" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alertView show];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
