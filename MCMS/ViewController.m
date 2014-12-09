//
//  ViewController.m
//  MCMS
//
//  Created by miganbec on 18/11/14.
//  Copyright (c) 2014 miganbec. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *creatureTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *magicalCreatureOne = [[MagicalCreature alloc] init];
    magicalCreatureOne.name = @"Criatura Mágica Uno";
    magicalCreatureOne.detail = @"1";
    MagicalCreature *magicalCreatureTwo = [[MagicalCreature alloc] init];
    magicalCreatureTwo.name = @"Criatura Mágica Dos";
    magicalCreatureTwo.detail = @"2";
    MagicalCreature *magicalCreatureThree = [[MagicalCreature alloc] init];
    magicalCreatureThree.name = @"Criatura Mágica Tres";
    magicalCreatureThree.detail = @"3";
    self.creatures = [NSMutableArray arrayWithObjects:magicalCreatureOne, magicalCreatureTwo, magicalCreatureThree, nil];
    for (MagicalCreature *magicalCreature in self.creatures) {
        NSLog(@"%@", magicalCreature.name);
    }
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"creatureCellId" forIndexPath:indexPath];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;
    return cell;
}

- (IBAction)onAddButtonPressed:(id)sender {
    NSLog(@"Botón agregar presionado...");
    MagicalCreature *magicalCreatureAgregar = [[MagicalCreature alloc] init];
    NSString *creatureName = self.creatureTextField.text;
    NSString *detailName = self.detailTextField.text;
    magicalCreatureAgregar.name = creatureName;
    magicalCreatureAgregar.detail = detailName;
    [self.creatures addObject:magicalCreatureAgregar];
    self.creatureTextField.text = @"";
    self.detailTextField.text = @"";
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Seleccionó una fila");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    CreatureViewController *creatureViewController = segue.destinationViewController;
    creatureViewController.creatureToEdit = [self.creatures objectAtIndex:[self.tableView indexPathForCell:cell].row];
    [self.tableView reloadData];
    NSLog(@"Selección: %@", creatureViewController.creatureToEdit.name);
}

@end
