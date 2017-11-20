//
//  PresidentsTabelViewCellTableViewCell.h
//  HW02-US-Presidents
//
//  Created by Asdruval De Leon on 11/19/17.
//  Copyright © 2017 Asdruval De Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresidentsTabelViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblParty;
@property (weak, nonatomic) IBOutlet UIImageView *tnImg;
@property (weak, nonatomic) IBOutlet UILabel *lblNumber;

@end
