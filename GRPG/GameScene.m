//
//  GameScene.m
//  GRPG
//
//  Created by Jared Halpern on 12/25/15.
//  Copyright (c) 2015 Jared Halpern. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
  
  
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        

    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
