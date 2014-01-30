//
//  DetailViewController.m
//  AddressBookSDK
//
//  Created by Anthony Marchenko on 1/30/14.
//  Copyright (c) 2014 Anthony Marchenko. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () 

@property (weak, nonatomic) IBOutlet UILabel *lblContactName;
@property (weak, nonatomic) IBOutlet UIImageView *imgContactImage;
@property (weak, nonatomic) IBOutlet UITableView *tblContactDetails;


@end

@implementation DetailViewController

#pragma mark - Managing the detail item


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

@end
