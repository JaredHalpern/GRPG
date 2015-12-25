//
//  SpriteManager.h
//  GRPG
//
//  Created by Jared Halpern on 12/25/15.
//  Copyright © 2015 Jared Halpern. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface SpriteManager : NSObject

+ (SpriteManager *)sharedManager;
- (NSArray *)framesWithAtlasName:(NSString *)textureAtlasName;
- (SKSpriteNode *)spriteNodeOfType:(NSString *)spriteType;

@end
