//
//  PresidentsDetailsViewController.m
//  HW02-US-Presidents
//
//  Created by Asdruval De Leon on 11/19/17.
//  Copyright © 2017 Asdruval De Leon. All rights reserved.
//

#import "PresidentsDetailsViewController.h"

@interface PresidentsDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *detailPresidentImage;
@property (weak, nonatomic) IBOutlet UILabel *lblBorn;
@property (weak, nonatomic) IBOutlet UILabel *lblDied;
@property (weak, nonatomic) IBOutlet UILabel *lblOfficeTerms;
@property (weak, nonatomic) IBOutlet UILabel *lblParty;
@property (weak, nonatomic) IBOutlet UILabel *lblOccupation;


@end

@implementation PresidentsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _detailPresidentImage.image = _myPresident.presidentImg;
    _lblBorn.text = [NSString stringWithFormat:@"Born: \n%@ in %@", _myPresident.born,_myPresident.bornLocation];
    _lblParty.text = [NSString stringWithFormat:@"Political Party: %@ and Served for: %@ term/s",_myPresident.politicalParty, _myPresident.termServed];
    _lblOfficeTerms.text = [NSString stringWithFormat:@"Office terms: %@ ",_myPresident.officeTerm];
    _lblOccupation.text = [NSString stringWithFormat:@"Occupation: %@ ",_myPresident.occupation];
    _lblDied.text = [NSString stringWithFormat:@"Diet: \n%@ in %@", _myPresident.died,_myPresident.diedLocation];


    
    //add a title to detail view
    self.navigationItem.title = _myPresident.name;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
