//
//  LLCharacter.h
//  Pyrates
//
//  Created by Len on 10/16/13.
//  Copyright (c) 2013 LL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLWeapon.h"
#import "LLArmor.h"

@interface LLCharacter : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) LLWeapon *weapon;
@property (nonatomic, strong) LLArmor *armor;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
