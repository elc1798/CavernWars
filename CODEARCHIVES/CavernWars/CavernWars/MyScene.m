//
//  MyScene.m
//  CavernWars
//
//  Created by iD Student on 7/11/14.
//  Copyright (c) 2014 Subliminalmau5. All rights reserved.
//

#import "MyScene.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        [self generateMap];
    }
    barrierlevel = 0;
    saberlevel = 0;
    healerlevel = 0;
    bomberlevel = 0;
    AIhealth = 500;
    AImoney = 750;
    playerhealth = 500;
    playermoney = 750;
    [self playThemeSong];
    [self buildbuttons];
    [self buildhealthbars];
    self.currUnits = [[NSMutableArray alloc]init];
    self.currTurrets = [[NSMutableArray alloc]init];
    self.enemyUnits = [[NSMutableArray alloc]init];
    self.enemyTurrets = [[NSMutableArray alloc]init];
    return self;
}

-(void)generateMap{
    SKSpriteNode *bgImage = [SKSpriteNode spriteNodeWithImageNamed:@"cavernwarsbkgrd"];
    bgImage.size = CGSizeMake(self.size.width - 50 , self.size.height - 50);
    bgImage.position = CGPointMake(CGRectGetMidX(self.frame) , CGRectGetMidY(self.frame) - 35);
    [self addChild:bgImage];
}

-(void)buildbuttons{
    //Use unit icons for buttons
    self.spawnBarrierSprite = [SKSpriteNode spriteNodeWithImageNamed:@"cavernwarsshield"];
    self.spawnSaberSprite = [SKSpriteNode spriteNodeWithImageNamed:@"cavernwarssabre"];
    //No visuals yet for the following:
    self.spawnHealerSprite = [SKSpriteNode spriteNodeWithImageNamed:@"cavernwarshealer"];
    self.spawnBomberSprite = [SKSpriteNode spriteNodeWithImageNamed:@"cavernwarsbomber"];
    self.spawnRFTurretSprite = [SKSpriteNode spriteNodeWithImageNamed:@"cavernwarsrfturret"];
    self.spawnBTurretSprite = [SKSpriteNode spriteNodeWithImageNamed:@"cavernwarsbturret"];
    
    //Size Correction
    
    self.spawnBomberSprite.size = CGSizeMake(15 , 15);
    self.spawnSaberSprite.size = CGSizeMake(15 , 15);
    self.spawnBarrierSprite.size = CGSizeMake(15 , 15);
    self.spawnHealerSprite.size = CGSizeMake(15 , 15);
    self.spawnRFTurretSprite.size = CGSizeMake(15 , 15);
    self.spawnBTurretSprite.size = CGSizeMake(15 , 15);
    
    //Position Setting
    
    self.spawnBarrierSprite.position = CGPointMake(32 , 435);
    self.spawnSaberSprite.position = CGPointMake(64 , 435);
    self.spawnHealerSprite.position = CGPointMake(96 , 435);
    self.spawnBomberSprite.position = CGPointMake(128 , 435);
    self.spawnBTurretSprite.position = CGPointMake(288 , 435);
    self.spawnRFTurretSprite.position = CGPointMake(256 , 435);
    
    [self addChild:self.spawnBarrierSprite];
    [self addChild:self.spawnSaberSprite];
    [self addChild:self.spawnHealerSprite];
    [self addChild:self.spawnBomberSprite];
    [self addChild:self.spawnRFTurretSprite];
    [self addChild:self.spawnBTurretSprite];
}

-(void)buildhealthbars{
    playernexus = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    [playernexus setText:[NSString stringWithFormat:@"You: %d" , playerhealth]];
    [playernexus setFontSize:8];
    [playernexus setPosition:CGPointMake(52 , 445)];
    [self addChild:playernexus];
    AInexus = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    [AInexus setText:[NSString stringWithFormat:@"Computer: %d" , AIhealth]];
    [AInexus setFontSize:8];
    [AInexus setPosition:CGPointMake(224 , 445)];
    [self addChild:AInexus];
    playerfunds = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    [playerfunds setText:[NSString stringWithFormat:@"$$: %d" , playermoney]];
    [playerfunds setFontSize:8];
    [playerfunds setPosition:CGPointMake(104 , 445)];
    [self addChild:playerfunds];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if (CGRectContainsPoint(self.spawnBarrierSprite.frame , location)) {
            [self spawnBarriers];
        }
        if (CGRectContainsPoint(self.spawnSaberSprite.frame , location)) {
            [self spawnSabers];
        }
        if (CGRectContainsPoint(self.spawnHealerSprite.frame , location)) {
            [self spawnHealers];
        }
        if (CGRectContainsPoint(self.spawnBomberSprite.frame , location)) {
            [self spawnBombers];
        }
        if (CGRectContainsPoint(self.spawnRFTurretSprite.frame , location)) {
            [self spawnRFTurret];
        }
        if (CGRectContainsPoint(self.spawnBTurretSprite.frame , location)) {
            [self spawnBTurret];
        }
        
        //FOR DEBUGGING:
        
//        [self displayCoordinates:location];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)playThemeSong {
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"gloriousmorning2" ofType:@"mp3"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath],
                                     &soundID);
    AudioServicesPlaySystemSound (soundID);
}

