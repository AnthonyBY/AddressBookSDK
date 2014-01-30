//
//  DetailViewController.h
//  AddressBookSDK
//
//  Created by Anthony Marchenko on 1/30/14.
//  Copyright (c) 2014 Anthony Marchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
