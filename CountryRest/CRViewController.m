//
//  CRViewController.m
//  CountryRest
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "CRViewController.h"
#import "CountryController.h"

@interface CRViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryCapitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryPopulationLabel;

- (IBAction)searchTapped:(UIButton *)sender;

@end

@implementation CRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchTapped:(UIButton *)sender
{
    [[CountryController sharedInstance] getCountriesWithName:self.searchField.text withCompletion:
     ^(NSArray *countries)
    {
        NSDictionary *country = countries.firstObject;
        self.countryNameLabel.text = country[@"name"];
        self.countryCapitalLabel.text = country[@"capital"];
        NSNumber *pop = country[@"population"];
        self.countryPopulationLabel.text = pop.description;
    }];
}
@end
