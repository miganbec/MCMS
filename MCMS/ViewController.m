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
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *magicalCreatureOne = [[MagicalCreature alloc] init];
    magicalCreatureOne.name = @"Criatura Mágica Uno";
    MagicalCreature *magicalCreatureTwo = [[MagicalCreature alloc] init];
    magicalCreatureTwo.name = @"Criatura Mágica Dos";
    MagicalCreature *magicalCreatureThree = [[MagicalCreature alloc] init];
    magicalCreatureThree.name = @"Criatura Mágica Tres";
    self.creatures = [NSMutableArray arrayWithObjects:magicalCreatureOne, magicalCreatureTwo, magicalCreatureThree, nil];
    for (MagicalCreature *magicalCreature in self.creatures) {
        NSLog(@"%@", magicalCreature.name);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"creatureCellId" forIndexPath:indexPath];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    return cell;
}

- (IBAction)onAddButtonPressed:(id)sender {
    NSLog(@"Botón agregar presionado...");
    MagicalCreature *magicalCreatureAgregar = [[MagicalCreature alloc] init];
    NSString *creatureName = self.creatureTextField.text;
    magicalCreatureAgregar.name = creatureName;
    [self.creatures addObject:magicalCreatureAgregar];
    [self.tableView reloadData];
    self.creatureTextField.text = @"";
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Seleccionó una fila");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    CreatureViewController *creatureViewController = segue.destinationViewController;
    creatureViewController.creatureName = cell.textLabel.text;
    NSLog(@"Selección: %@", creatureViewController.creatureName);
}

@end
