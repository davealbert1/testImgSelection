//
//  fullListScrollView.m
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import "fullListScrollView.h"
#define H_BUFFER 20

@implementation fullListScrollView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
    [self commonInit];
  }
  return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    // Initialization code
    [self commonInit];
  }
  return self;
}


- (void)commonInit {
  // Thumbnails are 135x101  
  CGPoint lastButton = CGPointMake((135.0f/2.0f)+H_BUFFER, (101.0f/2.0f)+H_BUFFER + 45.0f);
  
  for (int i=0; i<=37; i++) {
    if ((i > 0) && (i % 3 == 0)) {
      NSLog(@"%d",i);
      lastButton = CGPointMake((135.0f/2.0f)+H_BUFFER, lastButton.y + 101.0f + H_BUFFER);
    }
    lastButton = [self addImageButton:i withLastButton:lastButton];        
  }
  
  [self setContentSize:CGSizeMake(0.0f, lastButton.y+101.0f)];
}

#pragma mark - Supporting Methods

- (CGPoint)addImageButton:(int)tag withLastButton:(CGPoint)lastButton{
  

  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d.png",tag] ofType:nil]]];
  [btn setFrame:img.frame];
  [btn addSubview:img];
  [btn setTag:tag];
  [btn addTarget:self action:@selector(addSlide:) forControlEvents:UIControlEventTouchUpInside];
  [btn setCenter:lastButton];
  [self addSubview:btn];
  
  lastButton = CGPointMake(lastButton.x +(135.0f)+H_BUFFER, lastButton.y);
  return lastButton;
}

#pragma mark - User Interaction Methods

-(IBAction)addSlide:(UIButton *)sender {
  NSLog(@"%d",sender.tag);
  UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"used.png" ofType:nil]]];
  [sender addSubview:img];

}

@end