-(void)unitMovementAlgorithm{
    for (Units *unit in self.currUnits) {
        CGPoint unitcoor;
        unitcoor = CGPointMake(unit.position.x , unit.position.y);
        if (unit.owner == 0) {
            if (unitcoor.y <= 375 && unitcoor.y > 275) {
                if (unitcoor.x >= 250) {
                    [unit setPosition:CGPointMake(unit.position.x , unit.position.y - 1)];
                }
                else {
                    [unit setPosition:CGPointMake(unit.position.x + 1 , unit.position.y)];
                }
            }
            if (unitcoor.y <= 275 && unitcoor.y > 195) {
                if (unitcoor.x <= 72) {
                    [unit setPosition:CGPointMake(unit.position.x , unit.position.y - 1)];
                }
                else {
                    [unit setPosition:CGPointMake(unit.position.x - 1 , unit.position.y)];
                }
            }
            if (unitcoor.y <= 195 && unitcoor.y > 110) {
                if (unitcoor.x >= 250) {
                    [unit setPosition:CGPointMake(unit.position.x , unit.position.y - 1)];
                }
                else {
                    [unit setPosition:CGPointMake(unit.position.x + 1 , unit.position.y)];
                }
            }
            if (unitcoor.y <= 110 && unitcoor.y > 23) {
                if (unitcoor.x <= 72) {
                    [unit setPosition:CGPointMake(unit.position.x , unit.position.y - 1)];
                }
                else {
                    [unit setPosition:CGPointMake(unit.position.x - 1 , unit.position.y)];
                }
            }
            if (unitcoor.y <= 23) {
                if (unitcoor.x >= 240) {
                    [unit setPosition:CGPointMake(unit.position.x , unit.position.y)];
                    AIhealth = AIhealth - unit.damage;
                }
                else {
                    [unit setPosition:CGPointMake(unit.position.x + 1 , unit.position.y)];
                }
            }
        }
    }
}

-(void)enemyMovementAlg {
    for (Units *unit in self.enemyUnits) {
        CGPoint unitcoor;
        unitcoor = CGPointMake(unit.position.x , unit.position.y);
        if (unitcoor.y >= 22 && unitcoor.y < 110) {
            if (unitcoor.x <= 72) {
                [unit setPosition:CGPointMake(unit.position.x , unit.position.y + 1)];
            }
            else {
                [unit setPosition:CGPointMake(unit.position.x - 1 , unit.position.y)];
            }
        }
        if (unitcoor.y >= 110 && unitcoor.y < 195) {
            if (unitcoor.x >= 250) {
                [unit setPosition:CGPointMake(unit.position.x , unit.position.y + 1)];
            }
            else {
                [unit setPosition:CGPointMake(unit.position.x + 1 , unit.position.y)];
            }
        }
        if (unitcoor.y >= 195 && unitcoor.y < 275) {
            if (unitcoor.x <= 72) {
                [unit setPosition:CGPointMake(unit.position.x , unit.position.y + 1)];
            }
            else {
                [unit setPosition:CGPointMake(unit.position.x - 1 , unit.position.y)];
            }
        }
        if (unitcoor.y >= 275 && unitcoor.y < 375) {
            if (unitcoor.x >= 250) {
                [unit setPosition:CGPointMake(unit.position.x , unit.position.y + 1)];
            }
            else {
                [unit setPosition:CGPointMake(unit.position.x + 1 , unit.position.y)];
            }
        }
        if (unitcoor.y >= 375) {
            if (unitcoor.x <= 72) {
                [unit setPosition:CGPointMake(unit.position.x , unit.position.y)];
                playerhealth = playerhealth - unit.damage;
            }
            else {
                [unit setPosition:CGPointMake(unit.position.x - 1 , unit.position.y)];
            }
        }
    }
}

