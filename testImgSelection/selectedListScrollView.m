//
//  selectedListScrollView.m
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import "selectedListScrollView.h"

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
  
}

@end
