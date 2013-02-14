//
//  SKFGeometryAdditions.h
//  barefoot
//
//  Created by Stefan Kreminski on 27.12.12.
//  Copyright (c) 2012 Stefan Kreminski. All rights reserved.
//


CG_INLINE CGRect CGRectMoveX(CGRect rect, CGFloat moveX)
{
    rect.origin.x += moveX;
    return rect;
}

CG_INLINE CGRect CGRectMoveY(CGRect rect, CGFloat moveY)
{
    rect.origin.y += moveY;
    return rect;
}

CG_INLINE CGRect CGRectMove(CGRect rect, CGFloat moveX, CGFloat moveY)
{
    rect.origin.x += moveX;
    rect.origin.y += moveY;
    return rect;
}