-(void)unitBounceBack:(Units*)poof{
    CGPoint unitcoor;
    unitcoor = CGPointMake(poof.position.x , poof.position.y);
    if (poof.owner == 1) {
        if (unitcoor.y <= 375 && unitcoor.y > 275) {
            if (unitcoor.x >= 250) {
                [poof setPosition:CGPointMake(poof.position.x , poof.position.y - 1)];
            }
            else {
                [poof setPosition:CGPointMake(poof.position.x + 1 , poof.position.y)];
            }
        }
        if (unitcoor.y <= 275 && unitcoor.y > 195) {
            if (unitcoor.x <= 72) {
                [poof setPosition:CGPointMake(poof.position.x , poof.position.y - 1)];
            }
            else {
                [poof setPosition:CGPointMake(poof.position.x - 1 , poof.position.y)];
            }
        }
        if (unitcoor.y <= 195 && unitcoor.y > 110) {
            if (unitcoor.x >= 250) {
                [poof setPosition:CGPointMake(poof.position.x , poof.position.y - 1)];
            }
            else {
                [poof setPosition:CGPointMake(poof.position.x + 1 , poof.position.y)];
            }
        }
        if (unitcoor.y <= 110 && unitcoor.y > 23) {
            if (unitcoor.x <= 72) {
                [poof setPosition:CGPointMake(poof.position.x , poof.position.y - 1)];
            }
            else {
                [poof setPosition:CGPointMake(poof.position.x - 1 , poof.position.y)];
            }
        }
        if (unitcoor.y <= 23) {
            if (unitcoor.x >= 240) {
                [poof setPosition:CGPointMake(poof.position.x , poof.position.y)];
            }
            else {
                [poof setPosition:CGPointMake(poof.position.x + 1 , poof.position.y)];
            }
        }
    }
    else {
        if (unitcoor.y <= 375 && unitcoor.y > 275) {
            if (unitcoor.x >= 250) {
                [poof setPosition:CGPointMake(poof.position.x , poof.position.y + 1)];
            }
            else {
                [poof setPosition:CGPointMake(poof.position.x - 1 , poof.position.y)];
            }
        }
        if (unitcoor.y <= 275 && unitcoor.y > 195) {
            if (unitcoor.x <= 72) {
                [poof setPosition:CGPointMake(poof.position.x , poof.position.y + 1)];
            }
            else {
                [poof setPosition:CGPointMake(poof.position.x + 1 , poof.position.y)];
            }
        }
        if (unitcoor.y <= 195 && unitcoor.y > 110) {
            if (unitcoor.x >= 250) {
                [poof setPosition:CGPointMake(poof.position.x , poof.position.y + 1)];
            }
            else {
                [poof setPosition:CGPointMake(poof.position.x - 1 , poof.position.y)];
            }
        }
        if (unitcoor.y <= 110 && unitcoor.y > 23) {
            if (unitcoor.x <= 72) {
                [poof setPosition:CGPointMake(poof.position.x , poof.position.y + 1)];
            }
            else {
                [poof setPosition:CGPointMake(poof.position.x + 1 , poof.position.y)];
            }
        }
        if (unitcoor.y <= 23) {
            if (unitcoor.x >= 240) {
                [poof setPosition:CGPointMake(poof.position.x , poof.position.y)];
            }
            else {
                [poof setPosition:CGPointMake(poof.position.x - 1 , poof.position.y)];
            }
        }
    }
}

-(void)spawnBarriers{
    if (playermoney < 200 || [self.currUnits count] > 14)
    {
        //Player can't buy anything so do nothing
    }
    else
    {
        Units *barrier = [Units spriteNodeWithImageNamed:@"cavernwarsshield"];
        [barrier setDamage:(barrierlevel * 2)];
        [barrier setHealth:((barrierlevel / 2) + 210)];
        [barrier setOwner:0];
        [barrier setUnitspeed:1];
        [barrier setPosition:CGPointMake(74 , 375)];
        [barrier setType:1];
        barrier.size = CGSizeMake(30 , 30);
        playermoney = playermoney - 200;
        [self.currUnits addObject:barrier];
        [self addChild:barrier];
    }
}

