//
//  DeadBunny.m
//  Ninja
//
//  Created by Damien Locque on 2014-07-21.
//  Copyright (c) 2014 Damien Locque. All rights reserved.
//

#import "DarkCookie.h"

#import "WorldsUtil.h"

#import "CCActionInterval.h"
#import "CCAnimation.h"

@implementation DarkCookie

- (id) init
{
    if (self = [super init])
    {
        self.duration = 4.0;
        self.life = 6;
        self.currentLife = self.life;
        [self createAnimation];
        [self setPosition];
        [self customPhysics];
        [self addMovements];
        // [self initLife];
    }
    return self;
}

- (void) createAnimation
{
    [self setSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"darkcookie.png"]];
    
    CCActionRotateBy* actionSpin = [CCActionRotateBy actionWithDuration:8.0f angle:360];
    [self runAction:[CCActionRepeatForever actionWithAction:actionSpin]];
}

- (void) addMovements
{
    CCAction *actionMove = [CCActionMoveTo actionWithDuration:self.duration position:CGPointMake(-self.contentSize.width / 2, posY)];
    CCAction *actionRemove = [CCActionRemove action];
    [self runAction:[CCActionSequence actionWithArray:@[actionMove,actionRemove]]];
}

- (void) customPhysics
{
    self.physicsBody = [CCPhysicsBody bodyWithCircleOfRadius:self.contentSize.width / 2.5f andCenter:self.anchorPointInPoints];
    //self.sprite.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){CGPointZero, self.sprite.contentSize} cornerRadius:0];
    self.physicsBody.collisionGroup = @"monsterGroup";
    self.physicsBody.collisionType  = @"monsterCollision";
    self.physicsBody.type = CCPhysicsBodyTypeStatic;
 }

@end
