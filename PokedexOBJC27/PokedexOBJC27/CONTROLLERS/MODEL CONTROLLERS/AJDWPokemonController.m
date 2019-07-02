//
//  AJDWPokemonController.m
//  PokedexOBJC27
//
//  Created by Austin West on 7/2/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import "Foundation/Foundation.h"
#import "Pokemon.h"

@interface AJDWPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^) (Pokemon *))completion;
// Swift way
// static func fetchPokemon(for searchTerm: String, completion:((Pokemon?) -> (void))?)
@end
