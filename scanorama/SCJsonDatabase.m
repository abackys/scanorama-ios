//
//  SCJsonDatabase.m
//  scanorama
//
//  Created by Lion User on 20/09/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SCJsonDatabase.h"
#import "SCAppDelegate.h"

@implementation SCJsonDatabase


@synthesize managedObjectContext = _managedObjectContext;
@synthesize fetchedResultsController = _fetchedResultsController;

- (id)init
{
    self = [super init];
    if (self) {
        
        SCAppDelegate *app = [UIApplication sharedApplication].delegate;
        _managedObjectContext = app.managedObjectContext;
    }
    return self;
}



-(void) insertScheduleJsonToDatabase {
    
    NSManagedObjectContext *context = _managedObjectContext;
    NSError *error; 
      
    NSString* dataPath = [[NSBundle mainBundle] pathForResource:@"schedule" ofType:@"json"];
    NSArray* ScheduleArray = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]
                                                           options:kNilOptions
                                                             error:&error];
    NSLog(@"%i", [ScheduleArray count]);
    
    [ScheduleArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSError *err; 
              NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
       
        
        Schedule *scheduleDb = [NSEntityDescription                                 insertNewObjectForEntityForName:@"Schedule"                                 inManagedObjectContext:context];
        

    // NSLog(@"%@", [obj objectForKey:@"movie"]);
        NSFetchRequest *fetchMovieRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entityMovie = [NSEntityDescription 
                                            entityForName:@"Movies" inManagedObjectContext:context];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"movieId=%@", [obj objectForKey:@"movie"]];
        [fetchMovieRequest setPredicate:predicate];
        [fetchMovieRequest setEntity:entityMovie];
        
        NSArray *fetchedMovie = [context executeFetchRequest:fetchMovieRequest error:&err];
        
        if([fetchedMovie count]){
            Movies *movieQuery = [fetchedMovie objectAtIndex:0];  
            scheduleDb.date = [df dateFromString:[obj objectForKey:@"date"]];      
            scheduleDb.city = [obj objectForKey:@"city"];
            scheduleDb.cinema = [obj objectForKey:@"cinema"];
            scheduleDb.favorite =  0;
            scheduleDb.movie = movieQuery;
       /*     
            NSMutableSet *scheduleSet = [NSMutableSet setWithSet:moviesInsert.schedule];
            [scheduleSet addObject:scheduleDb];
            moviesInsert.schedule = (NSSet *) [scheduleSet copy];
        */
            
      //  NSLog(@"%@",scheduleDb.movie);
        }
        
     //   Movies *movieDB = [fetchedMovie objectAtIndex:0];    
        
       // NSLog(@"%@", movieDB);

        



        
        
        
    //    NSLog(@"%@", scheduleDb);
        //  failedBankInfo.word = [obj objectForKey:@"word"];
        //  failedBankInfo.translations = [obj objectForKey:@"trans"];
       
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    
    
        
    }];
 //   NSLog(@"%@,", ScheduleArray); 
    
}


- (void) insertMoviesJsonToDatabase{
    
    NSManagedObjectContext *context = _managedObjectContext;
    
    NSError* err = nil;
    NSString* dataPath = [[NSBundle mainBundle] pathForResource:@"movies" ofType:@"json"];
    NSArray* MoviesArray = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]
                                                     options:kNilOptions
                                                       error:&err];
    
    [MoviesArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Movies *moviesDB = [NSEntityDescription                                 insertNewObjectForEntityForName:@"Movies"                                 inManagedObjectContext:context];
        
        moviesDB.movieId = [obj objectForKey:@"movieId"];
        moviesDB.title = [obj objectForKey:@"title"];
        moviesDB.titleEn = [obj objectForKey:@"titleEn"];
        moviesDB.titleNative = [obj objectForKey:@"titleNative"];
        moviesDB.createdYear = [obj objectForKey:@"createdYear"];
        moviesDB.director = [obj objectForKey:@"director"];
        moviesDB.duration = [obj objectForKey:@"duration"];
        moviesDB.fullImage = [obj objectForKey:@"fullImage"];
        moviesDB.thumbImage = [obj objectForKey:@"thumbImage"];
        moviesDB.country = [obj objectForKey:@"country"];
        moviesDB.screenplay = [obj objectForKey:@"screenplay"];
        moviesDB.cinematography = [obj objectForKey:@"cinematography"];
        moviesDB.editing = [obj objectForKey:@"editing"];
        moviesDB.music = [obj objectForKey:@"music"];
        moviesDB.group = [obj objectForKey:@"group"];
        moviesDB.cast = [obj objectForKey:@"cast"];
        moviesDB.moviedescription = [obj objectForKey:@"moviedescription"];
        moviesDB.directorDescription = [obj objectForKey:@"directorDescription"];
        moviesDB.directorFilms = [obj objectForKey:@"directorFilms"];
        moviesDB.videoUrl = @"http://www.youtube.com/embed/oHg5SJYRHA0";

        
        
        NSLog(@"%i", 1);
      //  failedBankInfo.word = [obj objectForKey:@"word"];
      //  failedBankInfo.translations = [obj objectForKey:@"trans"];
        
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
  
      
    }];
    

}

@end
