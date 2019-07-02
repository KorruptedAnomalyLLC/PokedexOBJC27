//
//  Pokemon.m
//  PokedexOBJC27
//
//  Created by Austin West on 7/2/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon
- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self != nil) {
        // Swift
        // self.pokemonName = name
        _pokemonName = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation Pokemon (JSONConvertable)
// TopLevelDictionary
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary  // C
{
    NSString *name = topLevelDictionary[@"name"];
    //Swift
    // let name = dictionary["name"] as? String
    NSInteger identifier = [topLevelDictionary[@"id"] integerValue];
    NSArray *abilitiesDict = topLevelDictionary[@"abilities"];  // B
    
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDict isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    // SWIFT way
    // let abilities : [String] = []
    for (NSDictionary *dictionary in abilitiesDict) {  // B
        NSDictionary *abilityDict = dictionary[@"ability"];  // A
        NSString *abilityName = abilityDict[@"name"];
        [abilities addObject:abilityName];
    }
    return [self initWithPokemonName:name identifier:identifier abilities:abilities];
}

@end
