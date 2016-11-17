//
//  RosterCell.h
//  ClassRoster
//
//  Created by John D Hearn on 11/16/16.
//  Copyright © 2016 Bastardized Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RosterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@end