-(void)spawnSabers{
    if (playermoney < 250 || [self.currUnits count] > 14)
    {
        //Insufficient funds
    }
    else
    {
        Units *saber = [Units spriteNodeWithImageNamed:@"cavernwarssabre"];
        [saber setDamage:(saberlevel * 5)];
        [saber setHealth:((saberlevel * 2) + 100)];
        [saber setOwner:0];
        [saber setUnitspeed:1.2];
        [saber setType:2];
        [saber setPosition:CGPointMake(74 , 375)];
        saber.size = CGSizeMake(30 , 30);
        playermoney = playermoney - 250;
        [self.currUnits addObject:saber];
        [self addChild:saber];
    }
}

-(void)spawnHealers{
    if (playermoney < 225 || [self.currUnits count] > 14)
    {
        //Insufficient funds
    }
    else
    {
        Units *healer = [Units spriteNodeWithImageNamed:@"cavernwarshealer"];
        [healer setDamage:(-50 - healerlevel)];
        [healer setHealth:100];
        [healer setOwner:0];
        [healer setUnitspeed:1.1];
        [healer setType:3];
        [healer setPosition:CGPointMake(74 , 375)];
        healer.size = CGSizeMake(30 , 30);
        playermoney = playermoney - 225;
        [self.currUnits addObject:healer];
        [self addChild:healer];
    }
}

-(void)spawnBombers{
    if (playermoney < 300 || [self.currUnits count] > 14)
    {
        //Insufficient funds
    }
    else
    {
        Units *bombers = [Units spriteNodeWithImageNamed:@"cavernwarsbomber"];
        [bombers setDamage:(5000 * bomberlevel)];
        [bombers setHealth:1];
        [bombers setOwner:0];
        [bombers setUnitspeed:(1.4 + (bomberlevel / 10))];
        [bombers setPosition:CGPointMake(74 , 375)];
        [bombers setType:4];
        bombers.size = CGSizeMake(30 , 30);
        playermoney = playermoney - 300;
        [self.currUnits addObject:bombers];
        [self addChild:bombers];
    }
}

-(void)moveBarriers{
    for (Units *barriers in self.currUnits) {
        if (barriers.type == 1) {
            if ([self.enemyUnits count] > 0) {
                for (Units *buffer in self.enemyUnits){
                    if (CGRectIntersectsRect(barriers.frame , buffer.frame)) {
                        [self unitBounceBack:barriers];
                        [self unitBounceBack:buffer];
                        barriers.health = barriers.health - buffer.damage;
                        buffer.health = buffer.health - barriers.damage;
                        if (barriers.position.x <= 240 && barriers.position.y == 23) {
                            AIhealth = AIhealth - barriers.damage;
                        }
                    }
                }
            }
            else {
                //Do nothing
            }
        }
    }
    for (Units *barriers in self.enemyUnits) {
        if (barriers.type == 1) {
            if ([self.currUnits count] > 0) {
                for (Units *buffer in self.currUnits) {
                    if (CGRectIntersectsRect(barriers.frame , buffer.frame)) {
                        [self unitBounceBack:barriers];
                        [self unitBounceBack:buffer];
                        barriers.health = barriers.health - buffer.damage;
                        buffer.health = buffer.health - barriers.damage;
                        if (barriers.position.x >= 72 && barriers.position.y == 375) {
                            playerhealth = playerhealth - barriers.damage;
                        }
                    }
                }
            }
            else {
                //Do nothing
            }
        }
    }
}

-(void)moveSabers{
    for (Units *sword in self.currUnits) {
        if (sword.type == 2) {
            if ([self.enemyUnits count] > 0) {
                for (Units *buffer in self.enemyUnits){
                    if (CGRectIntersectsRect(sword.frame , buffer.frame)) {
                        [self unitBounceBack:sword];
                        [self unitBounceBack:buffer];
                        sword.health = sword.health - buffer.damage;
                        buffer.health = buffer.health - sword.damage;
                        if (sword.position.x <= 240 && sword.position.y == 23) {
                            AIhealth = AIhealth - sword.damage;
                        }
                    }
                }
            }
            else {
                //Do nothing
            }
        }
    }
    for (Units *sword in self.enemyUnits) {
        if (sword.type == 2) {
            if ([self.currUnits count] > 0) {
                for (Units *buffer in self.currUnits) {
                if (CGRectIntersectsRect(sword.frame , buffer.frame)) {
                    [self unitBounceBack:sword];
                    [self unitBounceBack:buffer];
                    sword.health = sword.health - buffer.damage;
                    buffer.health = buffer.health - sword.damage;
                    if (sword.position.x >= 72 && sword.position.y == 375) {
                        playerhealth = playerhealth - sword.damage;
                    }
                }
                }
            }
            else {
                //Do nothing
            }
        }
    }
}

