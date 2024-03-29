//
//  selectedListScrollView.h
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedListScrollView : UIScrollView {
  NSMutableArray *selectedDataList;
  CGPoint buttonPos;
  BOOL flowHasBeenSelected;
}

@property (nonatomic, assign) BOOL fullListHidden;

- (void)redrawSlides;
- (void)addToList:(int)tag;
- (void)flowSelected:(NSMutableDictionary *)flowList;

@end
