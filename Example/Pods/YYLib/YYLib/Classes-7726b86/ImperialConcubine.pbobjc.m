// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: ImperialConcubine.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/Wrappers.pbobjc.h>
#else
 #import "google/protobuf/Wrappers.pbobjc.h"
#endif

 #import "ImperialConcubine.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - ImperialConcubineRoot

@implementation ImperialConcubineRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - ImperialConcubineRoot_FileDescriptor

static GPBFileDescriptor *ImperialConcubineRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"Concubine"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - imperial_concubine

@implementation imperial_concubine

@dynamic num;
@dynamic name;
@dynamic hasAge, age;

typedef struct imperial_concubine__storage_ {
  uint32_t _has_storage_[1];
  uint32_t num;
  NSString *name;
  GPBDoubleValue *age;
} imperial_concubine__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "num",
        .dataTypeSpecific.className = NULL,
        .number = imperial_concubine_FieldNumber_Num,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(imperial_concubine__storage_, num),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = imperial_concubine_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(imperial_concubine__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "age",
        .dataTypeSpecific.className = GPBStringifySymbol(GPBDoubleValue),
        .number = imperial_concubine_FieldNumber_Age,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(imperial_concubine__storage_, age),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[imperial_concubine class]
                                     rootClass:[ImperialConcubineRoot class]
                                          file:ImperialConcubineRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(imperial_concubine__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
