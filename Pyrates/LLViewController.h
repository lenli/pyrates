//
//  LLViewController.h
//  Pyrates
//
//  Created by Len on 10/16/13.
//  Copyright (c) 2013 LL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLCharacter.h"
#import "LLBoss.h"

@interface LLViewController : UIViewController

// iVars
@property (nonatomic) CGPoint currentPosition;
@property (nonatomic, strong) NSArray *tiles;
@property (nonatomic, strong) LLCharacter *character;
@property (nonatomic, strong) LLBoss *boss;

// IBOutlets
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UIButton *northLabel;
@property (strong, nonatomic) IBOutlet UIButton *westLabel;
@property (strong, nonatomic) IBOutlet UIButton *eastLabel;
@property (strong, nonatomic) IBOutlet UIButton *southLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UILabel *positionLabel;

// IBActions
- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;

@end
