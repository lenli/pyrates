//
//  LLViewController.m
//  Pyrates
//
//  Created by Len on 10/16/13.
//  Copyright (c) 2013 LL. All rights reserved.
//

#import "LLViewController.h"
#import "LLFactory.h"
#import "LLTile.h"

@interface LLViewController ()

@end

@implementation LLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    LLFactory *factory = [[LLFactory alloc] init];
    
    self.tiles = [factory setupTiles];
    self.character = [factory setupCharacter];
    self.boss = [factory setupBoss];
    
    self.currentPosition = CGPointMake(0,0);
    [self updateCharacterStats:0 forWeapons:self.character.weapon forArmor:self.character.armor];
    [self updateTile];
    [self updateButtons];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender {
    LLTile *currentTile = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    [self updateCharacterStats:currentTile.healthEffect forWeapons:currentTile.weapon forArmor:currentTile.armor];
    [self updateTile];
    
    if (currentTile.healthEffect == -15) {
        self.boss.health = self.boss.health - self.character.damage;
    };

    if (self.character.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You Died" message:@"You have died a dishonorable pirate death." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles: nil];
        [alertView show];
    } else if (self.boss.health <=0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You Won" message:@"Ahoy you scurvy pyrate.  You won!" delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        [alertView show];
    };
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y + 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    self.currentPosition = CGPointMake(self.currentPosition.x-1, self.currentPosition.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    self.currentPosition = CGPointMake(self.currentPosition.x+1, self.currentPosition.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y - 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

#pragma mark - Helper Methods

- (void)updateTile
{
    LLTile *currentTile = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    self.storyLabel.text = currentTile.storyText;
    self.backgroundImageView.image = currentTile.backgroundImage;
    [self.positionLabel setText:[NSString stringWithFormat:@"[ %.0f, %.0f ]", self.currentPosition.x, self.currentPosition.y]];
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
}

- (void)updateButtons
{
    LLTile *currentTile = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    self.westLabel.hidden = [self doesTileExist:CGPointMake(self.currentPosition.x - 1, self.currentPosition.y)];
    self.northLabel.hidden = [self doesTileExist:CGPointMake(self.currentPosition.x, self.currentPosition.y + 1)];
    self.eastLabel.hidden = [self doesTileExist:CGPointMake(self.currentPosition.x + 1, self.currentPosition.y)];
    self.southLabel.hidden = [self doesTileExist:CGPointMake(self.currentPosition.x, self.currentPosition.y - 1)];
    [self.actionButton setTitle:[NSString stringWithFormat:@"%@", currentTile.actionButtonName] forState:UIControlStateNormal];
     
}


- (BOOL)doesTileExist:(CGPoint)atPoint
{
    
    if (atPoint.x >= 0 &&
        atPoint.y >= 0 &&
        atPoint.x < [self.tiles count] &&
        atPoint.y < [[self.tiles objectAtIndex:atPoint.x] count]) {
        return NO;
    } else {
        return YES;
    }
    
};

- (void)updateCharacterStats:(int)healthEffect forWeapons:(LLWeapon *)weapon forArmor: (LLArmor *)armor
{
    [self updateCharacterStatsForHealthEffects:healthEffect];
    [self updateCharacterStatsForArmor:armor];
    [self updateCharacterStatsForWeapon:weapon];
}

- (void)updateCharacterStatsForHealthEffects:(int)healthEffect
{
    self.character.health = self.character.health + healthEffect;
}

- (void)updateCharacterStatsForArmor:(LLArmor *)armor
{
    if (armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
}

- (void)updateCharacterStatsForWeapon:(LLWeapon *)weapon
{
    if (weapon != nil) {
        self.character.damage = weapon.damage;
        self.character.weapon = weapon;
    } 
}

@end
