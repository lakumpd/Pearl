/**
 * Copyright Maarten Billemont (http://www.lhunath.com, lhunath@lyndir.com)
 *
 * See the enclosed file LICENSE for license information (LGPLv3). If you did
 * not receive this file, see http://www.gnu.org/licenses/lgpl-3.0.txt
 *
 * @author   Maarten Billemont <lhunath@lyndir.com>
 * @license  http://www.gnu.org/licenses/lgpl-3.0.txt
 */

//
//  StringUtils.m
//  Pearl
//
//  Created by Maarten Billemont on 05/11/09.
//  Copyright 2009, lhunath (Maarten Billemont). All rights reserved.
//

#import "PearlStringUtils.h"
#import "PearlStrings.h"


NSString* RPad(const NSString* string, const NSUInteger l) {

    NSMutableString *newString = [string mutableCopy];
    while (newString.length < l)
        [newString appendString:@" "];

    return newString;
}


NSString* LPad(const NSString* string, const NSUInteger l) {

    NSMutableString *newString = [string mutableCopy];
    while (newString.length < l)
        [newString insertString:@" " atIndex:0];

    return newString;
}


NSString* AppendOrdinalPrefix(const NSInteger number, const NSString* prefix) {

    NSString *suffix = [PearlStrings get].timeDaySuffix;
    if(number % 10 == 1 && number != 11)
        suffix = [PearlStrings get].timeDaySuffixOne;
    else if(number % 10 == 2 && number != 12)
        suffix = [PearlStrings get].timeDaySuffixTwo;
    else if(number % 10 == 3 && number != 13)
        suffix = [PearlStrings get].timeDaySuffixThree;

    return [NSString stringWithFormat:@"%@%@", prefix, suffix];
}

NSArray* NumbersRanging(double min, double max, double step, NSNumberFormatterStyle style) {

    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = style;
    NSMutableArray *numbers = [NSMutableArray arrayWithCapacity:(NSUInteger)((max - min) / step)];
    for (double n = min; n <= max; n += step)
        [numbers addObject:[formatter stringFromNumber:[NSNumber numberWithDouble:n]]];
    [formatter release];

    return numbers;
}

@implementation PearlStringUtils

@end
