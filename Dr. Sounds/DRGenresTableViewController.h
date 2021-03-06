//
//  DRGenresTableViewController.h
//  Dr. Sounds
//
//  Created by Alecca on 2014-04-10.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DRDataSource.h"
@interface DRGenresTableViewController : UITableViewController
@property NSMutableArray *items;
@property DRDataSource *dataSource;
@property DRGenre *selectedGenre;
@end
