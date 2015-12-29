//
//  GRPGSKObject.m
//  GRPG
//
//  Created by Jared Halpern on 12/25/15.
//  Copyright © 2015 Jared Halpern. All rights reserved.
//

#import "GRPGSKObject.h"
#import <SpriteKit/SpriteKit.h>

@interface GRPGSKObject ()
@property (nonatomic, strong) SKSpriteNode *grpgSKSPriteNode;
@end

@implementation GRPGSKObject
/*
- (instancetype)initWithObjectName:(NSString *)objectName textureAtlas:(NSString *)atlasName andPosition:(CGPoint)position {
  if (self == [super init]) {
    
    NSAssert(atlasName, @"atlasName required.");
    NSAssert(objectName, @"objectName required.");
    
    _atlasName = atlasName;
    _position = position;
    _objectName = objectName;
    
    [self setupSpriteKit];
  }
  return self;
}

- (void)setupSpriteKit {
  
  // NOTE: we should eventually refactor this to have a key-value dict of frame states mapped to sets of frames so we can have object state mapped to the specific animation we want.
  // initialize with a dict of states mapped to atlas names.
  // a subclass shouldnt have to refer to the frames dict
  
  // NOTE: the below implementation will not allow a sprite to be created partially offscreen. This is deliberate, until such time that requirements change.
  
  _gameSKActivatedFrames = [[SpriteManager sharedManager] framesWithAtlasName:self.atlasName];
  
  SKTexture *firstFrame = [_gameSKActivatedFrames objectAtIndex:0];
  _gameSKSpriteNode = [SKSpriteNode spriteNodeWithTexture:firstFrame size:CGSizeMake(firstFrame.size.width, firstFrame.size.height)];
  _gameSKSpriteNode.name = self.objectName;
  
  // don't forget about anchorPoint here. default is (0.5, 0.5)
  // https://developer.apple.com/library/ios/documentation/SpriteKit/Reference/SKSpriteNode_Ref/#//apple_ref/occ/instp/SKSpriteNode/anchorPoint
  
  if (_position.x > [APPDELEGATE mainViewController].view.bounds.size.width - (firstFrame.size.width / 2)) {
    _position.x = [APPDELEGATE mainViewController].view.bounds.size.width - (firstFrame.size.width / 2);
  } else if (_position.x < (firstFrame.size.width / 2)) {
    _position.x = (firstFrame.size.width / 2);
  }
  
  if (_position.y > [APPDELEGATE mainViewController].view.bounds.size.height - [APPDELEGATE mainViewController].mainTopActionsViewHeight - (firstFrame.size.height / 2)) {
    _position.y = [APPDELEGATE mainViewController].view.bounds.size.height - [APPDELEGATE mainViewController].mainTopActionsViewHeight - (firstFrame.size.height / 2);
  } else if (_position.y < (firstFrame.size.height / 2) + [APPDELEGATE mainViewController].mainBottomActionsViewHeight) {
    _position.y = (firstFrame.size.height / 2) + [APPDELEGATE mainViewController].mainBottomActionsViewHeight;
  }
  _gameSKSpriteNode.position = _position;
  
}
*/










- (instancetype)init {
  if (self == [super init]) {
    
  }
  return self;
}

- (SKSpriteNode *)gameSKSpriteNode {
  NSAssert(_grpgSKSPriteNode, @"gameSKSpriteNode == nil");
  return _grpgSKSPriteNode;
}

- (void)beginAnimation {
  NSAssert(0, @"Override me in subclass");
}

- (void)tap {
  NSAssert(0, @"Override me in subclass");
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@", [GRPGSKObject class]];
}

@end
