//
//  SpriteSheet.h
//  GRPG
//
//  Created by Jared Halpern on 12/25/15.
//  Copyright © 2015 Jared Halpern. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>


@interface SpriteSheet : NSObject

- (instancetype)initWithTexture:(SKTexture *)texture rows:(NSInteger)rows cols:(NSInteger)cols margin:(CGFloat)margin spacing:(CGFloat)spacing;
- (instancetype)initWithTexture:(SKTexture *)texture rows:(NSInteger)rows cols:(NSInteger)cols;
- (instancetype)initWithTextureName:(NSString *)name rows:(NSInteger)rows cols:(NSInteger)cols;
- (SKTexture *)textureForColumn:(NSInteger)column andRow:(NSInteger)row;
@end