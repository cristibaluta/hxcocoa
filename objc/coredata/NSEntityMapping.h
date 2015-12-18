/*
    NSEntityMapping.h
    Core Data
    Copyright (c) 2004-2012 Apple Inc.
    All rights reserved.
*/

#import <Foundation/Foundation.h>

@class NSEntityDescription;
@class NSEntityMapping;

/*  mapping types */

enum {
    NSUndefinedEntityMappingType    = 0x00,
    NSCustomEntityMappingType       = 0x01,         /* developer handles destination instance creation */
    NSAddEntityMappingType          = 0x02,         /* new entity in destination */
    NSRemoveEntityMappingType	    = 0x03,         /* source instances aren't mapped to destination */
    NSCopyEntityMappingType         = 0x04,         /* migrate instances as-is */
    NSTransformEntityMappingType    = 0x05,         /* entity exists in source and destination and is mapped */
};
typedef NSUInteger NSEntityMappingType;

NS_CLASS_AVAILABLE(10_5,3_0)
extern class NSEntityMapping extends NSObject {

@private
    void *_reserved;
    void *_reserved1;
    NSDictionary *_mappingsByName;
    NSString *_name;
    NSEntityMappingType _mappingType;
    NSString *_sourceEntityName;
    NSData *_sourceEntityVersionHash;
    NSString *_destinationEntityName;
    NSData *_destinationEntityVersionHash;
    NSExpression *_sourceExpression;
    NSDictionary *_userInfo;
    NSString *_entityMigrationPolicyClassName;
    NSMutableArray *_attributeMappings;
    NSMutableArray *_relationshipMappings;

    struct __entityMappingFlags {
        unsigned int _isInUse:1;
        unsigned int _reservedEntityMapping:31;
    } _entityMappingFlags;

}

/* Returns/sets the name of the mapping. The name is used only as a means of distinguishing mappings in a model.  If not specified, defaults to the string composed by the source entity name followed by the destination entity name (ex. SourceName->DestinationName)
*/
- (NSString *)name;
- (void)setName:(NSString *)name;

/* Returns/sets the mapping type.  (If a custom entity mapping type is utilized, the developer must specify a migrationPolicyClassName as well.) 
*/
- (NSEntityMappingType)mappingType;
- (void)setMappingType:(NSEntityMappingType)type;

/* Returns/sets the source entity name for the mapping.  (Mappings are not directly bound to NSEntityDescriptions;  developers can use the sourceEntityForEntityMapping: API on the NSMigrationManager to retrieve the entity description for this name.)
*/
- (NSString *)sourceEntityName;
- (void)setSourceEntityName:(NSString *)name;

/* Returns/sets the version hash for the source entity for the mapping.  VersionHashes are calculated by the Core Data framework (see NSEntityDescrition's versionHash method). The sourceEntityVersionHash must equal the version hash of the source entity represented by the mapping.
*/
- (NSData *)sourceEntityVersionHash;
- (void)setSourceEntityVersionHash:(NSData *)vhash;

/* Returns/sets the destination entity name for the mapping.  (Mappings are not directly bound to NSEntityDescriptions;  developers can use the destinationEntityForEntityMapping: API on the NSMigrationManager to retrieve the entity description for this name.)
*/
- (NSString *)destinationEntityName;
- (void)setDestinationEntityName:(NSString *)name;

/* Returns/sets the version hash for the destination entity for the mapping.  VersionHashes are calculated by the Core Data framework (see NSEntityDescrition's versionHash method). The destinationEntityVersionHash must equal the version hash of the destination entity represented by the mapping.
*/
- (NSData *)destinationEntityVersionHash;
- (void)setDestinationEntityVersionHash:(NSData *)vhash;

/* Returns/sets the array of attribute mappings for the entity mapping.  The order of mappings in this collection dictates the order in which the mappings will be processed during a migration.
*/
- (NSArray *)attributeMappings;
- (void)setAttributeMappings:(NSArray *)mappings;

/* Returns/sets the array of relationship mappings for the entity mapping.  The order of mappings in this collection dictates the order in which the mappings will be processed during a migration.
*/
- (NSArray *)relationshipMappings;
- (void)setRelationshipMappings:(NSArray *)mappings;

/* Returns/sets the source expression for the mapping.  The source expression is used to obtain the collection of managed object instances to process through the mapping.  The expression can be a fetch request expression, or any other expression which evaluates to a collection.  
*/
- (NSExpression *)sourceExpression;
- (void)setSourceExpression:(NSExpression *)source;

/* Returns/sets the user info dictionary for the mapping
*/
- (NSDictionary *)userInfo;
- (void)setUserInfo:(NSDictionary *)dict;

/* Returns/sets the class name of the migration policy for the class.  If not specified, the default migration class name is NSEntityMigrationPolicy, though developers can specify a subclass for specific behavior.
*/
- (NSString *)entityMigrationPolicyClassName;
- (void)setEntityMigrationPolicyClassName:(NSString *)name;

}
