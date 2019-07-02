//
//  AJDWPokemonController.h
//  PokedexOBJC27
//
//  Created by Austin West on 7/2/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import "AJDWPokemonController.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon.";

@implementation AJDWPokemonController

+ (void) fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(Pokemon*))completion
{
    // Step 1   Create the URL from the base url and search term
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *finalURL = [baseURL URLByAppeningPathComponent:[searchTerm lowercaseString]];
    
    // Print the URL for testing
    NSLog(@"%@", finalURL);
    
    // Step 2      Start my dataTask with the completion
    
    [NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // Was there an error
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@, __Pretty_Function__, error, [error localizedDescription]);
                  completion(nil);
                  return;
                  }
                  // Check the response
                  if (response)
                  {
                      NSLog(@"%@", response);
                  }
                  
                  // Get the data
                  if (data)
                  {
                      NSDictionary *topLevelDictionary = [NSJSonSerialization JSONObjectWithData: data options:2 error: &error];
                      
                      if (!topLevelDictionary)
                      {
                          NSLog(@"Error parsing the JSON: %@", error);
                          completion(nil);
                          return;
                      }
                      //If we made it here then I have successfully parsed my JSON and should be able to complete with a Pokemon Object
                      Pokemone *pokemon = [[Pokemon alloc] initWithDictionary:topLevelDictionary];
                      completion(pokemon);
                  }
                  }] resume ];
                  
                  }
                  
                  @end
