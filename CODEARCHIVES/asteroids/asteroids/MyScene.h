//
//  MyScene.h
//  asteroids
//

//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Spaceship.h"
#import "Asteroid.h"

@interface MyScene : SKScene
{
    NSTimer *timer;
}

@property (nonatomic, strong) SKSpriteNode *upButtonSprite;
@property (nonatomic, strong) SKSpriteNode *downButtonSprite;
@property (nonatomic, strong) SKSpriteNode *leftButtonSprite;
@property (nonatomic, strong) SKSpriteNode *rightButtonSprite;
@property (nonatomic, strong) Spaceship *playerSprite;
@property (nonatomic, strong) NSMutableArray *asteroids;

@end
