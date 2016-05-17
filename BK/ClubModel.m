//
//  ClubModel.m
//  BK
//
//  Created by Chen Jin on 5/7/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import "ClubModel.h"

@interface ClubModel()

@property (strong, nonatomic) NSMutableArray *clubs;

@end

@implementation ClubModel

- (instancetype) init {
    
    self = [super init];
    //get the data from plist
    if (self) {
        NSString *filepath = [ [NSBundle mainBundle] pathForResource:@"ClubList" ofType:@"plist"];
        _clubs = [NSMutableArray arrayWithContentsOfFile:filepath];
    }
    return self;
}

- (NSUInteger) numberOfClubs {
    return [self.clubs count];
}

- (NSDictionary *) clubAtIndex:(NSUInteger) index {
    return [self.clubs objectAtIndex:index];
}

@end
