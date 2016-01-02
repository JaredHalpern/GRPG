//
//  GameScene.m
//  GRPG
//
//  Created by Jared Halpern on 12/25/15.
//  Copyright (c) 2015 Jared Halpern. All rights reserved.
//

#import "GameScene.h"
#import "SpriteManager.h"
#import "Constants.h"

@interface GameScene ()
@property (nonatomic, strong) SKSpriteNode        *dogSpriteNode;
@property (nonatomic)         NSMutableArray      *dogFrames;
@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
  
  [self loadDog];
  _dogSpriteNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
  
  NSArray *walkEastFrames = [NSArray arrayWithObjects:self.dogFrames[1], self.dogFrames[2], nil];
  SKAction *walkEastAction = [SKAction animateWithTextures:walkEastFrames timePerFrame:(1.0/3.0) resize:NO restore:NO];
  SKAction *repeatAction = [SKAction repeatActionForever:walkEastAction];
  [_dogSpriteNode runAction:repeatAction withKey:@"walkEastAction"];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

#pragma mark - Character specific

- (void)loadDog {
  
  _dogFrames = [[SpriteManager sharedManager] framesPrefix:@"dog_hat" withAtlasName:@"dog_hat"];
  _dogSpriteNode = [[SKSpriteNode alloc] initWithTexture:[self.dogFrames objectAtIndex:0]];
  _dogSpriteNode.name = kObjectNameDogHat;
  _dogSpriteNode.xScale = 2.5;
  _dogSpriteNode.yScale = 2.5;

  [self addChild:_dogSpriteNode];
}

- (void)loadOrc {
  
}

@end
