//
//  selectedListScrollView.m
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import "SelectedListScrollView.h"
#define H_BUFFER 5
#define DEFAULT_X (135.0f/2.0f)+H_BUFFER
#define DEFAULT_Y (101.0f/2.0f)+H_BUFFER

@implementation SelectedListScrollView

@synthesize fullListHidden;

#pragma mark - Initialization Methods

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

#pragma mark - User Interaction Methods

- (IBAction)removeSlide:(UIButton *)sender{
  if (fullListHidden) {

  } else {
    [UIView animateWithDuration:0.25f animations:^{
      [sender setAlpha:0.0f];
    } completion:^(BOOL finished) {
      NSMutableArray *tempArray = [[NSMutableArray alloc]init];
      int count = [selectedDataList count];
      for (int i=0; i<count; i++) {
        if (sender.tag != i) {
          [tempArray addObject:[selectedDataList objectAtIndex:i]];
          [[tempArray objectAtIndex:[tempArray count]-1] setTag:[tempArray count]];
        }
      }

      [selectedDataList removeAllObjects];
      for (NSObject *obj in tempArray) {
        [selectedDataList addObject:obj];
      }

      [self redrawSlides];
    }];
  }
}

- (IBAction)moveSlideStart:(UIButton *)sender{
  if (fullListHidden) {
    NSLog(@"moveing");
    [sender addTarget:self action:@selector(wasDragged:withEvent:)
     forControlEvents:UIControlEventTouchDragInside];
    [self bringSubviewToFront:sender];
  } else {
    //shh
  }
}


- (IBAction)moveSlideFinish:(UIButton *)sender{
  if (fullListHidden) {
    [sender removeTarget:self action:@selector(wasDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    int moveNum = (((int)sender.center.x)/ 135) +((((int)sender.center.y) / 105)) *5;
    NSObject *obj = [selectedDataList objectAtIndex:sender.tag];
    [selectedDataList removeObjectAtIndex:sender.tag];
    if (moveNum > [selectedDataList count]) {
      moveNum = [selectedDataList count];
    }
    [selectedDataList insertObject:obj atIndex:moveNum];

    [self redrawSlides];
  } else {
    //shh
  }
}

#pragma mark - Supporting Methods

- (void)redrawSlides {
  [self setAlpha:0.75f];
  [UIView animateWithDuration:0.5f animations:^{
    [self setAlpha:1.0f];
  }];
  
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
    if (buttonPos.x > (fullListHidden ? 700.0f : 350.0f)) {
      buttonPos = CGPointMake(DEFAULT_X, buttonPos.y + 101.0f + H_BUFFER);
    }
    [self addSubview:btn];
  }
  [self setContentSize:CGSizeMake(0.0f, buttonPos.y + 100.0f)];
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
  if (buttonPos.y >650.0f) {
    [self setContentOffset:CGPointMake(0.0f, buttonPos.y - 400.0f)];
  }

  
  [btn setTag:[selectedDataList count]];
  [btn addTarget:self action:@selector(removeSlide:) forControlEvents:UIControlEventTouchUpInside];
  [btn addTarget:self action:@selector(moveSlideStart:) forControlEvents:UIControlEventTouchDown];
  [btn addTarget:self action:@selector(moveSlideFinish:) forControlEvents:UIControlEventTouchUpInside];
    
  [btn setAlpha:0.5];
  [self addSubview:btn];
  [UIView animateWithDuration:0.5f animations:^{
    [btn setAlpha:1.0f];
  }];
  
  return btn;
}

- (void)addButtonToScrollView:(UIButton *)btn{
  [self addSubview:btn];
}

- (void)addToList:(int)tag {
  [selectedDataList addObject:[self imageWithTag:tag]];
}

- (void)saveList{

}

- (void)clearList {
  for (UIButton *selBut in self.subviews) {
    if ([selBut isKindOfClass:[UIButton class]]) {
      [selBut removeFromSuperview];
    }
  }
  buttonPos = CGPointMake(DEFAULT_X, DEFAULT_Y);
}

- (void)flowSelected:(NSMutableDictionary *)flowList {
  if (!flowHasBeenSelected) {
    flowHasBeenSelected = YES;
  } else {
    [self saveList];
    [self clearList];
  }
  selectedDataList = [flowList objectForKey:@"slides"];
  [self redrawSlides];
}




- (void)wasDragged:(UIButton *)button withEvent:(UIEvent *)event
{
	// get the touch
	UITouch *touch = [[event touchesForView:button] anyObject];

	// get delta
	CGPoint previousLocation = [touch previousLocationInView:button];
	CGPoint location = [touch locationInView:button];
	CGFloat delta_x = location.x - previousLocation.x;
	CGFloat delta_y = location.y - previousLocation.y;

	// move button
	button.center = CGPointMake(button.center.x + delta_x,
                              button.center.y + delta_y);
}

@end
