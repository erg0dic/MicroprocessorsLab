#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Sec_dict.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Sec_dict.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=config.asm finger.asm Simple1.asm LCD.asm external_memoy.asm counter24b.asm Multiplication.asm ADC.asm simple_dac.asm keypad.asm

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/config.o ${OBJECTDIR}/finger.o ${OBJECTDIR}/Simple1.o ${OBJECTDIR}/LCD.o ${OBJECTDIR}/external_memoy.o ${OBJECTDIR}/counter24b.o ${OBJECTDIR}/Multiplication.o ${OBJECTDIR}/ADC.o ${OBJECTDIR}/simple_dac.o ${OBJECTDIR}/keypad.o
POSSIBLE_DEPFILES=${OBJECTDIR}/config.o.d ${OBJECTDIR}/finger.o.d ${OBJECTDIR}/Simple1.o.d ${OBJECTDIR}/LCD.o.d ${OBJECTDIR}/external_memoy.o.d ${OBJECTDIR}/counter24b.o.d ${OBJECTDIR}/Multiplication.o.d ${OBJECTDIR}/ADC.o.d ${OBJECTDIR}/simple_dac.o.d ${OBJECTDIR}/keypad.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/config.o ${OBJECTDIR}/finger.o ${OBJECTDIR}/Simple1.o ${OBJECTDIR}/LCD.o ${OBJECTDIR}/external_memoy.o ${OBJECTDIR}/counter24b.o ${OBJECTDIR}/Multiplication.o ${OBJECTDIR}/ADC.o ${OBJECTDIR}/simple_dac.o ${OBJECTDIR}/keypad.o

# Source Files
SOURCEFILES=config.asm finger.asm Simple1.asm LCD.asm external_memoy.asm counter24b.asm Multiplication.asm ADC.asm simple_dac.asm keypad.asm


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Sec_dict.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18f87k22
MP_LINKER_DEBUG_OPTION= 
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/config.o: config.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/config.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/config.lst\" -e\"${OBJECTDIR}/config.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/config.o\" \"config.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/config.o"
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/finger.o: finger.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/finger.o.d 
	@${RM} ${OBJECTDIR}/finger.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/finger.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/finger.lst\" -e\"${OBJECTDIR}/finger.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/finger.o\" \"finger.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/finger.o"
	@${FIXDEPS} "${OBJECTDIR}/finger.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Simple1.o: Simple1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Simple1.o.d 
	@${RM} ${OBJECTDIR}/Simple1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Simple1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Simple1.lst\" -e\"${OBJECTDIR}/Simple1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Simple1.o\" \"Simple1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Simple1.o"
	@${FIXDEPS} "${OBJECTDIR}/Simple1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/LCD.o: LCD.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LCD.o.d 
	@${RM} ${OBJECTDIR}/LCD.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/LCD.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/LCD.lst\" -e\"${OBJECTDIR}/LCD.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/LCD.o\" \"LCD.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/LCD.o"
	@${FIXDEPS} "${OBJECTDIR}/LCD.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/external_memoy.o: external_memoy.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/external_memoy.o.d 
	@${RM} ${OBJECTDIR}/external_memoy.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/external_memoy.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/external_memoy.lst\" -e\"${OBJECTDIR}/external_memoy.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/external_memoy.o\" \"external_memoy.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/external_memoy.o"
	@${FIXDEPS} "${OBJECTDIR}/external_memoy.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/counter24b.o: counter24b.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/counter24b.o.d 
	@${RM} ${OBJECTDIR}/counter24b.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/counter24b.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/counter24b.lst\" -e\"${OBJECTDIR}/counter24b.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/counter24b.o\" \"counter24b.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/counter24b.o"
	@${FIXDEPS} "${OBJECTDIR}/counter24b.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Multiplication.o: Multiplication.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Multiplication.o.d 
	@${RM} ${OBJECTDIR}/Multiplication.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Multiplication.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Multiplication.lst\" -e\"${OBJECTDIR}/Multiplication.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Multiplication.o\" \"Multiplication.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Multiplication.o"
	@${FIXDEPS} "${OBJECTDIR}/Multiplication.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/ADC.o: ADC.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC.o.d 
	@${RM} ${OBJECTDIR}/ADC.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/ADC.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/ADC.lst\" -e\"${OBJECTDIR}/ADC.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/ADC.o\" \"ADC.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/ADC.o"
	@${FIXDEPS} "${OBJECTDIR}/ADC.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/simple_dac.o: simple_dac.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/simple_dac.o.d 
	@${RM} ${OBJECTDIR}/simple_dac.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/simple_dac.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/simple_dac.lst\" -e\"${OBJECTDIR}/simple_dac.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/simple_dac.o\" \"simple_dac.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/simple_dac.o"
	@${FIXDEPS} "${OBJECTDIR}/simple_dac.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/keypad.o: keypad.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/keypad.o.d 
	@${RM} ${OBJECTDIR}/keypad.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/keypad.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/keypad.lst\" -e\"${OBJECTDIR}/keypad.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/keypad.o\" \"keypad.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/keypad.o"
	@${FIXDEPS} "${OBJECTDIR}/keypad.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
