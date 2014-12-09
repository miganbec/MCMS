//
//  CreatureViewController.m
//  MCMS
//
//  Created by miganbec on 25/11/14.
//  Copyright (c) 2014 miganbec. All rights reserved.
//

#import "CreatureViewController.h"
#import "ViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UITextView *creatureTextView;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UITextField *editTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (nonatomic, getter=isHidden) BOOL hidden;
@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureTextView.text = self.creatureToEdit.name;
    self.detailTextView.text = self.creatureToEdit.detail;
    self.hidden = TRUE;
    self.editTextField.hidden = self.hidden;
    self.detailTextField.hidden = self.hidden;

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

- (IBAction)editButtonPressed:(id)sender {
    NSLog(@"Editar...");
    if (self.editTextField.hidden) {
        [sender setTitle:@"Hecho" forState:UIControlStateNormal];
        self.editTextField.hidden = FALSE;
        self.detailTextField.hidden = FALSE;
        self.editTextField.text = self.creatureToEdit.name;
        self.detailTextField.text = self.creatureToEdit.detail;
    } else {
        self.creatureToEdit.name = self.editTextField.text;
        self.creatureToEdit.detail = self.detailTextField.text;
        self.creatureTextView.text = self.creatureToEdit.name;
        self.detailTextView.text = self.creatureToEdit.detail;
        self.editTextField.hidden = TRUE;
        self.detailTextField.hidden = TRUE;
        [sender setTitle:@"Editar" forState:UIControlStateNormal];
    }
}

@end
