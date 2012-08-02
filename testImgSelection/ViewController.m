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
@synthesize moveAsideButton;

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
  [self setMoveAsideButton:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
          interfaceOrientation == UIInterfaceOrientationLandscapeRight );
}

- (IBAction)hideFullList:(id)sender {
  if ([moveAsideButton tag] == 0) {
    [self.selectedList setFullListHidden:YES];
    
    [self.fullList hideFullList];
    [self.selectedList redrawSlides];  
    [moveAsideButton setTag:1];
    [self.moveAsideButton setTitle:@" <<" forState:UIControlStateNormal];
  } else {
    [self.selectedList setFullListHidden:NO];
    
    [self.fullList showFullList];
    [self.selectedList redrawSlides];  
    [moveAsideButton setTag:0];
    [self.moveAsideButton setTitle:@" >>" forState:UIControlStateNormal];
  }
}

@end
