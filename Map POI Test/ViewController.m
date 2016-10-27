//
//  ViewController.m
//  Map POI Test
//
//  Created by Richard Groves on 27/10/2016.
//  Copyright © 2016 NoodlFroot. All rights reserved.
//

#import "ViewController.h"

@import MapKit;

@interface ViewController ()

@property (nonatomic, strong) MKMapView* mapView;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	self.mapView.backgroundColor = [UIColor whiteColor];
	self.mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	// Aiming for a 'zoom level' of ~16.1
	self.mapView.region = (MKCoordinateRegion){	CLLocationCoordinate2DMake(51.510067, -0.133869),
		MKCoordinateSpanMake(0.0024, 0.00327)
	};
	
	self.mapView.showsPointsOfInterest = NO;
	
	[self.view addSubview:self.mapView];


	UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"Show POI" forState:UIControlStateNormal];
	[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[button setBackgroundColor:[UIColor colorWithRed:0.3 green:0.0 blue:0.0 alpha:0.3]];
	[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
	
	button.frame = CGRectMake(30,50, 120, 40);
	[self.view addSubview:button];
}

- (void)buttonTapped:(UIButton*)sender
{
	self.mapView.showsPointsOfInterest = !self.mapView.showsPointsOfInterest;
	
	[sender setTitle:self.mapView.showsPointsOfInterest ? @"Hide POI" : @"Show POI" forState:UIControlStateNormal];
}
@end
