//
//  Units.h
//  CavernWars
//
//  Created by iD Student on 7/11/14.
//  Copyright (c) 2014 iD Student. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Units : SKSpriteNode

@property (nonatomic, assign) float YVelocity;
@property (nonatomic, assign) float XVelocity;
@property (nonatomic, assign) float unitspeed;
@property (nonatomic, assign) int damage;
@property (nonatomic, assign) int health;
@property (nonatomic, assign) int owner;        //Player = 0, AI = 1
@property (nonatomic, assign) int type;
    // 1 = barrier
    // 2 = saber
    // 3 = healer
    // 4 = bomber

@end
