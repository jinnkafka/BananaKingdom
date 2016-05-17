//
//  EventCollectionViewCell.m
//  BK
//
//  Created by Chen Jin on 5/7/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import "EventCollectionViewCell.h"
#import "EventModel.h"

@interface EventCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *eventImage;
@property (weak, nonatomic) IBOutlet UILabel *eventName;

@end

@implementation EventCollectionViewCell

- (void) setCell: (NSDictionary *)event {
    self.eventImage.image = [UIImage imageNamed: event[@"image"]];
    self.eventName.text = event[@"name"];
}

@end
