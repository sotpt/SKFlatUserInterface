//
//  SKFHelperBlocks.h
//  barefoot
//
//  Created by Stefan Kreminski on 04.12.12.
//  Copyright (c) 2012 Stefan Kreminski. All rights reserved.
//


BOOL (^isNilOrNull)(id obj) = ^BOOL (id obj)
{
    return (nil == obj || [obj isEqual:[NSNull null]]);
};

BOOL (^isNilNullOrEmpty)(id obj) = ^BOOL (NSString *obj)
{
    
    return (nil == obj ||
			[obj isEqual:[NSNull null]] ||
			obj.length == 0 ||
			[obj isEqualToString:@"<null>"]
			);
};
