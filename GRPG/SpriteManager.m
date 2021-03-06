//
//  SpriteManager.m
//  GRPG
//
//  Created by Jared Halpern on 12/25/15.
//  Copyright © 2015 Jared Halpern. All rights reserved.
//

#import "SpriteManager.h"
#import "SpriteSheet.h"

@interface SpriteManager ()

@property (nonatomic, strong) NSMutableDictionary *atlasFramesDictionary;

@end

@implementation SpriteManager

- (instancetype)init {
  if (self == [super init]) {
    
    _atlasFramesDictionary = [@{} mutableCopy];
    
  }
  return self;
}

+ (SpriteManager *) sharedManager {
  static dispatch_once_t pred;
  static SpriteManager *shared = nil;
  
  dispatch_once(&pred, ^{
    shared = [[SpriteManager alloc] init];
  });
  return shared;
}

- (SKSpriteNode *)spriteNodeOfType:(NSString *)spriteType {
#warning implement me
  // use this method instead of creating and destroying skspritenodes all the time
  // which will kill the frame rate
  // Just update the sprite's texture, position and other attributes when reusing one of those we no longer need.
  return nil;
}

- (NSArray *)framesWithTextureName:(NSString *)textureName {
  
  // note - this isn't caching for reuse
  
  SpriteSheet *spriteSheet = [[SpriteSheet alloc] initWithTextureName:textureName rows:3 cols:3 margin:0.0 spacing:8.0];
  NSMutableArray *animFrames = [@[] mutableCopy];
  
  // loads from bottom left of sprite sheet, left to right
  for (NSInteger i = 0; i < 3; i++) {
    for (NSInteger j = 0; j < 3; j++) {
      [animFrames addObject:[spriteSheet textureForColumn:j andRow:i]];
    }
  }
//  NSLog(@"%s - added these frames to array: %@", __PRETTY_FUNCTION__, animFrames);
  return animFrames;
}

- (NSMutableArray *)framesPrefix:(NSString *)framesPrefix withAtlasName:(NSString *)textureAtlasName {
  
  SKTextureAtlas *textureAtlas = nil;
  NSMutableArray *animFrames = [@[] mutableCopy];
  
  // Mapping in dictionary: atlas name --> animation frames
  
  // check if we've already created a texture atlas for this key
  if (self.atlasFramesDictionary[textureAtlasName]) {
    animFrames = self.atlasFramesDictionary[textureAtlasName];
    return animFrames;
    
  } else {
    textureAtlas = [SKTextureAtlas atlasNamed:textureAtlasName];
  }
  
  // Note - look over sktexture / atlas usage. not sure we're using this optimally
  // http://stackoverflow.com/questions/26028495/spritekit-sktextureatlas-atlaswithdictionary-method
  
  // Note -- Naming: sprites inside atlas must be named the same as the atlas itself, with their frame # at the end.
  // eg: <object type>_<size>_<description>_<version>_<frame #>

  for (int i = 0; i < textureAtlas.textureNames.count; i++) {
    NSString *textureName = [NSString stringWithFormat:@"%@_%d", framesPrefix, i];
    SKTexture *texture = [textureAtlas textureNamed:textureName];
    [animFrames addObject:texture];
  }
   
  // set the texture atlast name key for the animation frames, so we can retrieve them (cache for later)
  [self.atlasFramesDictionary setObject:animFrames forKey:textureAtlasName];
  
  return animFrames;
}




@end
