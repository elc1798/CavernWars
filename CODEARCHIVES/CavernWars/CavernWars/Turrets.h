//
//  Turrets.h
//  CavernWars
//
//  Created by iD Student on 7/11/14.
//  Copyright (c) 2014 iD Student. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Turrets : SKSpriteNode

@property (nonatomic, assign) int damage;
@property (nonatomic, assign) int ammo;
@property (nonatomic, assign) int range;
@property (nonatomic, assign) int firerate;
@property (nonatomic, assign) int type;
    // 1 = RF
    // 2 = Burst

@end
