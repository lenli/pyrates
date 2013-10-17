//
//  LLTile.h
//  Pyrates
//
//  Created by Len on 10/16/13.
//  Copyright (c) 2013 LL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLWeapon.h"
#import "LLArmor.h"

@interface LLTile : NSObject
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) NSString *storyText;
@property (nonatomic, strong) NSString *actionButtonName;
@property (nonatomic, strong) LLWeapon *weapon;
@property (nonatomic, strong) LLArmor *armor;
@property (nonatomic) int healthEffect;

@end
