//
//  LLFactory.m
//  Pyrates
//
//  Created by Len on 10/16/13.
//  Copyright (c) 2013 LL. All rights reserved.
//

#import "LLFactory.h"
#import "LLTile.h"

@implementation LLFactory
-(NSArray *)setupTiles
{
    LLTile *tile1 = [[LLTile alloc] init];
    LLTile *tile2 = [[LLTile alloc] init];
    LLTile *tile3 = [[LLTile alloc] init];
    LLTile *tile4 = [[LLTile alloc] init];
    LLTile *tile5 = [[LLTile alloc] init];
    LLTile *tile6 = [[LLTile alloc] init];
    LLTile *tile7 = [[LLTile alloc] init];
    LLTile *tile8 = [[LLTile alloc] init];
    LLTile *tile9 = [[LLTile alloc] init];
    LLTile *tile10 = [[LLTile alloc] init];
    LLTile *tile11 = [[LLTile alloc] init];
    LLTile *tile12 = [[LLTile alloc] init];
    
    tile1.storyText = @"1: Captain, we need a fearless leader such as yourself to undertake a mission to take over the world.  Grab a sword and let's get going.";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.actionButtonName = @"Take the sword";
    
    LLWeapon *shortswordWeapon = [[LLWeapon alloc] init];
    shortswordWeapon.name = @"Short Sword";
    shortswordWeapon.damage = 12;
    tile1.weapon = shortswordWeapon;
    
    tile2.storyText = @"2: You have come across an armory.  Would you like to upgrade your armor to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile2.actionButtonName = @"Take steel armor";
    LLArmor *steelArmor = [[LLArmor alloc] init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 7;
    tile2.armor = steelArmor;
    
    tile3.storyText = @"3: A mysterious dock appears on the horizon.  Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.actionButtonName = @"Stop at the Dock";
    tile3.healthEffect = 17;

    tile4.storyText = @"4: You have found a parrot can be used in your armor slot!  Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile4.actionButtonName = @"Adopt Parrot";
    LLArmor *parrotArmor = [[LLArmor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot Armor";
    tile4.armor = parrotArmor;
    
    
    tile5.storyText = @"5: You have stumbled upon a cache of pirate weapons.  Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile5.actionButtonName = @"Take pistol";
    LLWeapon *pistolWeapon = [[LLWeapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 19;
    tile5.weapon = pistolWeapon;
    
    tile6.storyText = @"6: You have been captured by pirates and are ordered to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.actionButtonName = @"Show no fear!";
    tile6.healthEffect = -22;

    tile7.storyText = @"7: You sight a pirate battle off the coast";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.actionButtonName = @"Fight those scum!";
    tile7.healthEffect = -15;
    
    tile8.storyText = @"8: The legend of the deep, the mighty kraken appears";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.actionButtonName = @"Abandon Ship";
    tile8.healthEffect = -46;
    
    tile9.storyText = @"9: You stumble upon a hidden cave of pirate treasurer";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.actionButtonName = @"Take Treasurer";
    tile9.healthEffect = 20;
    
    tile10.storyText = @"10: A group of pirates attempts to board your ship";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.actionButtonName = @"Repel the invaders";
    tile10.healthEffect = 15;
    
    tile11.storyText = @"11: In the deep of the sea many things live and many things can be found.  Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.actionButtonName = @"Swim deeper";
    tile11.healthEffect = -7;
    
    tile12.storyText = @"12: Your final faceoff with the fearsome pirate boss";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.actionButtonName = @"Fight!";
    tile12.healthEffect = -15;

    NSArray *column1Tiles = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    NSArray *column2Tiles = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    NSArray *column3Tiles = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    NSArray *column4Tiles = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *factoryTilesArray = [[NSArray alloc] initWithObjects:column1Tiles, column2Tiles, column3Tiles, column4Tiles, nil];
    
    return factoryTilesArray;
}

-(LLCharacter *)setupCharacter
{
    LLArmor *cloakArmor = [[LLArmor alloc] init];
    cloakArmor.name = @"Cloak";
    cloakArmor.health = 2;
    
    LLWeapon *fistsWeapon = [[LLWeapon alloc] init];
    fistsWeapon.name = @"Fists";
    fistsWeapon.damage = 2;
    
    LLCharacter *character = [[LLCharacter alloc] init];
    character.health = 100;
    character.armor = cloakArmor;
    character.weapon = fistsWeapon;
    
    return character;
}

-(LLBoss *)setupBoss
{
    LLBoss *boss = [[LLBoss alloc] init];
    boss.health = 65;
    return boss;
}

@end
