//
//  EventModel.h
//  BK
//
//  Created by Chen Jin on 5/7/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventModel : NSObject

- (NSUInteger) numberOfEvents;

- (NSDictionary *) eventAtIndex: (NSUInteger) index;


@end
