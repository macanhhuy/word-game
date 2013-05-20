//
//  TileView.m
//  Anagrams
//
//  Created by Marin Todorov on 16/02/2013.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "TileView.h"
#import "config.h"

@implementation TileView

- (id)init
{
  NSAssert(NO, @"Use initWithLetter:andSideLength instead");
  return nil;
}

- (id)initWithImage:(UIImage *)image
{
  NSAssert(NO, @"Use initWithLetter:andSideLength instead");
  return nil;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
  NSAssert(NO, @"Use initWithLetter:andSideLength instead");
  return nil;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
  NSAssert(NO, @"Use initWithLetter:andSideLength instead");
  return nil;
}

- (id)initWithFrame:(CGRect)frame
{
  NSAssert(NO, @"Use initWithLetter:andSideLength instead");
  return nil;
}

// create new tile for a given letter
-(instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength
{
  //the tile background
  UIImage* img = [UIImage imageNamed:@"tile.png"];
  
  //create a new object
  self = [super initWithImage:img];
  
  if (self != nil) {
    
    //resize the tile
    float scale = sideLength/img.size.width;
    self.frame = CGRectMake(0,0,img.size.width*scale, img.size.height*scale);
    
    //more initialization here
    
    //add a letter on top
    UILabel* lblChar = [[UILabel alloc] initWithFrame:self.bounds];
    lblChar.textAlignment = NSTextAlignmentCenter;
    lblChar.textColor = [UIColor whiteColor];
    lblChar.backgroundColor = [UIColor clearColor];
    lblChar.text = [letter uppercaseString];
    lblChar.font = [UIFont fontWithName:@"Verdana-Bold" size:78.0*scale];
    [self addSubview: lblChar];
  
    //begin in unmatched state
    self.isMatched = NO;
    
    //save the letter
    _letter = letter;
  }
  
  return self;
}

-(void)randomize
{
  //set random rotation of the tile
  //anywhere between -0.2 and 0.3 radians
  float rotation = randomf(0,50) / (float)100 - 0.2;
  self.transform = CGAffineTransformMakeRotation( rotation );
  
  //move randomly upwards
  int yOffset = (arc4random() % 10) - 10;
  self.center = CGPointMake(self.center.x, self.center.y + yOffset);
}

@end
