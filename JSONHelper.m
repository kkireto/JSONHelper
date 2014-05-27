//
//  JSONHelper.m
//
//  Created by Kireto.
//  Copyright (c) 2014 No Name. All rights reserved.
//

#import "JSONHelper.h"
#import "Globals.h"

@implementation JSONHelper

+ (id)valueForKey:(NSString*)keyString withType:(Class)classType fromDictionary:(NSDictionary*)dictionary {
    id retValue;
    if ([dictionary valueForKey:keyString] && [[dictionary valueForKey:keyString] isKindOfClass:[classType class]]) {
        retValue = [dictionary objectForKey:keyString];
    }
    return retValue;
}

+ (NSUInteger)integerValueForKey:(NSString*)keyString fromDictionary:(NSDictionary*)dictionary {
    NSUInteger retValue = 0;
    if ([dictionary valueForKey:keyString] && [dictionary valueForKey:keyString] != [NSNull null]) {
        retValue = [[dictionary objectForKey:keyString] longValue];
    }
    return retValue;
}

+ (int)intValueForKey:(NSString*)keyString fromDictionary:(NSDictionary*)dictionary {
    int retValue = 0;
    if ([dictionary valueForKey:keyString] && [dictionary valueForKey:keyString] != [NSNull null]) {
        retValue = [[dictionary objectForKey:keyString] intValue];
    }
    return retValue;
}

+ (BOOL)boolValueForKey:(NSString*)keyString fromDictionary:(NSDictionary*)dictionary {
    BOOL retValue = NO;
    if ([dictionary valueForKey:keyString] && [dictionary valueForKey:keyString] != [NSNull null]) {
        retValue = [[dictionary objectForKey:keyString] boolValue];
    }
    return retValue;
}

+ (NSString*)stringValueForKey:(NSString*)keyString fromDictionary:(NSDictionary*)dictionary {
    NSString *retValue = @"";
    if ([dictionary valueForKey:keyString] && [[dictionary valueForKey:keyString] isKindOfClass:[NSString class]]) {
        retValue = [dictionary objectForKey:keyString];
    }
    return retValue;
}

+ (NSString*)resourceStringValueForKey:(NSString*)keyString fromDictionary:(NSDictionary*)dictionary {
    NSString *retValue = @"";
    if ([dictionary valueForKey:keyString] && [[dictionary valueForKey:keyString] isKindOfClass:[NSString class]]) {
        retValue = [Globals checkSanityForURLstring:[dictionary objectForKey:keyString]];
    }
    return retValue;
}

+ (NSArray*)arrayValueForKey:(NSString*)keyString fromDictionary:(NSDictionary*)dictionary {
    NSArray *retValue;
    if ([dictionary valueForKey:keyString] && [[dictionary valueForKey:keyString] isKindOfClass:[NSArray class]]) {
        retValue = [dictionary objectForKey:keyString];
    }
    return retValue;
}

+ (NSDictionary*)dictValueForKey:(NSString*)keyString fromDictionary:(NSDictionary*)dictionary {
    NSDictionary *retValue;
    if ([dictionary valueForKey:keyString] && [[dictionary valueForKey:keyString] isKindOfClass:[NSDictionary class]]) {
        retValue = [dictionary objectForKey:keyString];
    }
    return retValue;
}

+ (NSDate*)dateValueForKey:(NSString*)keyString fromDictionary:(NSDictionary*)dictionary {
    NSDate *retValue;
    NSString *dateString = [JSONHelper stringValueForKey:keyString fromDictionary:dictionary];
    if (dateString) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"];
        retValue = [dateFormat dateFromString:dateString];
        dateFormat = nil;
    }
    return retValue;
}

+ (NSDate*)dateValueForKey:(NSString*)keyString fromDictionary:(NSDictionary*)dictionary withDateFormatter:(NSDateFormatter*)dateFormat {
    NSDate *retValue;
    NSString *dateString = [JSONHelper stringValueForKey:keyString fromDictionary:dictionary];
    if (dateString) {
        retValue = [dateFormat dateFromString:dateString];
    }
    return retValue;
}

@end
