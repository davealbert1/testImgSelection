//
//  ViewController.m
//  testImgSelection
//
//  Created by Dave Albert on 30/07/2012.
//  Copyright (c) 2012 Publicis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize fullList;
@synthesize flowTableView;
@synthesize selectedList;

- (void)viewDidLoad {
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [fullList setSelectedList:self.selectedList];
  [flowTableView setSLsv:selectedList];
  [flowTableView setFLsv:fullList];
}

- (void)viewDidUnload {
  [self setFullList:nil];
  [self setFlowTableView:nil];
  [self setSelectedList:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
          interfaceOrientation == UIInterfaceOrientationLandscapeRight );
}

@end
