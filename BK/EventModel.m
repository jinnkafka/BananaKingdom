//
//  EventModel.m
//  BK
//
//  Created by Chen Jin on 5/7/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import "EventModel.h"

@interface EventModel()

@property (strong, nonatomic) NSMutableArray *events;

@end

@implementation EventModel

- (instancetype) init {
    self = [super init];
    //get the data from plist
    if(self) {
        NSString *filepath = [[NSBundle mainBundle] pathForResource:@"EventList" ofType:@"plist"];
        _events = [NSMutableArray arrayWithContentsOfFile:filepath];
        
    }
    return self;
}

- (NSUInteger) numberOfEvents {
    return [self.events count];
}

- (NSDictionary *) eventAtIndex:(NSUInteger)index {
    return [self.events objectAtIndex: index];
}


@end
