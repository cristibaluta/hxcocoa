package objc.foundation;

import objc.foundation.NSObject;


typedef NS_OPTIONS(NSUInteger, NSFileWrapperReadingOptions) {
    
    /* Whether the contents are read immediately, applied recursively in the case of directory file wrappers. If reading with this option succeeds then subsequent invocations of -fileWrappers, -regularFileContents, -symbolicLinkDestinationURL:, -serializedRepresentation, and, on Mac OS X, -[NSFileWrapper(NSExtensions) icon] sent to the receiver and all its descendant file wrappers won't fail. For performance NSFileWrapper may or may not immediately read the contents of some file packages immediately even when this option is chosen. For example, the contents of bundles (not all file packages are bundles) are immutable to the user so on Mac OS X NSFileWrapper may read the children of such a directory lazily. You can use this option to take a reasonable snapshot of a file or folder for writing later. For example, a Mac OS X application like TextEdit can use this option when creating new file wrappers to represent attachments that the user creates by copying and pasting or dragging and dropping from the Finder to a TextEdit document. You wouldn't use this option when reading a document file package because that would cause unnecessarily bad perfomance. For example, an application wouldn't use this option when creating file wrappers to represent attachments as it's opening a document stored in a file package.
    */
    NSFileWrapperReadingImmediate = 1 << 0,

    /* Whether file mapping for regular file wrappers is disallowed. In Mac OS 10.6 and newer NSFileWrapper only ever memory maps files on internal drives, regardless of whether this option is used. It never memory maps files onexternal drives or network volumes. You can use this option to keep NSFileWrapper from memory mapping files at all, even ones on internal drives. This is useful if you want to make sure your application doesn't hold files open (mapped files are open files) and therefore prevent the user from ejecting DVDs, unmounting disk partitions, or unmounting disk images.
    */
    NSFileWrapperReadingWithoutMapping = 1 << 1

} NS_ENUM_AVAILABLE(10_6, 4_0);

typedef NS_OPTIONS(NSUInteger, NSFileWrapperWritingOptions) {

    /* Whether writing is done atomically. You can use this option to ensure that when overwriting a file package the overwriting either completely succeeds or completely fails, with no possibility of leaving the file package in an inconsistent state. Because this option causes additional I/O you shouldn't use it unnecessarily. For example, on Mac OS X you wouldn't use this option in an override of -[NSDocument writeToURL:ofType:error:] because NSDocument's implementation of safe saving already does atomic writing.
    */
    NSFileWrapperWritingAtomic = 1 << 0,

    /* Whether descendant file wrappers are sent -setFilename: if the writing succeeds. This is necessary when your application passes original contents URLs to -writeToURL:options:originalContentsURL:error:. Without using this and reusing child file wrappers properly subsequent invocations of -writeToURL:options:originalContentsURL:error: wouldn't be able to reliably create hard links in a new file package for performance because the record of names in the old file package would be out of date.
    */
    NSFileWrapperWritingWithNameUpdating = 1 << 1

} NS_ENUM_AVAILABLE(10_6, 4_0);

extern class NSFileWrapper extends NSObject implements NSObject {


- (id)initWithURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError **)outError NS_AVAILABLE(10_6, 4_0);
- (id)initDirectoryWithFileWrappers:(NSDictionary *)childrenByPreferredName;
- (id)initRegularFileWithContents:(NSData *)contents;
- (id)initSymbolicLinkWithDestinationURL:(NSURL *)url NS_AVAILABLE(10_6, 4_0);
- (id)initWithSerializedRepresentation:(NSData *)serializeRepresentation;

- (Bool)isDirectory;
- (Bool)isRegularFile;
- (Bool)isSymbolicLink;
- (void)setPreferredFilename:(NSString *)fileName;
- (NSString *)preferredFilename;
- (void)setFilename:(NSString *)fileName;
- (NSString *)filename;
- (void)setFileAttributes:(NSDictionary *)fileAttributes;
- (NSDictionary *)fileAttributes;

- (Bool)matchesContentsOfURL:(NSURL *)url NS_AVAILABLE(10_6, 4_0);
- (Bool)readFromURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError **)outError NS_AVAILABLE(10_6, 4_0);

- (Bool)writeToURL:(NSURL *)url options:(NSFileWrapperWritingOptions)options originalContentsURL:(NSURL *)originalContentsURL error:(NSError **)outError NS_AVAILABLE(10_6, 4_0);

- (NSData *)serializedRepresentation;

- (NSString *)addFileWrapper:(NSFileWrapper *)child;
- (NSString *)addRegularFileWithContents:(NSData *)data preferredFilename:(NSString *)fileName;
- (void)removeFileWrapper:(NSFileWrapper *)child;
- (NSDictionary *)fileWrappers;
- (NSString *)keyForFileWrapper:(NSFileWrapper *)child;

- (NSData *)regularFileContents;

- (NSURL *)symbolicLinkDestinationURL NS_AVAILABLE(10_6, 4_0);

}
