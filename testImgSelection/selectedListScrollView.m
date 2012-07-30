//
//  selectedListScrollView.m
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import "selectedListScrollView.h"
#define H_BUFFER 5
#define DEFAULT_X (135.0f/2.0f)+H_BUFFER
#define DEFAULT_Y (101.0f/2.0f)+H_BUFFER

@implementation selectedListScrollView

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
  selectedDataList = [[NSMutableArray alloc] init];
  buttonPos = CGPointMake(DEFAULT_X, DEFAULT_Y);
}

- (IBAction)removeSlide:(UIButton *)sender{
  NSMutableArray *tempArray = [[NSMutableArray alloc]init];
  int count = [selectedDataList count];
  for (int i=0; i<count; i++) {
    if (sender.tag != i) {
      [tempArray addObject:[selectedDataList objectAtIndex:i]];
      [[tempArray objectAtIndex:[tempArray count]-1] setTag:[tempArray count]];
    }    
  }
  selectedDataList = tempArray;
  [self redrawSlides];
}

#pragma mark - Supporting Methods

- (void)redrawSlides {
  for (UIButton *btn in self.subviews) {
    if ([btn isKindOfClass:[UIButton class]]) {
      [btn removeFromSuperview];
    }
  }
  buttonPos = CGPointMake(DEFAULT_X, DEFAULT_Y);
  for (int i=0; i<[selectedDataList count]; i++) {
    UIButton *btn = [selectedDataList objectAtIndex:i];
    [btn setTag:i];
    [btn setCenter:buttonPos];
    buttonPos = CGPointMake(buttonPos.x + 135.0f + H_BUFFER,buttonPos.y);
    if (buttonPos.x > 350.0f) {
      buttonPos = CGPointMake(DEFAULT_X, buttonPos.y + 101.0f + H_BUFFER);
    }
    [self addSubview:btn];
  }
}

- (UIButton *)imageWithTag:(int)tag {
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d.png",tag] ofType:nil]]];
  [btn setFrame:img.frame];
  [btn addSubview:img];
  [btn setCenter:buttonPos];

  buttonPos = CGPointMake(buttonPos.x + 135.0f + H_BUFFER,buttonPos.y);
  if (buttonPos.x > 350.0f) {
    buttonPos = CGPointMake(DEFAULT_X, buttonPos.y + 101.0f + H_BUFFER);
  }

  [self setContentSize:CGSizeMake(0.0f, buttonPos.y + 100.0f)];
  [btn setTag:[selectedDataList count]];
  [btn addTarget:self action:@selector(removeSlide:) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:btn];
  return btn;
}

- (void)addButtonToScrollView:(UIButton *)btn{
  [self addSubview:btn];
}

- (void)addToList:(int)tag {
  [selectedDataList addObject:[self imageWithTag:tag]];
}

@end
