//
//  Pokemon.h
//  PokedexOBJC27
//
//  Created by Austin West on 7/2/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pokemon : NSObject

@property (nonatomic, copy, readonly) NSString *pokemonName;
// (in swift) let pokemonName: String
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
// *1 is for the individual strings, *2 is for the array

- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *> *)abilities;

/* Swift way
 init*name: String, identifier: Int, abilities: [String]) {
 
 }
 */

@end

// Class extension
@interface Pokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

// Swift way
// init(with dictionary: [String:Any]) {
// }

@end


NS_ASSUME_NONNULL_END
