//
//  fullListScrollView.m
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import "FullListScrollView.h"
#define H_BUFFER 20

@implementation FullListScrollView

@synthesize selectedList;

- (id)initWithFrame:(CGRect)frame {
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
  CGPoint buttonPos = CGPointMake((135.0f/2.0f)+H_BUFFER, (101.0f/2.0f)+H_BUFFER + 45.0f);

  for (int i=0; i<=37; i++) {
    if ((i > 0) && (i % 3 == 0)) {
      buttonPos = CGPointMake((135.0f/2.0f)+H_BUFFER, buttonPos.y + 101.0f + H_BUFFER);
    }
    buttonPos = [self addImageButton:i withLastButton:buttonPos];
  }

  [self setContentSize:CGSizeMake(0.0f, buttonPos.y+101.0f)];
}

#pragma mark - Supporting Methods

- (CGPoint)addImageButton:(int)tag withLastButton:(CGPoint)buttonPos {
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d.png",tag] ofType:nil]]];
  [btn setFrame:img.frame];
  [btn addSubview:img];
  [btn setTag:tag];
  [btn addTarget:self action:@selector(addSlide:) forControlEvents:UIControlEventTouchUpInside];
  [btn setCenter:buttonPos];
  [self addSubview:btn];

  buttonPos = CGPointMake(buttonPos.x +(135.0f)+H_BUFFER, buttonPos.y);
  return buttonPos;
}

- (void)flowSelected{
  flowHasBeenSelected = YES;
}

#pragma mark - User Interaction Methods

-(IBAction)addSlide:(UIButton *)sender {
  //  UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"used.png" ofType:nil]]];
  //  [sender addSubview:img];
  if (flowHasBeenSelected) {
    [self.selectedList addToList:sender.tag];
  } else {
    [[[UIAlertView alloc] initWithTitle:@"Select Flow" message:@"Please select a flow" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
  }
}

@end