else
${OBJECTDIR}/config.o: config.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/config.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/config.lst\" -e\"${OBJECTDIR}/config.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/config.o\" \"config.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/config.o"
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/finger.o: finger.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/finger.o.d 
	@${RM} ${OBJECTDIR}/finger.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/finger.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/finger.lst\" -e\"${OBJECTDIR}/finger.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/finger.o\" \"finger.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/finger.o"
	@${FIXDEPS} "${OBJECTDIR}/finger.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Simple1.o: Simple1.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Simple1.o.d 
	@${RM} ${OBJECTDIR}/Simple1.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Simple1.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Simple1.lst\" -e\"${OBJECTDIR}/Simple1.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Simple1.o\" \"Simple1.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Simple1.o"
	@${FIXDEPS} "${OBJECTDIR}/Simple1.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/LCD.o: LCD.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LCD.o.d 
	@${RM} ${OBJECTDIR}/LCD.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/LCD.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/LCD.lst\" -e\"${OBJECTDIR}/LCD.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/LCD.o\" \"LCD.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/LCD.o"
	@${FIXDEPS} "${OBJECTDIR}/LCD.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/external_memoy.o: external_memoy.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/external_memoy.o.d 
	@${RM} ${OBJECTDIR}/external_memoy.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/external_memoy.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/external_memoy.lst\" -e\"${OBJECTDIR}/external_memoy.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/external_memoy.o\" \"external_memoy.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/external_memoy.o"
	@${FIXDEPS} "${OBJECTDIR}/external_memoy.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/counter24b.o: counter24b.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/counter24b.o.d 
	@${RM} ${OBJECTDIR}/counter24b.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/counter24b.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/counter24b.lst\" -e\"${OBJECTDIR}/counter24b.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/counter24b.o\" \"counter24b.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/counter24b.o"
	@${FIXDEPS} "${OBJECTDIR}/counter24b.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Multiplication.o: Multiplication.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Multiplication.o.d 
	@${RM} ${OBJECTDIR}/Multiplication.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Multiplication.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Multiplication.lst\" -e\"${OBJECTDIR}/Multiplication.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Multiplication.o\" \"Multiplication.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Multiplication.o"
	@${FIXDEPS} "${OBJECTDIR}/Multiplication.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/ADC.o: ADC.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC.o.d 
	@${RM} ${OBJECTDIR}/ADC.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/ADC.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/ADC.lst\" -e\"${OBJECTDIR}/ADC.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/ADC.o\" \"ADC.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/ADC.o"
	@${FIXDEPS} "${OBJECTDIR}/ADC.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/simple_dac.o: simple_dac.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/simple_dac.o.d 
	@${RM} ${OBJECTDIR}/simple_dac.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/simple_dac.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/simple_dac.lst\" -e\"${OBJECTDIR}/simple_dac.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/simple_dac.o\" \"simple_dac.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/simple_dac.o"
	@${FIXDEPS} "${OBJECTDIR}/simple_dac.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/keypad.o: keypad.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/keypad.o.d 
	@${RM} ${OBJECTDIR}/keypad.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/keypad.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/keypad.lst\" -e\"${OBJECTDIR}/keypad.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/keypad.o\" \"keypad.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/keypad.o"
	@${FIXDEPS} "${OBJECTDIR}/keypad.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Sec_dict.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w -x -u_DEBUG -z__ICD2RAM=1 -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_ICD3=1 $(MP_LINKER_DEBUG_OPTION) -odist/${CND_CONF}/${IMAGE_TYPE}/Sec_dict.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/Sec_dict.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -odist/${CND_CONF}/${IMAGE_TYPE}/Sec_dict.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
