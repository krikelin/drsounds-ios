//
//  DRFirstViewController.h
//  Dr. Sounds
//
//  Created by Alecca on 2014-04-10.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DRDataSource.h"
@interface DRFirstViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *featuredCollectionView;
@property NSMutableArray *items;
@property DRDataSource *dataSource;
@end
