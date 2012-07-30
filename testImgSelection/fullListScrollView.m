//
//  fullListScrollView.m
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import "fullListScrollView.h"

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
  for (int i=0; i<=37; i++) {
    [self addImageButton:i];
  }
}

#pragma mark - Supporting Methods

- (void)addImageButton:(int)tag {
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d.png",tag] ofType:nil]]];
  [btn setFrame:img.frame];
  [btn addSubview:img];
  [btn setTag:tag];
  [btn addTarget:self action:@selector(addSlide:) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:btn];
}

#pragma mark - User Interaction Methods

-(IBAction)addSlide:(UIButton *)sender {
  NSLog(@"%d",sender.tag);
}

@end
