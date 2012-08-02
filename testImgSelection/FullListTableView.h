//
//  fullListTableView.h
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectedListScrollView.h"
#import "FullListScrollView.h"


@interface FullListTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) SelectedListScrollView *sLsv;
@property (nonatomic, strong) FullListScrollView *fLsv;

@end
