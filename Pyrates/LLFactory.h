//
//  LLFactory.h
//  Pyrates
//
//  Created by Len on 10/16/13.
//  Copyright (c) 2013 LL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLCharacter.h"
#import "LLBoss.h"

@interface LLFactory : NSObject
-(NSArray *)setupTiles;
-(LLCharacter *)setupCharacter;
-(LLBoss *)setupBoss;

@end
