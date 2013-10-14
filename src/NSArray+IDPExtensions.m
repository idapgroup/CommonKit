//
//  NSArray+IDPExtensions.m
//  Accomplist
//
//  Created by Oleksa 'trimm' Korin on 4/14/13.
//  Copyright (c) 2013 IDAP Group. All rights reserved.
//

#import "NSArray+IDPExtensions.h"

@implementation NSArray (IDPExtensions)

- (id)randomObject {
     return [self objectAtIndex:[self randomWithCount:[self count]]];
}

- (NSArray *)shuffledArray {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    NSMutableArray *shuffle = [[[NSMutableArray alloc] initWithCapacity:self.count]  autorelease];
    while ([array count]) {
        int index = arc4random()%[array count];
        [shuffle addObject:[array objectAtIndex:index]];
        [array removeObjectAtIndex:index];
    }
    return  shuffle;
}

- (NSUInteger)randomWithCount:(NSUInteger)count {
    return arc4random() % count;
}

@end

@implementation NSMutableArray (IDPExtensions)

+ (NSMutableArray *)weakArray {
    return [IDPMutableWeakArray array];
}

+ (NSMutableArray *)observableArray {
    return [IDPKVOMutableArray array];
}

+ (NSMutableArray *)observableArrayWithArray:(NSArray *)array {
    return [IDPKVOMutableArray arrayWithArray:array];
}

@end
