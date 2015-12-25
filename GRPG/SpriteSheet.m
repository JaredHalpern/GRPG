//
//  SpriteSheet.m
//  GRPG
//
//  Created by Jared Halpern on 12/25/15.
//  Copyright © 2015 Jared Halpern. All rights reserved.
//

#import "SpriteSheet.h"

@interface SpriteSheet ()
@property (nonatomic, strong) SKTexture *texture;
@property (nonatomic)         NSInteger rows;
@property (nonatomic)         NSInteger cols;
@property (nonatomic)         CGFloat   margin;
@property (nonatomic)         CGFloat   spacing;
@property (nonatomic, getter=frameSize)         CGSize    frameSize;
@end


@implementation SpriteSheet

- (instancetype)initWithTextureName:(NSString *)name rows:(NSInteger)rows cols:(NSInteger)cols {
  SKTexture *texture = [SKTexture textureWithImageNamed:name];
  return [self initWithTexture:texture rows:rows cols:cols];
}

- (instancetype)initWithTexture:(SKTexture *)texture rows:(NSInteger)rows cols:(NSInteger)cols {
  return [self initWithTexture:texture rows:rows cols:cols margin:0 spacing:0];
}

- (instancetype)initWithTexture:(SKTexture *)texture rows:(NSInteger)rows cols:(NSInteger)cols margin:(CGFloat)margin spacing:(CGFloat)spacing {
  if (self == [super init]) {
    _texture = texture;
    _rows = rows;
    _cols = cols;
    _margin = margin;
    _spacing = spacing;
    _frameSize = [self frameSize];
    
  }
  return self;
}

- (CGSize)frameSize {
  return CGSizeMake((self.texture.size.width - (self.margin * 2 + self.spacing * ((CGFloat)self.cols - 1))) / ((CGFloat)self.cols),
                    (self.texture.size.height - (self.margin * 2 + self.spacing * ((CGFloat)self.rows - 1)) / ((CGFloat)self.rows)));
}

- (SKTexture *)textureForColumn:(NSInteger)column andRow:(NSInteger)row {
  
  if (column >= (self.cols) || row >= (self.rows)) {
    NSLog(@"Asking for row or col greater than spritesheet");
    return nil;
  }

  CGRect textureRect = CGRectMake(self.margin + (column * self.frameSize.width + self.spacing) - self.spacing,
                                  self.margin + (row * self.frameSize.height + self.spacing) - self.spacing,
                                  self.frameSize.width,
                                  self.frameSize.height);
  
  textureRect = CGRectMake(textureRect.origin.x / self.texture.size.width, textureRect.origin.y / self.texture.size.height, textureRect.size.width / self.texture.size.width, textureRect.size.height/self.texture.size.height);
  
  return [SKTexture textureWithRect:textureRect inTexture:self.texture];
}

/*
 
 func textureForColumn(column: Int, row: Int)->SKTexture? {
 if !(0...self.rows ~= row && 0...self.columns ~= column) {
 //location is out of bounds
 return nil
 }
 
 var textureRect=CGRect(x: self.margin+CGFloat(column)*(self.frameSize.width+self.spacing)-self.spacing,
 y: self.margin+CGFloat(row)*(self.frameSize.width+self.spacing)-self.spacing,
 width: self.frameSize.width,
 height: self.frameSize.height)
 
 textureRect=CGRect(x: textureRect.origin.x/self.texture.size().width, y: textureRect.origin.y/self.texture.size().height,
 width: textureRect.size.width/self.texture.size().width, height: textureRect.size.height/self.texture.size().height)
 return SKTexture(rect: textureRect, inTexture: self.texture)
 }
 
 }
 */

@end
