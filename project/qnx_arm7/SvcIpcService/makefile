RM := rm -rf

ARCH :=../../../../../OpenHMI/tool/BuildChain/qnx_Jacinto4_Yamaha_2DF/host/win32/x86/usr/bin/ntoarmv7-

CPP_INCLUDE := -I../../../../../OpenHMI/include -I../../../source/AbstractService -I../../../source/SvcIpcService -I../../../source/SvcIpcService/jsoncpp

CPP_SRCDIR := ../../../source/SvcIpcService

CPP_SRC := $(shell find $(CPP_SRCDIR) -name "*.cpp")

CPP := $(ARCH)g++

PLATFROM_MACRO := OS_QNX

CPP_TARGETDIR := ../../../../../target/qnx/release/

CPP_TARGETDIR_DEBUG := ../../../../../target/qnx/debug/

CPP_OBJECT_MIDDLE := ../../../../../intermediate_qnx/SvcIpcService/release

CPP_OBJECT_MIDDLE_DEBUG := ../../../../../intermediate_qnx/SvcIpcService/debug

CFLAGS := -O3 -Wall -c -fmessage-length=0 -MMD -MP -fPIC -D$(PLATFROM_MACRO)

CFLAGS_DEBUG := -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -fPIC -D$(PLATFROM_MACRO)

CPP_APP_OBJECT := $(foreach filename,$(CPP_SRC:%.cpp=%.o),$(subst $(CPP_SRCDIR),$(CPP_OBJECT_MIDDLE),$(filename)))

CPP_APP_OBJECT_DEBUG := $(foreach filename,$(CPP_SRC:%.cpp=%.o),$(subst $(CPP_SRCDIR),$(CPP_OBJECT_MIDDLE_DEBUG),$(filename)))

CPP_APP_D := $(foreach filename,$(CPP_SRC:%.cpp=%.d),$(subst $(CPP_SRCDIR),$(CPP_OBJECT_MIDDLE),$(filename)))

CPP_APP_D_DEBUG := $(foreach filename,$(CPP_SRC:%.cpp=%.d),$(subst $(CPP_SRCDIR),$(CPP_OBJECT_MIDDLE_DEBUG),$(filename)))

LIBS := -lAbstractService -lOpenHMI

LIBSDIR := -L$(CPP_TARGETDIR) -L../../../../../OpenHMI/lib/qnx/Jacinto4_Yamaha_2DF/Release

LIBSDIR_DEBUG := -L$(CPP_TARGETDIR_DEBUG) -L../../../../../OpenHMI/lib/qnx/Jacinto4_Yamaha_2DF/Release

LIBSDIRFOLDER := ../../../../../OpenHMI/lib/qnx/Jacinto4_Yamaha_2DF/Release

LIBSDIRFOLDER_DEBUG := ../../../../../OpenHMI/lib/qnx/Jacinto4_Yamaha_2DF/Release

all: SvcIpcService 


release: SvcIpcService

$(CPP_APP_OBJECT): $(CPP_OBJECT_MIDDLE)%.o: $(CPP_SRCDIR)%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	mkdir -p $(dir $@)
	$(CPP) $(CPP_INCLUDE) $(CFLAGS) -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

SvcIpcService : $(CPP_APP_OBJECT)
	@echo 'Building target: $@'
	@echo 'Invoking: GCC C++ Linker'
	$(CPP) -shared -o "libSvcIpcService.so" $(CPP_APP_OBJECT) $(LIBSDIR) $(LIBS)
	mkdir -p $(CPP_TARGETDIR)
	cp -f libSvcIpcService.so $(CPP_TARGETDIR)libSvcIpcService.so
	-$(RM) libSvcIpcService.so
	@echo 'Finished building target: $@'
	@echo ' '


clean:
	-$(RM) $(CPP_APP_OBJECT) $(CPP_APP_D) $(CPP_TARGETDIR)libSvcIpcService.so
	-$(RM) $(CPP_OBJECT_MIDDLE)
	-$(RM) $(CPP_APP_OBJECT_DEBUG) $(CPP_APP_D_DEBUG) $(CPP_TARGETDIR_DEBUG)libSvcIpcService.so
	-$(RM) $(CPP_OBJECT_MIDDLE_DEBUG)

.PHONY: all clean debug release