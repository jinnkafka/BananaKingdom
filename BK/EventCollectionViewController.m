//
//  EventCollectionViewController.m
//  BK
//
//  Created by Chen Jin on 5/7/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import "EventCollectionViewController.h"
#import "EventCollectionViewCell.h"
#import "EventDetailViewController.h"
#import "EventModel.h"

@interface EventCollectionViewController ()

@property (strong, nonatomic) EventModel *emodel;

@end

@implementation EventCollectionViewController

static NSString * const reuseIdentifier = @"Event";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initialize the event data model
    _emodel = [[EventModel alloc] init];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id)sender {
    if ([segue.identifier isEqualToString:@"EventDetail"]) {
        NSArray * selectedItems = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath * selectedItem = selectedItems[0];
        NSInteger selectedIndex = selectedItem.row;
        NSDictionary *event = [self.emodel eventAtIndex:selectedIndex];
        
        EventDetailViewController *edvc = [segue destinationViewController];
        edvc.event = event;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.emodel numberOfEvents];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EventCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Event" forIndexPath:indexPath];
    
    // Configure the cell
    NSDictionary *event = [self.emodel eventAtIndex:indexPath.row];
    [cell setCell:event];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
