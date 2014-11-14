//
//  MyScene.h
//  CavernWars
//

//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Units.h"
#import "Turrets.h"

@interface MyScene : SKScene

{
    int barrierlevel;
    int saberlevel;
    int healerlevel;
    int bomberlevel;
    int AIhealth;
    int playerhealth;
    int playermoney;
    int AImoney;
    NSTimer *timer;
    SKLabelNode *playernexus;
    SKLabelNode *AInexus;
    SKLabelNode *playerfunds;
    
    //Debugger (Developer only)
    SKLabelNode *coordinateLabel;
}

@property (nonatomic , strong) NSMutableArray *currUnits;
@property (nonatomic , strong) NSMutableArray *currTurrets;
@property (nonatomic , strong) NSMutableArray *enemyUnits;
@property (nonatomic , strong) NSMutableArray *enemyTurrets;

//Spawn Unit Buttons

@property (nonatomic, strong) SKSpriteNode *spawnBarrierSprite;
@property (nonatomic, strong) SKSpriteNode *spawnSaberSprite;
@property (nonatomic, strong) SKSpriteNode *spawnHealerSprite;
@property (nonatomic, strong) SKSpriteNode *spawnBomberSprite;

//Spawn Turret Buttons

@property (nonatomic, strong) SKSpriteNode *spawnRFTurretSprite;
@property (nonatomic, strong) SKSpriteNode *spawnBTurretSprite;

//Debugger (Developer Only)

//@property (nonatomic, strong) SKLabelNode *coordinateLabel;

@end