-(void)moveHealers{
    //Too lazy to rename the variable. concept is the same
    for (Units *sword in self.currUnits) {
        if (sword.type == 3) {
            if ([self.currUnits count] > 0) {
                for (Units *buffer in self.currUnits) {
                if (CGRectIntersectsRect(sword.frame , buffer.frame)) {
                    [self unitBounceBack:sword];
                    [self unitBounceBack:buffer];
                    sword.health = sword.health - buffer.damage;
                    buffer.health = buffer.health - sword.damage;
                }
                }
            }
            else {
                //Do nothing
            }
        }
    }
    for (Units *sword in self.enemyUnits) {
        if (sword.type == 3) {
            if ([self.enemyUnits count] > 0) {
                for (Units *buffer in self.enemyUnits) {
                if (CGRectIntersectsRect(sword.frame , buffer.frame)) {
                    [self unitBounceBack:sword];
                    [self unitBounceBack:buffer];
                    sword.health = sword.health - buffer.damage;
                    buffer.health = buffer.health - sword.damage;
                }
                }
            }
            else {
                //Do nothing
            }
        }
    }
}

-(void)moveBombers{
    for (Units *kami in self.currUnits) {
        if (kami.type == 4) {
            if ([self.enemyUnits count] > 0) {
                for (Units *buffer in self.enemyUnits) {
                if (CGRectIntersectsRect(kami.frame , buffer.frame)) {
                    kami.health = 0;
                    buffer.health = 0;
                }
                }
            }
            else {
                //Do nothing
            }
        }
    }
    for (Units *kami in self.enemyUnits) {
        if (kami.type == 4) {
            if ([self.currUnits count] > 0) {
                for (Units *buffer in self.currUnits) {
                if (CGRectIntersectsRect(kami.frame , buffer.frame)) {
                    kami.health = 0;
                    buffer.health = 0;
                }
                }
            }
            else {
                //Do nothing
            }
        }
    }
}

-(void)spawnRFTurret{
    if (playermoney < 200 || [self.currTurrets count] > 2)
    {
        //Insufficient funds
    }
    else
    {
        Turrets *rf = [Turrets spriteNodeWithImageNamed:@"cavernwarsrfturret"];
        [rf setDamage:2];
        [rf setAmmo:100];
        [rf setRange:25]; //Range is via coordinates in the iPhone Coordinate System
        [rf setFirerate:1]; //Fires once a frame
        [rf setPosition:CGPointMake(76 , 380)];
        [rf setType:1];
        playermoney = playermoney - 200;
        [self.currTurrets addObject:rf];
        [self addChild:rf];
    }
}

-(void)spawnBTurret{
    if (playermoney < 200 || [self.currTurrets count] > 2)
    {
        //Insufficient funds
    }
    else
    {
        Turrets *B = [Turrets spriteNodeWithImageNamed:@"cavernwarsbturret"];
        [B setDamage:20];
        [B setAmmo:10];
        [B setRange:25];
        [B setFirerate:2]; //Fires once every 2 frames
        [B setPosition:CGPointMake(76 , 380)];
        [B setType:2];
        playermoney = playermoney - 200;
        [self.currTurrets addObject:B];
        [self addChild:B];
    }
}

-(void)RFTurretShoot{
    
}

-(void)BTurretShoot{
    
}

// AI

