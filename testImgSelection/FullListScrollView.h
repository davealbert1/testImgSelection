//
//  fullListScrollView.h
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectedListScrollView.h"

@interface FullListScrollView : UIScrollView {
  BOOL flowHasBeenSelected;
  BOOL isMovedAside;
}

@property (nonatomic, strong) SelectedListScrollView *selectedList;

- (void)flowSelected;
- (void)hideFullList;
- (void)showFullList;

@end
