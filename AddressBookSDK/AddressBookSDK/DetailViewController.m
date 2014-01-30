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

-(void)populateContactData;

@end

@implementation DetailViewController


-(void)populateContactData{
    NSString *contactFullName = [NSString stringWithFormat:@"%@ %@", [_dictContactDetails objectForKey:@"firstName"], [_dictContactDetails objectForKey:@"lastName"]];
    
    [_lblContactName setText:contactFullName];
    
    // Set the contact image.
    if ([_dictContactDetails objectForKey:@"image"] != nil) {
        [_imgContactImage setImage:[UIImage imageWithData:[_dictContactDetails objectForKey:@"image"]]];
    }
    
    [_tblContactDetails reloadData];
}

#pragma mark - Managing the detail item


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_tblContactDetails setDelegate:self];
    [_tblContactDetails setDataSource:self];
    
    [self populateContactData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - populate the table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        return 2;
    }
    else{
        return 3;
    }
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Phone Numbers";
            break;
        case 1:
            return @"E-mail Addresses";
            break;
        case 2:
            return @"Address Info";
            break;
            
        default:
            return @"";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    NSString *cellText = @"";
    NSString *detailText = @"";
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cellText = [_dictContactDetails objectForKey:@"mobileNumber"];
                    detailText = @"Mobile Number";
                    break;
                case 1:
                    cellText = [_dictContactDetails objectForKey:@"homeNumber"];
                    detailText = @"Home Number";
                    break;
            }
            break;
            
        case 1:
            switch (indexPath.row) {
                case 0:
                    cellText = [_dictContactDetails objectForKey:@"homeEmail"];
                    detailText = @"Home E-mail";
                    break;
                case 1:
                    cellText = [_dictContactDetails objectForKey:@"workEmail"];
                    detailText = @"Work E-mail";
                    break;
            }
            break;
            
        case 2:
            switch (indexPath.row) {
                case 0:
                    cellText = [_dictContactDetails objectForKey:@"address"];
                    detailText = @"Street Address";
                    break;
                case 1:
                    cellText = [_dictContactDetails objectForKey:@"zipCode"];
                    detailText = @"ZIP Code";
                    break;
                case 2:
                    cellText = [_dictContactDetails objectForKey:@"city"];
                    detailText = @"City";
                    break;
            }
            break;
            
        default:
            break;
    }
    
    cell.textLabel.text = cellText;
    cell.detailTextLabel.text = detailText;
    
    return cell;
}

@end
