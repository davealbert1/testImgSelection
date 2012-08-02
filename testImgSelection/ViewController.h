//
//  ViewController.h
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullListScrollView.h"
#import "SelectedListScrollView.h"
#import "FullListTableView.h"


@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet FullListTableView *flowTableView;
@property (strong, nonatomic) IBOutlet FullListScrollView *fullList;
@property (strong, nonatomic) IBOutlet SelectedListScrollView *selectedList;
@property (strong, nonatomic) IBOutlet UIButton *moveAsideButton;

- (IBAction)hideFullList:(id)sender;

@end
