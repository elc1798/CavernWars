//
//  MyScene.m
//  asteroids
//
//  Created by iD Student on 7/9/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        [self createDPad];
            
        self.playerSprite = [Spaceship spriteNodeWithImageNamed:@"Spaceship"];
        [self.playerSprite setScale:0.15];
        [self.playerSprite setPosition:
        CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        [self addChild:self.playerSprite];
        self.asteroids = [[NSMutableArray alloc] init];
        [self spawnAsteroid];
    }
    return self;
}

-(void)spawnAsteroid {
    Asteroid *asteroid = [Asteroid spriteNodeWithImageNamed:@"Asteroid"];
    
    float randomXStartingPosition = (arc4random() % 280) + 50;
//    [asteroid setPosition:CGPointMake(CGRectGetMidX(self.frame), 400)];
    [asteroid setPosition:CGPointMake(randomXStartingPosition , 400)];
    float randomY = (-(arc4random() % 20)/10.0f);
    [self.asteroids addObject:asteroid];
    [self addChild:asteroid];
    [asteroid setYVelocity:randomY];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if (CGRectContainsPoint(self.upButtonSprite.frame, location)) {
            [self.playerSprite setYVelocity:1];
        }
        
        if (CGRectContainsPoint(self.downButtonSprite.frame, location)) {
            [self.playerSprite setYVelocity:-1];
        }
        
        if (CGRectContainsPoint(self.leftButtonSprite.frame, location)) {
            [self.playerSprite setXVelocity:-1];
        }
        
        if (CGRectContainsPoint(self.rightButtonSprite.frame, location)) {
            [self.playerSprite setXVelocity:1];
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if (CGRectContainsPoint(self.upButtonSprite.frame, location)) {
            [self.playerSprite setYVelocity:1];
        }
        if (CGRectContainsPoint(self.downButtonSprite.frame, location)) {
            [self.playerSprite setYVelocity:-1];
        }
        if(CGRectContainsPoint(self.leftButtonSprite.frame, location)) {
            [self.playerSprite setXVelocity:-1];
        }
        if(CGRectContainsPoint(self.rightButtonSprite.frame, location)) {
            [self.playerSprite setXVelocity:1];
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] == 1) {
        [self.playerSprite setXVelocity:0];
        [self.playerSprite setYVelocity:0];
    }
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if (CGRectContainsPoint(self.upButtonSprite.frame, location) ||
            CGRectContainsPoint(self.downButtonSprite.frame, location)){
            
            [self.playerSprite setYVelocity:0];
        }
        if (CGRectContainsPoint(self.leftButtonSprite.frame, location) ||
            CGRectContainsPoint(self.rightButtonSprite.frame, location)){
            
            [self.playerSprite setXVelocity:0];
        }
    }
}

-(void)createDPad {
    self.upButtonSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Arrow"];
    self.downButtonSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Arrow"];
    self.leftButtonSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Arrow"];
    self.rightButtonSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Arrow"];
    
    [self addChild:self.upButtonSprite];
    [self addChild:self.downButtonSprite];
    [self addChild:self.leftButtonSprite];
    [self addChild:self.rightButtonSprite];
    
    [self.upButtonSprite setPosition:CGPointMake(60,110)];
    [self.downButtonSprite setPosition:CGPointMake(60,40)];
    [self.leftButtonSprite setPosition:CGPointMake(25,75)];
    [self.rightButtonSprite setPosition:CGPointMake(95,75)];
    [self.downButtonSprite setZRotation:M_PI];
    [self.leftButtonSprite setZRotation:M_PI_2];
    [self.rightButtonSprite setZRotation:-M_PI_2];
}

-(void)update:(CFTimeInterval)currentTime {
    [self.playerSprite setPosition:CGPointMake(self.playerSprite.position.x + self.playerSprite.XVelocity,
                                               self.playerSprite.position.y + self.playerSprite.YVelocity)];
    timer = [NSTimer timerWithTimeInterval:2
                                    target:self
                                  selector:@selector(spawnAsteroid)
                                  userInfo:nil
                                   repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    for (Asteroid *asteroid in self.asteroids) {
        [asteroid setPosition:CGPointMake(asteroid.position.x,
                                          asteroid.position.y + asteroid.YVelocity)];
    }
    [self checkCollisions];
}

-(void)checkCollisions {
    for (Asteroid *asteroid in self.asteroids) {
        if (CGRectIntersectsRect(asteroid.frame, self.playerSprite.frame)) {
            [self removeAllChildren];
            [timer invalidate];
            
            SKLabelNode *youLoseLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
            [youLoseLabel setText:@"You lose :("];
            [youLoseLabel setPosition:CGPointMake(CGRectGetMidX(self.frame),
                                                  CGRectGetMidY(self.frame))];
            [self addChild:youLoseLabel];
        }
    }
}

//- (void)playJetSound {
//    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"jet_sound" ofType:@"mp3"];
//    SystemSoundID soundID;
//    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath],
//                                     &soundID);
//    AudioServicesPlaySystemSound (soundID);
    
//}

@end