-(void)AIMove {
    if (AImoney > 500) {
        if ([self.enemyUnits count] < 15) {
            int generate = random() % 8;
            switch (generate) {
                case 0: {
                    Units *barrier = [Units spriteNodeWithImageNamed:@"cavernwarsshield"];
                    [barrier setDamage:(barrierlevel * 1.2)];
                    [barrier setHealth:((barrierlevel / 4) + 210)];
                    [barrier setOwner:1];
                    [barrier setUnitspeed:1];
                    [barrier setPosition:CGPointMake(250 , 23)];
                    [barrier setType:1];
                    barrier.size = CGSizeMake(30 , 30);
                    AImoney = AImoney - 200;
                    [self.enemyUnits addObject:barrier];
                    [self addChild:barrier];
                    break;
                }
                case 1: {
                    Units *saber = [Units spriteNodeWithImageNamed:@"cavernwarssabre"];
                    [saber setDamage:(saberlevel * 3.5)];
                    [saber setHealth:((saberlevel * 1.2) + 100)];
                    [saber setOwner:1];
                    [saber setUnitspeed:1.2];
                    [saber setType:2];
                    [saber setPosition:CGPointMake(250 , 23)];
                    saber.size = CGSizeMake(30 , 30);
                    AImoney = AImoney - 250;
                    [self.enemyUnits addObject:saber];
                    [self addChild:saber];
                    break;
                }
                case 2: {
                    Units *healer = [Units spriteNodeWithImageNamed:@"cavernwarshealer"];
                    [healer setDamage:(-50 - healerlevel / 2)];
                    [healer setHealth:100];
                    [healer setOwner:1];
                    [healer setUnitspeed:1.1];
                    [healer setType:3];
                    [healer setPosition:CGPointMake(250 , 23)];
                    healer.size = CGSizeMake(30 , 30);
                    AImoney = AImoney - 225;
                    [self.enemyUnits addObject:healer];
                    [self addChild:healer];
                    break;
                }
                case 3: {
                    Units *bombers = [Units spriteNodeWithImageNamed:@"cavernwarsbomber"];
                    [bombers setDamage:5000];
                    [bombers setHealth:1];
                    [bombers setOwner:1];
                    [bombers setUnitspeed:(1.4 + (bomberlevel / 10))];
                    [bombers setPosition:CGPointMake(250 , 23)];
                    bombers.size = CGSizeMake(30,30);
                    [bombers setType:4];
                    AImoney = AImoney - 300;
                    [self.enemyUnits addObject:bombers];
                    [self addChild:bombers];
                    break;
                }
            }
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    [self enemyMovementAlg];
    [self AIMove];
    AImoney = AImoney + 1;
    [self unitMovementAlgorithm];
    [self moveSabers];
    [self moveBombers];
    [self moveHealers];
    [self moveBarriers];
    [self RFTurretShoot];
    [self BTurretShoot];
    [playernexus setText:[NSString stringWithFormat:@"You: %d" , playerhealth]];
    [AInexus setText:[NSString stringWithFormat:@"Computer: %d" , AIhealth]];
    [playerfunds setText:[NSString stringWithFormat:@"$$: %d" , playermoney]];
    if (playerhealth <= 0)
    {
        [self removeAllChildren];
        SKLabelNode *youLoseLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        [youLoseLabel setText:@"You lose :("];
        [youLoseLabel setPosition:CGPointMake(CGRectGetMidX(self.frame),
                                              CGRectGetMidY(self.frame))];
        [self addChild:youLoseLabel];
    }
    if (AIhealth <= 0)
    {
        [self removeAllChildren];
        SKLabelNode *youWinLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        [youWinLabel setText:@"You win :D"];
        [youWinLabel setPosition:CGPointMake(CGRectGetMidX(self.frame),
                                              CGRectGetMidY(self.frame))];
        [self addChild:youWinLabel];
    }
    for (Units *unit in self.currUnits) {
        if (unit.health <= 0) {
            [unit removeFromParent];
            [self.currUnits removeObject:unit];
            AImoney = AImoney + 100;
        }
    }
    for (Units *unit in self.enemyUnits) {
        if (unit.health <= 0) {
            [unit removeFromParent];
            [self.enemyUnits removeObject:unit];
            playermoney = playermoney + 125;
        }
    }
}

//Debugging and Coordinate Searching (Developer Only)

-(void)displayCoordinates:(CGPoint)location {
    [self setupDebug];
    SKSpriteNode *filler = [SKSpriteNode spriteNodeWithImageNamed:@"cavernwarssabre"];
    filler.position = location;
    CGFloat positionx = filler.position.x;
    CGFloat positiony = filler.position.y;
    [coordinateLabel setText:[NSString stringWithFormat:@"%f , %f" , positionx , positiony]];
}

-(void)setupDebug {
    [self removeAllChildren];
    [self generateMap];
    coordinateLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    [coordinateLabel setText:[NSString stringWithFormat:@"%f , %f" , 0.00 , 0.00]];
    [coordinateLabel setFontSize:12];
    [coordinateLabel setPosition:CGPointMake(CGRectGetMidX(self.frame) , CGRectGetMidY(self.frame))];
    [self addChild:coordinateLabel];
}

@end
