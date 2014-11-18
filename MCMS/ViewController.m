//
//  ViewController.m
//  MCMS
//
//  Created by miganbec on 18/11/14.
//  Copyright (c) 2014 miganbec. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"

@interface ViewController ()

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
