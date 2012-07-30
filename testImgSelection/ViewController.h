//
//  ViewController.h
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "fullListScrollView.h"
#import "selectedListScrollView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *flowTableView;

@property (strong, nonatomic) IBOutlet fullListScrollView *fullList;
@property (strong, nonatomic) IBOutlet selectedListScrollView *selectedList;

@end
