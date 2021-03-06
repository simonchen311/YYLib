// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: ImperialFamily.proto

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

 #import "ImperialFamily.pbobjc.h"
 #import "ImperialConcubine.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdirect-ivar-access"

#pragma mark - ImperialFamilyRoot

@implementation ImperialFamilyRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - ImperialFamilyRoot_FileDescriptor

static GPBFileDescriptor *ImperialFamilyRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"Family"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - Enum gender_type

GPBEnumDescriptor *gender_type_EnumDescriptor(void) {
  static GPBEnumDescriptor *descriptor = NULL;
  if (!descriptor) {
    static const char *valueNames =
        "Male\000Female\000";
    static const int32_t values[] = {
        gender_type_Male,
        gender_type_Female,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(gender_type)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:gender_type_IsValidValue];
    if (!OSAtomicCompareAndSwapPtrBarrier(nil, worker, (void * volatile *)&descriptor)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL gender_type_IsValidValue(int32_t value__) {
  switch (value__) {
    case gender_type_Male:
    case gender_type_Female:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - emperor

@implementation emperor

@dynamic dynastyOneOfCase;
@dynamic num;
@dynamic name;
@dynamic gender;
@dynamic tang;
@dynamic song;
@dynamic yuan;
@dynamic ming;
@dynamic qing;
@dynamic concubinesArray, concubinesArray_Count;
@dynamic fatherAge;
@dynamic motherAge;
@dynamic paMotherAge;
@dynamic paFatherAge;
@dynamic preName;
@dynamic hasConc, conc;
@dynamic infomations, infomations_Count;

typedef struct emperor__storage_ {
  uint32_t _has_storage_[2];
  uint32_t num;
  gender_type gender;
  float paMotherAge;
  NSMutableArray *concubinesArray;
  NSData *preName;
  imperial_concubine *conc;
  GPBDoubleValue *song;
  NSString *yuan;
  NSString *ming;
  NSString *qing;
  GPBStringInt32Dictionary *infomations;
  int64_t name;
  uint64_t fatherAge;
  int64_t motherAge;
  double paFatherAge;
  int64_t tang;
} emperor__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "num",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_Num,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(emperor__storage_, num),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_Name,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(emperor__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSInt64,
      },
      {
        .name = "gender",
        .dataTypeSpecific.enumDescFunc = gender_type_EnumDescriptor,
        .number = emperor_FieldNumber_Gender,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(emperor__storage_, gender),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "concubinesArray",
        .dataTypeSpecific.className = GPBStringifySymbol(imperial_concubine),
        .number = emperor_FieldNumber_ConcubinesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(emperor__storage_, concubinesArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "fatherAge",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_FatherAge,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(emperor__storage_, fatherAge),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeFixed64,
      },
      {
        .name = "motherAge",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_MotherAge,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(emperor__storage_, motherAge),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeSFixed64,
      },
      {
        .name = "paMotherAge",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_PaMotherAge,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(emperor__storage_, paMotherAge),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeFloat,
      },
      {
        .name = "paFatherAge",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_PaFatherAge,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(emperor__storage_, paFatherAge),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeDouble,
      },
      {
        .name = "preName",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_PreName,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(emperor__storage_, preName),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBytes,
      },
      {
        .name = "conc",
        .dataTypeSpecific.className = GPBStringifySymbol(imperial_concubine),
        .number = emperor_FieldNumber_Conc,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(emperor__storage_, conc),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "tang",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_Tang,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(emperor__storage_, tang),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "song",
        .dataTypeSpecific.className = GPBStringifySymbol(GPBDoubleValue),
        .number = emperor_FieldNumber_Song,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(emperor__storage_, song),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "yuan",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_Yuan,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(emperor__storage_, yuan),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "ming",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_Ming,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(emperor__storage_, ming),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "qing",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_Qing,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(emperor__storage_, qing),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "infomations",
        .dataTypeSpecific.className = NULL,
        .number = emperor_FieldNumber_Infomations,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(emperor__storage_, infomations),
        .flags = GPBFieldMapKeyString,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[emperor class]
                                     rootClass:[ImperialFamilyRoot class]
                                          file:ImperialFamilyRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(emperor__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    static const char *oneofs[] = {
      "dynasty",
    };
    [localDescriptor setupOneofs:oneofs
                           count:(uint32_t)(sizeof(oneofs) / sizeof(char*))
                   firstHasIndex:-1];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\005\013D\000\014D\000\rD\000\016D\000\017D\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t emperor_Gender_RawValue(emperor *message) {
  GPBDescriptor *descriptor = [emperor descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:emperor_FieldNumber_Gender];
  return GPBGetMessageInt32Field(message, field);
}

void Setemperor_Gender_RawValue(emperor *message, int32_t value) {
  GPBDescriptor *descriptor = [emperor descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:emperor_FieldNumber_Gender];
  GPBSetInt32IvarWithFieldInternal(message, field, value, descriptor.file.syntax);
}

void emperor_ClearDynastyOneOfCase(emperor *message) {
  GPBDescriptor *descriptor = [message descriptor];
  GPBOneofDescriptor *oneof = [descriptor.oneofs objectAtIndex:0];
  GPBMaybeClearOneof(message, oneof, -1, 0);
}

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
