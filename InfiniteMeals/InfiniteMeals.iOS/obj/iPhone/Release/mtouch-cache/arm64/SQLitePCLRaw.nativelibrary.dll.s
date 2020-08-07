.subsections_via_symbols
.section __DWARF, __debug_line,regular,debug
Ldebug_line_section_start:
Ldebug_line_start:
.section __DWARF, __debug_abbrev,regular,debug

	.byte 1,17,1,37,8,3,8,27,8,19,11,17,1,18,1,16,6,0,0,2,46,1,3,8,135,64,8,58,15,59,15,17
	.byte 1,18,1,64,10,0,0,3,5,0,3,8,73,19,2,10,0,0,15,5,0,3,8,73,19,2,6,0,0,4,36,0
	.byte 11,11,62,11,3,8,0,0,5,2,1,3,8,11,15,0,0,17,2,0,3,8,11,15,0,0,6,13,0,3,8,73
	.byte 19,56,10,0,0,7,22,0,3,8,73,19,0,0,8,4,1,3,8,11,15,73,19,0,0,9,40,0,3,8,28,13
	.byte 0,0,10,57,1,3,8,0,0,11,52,0,3,8,73,19,2,10,0,0,12,52,0,3,8,73,19,2,6,0,0,13
	.byte 15,0,73,19,0,0,14,16,0,73,19,0,0,16,28,0,73,19,56,10,0,0,18,46,0,3,8,17,1,18,1,0
	.byte 0,0
.section __DWARF, __debug_info,regular,debug
Ldebug_info_start:

LDIFF_SYM0=Ldebug_info_end - Ldebug_info_begin
	.long LDIFF_SYM0
Ldebug_info_begin:

	.short 2
	.long 0
	.byte 8,1
	.asciz "Mono AOT Compiler 6.12.0 (2020-02/165f4b03417 Wed Apr  8 09:02:28 EDT 2020)"
	.asciz "SQLitePCLRaw.nativelibrary.dll"
	.asciz ""

	.byte 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
LDIFF_SYM1=Ldebug_line_start - Ldebug_line_section_start
	.long LDIFF_SYM1
LDIE_I1:

	.byte 4,1,5
	.asciz "sbyte"
LDIE_U1:

	.byte 4,1,7
	.asciz "byte"
LDIE_I2:

	.byte 4,2,5
	.asciz "short"
LDIE_U2:

	.byte 4,2,7
	.asciz "ushort"
LDIE_I4:

	.byte 4,4,5
	.asciz "int"
LDIE_U4:

	.byte 4,4,7
	.asciz "uint"
LDIE_I8:

	.byte 4,8,5
	.asciz "long"
LDIE_U8:

	.byte 4,8,7
	.asciz "ulong"
LDIE_I:

	.byte 4,8,5
	.asciz "intptr"
LDIE_U:

	.byte 4,8,7
	.asciz "uintptr"
LDIE_R4:

	.byte 4,4,4
	.asciz "float"
LDIE_R8:

	.byte 4,8,4
	.asciz "double"
LDIE_BOOLEAN:

	.byte 4,1,2
	.asciz "boolean"
LDIE_CHAR:

	.byte 4,2,8
	.asciz "char"
LDIE_STRING:

	.byte 4,8,1
	.asciz "string"
LDIE_OBJECT:

	.byte 4,8,1
	.asciz "object"
LDIE_SZARRAY:

	.byte 4,8,1
	.asciz "object"
.section __DWARF, __debug_loc,regular,debug
Ldebug_loc_start:
.section __DWARF, __debug_frame,regular,debug
	.align 3

LDIFF_SYM2=Lcie0_end - Lcie0_start
	.long LDIFF_SYM2
Lcie0_start:

	.long -1
	.byte 3
	.asciz ""

	.byte 1,120,30
	.align 3
Lcie0_end:
.text
	.align 3
jit_code_start:

	.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_Load_string_System_Reflection_Assembly_int
SQLitePCL_NativeLibrary_Load_string_System_Reflection_Assembly_int:
.file 1 "<unknown>"
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xf90013a0
.word 0xf90017a1
.word 0xaa0203fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #200]
.word 0xf9400000
.word 0xaa0003e1
.word 0xf94013a2
.word 0xf9001ba2
.word 0xf94017a2
.word 0xf9001fa2
.word 0xaa1a03f9
.word 0xaa0103fa
.word 0xb5000720

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #208]
.word 0xf9400000
.word 0xf9002ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000b80

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2801001
bl _p_1
.word 0xf90027a0
.word 0xf9402ba1
.word 0xeb1f003f
.word 0x10000011
.word 0x540009e0
.word 0xd5033bbf
.word 0xf94027a0
.word 0xf9001001
.word 0x91008002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #224]
.word 0xf9001401

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #232]
.word 0xf9002001

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #240]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0x3901c01f
.word 0xf90023a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #200]
.word 0xd5033bbf
.word 0xf94023a0
.word 0xf9000020
.word 0xaa0003fa
.word 0xf9401ba0
.word 0xf9401fa1
.word 0xaa1903e2
.word 0xaa1a03e3
bl _p_2
.word 0xaa0003e1

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x2, [x16, #248]
.word 0xf9400042
.word 0xeb02001f
.word 0x9a9f17e0
.word 0x53001c00
.word 0xaa0103fa
.word 0x350000c0
.word 0xaa1a03e0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2800021
bl _p_3
.word 0xf90023a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2800261
bl _p_3
.word 0xaa0003e2
.word 0xf94023a0
.word 0xf94013a1
bl _p_4
.word 0xaa0003e1
.word 0xd28028e0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_5
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_6
.word 0xd2800f60
.word 0xaa1103e1
bl _p_6

Lme_0:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_MyGetExport_intptr_string
SQLitePCL_NativeLibrary_MyGetExport_intptr_string:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9000fa0
.word 0xf90013a1
bl _p_7
.word 0x93407c00
.word 0xaa0003f8
.word 0xaa1803e0
.word 0x350000a0
.word 0xf9400fa0
.word 0xf94013a1
bl _p_8
.word 0x1400000c
.word 0xd280003e
.word 0x6b1e031f
.word 0x540000a1
.word 0xf9400fa0
.word 0xf94013a1
bl _p_9
.word 0x14000005
.word 0xd2801b80
.word 0xf2a04000
bl _mono_create_corlib_exception_0
bl _p_5
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_1:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_GetExport_intptr_string
SQLitePCL_NativeLibrary_GetExport_intptr_string:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xf90013a1
.word 0xf9400fa0
.word 0xf94013a1
bl _p_10
.word 0xaa0003e1

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x2, [x16, #248]
.word 0xf9400042
.word 0xeb02001f
.word 0x9a9f17e0
.word 0x53001c00
.word 0xaa0103f9
.word 0x350000c0
.word 0xaa1903e0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2800521
bl _p_3
.word 0xf9001ba0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2800261
bl _p_3
.word 0xaa0003e2
.word 0xf9401ba0
.word 0xf94013a1
bl _p_4
.word 0xaa0003e1
.word 0xd28028e0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_5

Lme_2:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_Free_intptr
SQLitePCL_NativeLibrary_Free_intptr:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
bl _p_7
.word 0x93407c00
.word 0xaa0003f9
.word 0xaa1903e0
.word 0x35000080
.word 0xf9400fa0
bl _p_11
.word 0x1400000c
.word 0xd280003e
.word 0x6b1e033f
.word 0x540000a1
.word 0xf9400fa0
bl _p_12
.word 0x93407c00
.word 0x14000005
.word 0xd2801b80
.word 0xf2a04000
bl _mono_create_corlib_exception_0
bl _p_5
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_3:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_TryLoad_string_System_Reflection_Assembly_int_intptr_
SQLitePCL_NativeLibrary_TryLoad_string_System_Reflection_Assembly_int_intptr_:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xf90013b9
.word 0xf90017a0
.word 0xf9001ba1
.word 0xaa0203f9
.word 0xf9001fa3

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #256]
.word 0xf9400000
.word 0xaa0003e1
.word 0xf94017a2
.word 0xf90023a2
.word 0xf9401bb7
.word 0xaa1903f8
.word 0xaa0103f9
.word 0xb5000720

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #208]
.word 0xf9400000
.word 0xf90033a0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000900

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2801001
bl _p_1
.word 0xf9002fa0
.word 0xf94033a1
.word 0xeb1f003f
.word 0x10000011
.word 0x54000760
.word 0xd5033bbf
.word 0xf9402fa0
.word 0xf9001001
.word 0x91008002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #264]
.word 0xf9001401

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #272]
.word 0xf9002001

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #280]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0x3901c01f
.word 0xf9002ba0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #256]
.word 0xd5033bbf
.word 0xf9402ba0
.word 0xf9000020
.word 0xaa0003f9
.word 0xf94023a0
.word 0xaa1703e1
.word 0xaa1803e2
.word 0xaa1903e3
bl _p_2
.word 0xaa0003f9
.word 0xf9401fa0
.word 0xf9000019

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #248]
.word 0xf9400001
.word 0xaa1903e0
bl _p_13
.word 0x53001c00
.word 0xa94163b7
.word 0xf94013b9
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_6
.word 0xd2800f60
.word 0xaa1103e1
bl _p_6

Lme_4:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_TryGetExport_intptr_string_intptr_
SQLitePCL_NativeLibrary_TryGetExport_intptr_string_intptr_:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_10
.word 0xf94013a1
.word 0xf9000020

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #248]
.word 0xf9400021
bl _p_13
.word 0x53001c00
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_5:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_basename_to_libname_string_SQLitePCL_NativeLibrary_LibSuffix
SQLitePCL_NativeLibrary_basename_to_libname_string_SQLitePCL_NativeLibrary_LibSuffix:
.loc 1 1 0
.word 0xa9b77bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xb9801ba0
.word 0xf90013a0
.word 0xb9801ba0
.word 0xd280007e
.word 0x6b1e001f
.word 0x54000382
.word 0xf94013a0
.word 0xd37df000
.word 0x2a0003e1

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #288]
.word 0x8b010000
.word 0xf9400000
.word 0xd61f0000

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #296]
.word 0xf9400ba1
bl _p_14
.word 0x14000011

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #304]
.word 0xf9400ba1
bl _p_14
.word 0x1400000b

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #312]
.word 0xf9400ba1
bl _p_14
.word 0x14000005
.word 0xd2801b80
.word 0xf2a04000
bl _mono_create_corlib_exception_0
bl _p_5
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_6:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_TryLoad_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_intptr_
SQLitePCL_NativeLibrary_TryLoad_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_intptr_:
.loc 1 1 0
.word 0xa9af7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf90013a2
.word 0xf90017a3
.word 0x3900c3bf
.word 0xf9001fbf
.word 0x3500081a
.word 0xf94013a0
.word 0xf90077a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #320]
.word 0xaa1903e1
bl _p_15
.word 0xaa0003e1
.word 0xf94077a2
.word 0xaa0203e0
.word 0xf90073a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94073a0
.word 0xaa1903e0
bl _p_16
.word 0xaa0003fa
.word 0xaa1a03e0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #248]
.word 0xf9400021
bl _p_13
.word 0x53001c00
.word 0x34000380
.word 0xf94013a0
.word 0xf90077a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #328]
.word 0xf9007ba0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #336]
.word 0xd2800301
bl _p_1
.word 0xaa0003e1
.word 0xf9407ba0
.word 0xf900083a
bl _p_14
.word 0xaa0003e1
.word 0xf94077a2
.word 0xaa0203e0
.word 0xf90073a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94073a0
.word 0xf94017a0
.word 0xf900001a
.word 0xd2800020
.word 0x3900c3a0
.word 0x14000074
bl _p_17
.word 0x93407c00

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2801301
bl _p_1
.word 0xf90073a0
bl _p_18
.word 0xf94073a0
bl _p_5
.word 0xd280003e
.word 0x6b1e035f
.word 0x540007e1
.word 0xf94013a0
.word 0xf90083a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xaa1903e1
bl _p_15
.word 0xaa0003e1
.word 0xf94083a2
.word 0xaa0203e0
.word 0xf9007fa2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf9407fa0
.word 0xaa1903e0
.word 0xd2800041
bl _p_19
.word 0xaa0003fa
.word 0xf94013a0
.word 0xf90077a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #360]
.word 0xf9007ba0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #336]
.word 0xd2800301
bl _p_1
.word 0xaa0003e1
.word 0xf9407ba0
.word 0xf900083a
bl _p_14
.word 0xaa0003e1
.word 0xf94077a2
.word 0xaa0203e0
.word 0xf90073a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94073a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #248]
.word 0xf9400001
.word 0xaa1a03e0
bl _p_13
.word 0x53001c00
.word 0x340000c0
.word 0xf94017a0
.word 0xf900001a
.word 0xd2800020
.word 0x3900c3a0
.word 0x14000031
.word 0xf94017a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #248]
.word 0xf9400021
.word 0xf9000001
.word 0xd2800000
.word 0x3900c3a0
.word 0x14000028
.word 0xd2801b80
.word 0xf2a04000
bl _mono_create_corlib_exception_0
bl _p_5
.word 0xf90023a0
.word 0xf94023a0
bl _p_20
.word 0xf90027a0
.word 0xf94027a0
.word 0xf9001fa0
.word 0xf94013a0
.word 0xf90077a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #368]
.word 0xf9401fa1
bl _p_14
.word 0xaa0003e1
.word 0xf94077a2
.word 0xaa0203e0
.word 0xf90073a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94073a0
.word 0xf94017a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #248]
.word 0xf9400021
.word 0xf9000001
.word 0xd2800000
.word 0x3900c3a0
bl _p_21
.word 0xf9006ba0
.word 0xf9406ba0
.word 0xb4000060
.word 0xf9406ba0
bl _p_5
.word 0x14000001
.word 0x3940c3a0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8d17bfd
.word 0xd65f03c0

Lme_7:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_WhichLoader
SQLitePCL_NativeLibrary_WhichLoader:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #376]
.word 0x3980b410
.word 0xb5000050
bl _p_22

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #384]
.word 0xf9400000
.word 0xf90013a0
.word 0xf94013a0
bl _p_23
.word 0x53001c00
.word 0x34000060
.word 0xd2800000
.word 0x14000027

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #376]
.word 0x3980b410
.word 0xb5000050
bl _p_22

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #392]
.word 0xf9400000
.word 0xf9000fa0
.word 0xf9400fa0
bl _p_23
.word 0x53001c00
.word 0x34000060
.word 0xd2800020
.word 0x14000016

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #376]
.word 0x3980b410
.word 0xb5000050
bl _p_22

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #400]
.word 0xf9400000
.word 0xf9000ba0
.word 0xf9400ba0
bl _p_23
.word 0x53001c00
.word 0x34000060
.word 0xd2800020
.word 0x14000005
.word 0xd2801b80
.word 0xf2a04000
bl _mono_create_corlib_exception_0
bl _p_5
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_8:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_WhichLibSuffix
SQLitePCL_NativeLibrary_WhichLibSuffix:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #376]
.word 0x3980b410
.word 0xb5000050
bl _p_22

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #384]
.word 0xf9400000
.word 0xf90013a0
.word 0xf94013a0
bl _p_23
.word 0x53001c00
.word 0x34000060
.word 0xd2800000
.word 0x14000027

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #376]
.word 0x3980b410
.word 0xb5000050
bl _p_22

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #392]
.word 0xf9400000
.word 0xf9000fa0
.word 0xf9400fa0
bl _p_23
.word 0x53001c00
.word 0x34000060
.word 0xd2800040
.word 0x14000016

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #376]
.word 0x3980b410
.word 0xb5000050
bl _p_22

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #400]
.word 0xf9400000
.word 0xf9000ba0
.word 0xf9400ba0
bl _p_23
.word 0x53001c00
.word 0x34000060
.word 0xd2800020
.word 0x14000005
.word 0xd2801b80
.word 0xf2a04000
bl _mono_create_corlib_exception_0
bl _p_5
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_9:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_get_rid_front
SQLitePCL_NativeLibrary_get_rid_front:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #376]
.word 0x3980b410
.word 0xb5000050
bl _p_22

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #384]
.word 0xf9400000
.word 0xf90013a0
.word 0xf94013a0
bl _p_23
.word 0x53001c00
.word 0x340000a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #408]
.word 0x1400002b

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #376]
.word 0x3980b410
.word 0xb5000050
bl _p_22

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #392]
.word 0xf9400000
.word 0xf9000fa0
.word 0xf9400fa0
bl _p_23
.word 0x53001c00
.word 0x340000a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #416]
.word 0x14000018

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #376]
.word 0x3980b410
.word 0xb5000050
bl _p_22

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #400]
.word 0xf9400000
.word 0xf9000ba0
.word 0xf9400ba0
bl _p_23
.word 0x53001c00
.word 0x340000a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #424]
.word 0x14000005
.word 0xd2801b80
.word 0xf2a04000
bl _mono_create_corlib_exception_0
bl _p_5
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_a:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_get_rid_back
SQLitePCL_NativeLibrary_get_rid_back:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
bl _p_24
.word 0x93407c00
.word 0xaa0003fa
.word 0xd280009e
.word 0x6b1e035f
.word 0x54000382
.word 0xd37df340
.word 0x2a0003e1

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #432]
.word 0x8b010000
.word 0xf9400000
.word 0xd61f0000

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #440]
.word 0x14000014

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #448]
.word 0x14000010
.word 0xd2800100
.word 0xd280011e
.word 0x6b1e001f

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #456]
.word 0x14000009

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #464]
.word 0x14000005
.word 0xd2801b80
.word 0xf2a04000
bl _mono_create_corlib_exception_0
bl _p_5
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_b:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_get_rid
SQLitePCL_NativeLibrary_get_rid:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
bl _p_25
.word 0xf9000ba0
bl _p_26
.word 0xaa0003e2
.word 0xf9400ba0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #472]
bl _p_4
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_c:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_Search_System_Collections_Generic_IList_1_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_string__intptr_
SQLitePCL_NativeLibrary_Search_System_Collections_Generic_IList_1_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_string__intptr_:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xf90013b8
.word 0xf90017ba
.word 0xaa0003f6
.word 0xaa0103f7
.word 0xaa0203f8
.word 0xf9001ba3
.word 0xaa0403fa
.word 0xf9001fbf
.word 0xf90023bf
.word 0xaa1603e0
.word 0xf94002c1

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x15, [x16, #480]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001fa0
.word 0x1400002a
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x15, [x16, #488]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f6
.word 0xaa1603e0
.word 0xaa1703e1
.word 0xaa1803e2
.word 0x910103a3
bl _p_27
.word 0x53001c00
.word 0x34000300
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000016
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.word 0xf94023a0
.word 0xf9000340
.word 0xd2800020
.word 0x53001c1a
.word 0xf90027bf
.word 0x94000017
.word 0xf94027a0
.word 0xb4000040
bl _p_28
.word 0x1400002c
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x15, [x16, #496]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff980
.word 0xf90027bf
.word 0x94000005
.word 0xf94027a0
.word 0xb4000040
bl _p_28
.word 0x14000010
.word 0xf9002bbe
.word 0xf9401fa0
.word 0xb4000160
.word 0xf9401fa1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x15, [x16, #504]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9402bbe
.word 0xd61f03c0
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf900001f

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #248]
.word 0xf9400000
.word 0xf9000340
.word 0xd2800000
.word 0x14000002
.word 0xaa1a03e0
.word 0xa9415fb6
.word 0xf94013b8
.word 0xf94017ba
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_d:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_MakePossibilitiesFor_string_System_Reflection_Assembly_int_SQLitePCL_NativeLibrary_LibSuffix
SQLitePCL_NativeLibrary_MakePossibilitiesFor_string_System_Reflection_Assembly_int_SQLitePCL_NativeLibrary_LibSuffix:
.loc 1 1 0
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90153b3
.word 0xa9025bb5
.word 0xa90363b7
.word 0xa9046bb9
.word 0xaa0003f7
.word 0xaa0103f8
.word 0xaa0203f9
.word 0xaa0303fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #512]
.word 0xd2800501
bl _p_1

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #520]
.word 0xf9400021
.word 0xf9002ba0
.word 0x91004002
.word 0xd5033bbf
.word 0xf9402ba0
.word 0xf9000041
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xaa0003f6
.word 0xaa1703e0
.word 0xaa1a03e1
bl _p_29
.word 0xaa0003fa
.word 0xd280003e
.word 0xa1e0320
.word 0x34000320
.word 0xaa1603f7
.word 0xaa1a03f5
.word 0x394002de
.word 0xb98026c0
.word 0x11000400
.word 0xb90026c0
.word 0xf9400ad4
.word 0xb98022d3
.word 0xaa1303e0
.word 0xb9801a81
.word 0x6b01001f
.word 0x54000142
.word 0x11000660
.word 0xb90022e0
.word 0xaa1403e0
.word 0xaa1303e1
.word 0xaa1503e2
.word 0xf9400283
.word 0xf9408470
.word 0xd63f0200
.word 0x14000004
.word 0xaa1703e0
.word 0xaa1503e1
bl _p_30
.word 0xd280005e
.word 0xa1e0320
.word 0x34000b20
bl _p_31
.word 0xaa0003f7
.word 0xaa1803e0
.word 0xf9400301
.word 0xf9409030
.word 0xd63f0200
bl _p_32
.word 0xaa0003f5

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #528]
.word 0xd28000a1
bl _p_33
.word 0xaa0003e3
.word 0xaa0303e0
.word 0xf9003ba0
.word 0xaa0303e0
.word 0xd2800001
.word 0xaa1503e2
.word 0xf9400063
.word 0xf9408470
.word 0xd63f0200
.word 0xf9403ba3
.word 0xaa0303e0
.word 0xf90037a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x2, [x16, #536]
.word 0xaa0303e0
.word 0xd2800021
.word 0xf9400063
.word 0xf9408470
.word 0xd63f0200
.word 0xf94037a3
.word 0xaa0303e0
.word 0xf90033a0
.word 0xaa0303e0
.word 0xd2800041
.word 0xaa1703e2
.word 0xf9400063
.word 0xf9408470
.word 0xd63f0200
.word 0xf94033a3
.word 0xaa0303e0
.word 0xf9002fa0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x2, [x16, #544]
.word 0xaa0303e0
.word 0xd2800061
.word 0xf9400063
.word 0xf9408470
.word 0xd63f0200
.word 0xf9402fa3
.word 0xaa0303e0
.word 0xf9002ba0
.word 0xaa0303e0
.word 0xd2800081
.word 0xaa1a03e2
.word 0xf9400063
.word 0xf9408470
.word 0xd63f0200
.word 0xf9402ba0
bl _p_34
.word 0xaa1603f7
.word 0xaa0003f5
.word 0x394002de
.word 0xb98026c0
.word 0x11000400
.word 0xb90026c0
.word 0xf9400ad4
.word 0xb98022d3
.word 0xaa1303e0
.word 0xb9801a81
.word 0x6b01001f
.word 0x54000142
.word 0x11000660
.word 0xb90022e0
.word 0xaa1403e0
.word 0xaa1303e1
.word 0xaa1503e2
.word 0xf9400283
.word 0xf9408470
.word 0xd63f0200
.word 0x14000004
.word 0xaa1703e0
.word 0xaa1503e1
bl _p_30
.word 0xd280009e
.word 0xa1e0320
.word 0x340004a0
.word 0xaa1803e0
.word 0xf9400301
.word 0xf9409030
.word 0xd63f0200
bl _p_32
.word 0xaa0003f9
bl _p_26
.word 0xaa0003f8
.word 0xaa1903e0
.word 0xaa1803e1
.word 0xaa1a03e2
bl _p_35
.word 0xaa1603fa
.word 0xaa0003f9
.word 0x394002de
.word 0xb98026c0
.word 0x11000400
.word 0xb90026c0
.word 0xf9400ad8
.word 0xb98022d7
.word 0xaa1703e0
.word 0xb9801b01
.word 0x6b01001f
.word 0x54000142
.word 0x110006e0
.word 0xb9002340
.word 0xaa1803e0
.word 0xaa1703e1
.word 0xaa1903e2
.word 0xf9400303
.word 0xf9408470
.word 0xd63f0200
.word 0x14000004
.word 0xaa1a03e0
.word 0xaa1903e1
bl _p_30
.word 0xaa1603e0
.word 0xa94153b3
.word 0xa9425bb5
.word 0xa94363b7
.word 0xa9446bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0

Lme_e:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary_MyLoad_string_System_Reflection_Assembly_int_System_Action_1_string
SQLitePCL_NativeLibrary_MyLoad_string_System_Reflection_Assembly_int_System_Action_1_string:
.loc 1 1 0
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9000bb6
.word 0xa901e7b8
.word 0xf90017ba
.word 0xf9001ba0
.word 0xaa0103f8
.word 0xaa0203f9
.word 0xaa0303fa
.word 0xf9002bbf
.word 0xf9002fbf
.word 0xd2800000
.word 0xf9001fa0
.word 0xf90023a0
.word 0xf90027a0
bl _p_7
.word 0x93407c00
.word 0xaa0003f6

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #552]
.word 0xf9004fa0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #560]
.word 0xd2800281
bl _p_1
.word 0xaa0003e1
.word 0xf9404fa0
.word 0xb9001036
bl _p_14
.word 0xaa0003e1
.word 0xaa1a03e0
.word 0xf9400f50
.word 0xd63f0200
bl _p_36
.word 0x93407c00
.word 0xf9004ba0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #568]
.word 0xf90047a0

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #576]
.word 0xd2800281
bl _p_1
.word 0xaa0003e1
.word 0xf94047a0
.word 0xf9404ba2
.word 0xf90043a2
.word 0xb9001022
bl _p_14
.word 0xaa0003e1
.word 0xaa1a03e0
.word 0xf9400f50
.word 0xd63f0200
.word 0xf94043a3
.word 0xf9401ba0
.word 0xaa1803e1
.word 0xaa1903e2
bl _p_37
.word 0xaa0003f9

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #584]
.word 0xaa1a03e0
.word 0xf9400f50
.word 0xd63f0200
.word 0x9100e3a8
.word 0xaa1903e0
.word 0x3940033e
bl _p_38
.word 0x1400000e

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #592]
.word 0xf94027b8

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #600]
.word 0xaa1803e1
bl _p_15
.word 0xaa0003e1
.word 0xaa1a03e0
.word 0xf9400f50
.word 0xd63f0200

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x15, [x16, #592]
.word 0x9100e3a0
bl _p_39
.word 0x53001c00
.word 0x35fffda0
.word 0xf90033bf
.word 0x94000005
.word 0xf94033a0
.word 0xb4000040
bl _p_28
.word 0x14000009
.word 0xf9003bbe

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #592]
.word 0x9100e3a0
.word 0xf90037a0
.word 0xf9403bbe
.word 0xd61f03c0
.word 0xaa1903e0
.word 0xaa1603e1
.word 0xaa1a03e2
.word 0x910143a3
.word 0x910163a4
bl _p_40
.word 0x53001c00
.word 0x34000180

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #608]
.word 0xf9402ba1
bl _p_15
.word 0xaa0003e1
.word 0xaa1a03e0
.word 0xf9400f50
.word 0xd63f0200
.word 0xf9402fa0
.word 0x1400000b

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x1, [x16, #616]
.word 0xaa1a03e0
.word 0xf9400f50
.word 0xd63f0200

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #248]
.word 0xf9400000
.word 0xf9400bb6
.word 0xa941e7b8
.word 0xf94017ba
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_f:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary__c__cctor
SQLitePCL_NativeLibrary__c__cctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #624]
.word 0xd2800201
bl _p_1
.word 0xaa0003e1

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #208]
.word 0xf9000ba0
.word 0xd5033bbf
.word 0xf9400ba0
.word 0xf9000001
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_16:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary__c__ctor
SQLitePCL_NativeLibrary__c__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_17:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary__c__Loadb__7_0_string
SQLitePCL_NativeLibrary__c__Loadb__7_0_string:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_18:
.text
	.align 4
	.no_dead_strip SQLitePCL_NativeLibrary__c__TryLoadb__11_0_string
SQLitePCL_NativeLibrary__c__TryLoadb__11_0_string:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_19:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string
wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x350006a0
.word 0x14000001
.word 0xf9403f38
.word 0xaa1803e0
.word 0xb50001e0
.word 0xf9401338
.word 0xaa1803e0
.word 0xb40000e0
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001d
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x14000018
.word 0xb9801b00
.word 0xaa0003f9
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a0
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffdab
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0x91022300
.word 0xd280003e
.word 0xb900001e
.word 0xaa1803e0
bl _p_20
bl _p_41
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffca
.word 0xd28018c0
.word 0xaa1103e1
bl _p_6

Lme_1b:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string
wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000740
.word 0x14000001
.word 0xf9403f38
.word 0xaa1803e0
.word 0xb5000220
.word 0xf9401338
.word 0xaa1803e0
.word 0xb4000100
.word 0xf9401f20
.word 0xf9400b22
.word 0xaa1803e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x53001c00
.word 0x14000021
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x53001c00
.word 0x1400001b
.word 0xb9801b00
.word 0xaa0003f9
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000449
.word 0xd37df000
.word 0x8b000300
.word 0x91008000
.word 0xf9400016
.word 0xaa1603e2
.word 0xaa0203e0
.word 0xaa1a03e1
.word 0xf90023a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94023a1
.word 0x53001c00
.word 0x53001c16
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd6b
.word 0xaa1603e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0x91022300
.word 0xd280003e
.word 0xb900001e
.word 0xaa1803e0
bl _p_20
bl _p_41
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffc5
.word 0xd28018c0
.word 0xaa1103e1
bl _p_6

Lme_1c:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string
wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x350007a0
.word 0x14000001
.word 0xf9403f17
.word 0xaa1703e0
.word 0xb5000260
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000120
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x93407c00
.word 0x14000023
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x93407c00
.word 0x1400001c
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000469
.word 0xd37df000
.word 0x8b0002e0
.word 0x91008000
.word 0xf9400015
.word 0xaa1503e3
.word 0xaa0303e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xf90023a3
.word 0xf9400c70
.word 0xd63f0200
.word 0x93407c00
.word 0xf94023a1
.word 0xaa0003f5
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd4b
.word 0xaa1503e0
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0x910222e0
.word 0xd280003e
.word 0xb900001e
.word 0xaa1703e0
bl _p_20
bl _p_41
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffc2
.word 0xd28018c0
.word 0xaa1103e1
bl _p_6

Lme_1d:
.text
	.align 4
	.no_dead_strip wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int
wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int:
.loc 1 1 0
.word 0xa9b57bfd
.word 0x910003fd
.word 0x1000001e
.word 0xf9001bbe
.word 0xa903d3b3
.word 0xa904dbb5
.word 0xa905e3b7
.word 0xa906ebb9
.word 0xa907f3bb
.word 0xf90047bd
.word 0x910003f1
.word 0xf9004bb1
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #80]
.word 0xd63f0000
.word 0xaa0003f8
.word 0x910083a0
.word 0xf9400301
.word 0xf90013a1
.word 0xf9000300
.word 0xaa1903e0
bl _p_42
.word 0xaa0003f9

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #632]
.word 0x910063a0
bl _mono_threads_enter_gc_safe_region_unbalanced
.word 0xf90057a0
.word 0xaa1903e0
.word 0xaa1a03e1
bl _p_43
.word 0xaa0003e1
.word 0xf94057a0
.word 0xf90053a1
.word 0x910043a1
bl _mono_threads_exit_gc_safe_region_unbalanced
.word 0xf94053a0
.word 0xaa0003fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000220
.word 0x14000001
.word 0xaa1903e0
bl _p_44
.word 0xf94013a0
.word 0xf9000300
.word 0xaa1a03e0
.word 0xa945e3b7
.word 0xa946ebb9
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0
.word 0x910222e0
.word 0xd280003e
.word 0xb900001e
.word 0xaa1703e0
bl _p_20
bl _p_41
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffee

Lme_1e:
.text
	.align 4
	.no_dead_strip wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string
wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string:
.loc 1 1 0
.word 0xa9b57bfd
.word 0x910003fd
.word 0x1000001e
.word 0xf9001bbe
.word 0xa903d3b3
.word 0xa904dbb5
.word 0xa905e3b7
.word 0xa906ebb9
.word 0xa907f3bb
.word 0xf90047bd
.word 0x910003f1
.word 0xf9004bb1
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #80]
.word 0xd63f0000
.word 0xaa0003f8
.word 0x910083a0
.word 0xf9400301
.word 0xf90013a1
.word 0xf9000300
.word 0xaa1a03e0
bl _p_42
.word 0xaa0003fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #640]
.word 0x910063a0
bl _mono_threads_enter_gc_safe_region_unbalanced
.word 0xf90057a0
.word 0xaa1903e0
.word 0xaa1a03e1
bl _p_45
.word 0xaa0003e1
.word 0xf94057a0
.word 0xf90053a1
.word 0x910043a1
bl _mono_threads_exit_gc_safe_region_unbalanced
.word 0xf94053a0
.word 0xaa0003f9

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000220
.word 0x14000001
.word 0xaa1a03e0
bl _p_44
.word 0xf94013a0
.word 0xf9000300
.word 0xaa1903e0
.word 0xa945e3b7
.word 0xa946ebb9
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0
.word 0x910222e0
.word 0xd280003e
.word 0xb900001e
.word 0xaa1703e0
bl _p_20
bl _p_41
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffee

Lme_1f:
.text
	.align 4
	.no_dead_strip wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr
wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr:
.loc 1 1 0
.word 0xa9b57bfd
.word 0x910003fd
.word 0x1000001e
.word 0xf9001bbe
.word 0xa903d3b3
.word 0xa904dbb5
.word 0xa905e3b7
.word 0xa906ebb9
.word 0xa907f3bb
.word 0xf90047bd
.word 0x910003f1
.word 0xf9004bb1
.word 0xaa0003fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #80]
.word 0xd63f0000
.word 0xaa0003f9
.word 0x910083a0
.word 0xf9400321
.word 0xf90013a1
.word 0xf9000320

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #648]
.word 0x910063a0
bl _mono_threads_enter_gc_safe_region_unbalanced
.word 0xf90057a0
.word 0xaa1a03e0
bl _p_46
.word 0x93407c00
.word 0xaa0003e1
.word 0xf94057a0
.word 0xf90053a1
.word 0x910043a1
bl _mono_threads_exit_gc_safe_region_unbalanced
.word 0xf94053a0
.word 0xaa0003fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x350001e0
.word 0x14000001
.word 0xf94013a0
.word 0xf9000320
.word 0xaa1a03e0
.word 0xa94667b8
.word 0xf9403bba
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0
.word 0x91022300
.word 0xd280003e
.word 0xb900001e
.word 0xaa1803e0
bl _p_20
bl _p_41
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17fffff0

Lme_20:
.text
	.align 4
	.no_dead_strip wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string
wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string:
.loc 1 1 0
.word 0xa9b57bfd
.word 0x910003fd
.word 0x1000001e
.word 0xf9001bbe
.word 0xa903d3b3
.word 0xa904dbb5
.word 0xa905e3b7
.word 0xa906ebb9
.word 0xa907f3bb
.word 0xf90047bd
.word 0x910003f1
.word 0xf9004bb1
.word 0xaa0003fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #80]
.word 0xd63f0000
.word 0xaa0003f9
.word 0x910083a0
.word 0xf9400321
.word 0xf90013a1
.word 0xf9000320
.word 0xaa1a03e0
bl _p_42
.word 0xaa0003fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #656]
.word 0x910063a0
bl _mono_threads_enter_gc_safe_region_unbalanced
.word 0xf90057a0
.word 0xaa1a03e0
bl _p_47
.word 0xf90053a0
bl _mono_marshal_set_last_error
.word 0xf94057a0
.word 0x910043a1
bl _mono_threads_exit_gc_safe_region_unbalanced
.word 0xf94053a0
.word 0xaa0003f8

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000220
.word 0x14000001
.word 0xaa1a03e0
bl _p_44
.word 0xf94013a0
.word 0xf9000320
.word 0xaa1803e0
.word 0xa945e3b7
.word 0xa946ebb9
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0
.word 0x910222e0
.word 0xd280003e
.word 0xb900001e
.word 0xaa1703e0
bl _p_20
bl _p_41
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffee

Lme_21:
.text
	.align 4
	.no_dead_strip wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string
wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string:
.loc 1 1 0
.word 0xa9b57bfd
.word 0x910003fd
.word 0x1000001e
.word 0xf9001bbe
.word 0xa903d3b3
.word 0xa904dbb5
.word 0xa905e3b7
.word 0xa906ebb9
.word 0xa907f3bb
.word 0xf90047bd
.word 0x910003f1
.word 0xf9004bb1
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #80]
.word 0xd63f0000
.word 0xaa0003f8
.word 0x910083a0
.word 0xf9400301
.word 0xf90013a1
.word 0xf9000300
.word 0xaa1a03e0
bl _p_42
.word 0xaa0003fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #664]
.word 0x910063a0
bl _mono_threads_enter_gc_safe_region_unbalanced
.word 0xf90057a0
.word 0xaa1903e0
.word 0xaa1a03e1
bl _p_48
.word 0xf90053a0
bl _mono_marshal_set_last_error
.word 0xf94057a0
.word 0x910043a1
bl _mono_threads_exit_gc_safe_region_unbalanced
.word 0xf94053a0
.word 0xaa0003f9

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000220
.word 0x14000001
.word 0xaa1a03e0
bl _p_44
.word 0xf94013a0
.word 0xf9000300
.word 0xaa1903e0
.word 0xa945e3b7
.word 0xa946ebb9
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0
.word 0x910222e0
.word 0xd280003e
.word 0xb900001e
.word 0xaa1703e0
bl _p_20
bl _p_41
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffee

Lme_22:
.text
	.align 4
	.no_dead_strip wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr
wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr:
.loc 1 1 0
.word 0xa9b57bfd
.word 0x910003fd
.word 0x1000001e
.word 0xf9001bbe
.word 0xa903d3b3
.word 0xa904dbb5
.word 0xa905e3b7
.word 0xa906ebb9
.word 0xa907f3bb
.word 0xf90047bd
.word 0x910003f1
.word 0xf9004bb1
.word 0xaa0003fa

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #80]
.word 0xd63f0000
.word 0xaa0003f9
.word 0x910083a0
.word 0xf9400321
.word 0xf90013a1
.word 0xf9000320

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #672]
.word 0x910063a0
bl _mono_threads_enter_gc_safe_region_unbalanced
.word 0xf90057a0
.word 0xaa1a03e0
bl _p_49
.word 0x53001c00
.word 0xf90053a0
bl _mono_marshal_set_last_error
.word 0xf94057a0
.word 0x910043a1
bl _mono_threads_exit_gc_safe_region_unbalanced
.word 0xf94053a0
.word 0x53001c1a

adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x350001e0
.word 0x14000001
.word 0xf94013a0
.word 0xf9000320
.word 0xaa1a03e0
.word 0xa94667b8
.word 0xf9403bba
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0
.word 0x91022300
.word 0xd280003e
.word 0xb900001e
.word 0xaa1803e0
bl _p_20
bl _p_41
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17fffff0

Lme_23:
.text
	.align 3
jit_code_end:

	.byte 0,0,0,0
.text
	.align 3
method_addresses:
	.no_dead_strip method_addresses
bl SQLitePCL_NativeLibrary_Load_string_System_Reflection_Assembly_int
bl SQLitePCL_NativeLibrary_MyGetExport_intptr_string
bl SQLitePCL_NativeLibrary_GetExport_intptr_string
bl SQLitePCL_NativeLibrary_Free_intptr
bl SQLitePCL_NativeLibrary_TryLoad_string_System_Reflection_Assembly_int_intptr_
bl SQLitePCL_NativeLibrary_TryGetExport_intptr_string_intptr_
bl SQLitePCL_NativeLibrary_basename_to_libname_string_SQLitePCL_NativeLibrary_LibSuffix
bl SQLitePCL_NativeLibrary_TryLoad_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_intptr_
bl SQLitePCL_NativeLibrary_WhichLoader
bl SQLitePCL_NativeLibrary_WhichLibSuffix
bl SQLitePCL_NativeLibrary_get_rid_front
bl SQLitePCL_NativeLibrary_get_rid_back
bl SQLitePCL_NativeLibrary_get_rid
bl SQLitePCL_NativeLibrary_Search_System_Collections_Generic_IList_1_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_string__intptr_
bl SQLitePCL_NativeLibrary_MakePossibilitiesFor_string_System_Reflection_Assembly_int_SQLitePCL_NativeLibrary_LibSuffix
bl SQLitePCL_NativeLibrary_MyLoad_string_System_Reflection_Assembly_int_System_Action_1_string
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl SQLitePCL_NativeLibrary__c__cctor
bl SQLitePCL_NativeLibrary__c__ctor
bl SQLitePCL_NativeLibrary__c__Loadb__7_0_string
bl SQLitePCL_NativeLibrary__c__TryLoadb__11_0_string
bl method_addresses
bl wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string
bl wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string
bl wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string
bl wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int
bl wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string
bl wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr
bl wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string
bl wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string
bl wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr
method_addresses_end:

.section __TEXT, __const
	.align 3
unbox_trampolines:
unbox_trampolines_end:

	.long 0
.text
	.align 3
unbox_trampoline_addresses:

	.long 0
.section __TEXT, __const
	.align 3
unwind_info:

	.byte 18,12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10,154,9,16,12,31,0,68,14,48,157,6,158,5,68,13
	.byte 29,68,152,4,16,12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6,16,12,31,0,68,14,32,157,4,158,3
	.byte 68,13,29,68,153,2,21,12,31,0,68,14,112,157,14,158,13,68,13,29,68,151,12,152,11,68,153,10,13,12,31,0
	.byte 68,14,48,157,6,158,5,68,13,29,14,12,31,0,68,14,144,1,157,18,158,17,68,13,29,19,12,31,0,68,14,144
	.byte 2,157,34,158,33,68,13,29,68,153,32,154,31,16,12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2,13,12
	.byte 31,0,68,14,32,157,4,158,3,68,13,29,24,12,31,0,68,14,96,157,12,158,11,68,13,29,68,150,10,151,9,68
	.byte 152,8,68,154,7,34,12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68,151
	.byte 10,152,9,68,153,8,154,7,25,12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,150,18,68,152,17,153,16,68
	.byte 154,15,26,12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4,28,12,31
	.byte 0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3,39,12,31,0,68,14
	.byte 176,1,157,22,158,21,68,13,29,76,147,15,148,14,68,149,13,150,12,68,151,11,152,10,68,153,9,154,8,68,155,7
	.byte 156,6

.text
	.align 4
plt:
mono_aot_SQLitePCLRaw_nativelibrary_plt:
	.no_dead_strip plt_wrapper_alloc_object_AllocSmall_intptr_intptr
plt_wrapper_alloc_object_AllocSmall_intptr_intptr:
_p_1:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #688]
br x16
.word 567
	.no_dead_strip plt_SQLitePCL_NativeLibrary_MyLoad_string_System_Reflection_Assembly_int_System_Action_1_string
plt_SQLitePCL_NativeLibrary_MyLoad_string_System_Reflection_Assembly_int_System_Action_1_string:
_p_2:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #696]
br x16
.word 575
	.no_dead_strip plt__jit_icall_mono_helper_ldstr
plt__jit_icall_mono_helper_ldstr:
_p_3:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #704]
br x16
.word 577
	.no_dead_strip plt_string_Concat_string_string_string
plt_string_Concat_string_string_string:
_p_4:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #712]
br x16
.word 580
	.no_dead_strip plt__jit_icall_mono_arch_throw_exception
plt__jit_icall_mono_arch_throw_exception:
_p_5:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #720]
br x16
.word 585
	.no_dead_strip plt__jit_icall_mono_arch_throw_corlib_exception
plt__jit_icall_mono_arch_throw_corlib_exception:
_p_6:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #728]
br x16
.word 587
	.no_dead_strip plt_SQLitePCL_NativeLibrary_WhichLoader
plt_SQLitePCL_NativeLibrary_WhichLoader:
_p_7:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #736]
br x16
.word 589
	.no_dead_strip plt_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string
plt_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string:
_p_8:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #744]
br x16
.word 591
	.no_dead_strip plt_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string
plt_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string:
_p_9:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #752]
br x16
.word 593
	.no_dead_strip plt_SQLitePCL_NativeLibrary_MyGetExport_intptr_string
plt_SQLitePCL_NativeLibrary_MyGetExport_intptr_string:
_p_10:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #760]
br x16
.word 595
	.no_dead_strip plt_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr
plt_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr:
_p_11:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #768]
br x16
.word 597
	.no_dead_strip plt_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr
plt_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr:
_p_12:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #776]
br x16
.word 599
	.no_dead_strip plt_intptr_op_Inequality_intptr_intptr
plt_intptr_op_Inequality_intptr_intptr:
_p_13:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #784]
br x16
.word 601
	.no_dead_strip plt_string_Format_string_object
plt_string_Format_string_object:
_p_14:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #792]
br x16
.word 606
	.no_dead_strip plt_string_Concat_string_string
plt_string_Concat_string_string:
_p_15:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #800]
br x16
.word 611
	.no_dead_strip plt_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string
plt_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string:
_p_16:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #808]
br x16
.word 616
	.no_dead_strip plt_System_Runtime_InteropServices_Marshal_GetLastWin32Error
plt_System_Runtime_InteropServices_Marshal_GetLastWin32Error:
_p_17:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #816]
br x16
.word 618
	.no_dead_strip plt_System_ComponentModel_Win32Exception__ctor
plt_System_ComponentModel_Win32Exception__ctor:
_p_18:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #824]
br x16
.word 623
	.no_dead_strip plt_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int
plt_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int:
_p_19:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #832]
br x16
.word 628
	.no_dead_strip plt__jit_icall_mono_arch_rethrow_exception
plt__jit_icall_mono_arch_rethrow_exception:
_p_20:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #840]
br x16
.word 630
	.no_dead_strip plt__jit_icall_mono_thread_get_undeniable_exception
plt__jit_icall_mono_thread_get_undeniable_exception:
_p_21:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #848]
br x16
.word 632
	.no_dead_strip plt__jit_icall_mono_generic_class_init
plt__jit_icall_mono_generic_class_init:
_p_22:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #856]
br x16
.word 635
	.no_dead_strip plt_System_Runtime_InteropServices_RuntimeInformation_IsOSPlatform_System_Runtime_InteropServices_OSPlatform
plt_System_Runtime_InteropServices_RuntimeInformation_IsOSPlatform_System_Runtime_InteropServices_OSPlatform:
_p_23:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #864]
br x16
.word 638
	.no_dead_strip plt_System_Runtime_InteropServices_RuntimeInformation_get_OSArchitecture
plt_System_Runtime_InteropServices_RuntimeInformation_get_OSArchitecture:
_p_24:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #872]
br x16
.word 643
	.no_dead_strip plt_SQLitePCL_NativeLibrary_get_rid_front
plt_SQLitePCL_NativeLibrary_get_rid_front:
_p_25:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #880]
br x16
.word 648
	.no_dead_strip plt_SQLitePCL_NativeLibrary_get_rid_back
plt_SQLitePCL_NativeLibrary_get_rid_back:
_p_26:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #888]
br x16
.word 650
	.no_dead_strip plt_SQLitePCL_NativeLibrary_TryLoad_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_intptr_
plt_SQLitePCL_NativeLibrary_TryLoad_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_intptr_:
_p_27:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #896]
br x16
.word 652
	.no_dead_strip plt__jit_icall_ves_icall_thread_finish_async_abort
plt__jit_icall_ves_icall_thread_finish_async_abort:
_p_28:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #904]
br x16
.word 654
	.no_dead_strip plt_SQLitePCL_NativeLibrary_basename_to_libname_string_SQLitePCL_NativeLibrary_LibSuffix
plt_SQLitePCL_NativeLibrary_basename_to_libname_string_SQLitePCL_NativeLibrary_LibSuffix:
_p_29:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #912]
br x16
.word 657
	.no_dead_strip plt_System_Collections_Generic_List_1_string_AddWithResize_string
plt_System_Collections_Generic_List_1_string_AddWithResize_string:
_p_30:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #920]
br x16
.word 659
	.no_dead_strip plt_SQLitePCL_NativeLibrary_get_rid
plt_SQLitePCL_NativeLibrary_get_rid:
_p_31:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #928]
br x16
.word 676
	.no_dead_strip plt_System_IO_Path_GetDirectoryName_string
plt_System_IO_Path_GetDirectoryName_string:
_p_32:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #936]
br x16
.word 678
	.no_dead_strip plt_wrapper_alloc_object_AllocVector_intptr_intptr
plt_wrapper_alloc_object_AllocVector_intptr_intptr:
_p_33:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #944]
br x16
.word 683
	.no_dead_strip plt_System_IO_Path_Combine_string__
plt_System_IO_Path_Combine_string__:
_p_34:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #952]
br x16
.word 691
	.no_dead_strip plt_System_IO_Path_Combine_string_string_string
plt_System_IO_Path_Combine_string_string_string:
_p_35:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #960]
br x16
.word 696
	.no_dead_strip plt_SQLitePCL_NativeLibrary_WhichLibSuffix
plt_SQLitePCL_NativeLibrary_WhichLibSuffix:
_p_36:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #968]
br x16
.word 701
	.no_dead_strip plt_SQLitePCL_NativeLibrary_MakePossibilitiesFor_string_System_Reflection_Assembly_int_SQLitePCL_NativeLibrary_LibSuffix
plt_SQLitePCL_NativeLibrary_MakePossibilitiesFor_string_System_Reflection_Assembly_int_SQLitePCL_NativeLibrary_LibSuffix:
_p_37:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #976]
br x16
.word 703
	.no_dead_strip plt_System_Collections_Generic_List_1_string_GetEnumerator
plt_System_Collections_Generic_List_1_string_GetEnumerator:
_p_38:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #984]
br x16
.word 705
	.no_dead_strip plt_System_Collections_Generic_List_1_Enumerator_string_MoveNext
plt_System_Collections_Generic_List_1_Enumerator_string_MoveNext:
_p_39:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #992]
br x16
.word 716
	.no_dead_strip plt_SQLitePCL_NativeLibrary_Search_System_Collections_Generic_IList_1_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_string__intptr_
plt_SQLitePCL_NativeLibrary_Search_System_Collections_Generic_IList_1_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_string__intptr_:
_p_40:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #1000]
br x16
.word 727
	.no_dead_strip plt__jit_icall_mono_thread_interruption_checkpoint
plt__jit_icall_mono_thread_interruption_checkpoint:
_p_41:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #1008]
br x16
.word 729
	.no_dead_strip plt__jit_icall_mono_string_to_utf8str
plt__jit_icall_mono_string_to_utf8str:
_p_42:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #1016]
br x16
.word 732
	.no_dead_strip plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int
plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int:
_p_43:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #1024]
br x16
.word 735
	.no_dead_strip plt__jit_icall_mono_marshal_free
plt__jit_icall_mono_marshal_free:
_p_44:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #1032]
br x16
.word 737
	.no_dead_strip plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string
plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string:
_p_45:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #1040]
br x16
.word 740
	.no_dead_strip plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr
plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr:
_p_46:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #1048]
br x16
.word 742
	.no_dead_strip plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string
plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string:
_p_47:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #1056]
br x16
.word 744
	.no_dead_strip plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string
plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string:
_p_48:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #1064]
br x16
.word 746
	.no_dead_strip plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr
plt__icall_native_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr:
_p_49:
adrp x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGE+0
add x16, x16, mono_aot_SQLitePCLRaw_nativelibrary_got@PAGEOFF
ldr x16, [x16, #1072]
br x16
.word 748
plt_end:
.section __DATA, __bss
	.align 3
.lcomm mono_aot_SQLitePCLRaw_nativelibrary_got, 1080
got_end:
.section __TEXT, __const
	.align 3
Lglobals_hash:

	.short 11, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0
.data
	.align 3
globals:
	.align 3
	.quad Lglobals_hash

	.long 0,0
.section __TEXT, __const
	.align 2
runtime_version:
	.asciz ""
.section __TEXT, __const
	.align 2
assembly_guid:
	.asciz "E8DC4C51-1940-4B27-AE20-08C2FAF281E0"
.section __TEXT, __const
	.align 2
assembly_name:
	.asciz "SQLitePCLRaw.nativelibrary"
.data
	.align 3
_mono_aot_file_info:

	.long 172,0
	.align 3
	.quad mono_aot_SQLitePCLRaw_nativelibrary_got
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad jit_code_start
	.align 3
	.quad jit_code_end
	.align 3
	.quad method_addresses
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad mem_end
	.align 3
	.quad assembly_guid
	.align 3
	.quad runtime_version
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad 0
	.align 3
	.quad globals
	.align 3
	.quad assembly_name
	.align 3
	.quad plt
	.align 3
	.quad plt_end
	.align 3
	.quad unwind_info
	.align 3
	.quad unbox_trampolines
	.align 3
	.quad unbox_trampolines_end
	.align 3
	.quad unbox_trampoline_addresses

	.long 85,1080,50,36,9,98,387000831,0
	.long 1227,128,8,8,8,9,8388607,0
	.long 4,25,2240,0,0,1000,704,400
	.long 0,592,672,456,0,320,72,992
	.long 0,0,0,0,0,0,0,0
	.long 0,0,0,0,0,0,0,0
	.long 0,0,0,0,0,0,0,0
	.byte 32,153,165,97,185,209,147,188,93,182,108,99,239,94,176,189
	.globl _mono_aot_module_SQLitePCLRaw_nativelibrary_info
	.align 3
_mono_aot_module_SQLitePCLRaw_nativelibrary_info:
	.align 3
	.quad _mono_aot_file_info
.section __DWARF, __debug_info,regular,debug
LTDIE_1:

	.byte 17
	.asciz "System_Object"

	.byte 16,7
	.asciz "System_Object"

LDIFF_SYM3=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM3
LTDIE_1_POINTER:

	.byte 13
LDIFF_SYM4=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM4
LTDIE_1_REFERENCE:

	.byte 14
LDIFF_SYM5=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM5
LTDIE_0:

	.byte 5
	.asciz "System_Reflection_Assembly"

	.byte 16,16
LDIFF_SYM6=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM6
	.byte 2,35,0,0,7
	.asciz "System_Reflection_Assembly"

LDIFF_SYM7=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM7
LTDIE_0_POINTER:

	.byte 13
LDIFF_SYM8=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM8
LTDIE_0_REFERENCE:

	.byte 14
LDIFF_SYM9=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM9
LTDIE_3:

	.byte 5
	.asciz "System_ValueType"

	.byte 16,16
LDIFF_SYM10=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM10
	.byte 2,35,0,0,7
	.asciz "System_ValueType"

LDIFF_SYM11=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM11
LTDIE_3_POINTER:

	.byte 13
LDIFF_SYM12=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM12
LTDIE_3_REFERENCE:

	.byte 14
LDIFF_SYM13=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM13
LTDIE_2:

	.byte 5
	.asciz "System_Int32"

	.byte 20,16
LDIFF_SYM14=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM14
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM15=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM15
	.byte 2,35,16,0,7
	.asciz "System_Int32"

LDIFF_SYM16=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM16
LTDIE_2_POINTER:

	.byte 13
LDIFF_SYM17=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM17
LTDIE_2_REFERENCE:

	.byte 14
LDIFF_SYM18=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM18
	.byte 2
	.asciz "SQLitePCL.NativeLibrary:Load"
	.asciz "SQLitePCL_NativeLibrary_Load_string_System_Reflection_Assembly_int"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_Load_string_System_Reflection_Assembly_int
	.quad Lme_0

	.byte 2,118,16,3
	.asciz "libraryName"

LDIFF_SYM19=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM19
	.byte 2,141,32,3
	.asciz "assy"

LDIFF_SYM20=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM20
	.byte 2,141,40,3
	.asciz "flags"

LDIFF_SYM21=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM21
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM22=Lfde0_end - Lfde0_start
	.long LDIFF_SYM22
Lfde0_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_Load_string_System_Reflection_Assembly_int

LDIFF_SYM23=Lme_0 - SQLitePCL_NativeLibrary_Load_string_System_Reflection_Assembly_int
	.long LDIFF_SYM23
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10,154,9
	.align 3
Lfde0_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_4:

	.byte 8
	.asciz "_Loader"

	.byte 4
LDIFF_SYM24=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM24
	.byte 9
	.asciz "win"

	.byte 0,9
	.asciz "dlopen"

	.byte 1,0,7
	.asciz "_Loader"

LDIFF_SYM25=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM25
LTDIE_4_POINTER:

	.byte 13
LDIFF_SYM26=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM26
LTDIE_4_REFERENCE:

	.byte 14
LDIFF_SYM27=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM27
	.byte 2
	.asciz "SQLitePCL.NativeLibrary:MyGetExport"
	.asciz "SQLitePCL_NativeLibrary_MyGetExport_intptr_string"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_MyGetExport_intptr_string
	.quad Lme_1

	.byte 2,118,16,3
	.asciz "handle"

LDIFF_SYM28=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM28
	.byte 2,141,24,3
	.asciz "name"

LDIFF_SYM29=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM29
	.byte 2,141,32,11
	.asciz "V_0"

LDIFF_SYM30=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM30
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM31=Lfde1_end - Lfde1_start
	.long LDIFF_SYM31
Lfde1_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_MyGetExport_intptr_string

LDIFF_SYM32=Lme_1 - SQLitePCL_NativeLibrary_MyGetExport_intptr_string
	.long LDIFF_SYM32
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4
	.align 3
Lfde1_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary:GetExport"
	.asciz "SQLitePCL_NativeLibrary_GetExport_intptr_string"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_GetExport_intptr_string
	.quad Lme_2

	.byte 2,118,16,3
	.asciz "handle"

LDIFF_SYM33=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM33
	.byte 2,141,24,3
	.asciz "name"

LDIFF_SYM34=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM34
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM35=Lfde2_end - Lfde2_start
	.long LDIFF_SYM35
Lfde2_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_GetExport_intptr_string

LDIFF_SYM36=Lme_2 - SQLitePCL_NativeLibrary_GetExport_intptr_string
	.long LDIFF_SYM36
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6
	.align 3
Lfde2_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary:Free"
	.asciz "SQLitePCL_NativeLibrary_Free_intptr"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_Free_intptr
	.quad Lme_3

	.byte 2,118,16,3
	.asciz "handle"

LDIFF_SYM37=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM37
	.byte 2,141,24,11
	.asciz "V_0"

LDIFF_SYM38=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM38
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM39=Lfde3_end - Lfde3_start
	.long LDIFF_SYM39
Lfde3_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_Free_intptr

LDIFF_SYM40=Lme_3 - SQLitePCL_NativeLibrary_Free_intptr
	.long LDIFF_SYM40
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2
	.align 3
Lfde3_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary:TryLoad"
	.asciz "SQLitePCL_NativeLibrary_TryLoad_string_System_Reflection_Assembly_int_intptr_"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_TryLoad_string_System_Reflection_Assembly_int_intptr_
	.quad Lme_4

	.byte 2,118,16,3
	.asciz "libraryName"

LDIFF_SYM41=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM41
	.byte 2,141,40,3
	.asciz "assy"

LDIFF_SYM42=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM42
	.byte 2,141,48,3
	.asciz "flags"

LDIFF_SYM43=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM43
	.byte 1,105,3
	.asciz "handle"

LDIFF_SYM44=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM44
	.byte 2,141,56,11
	.asciz "V_0"

LDIFF_SYM45=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM45
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM46=Lfde4_end - Lfde4_start
	.long LDIFF_SYM46
Lfde4_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_TryLoad_string_System_Reflection_Assembly_int_intptr_

LDIFF_SYM47=Lme_4 - SQLitePCL_NativeLibrary_TryLoad_string_System_Reflection_Assembly_int_intptr_
	.long LDIFF_SYM47
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,151,12,152,11,68,153,10
	.align 3
Lfde4_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary:TryGetExport"
	.asciz "SQLitePCL_NativeLibrary_TryGetExport_intptr_string_intptr_"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_TryGetExport_intptr_string_intptr_
	.quad Lme_5

	.byte 2,118,16,3
	.asciz "handle"

LDIFF_SYM48=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM48
	.byte 2,141,16,3
	.asciz "name"

LDIFF_SYM49=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM49
	.byte 2,141,24,3
	.asciz "address"

LDIFF_SYM50=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM50
	.byte 2,141,32,11
	.asciz "V_0"

LDIFF_SYM51=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM51
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM52=Lfde5_end - Lfde5_start
	.long LDIFF_SYM52
Lfde5_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_TryGetExport_intptr_string_intptr_

LDIFF_SYM53=Lme_5 - SQLitePCL_NativeLibrary_TryGetExport_intptr_string_intptr_
	.long LDIFF_SYM53
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde5_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_5:

	.byte 8
	.asciz "_LibSuffix"

	.byte 4
LDIFF_SYM54=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM54
	.byte 9
	.asciz "DLL"

	.byte 0,9
	.asciz "DYLIB"

	.byte 1,9
	.asciz "SO"

	.byte 2,0,7
	.asciz "_LibSuffix"

LDIFF_SYM55=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM55
LTDIE_5_POINTER:

	.byte 13
LDIFF_SYM56=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM56
LTDIE_5_REFERENCE:

	.byte 14
LDIFF_SYM57=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM57
	.byte 2
	.asciz "SQLitePCL.NativeLibrary:basename_to_libname"
	.asciz "SQLitePCL_NativeLibrary_basename_to_libname_string_SQLitePCL_NativeLibrary_LibSuffix"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_basename_to_libname_string_SQLitePCL_NativeLibrary_LibSuffix
	.quad Lme_6

	.byte 2,118,16,3
	.asciz "basename"

LDIFF_SYM58=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM58
	.byte 2,141,16,3
	.asciz "suffix"

LDIFF_SYM59=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM59
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM60=Lfde6_end - Lfde6_start
	.long LDIFF_SYM60
Lfde6_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_basename_to_libname_string_SQLitePCL_NativeLibrary_LibSuffix

LDIFF_SYM61=Lme_6 - SQLitePCL_NativeLibrary_basename_to_libname_string_SQLitePCL_NativeLibrary_LibSuffix
	.long LDIFF_SYM61
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29
	.align 3
Lfde6_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_11:

	.byte 5
	.asciz "System_Reflection_MemberInfo"

	.byte 16,16
LDIFF_SYM62=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM62
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MemberInfo"

LDIFF_SYM63=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM63
LTDIE_11_POINTER:

	.byte 13
LDIFF_SYM64=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM64
LTDIE_11_REFERENCE:

	.byte 14
LDIFF_SYM65=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM65
LTDIE_10:

	.byte 5
	.asciz "System_Reflection_MethodBase"

	.byte 16,16
LDIFF_SYM66=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM66
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MethodBase"

LDIFF_SYM67=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM67
LTDIE_10_POINTER:

	.byte 13
LDIFF_SYM68=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM68
LTDIE_10_REFERENCE:

	.byte 14
LDIFF_SYM69=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM69
LTDIE_9:

	.byte 5
	.asciz "System_Reflection_MethodInfo"

	.byte 16,16
LDIFF_SYM70=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM70
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MethodInfo"

LDIFF_SYM71=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM71
LTDIE_9_POINTER:

	.byte 13
LDIFF_SYM72=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM72
LTDIE_9_REFERENCE:

	.byte 14
LDIFF_SYM73=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM73
LTDIE_13:

	.byte 5
	.asciz "System_Type"

	.byte 24,16
LDIFF_SYM74=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM74
	.byte 2,35,0,6
	.asciz "_impl"

LDIFF_SYM75=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM75
	.byte 2,35,16,0,7
	.asciz "System_Type"

LDIFF_SYM76=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM76
LTDIE_13_POINTER:

	.byte 13
LDIFF_SYM77=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM77
LTDIE_13_REFERENCE:

	.byte 14
LDIFF_SYM78=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM78
LTDIE_14:

	.byte 5
	.asciz "System_Boolean"

	.byte 17,16
LDIFF_SYM79=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM79
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM80=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM80
	.byte 2,35,16,0,7
	.asciz "System_Boolean"

LDIFF_SYM81=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM81
LTDIE_14_POINTER:

	.byte 13
LDIFF_SYM82=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM82
LTDIE_14_REFERENCE:

	.byte 14
LDIFF_SYM83=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM83
LTDIE_12:

	.byte 5
	.asciz "System_DelegateData"

	.byte 40,16
LDIFF_SYM84=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM84
	.byte 2,35,0,6
	.asciz "target_type"

LDIFF_SYM85=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM85
	.byte 2,35,16,6
	.asciz "method_name"

LDIFF_SYM86=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM86
	.byte 2,35,24,6
	.asciz "curried_first_arg"

LDIFF_SYM87=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM87
	.byte 2,35,32,0,7
	.asciz "System_DelegateData"

LDIFF_SYM88=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM88
LTDIE_12_POINTER:

	.byte 13
LDIFF_SYM89=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM89
LTDIE_12_REFERENCE:

	.byte 14
LDIFF_SYM90=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM90
LTDIE_8:

	.byte 5
	.asciz "System_Delegate"

	.byte 120,16
LDIFF_SYM91=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM91
	.byte 2,35,0,6
	.asciz "method_ptr"

LDIFF_SYM92=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM92
	.byte 2,35,16,6
	.asciz "invoke_impl"

LDIFF_SYM93=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM93
	.byte 2,35,24,6
	.asciz "m_target"

LDIFF_SYM94=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM94
	.byte 2,35,32,6
	.asciz "method"

LDIFF_SYM95=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM95
	.byte 2,35,40,6
	.asciz "delegate_trampoline"

LDIFF_SYM96=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM96
	.byte 2,35,48,6
	.asciz "extra_arg"

LDIFF_SYM97=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM97
	.byte 2,35,56,6
	.asciz "method_code"

LDIFF_SYM98=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM98
	.byte 2,35,64,6
	.asciz "interp_method"

LDIFF_SYM99=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM99
	.byte 2,35,72,6
	.asciz "interp_invoke_impl"

LDIFF_SYM100=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM100
	.byte 2,35,80,6
	.asciz "method_info"

LDIFF_SYM101=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM101
	.byte 2,35,88,6
	.asciz "original_method_info"

LDIFF_SYM102=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM102
	.byte 2,35,96,6
	.asciz "data"

LDIFF_SYM103=LTDIE_12_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM103
	.byte 2,35,104,6
	.asciz "method_is_virtual"

LDIFF_SYM104=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM104
	.byte 2,35,112,0,7
	.asciz "System_Delegate"

LDIFF_SYM105=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM105
LTDIE_8_POINTER:

	.byte 13
LDIFF_SYM106=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM106
LTDIE_8_REFERENCE:

	.byte 14
LDIFF_SYM107=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM107
LTDIE_7:

	.byte 5
	.asciz "System_MulticastDelegate"

	.byte 128,1,16
LDIFF_SYM108=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM108
	.byte 2,35,0,6
	.asciz "delegates"

LDIFF_SYM109=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM109
	.byte 2,35,120,0,7
	.asciz "System_MulticastDelegate"

LDIFF_SYM110=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM110
LTDIE_7_POINTER:

	.byte 13
LDIFF_SYM111=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM111
LTDIE_7_REFERENCE:

	.byte 14
LDIFF_SYM112=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM112
LTDIE_6:

	.byte 5
	.asciz "System_Action`1"

	.byte 128,1,16
LDIFF_SYM113=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM113
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM114=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM114
LTDIE_6_POINTER:

	.byte 13
LDIFF_SYM115=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM115
LTDIE_6_REFERENCE:

	.byte 14
LDIFF_SYM116=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM116
LTDIE_16:

	.byte 17
	.asciz "System_Collections_IDictionary"

	.byte 16,7
	.asciz "System_Collections_IDictionary"

LDIFF_SYM117=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM117
LTDIE_16_POINTER:

	.byte 13
LDIFF_SYM118=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM118
LTDIE_16_REFERENCE:

	.byte 14
LDIFF_SYM119=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM119
LTDIE_18:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM120=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM120
LTDIE_18_POINTER:

	.byte 13
LDIFF_SYM121=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM121
LTDIE_18_REFERENCE:

	.byte 14
LDIFF_SYM122=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM122
LTDIE_21:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM123=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM123
LTDIE_21_POINTER:

	.byte 13
LDIFF_SYM124=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM124
LTDIE_21_REFERENCE:

	.byte 14
LDIFF_SYM125=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM125
LTDIE_22:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM126=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM126
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM127=LTDIE_20_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM127
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM128=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM128
LTDIE_22_POINTER:

	.byte 13
LDIFF_SYM129=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM129
LTDIE_22_REFERENCE:

	.byte 14
LDIFF_SYM130=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM130
LTDIE_23:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM131=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM131
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM132=LTDIE_20_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM132
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM133=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM133
LTDIE_23_POINTER:

	.byte 13
LDIFF_SYM134=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM134
LTDIE_23_REFERENCE:

	.byte 14
LDIFF_SYM135=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM135
LTDIE_20:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM136=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM136
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM137=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM137
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM138=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM138
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM139=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM139
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM140=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM140
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM141=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM141
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM142=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM142
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM143=LTDIE_21_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM143
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM144=LTDIE_22_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM144
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM145=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM145
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM146=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM146
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM147=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM147
LTDIE_20_POINTER:

	.byte 13
LDIFF_SYM148=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM148
LTDIE_20_REFERENCE:

	.byte 14
LDIFF_SYM149=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM149
LTDIE_24:

	.byte 17
	.asciz "System_Runtime_Serialization_IFormatterConverter"

	.byte 16,7
	.asciz "System_Runtime_Serialization_IFormatterConverter"

LDIFF_SYM150=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM150
LTDIE_24_POINTER:

	.byte 13
LDIFF_SYM151=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM151
LTDIE_24_REFERENCE:

	.byte 14
LDIFF_SYM152=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM152
LTDIE_19:

	.byte 5
	.asciz "System_Runtime_Serialization_SerializationInfo"

	.byte 88,16
LDIFF_SYM153=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM153
	.byte 2,35,0,6
	.asciz "m_members"

LDIFF_SYM154=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM154
	.byte 2,35,16,6
	.asciz "m_data"

LDIFF_SYM155=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM155
	.byte 2,35,24,6
	.asciz "m_types"

LDIFF_SYM156=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM156
	.byte 2,35,32,6
	.asciz "m_nameToIndex"

LDIFF_SYM157=LTDIE_20_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM157
	.byte 2,35,40,6
	.asciz "m_currMember"

LDIFF_SYM158=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM158
	.byte 2,35,80,6
	.asciz "m_converter"

LDIFF_SYM159=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM159
	.byte 2,35,48,6
	.asciz "m_fullTypeName"

LDIFF_SYM160=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM160
	.byte 2,35,56,6
	.asciz "m_assemName"

LDIFF_SYM161=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM161
	.byte 2,35,64,6
	.asciz "objectType"

LDIFF_SYM162=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM162
	.byte 2,35,72,6
	.asciz "isFullTypeNameSetExplicit"

LDIFF_SYM163=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM163
	.byte 2,35,84,6
	.asciz "isAssemblyNameSetExplicit"

LDIFF_SYM164=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM164
	.byte 2,35,85,6
	.asciz "requireSameTokenInPartialTrust"

LDIFF_SYM165=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM165
	.byte 2,35,86,0,7
	.asciz "System_Runtime_Serialization_SerializationInfo"

LDIFF_SYM166=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM166
LTDIE_19_POINTER:

	.byte 13
LDIFF_SYM167=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM167
LTDIE_19_REFERENCE:

	.byte 14
LDIFF_SYM168=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM168
LTDIE_26:

	.byte 5
	.asciz "System_Reflection_TypeInfo"

	.byte 24,16
LDIFF_SYM169=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM169
	.byte 2,35,0,0,7
	.asciz "System_Reflection_TypeInfo"

LDIFF_SYM170=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM170
LTDIE_26_POINTER:

	.byte 13
LDIFF_SYM171=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM171
LTDIE_26_REFERENCE:

	.byte 14
LDIFF_SYM172=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM172
LTDIE_29:

	.byte 5
	.asciz "System_Reflection_ConstructorInfo"

	.byte 16,16
LDIFF_SYM173=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM173
	.byte 2,35,0,0,7
	.asciz "System_Reflection_ConstructorInfo"

LDIFF_SYM174=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM174
LTDIE_29_POINTER:

	.byte 13
LDIFF_SYM175=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM175
LTDIE_29_REFERENCE:

	.byte 14
LDIFF_SYM176=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM176
LTDIE_28:

	.byte 5
	.asciz "System_Reflection_RuntimeConstructorInfo"

	.byte 40,16
LDIFF_SYM177=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM177
	.byte 2,35,0,6
	.asciz "mhandle"

LDIFF_SYM178=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM178
	.byte 2,35,16,6
	.asciz "name"

LDIFF_SYM179=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM179
	.byte 2,35,24,6
	.asciz "reftype"

LDIFF_SYM180=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM180
	.byte 2,35,32,0,7
	.asciz "System_Reflection_RuntimeConstructorInfo"

LDIFF_SYM181=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM181
LTDIE_28_POINTER:

	.byte 13
LDIFF_SYM182=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM182
LTDIE_28_REFERENCE:

	.byte 14
LDIFF_SYM183=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM183
LTDIE_27:

	.byte 5
	.asciz "System_MonoTypeInfo"

	.byte 32,16
LDIFF_SYM184=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM184
	.byte 2,35,0,6
	.asciz "full_name"

LDIFF_SYM185=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM185
	.byte 2,35,16,6
	.asciz "default_ctor"

LDIFF_SYM186=LTDIE_28_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM186
	.byte 2,35,24,0,7
	.asciz "System_MonoTypeInfo"

LDIFF_SYM187=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM187
LTDIE_27_POINTER:

	.byte 13
LDIFF_SYM188=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM188
LTDIE_27_REFERENCE:

	.byte 14
LDIFF_SYM189=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM189
LTDIE_25:

	.byte 5
	.asciz "System_RuntimeType"

	.byte 48,16
LDIFF_SYM190=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM190
	.byte 2,35,0,6
	.asciz "type_info"

LDIFF_SYM191=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM191
	.byte 2,35,24,6
	.asciz "GenericCache"

LDIFF_SYM192=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM192
	.byte 2,35,32,6
	.asciz "m_serializationCtor"

LDIFF_SYM193=LTDIE_28_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM193
	.byte 2,35,40,0,7
	.asciz "System_RuntimeType"

LDIFF_SYM194=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM194
LTDIE_25_POINTER:

	.byte 13
LDIFF_SYM195=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM195
LTDIE_25_REFERENCE:

	.byte 14
LDIFF_SYM196=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM196
LTDIE_30:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 128,1,16
LDIFF_SYM197=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM197
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM198=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM198
LTDIE_30_POINTER:

	.byte 13
LDIFF_SYM199=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM199
LTDIE_30_REFERENCE:

	.byte 14
LDIFF_SYM200=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM200
LTDIE_17:

	.byte 5
	.asciz "System_Runtime_Serialization_SafeSerializationManager"

	.byte 56,16
LDIFF_SYM201=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM201
	.byte 2,35,0,6
	.asciz "m_serializedStates"

LDIFF_SYM202=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM202
	.byte 2,35,16,6
	.asciz "m_savedSerializationInfo"

LDIFF_SYM203=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM203
	.byte 2,35,24,6
	.asciz "m_realObject"

LDIFF_SYM204=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM204
	.byte 2,35,32,6
	.asciz "m_realType"

LDIFF_SYM205=LTDIE_25_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM205
	.byte 2,35,40,6
	.asciz "SerializeObjectState"

LDIFF_SYM206=LTDIE_30_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM206
	.byte 2,35,48,0,7
	.asciz "System_Runtime_Serialization_SafeSerializationManager"

LDIFF_SYM207=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM207
LTDIE_17_POINTER:

	.byte 13
LDIFF_SYM208=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM208
LTDIE_17_REFERENCE:

	.byte 14
LDIFF_SYM209=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM209
LTDIE_15:

	.byte 5
	.asciz "System_Exception"

	.byte 144,1,16
LDIFF_SYM210=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM210
	.byte 2,35,0,6
	.asciz "_className"

LDIFF_SYM211=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM211
	.byte 2,35,16,6
	.asciz "_message"

LDIFF_SYM212=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM212
	.byte 2,35,24,6
	.asciz "_data"

LDIFF_SYM213=LTDIE_16_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM213
	.byte 2,35,32,6
	.asciz "_innerException"

LDIFF_SYM214=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM214
	.byte 2,35,40,6
	.asciz "_helpURL"

LDIFF_SYM215=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM215
	.byte 2,35,48,6
	.asciz "_stackTrace"

LDIFF_SYM216=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM216
	.byte 2,35,56,6
	.asciz "_stackTraceString"

LDIFF_SYM217=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM217
	.byte 2,35,64,6
	.asciz "_remoteStackTraceString"

LDIFF_SYM218=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM218
	.byte 2,35,72,6
	.asciz "_remoteStackIndex"

LDIFF_SYM219=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM219
	.byte 2,35,80,6
	.asciz "_dynamicMethods"

LDIFF_SYM220=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM220
	.byte 2,35,88,6
	.asciz "_HResult"

LDIFF_SYM221=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM221
	.byte 2,35,96,6
	.asciz "_source"

LDIFF_SYM222=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM222
	.byte 2,35,104,6
	.asciz "_safeSerializationManager"

LDIFF_SYM223=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM223
	.byte 2,35,112,6
	.asciz "captured_traces"

LDIFF_SYM224=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM224
	.byte 2,35,120,6
	.asciz "native_trace_ips"

LDIFF_SYM225=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM225
	.byte 3,35,128,1,6
	.asciz "caught_in_unmanaged"

LDIFF_SYM226=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM226
	.byte 3,35,136,1,0,7
	.asciz "System_Exception"

LDIFF_SYM227=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM227
LTDIE_15_POINTER:

	.byte 13
LDIFF_SYM228=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM228
LTDIE_15_REFERENCE:

	.byte 14
LDIFF_SYM229=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM229
	.byte 2
	.asciz "SQLitePCL.NativeLibrary:TryLoad"
	.asciz "SQLitePCL_NativeLibrary_TryLoad_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_intptr_"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_TryLoad_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_intptr_
	.quad Lme_7

	.byte 2,118,16,3
	.asciz "name"

LDIFF_SYM230=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM230
	.byte 1,105,3
	.asciz "plat"

LDIFF_SYM231=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM231
	.byte 1,106,3
	.asciz "log"

LDIFF_SYM232=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM232
	.byte 2,141,32,3
	.asciz "h"

LDIFF_SYM233=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM233
	.byte 2,141,40,11
	.asciz "V_0"

LDIFF_SYM234=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM234
	.byte 1,106,11
	.asciz "V_1"

LDIFF_SYM235=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM235
	.byte 2,141,48,11
	.asciz "V_2"

LDIFF_SYM236=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM236
	.byte 1,106,11
	.asciz "V_3"

LDIFF_SYM237=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM237
	.byte 2,141,56,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM238=Lfde7_end - Lfde7_start
	.long LDIFF_SYM238
Lfde7_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_TryLoad_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_intptr_

LDIFF_SYM239=Lme_7 - SQLitePCL_NativeLibrary_TryLoad_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_intptr_
	.long LDIFF_SYM239
	.long 0
	.byte 12,31,0,68,14,144,2,157,34,158,33,68,13,29,68,153,32,154,31
	.align 3
Lfde7_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary:WhichLoader"
	.asciz "SQLitePCL_NativeLibrary_WhichLoader"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_WhichLoader
	.quad Lme_8

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM240=Lfde8_end - Lfde8_start
	.long LDIFF_SYM240
Lfde8_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_WhichLoader

LDIFF_SYM241=Lme_8 - SQLitePCL_NativeLibrary_WhichLoader
	.long LDIFF_SYM241
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde8_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary:WhichLibSuffix"
	.asciz "SQLitePCL_NativeLibrary_WhichLibSuffix"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_WhichLibSuffix
	.quad Lme_9

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM242=Lfde9_end - Lfde9_start
	.long LDIFF_SYM242
Lfde9_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_WhichLibSuffix

LDIFF_SYM243=Lme_9 - SQLitePCL_NativeLibrary_WhichLibSuffix
	.long LDIFF_SYM243
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde9_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary:get_rid_front"
	.asciz "SQLitePCL_NativeLibrary_get_rid_front"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_get_rid_front
	.quad Lme_a

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM244=Lfde10_end - Lfde10_start
	.long LDIFF_SYM244
Lfde10_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_get_rid_front

LDIFF_SYM245=Lme_a - SQLitePCL_NativeLibrary_get_rid_front
	.long LDIFF_SYM245
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde10_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_31:

	.byte 8
	.asciz "System_Runtime_InteropServices_Architecture"

	.byte 4
LDIFF_SYM246=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM246
	.byte 9
	.asciz "X86"

	.byte 0,9
	.asciz "X64"

	.byte 1,9
	.asciz "Arm"

	.byte 2,9
	.asciz "Arm64"

	.byte 3,0,7
	.asciz "System_Runtime_InteropServices_Architecture"

LDIFF_SYM247=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM247
LTDIE_31_POINTER:

	.byte 13
LDIFF_SYM248=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM248
LTDIE_31_REFERENCE:

	.byte 14
LDIFF_SYM249=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM249
	.byte 2
	.asciz "SQLitePCL.NativeLibrary:get_rid_back"
	.asciz "SQLitePCL_NativeLibrary_get_rid_back"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_get_rid_back
	.quad Lme_b

	.byte 2,118,16,11
	.asciz "V_0"

LDIFF_SYM250=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM250
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM251=Lfde11_end - Lfde11_start
	.long LDIFF_SYM251
Lfde11_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_get_rid_back

LDIFF_SYM252=Lme_b - SQLitePCL_NativeLibrary_get_rid_back
	.long LDIFF_SYM252
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde11_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary:get_rid"
	.asciz "SQLitePCL_NativeLibrary_get_rid"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_get_rid
	.quad Lme_c

	.byte 2,118,16,11
	.asciz "V_0"

LDIFF_SYM253=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM253
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM254=Lfde12_end - Lfde12_start
	.long LDIFF_SYM254
Lfde12_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_get_rid

LDIFF_SYM255=Lme_c - SQLitePCL_NativeLibrary_get_rid
	.long LDIFF_SYM255
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde12_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_32:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM256=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM256
LTDIE_32_POINTER:

	.byte 13
LDIFF_SYM257=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM257
LTDIE_32_REFERENCE:

	.byte 14
LDIFF_SYM258=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM258
LTDIE_33:

	.byte 17
	.asciz "System_Collections_Generic_IEnumerator`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEnumerator`1"

LDIFF_SYM259=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM259
LTDIE_33_POINTER:

	.byte 13
LDIFF_SYM260=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM260
LTDIE_33_REFERENCE:

	.byte 14
LDIFF_SYM261=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM261
	.byte 2
	.asciz "SQLitePCL.NativeLibrary:Search"
	.asciz "SQLitePCL_NativeLibrary_Search_System_Collections_Generic_IList_1_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_string__intptr_"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_Search_System_Collections_Generic_IList_1_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_string__intptr_
	.quad Lme_d

	.byte 2,118,16,3
	.asciz "a"

LDIFF_SYM262=LTDIE_32_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM262
	.byte 1,102,3
	.asciz "plat"

LDIFF_SYM263=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM263
	.byte 1,103,3
	.asciz "log"

LDIFF_SYM264=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM264
	.byte 1,104,3
	.asciz "name"

LDIFF_SYM265=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM265
	.byte 2,141,48,3
	.asciz "h"

LDIFF_SYM266=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM266
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM267=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM267
	.byte 2,141,56,11
	.asciz "V_1"

LDIFF_SYM268=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM268
	.byte 1,102,11
	.asciz "V_2"

LDIFF_SYM269=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM269
	.byte 3,141,192,0,11
	.asciz "V_3"

LDIFF_SYM270=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM270
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM271=Lfde13_end - Lfde13_start
	.long LDIFF_SYM271
Lfde13_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_Search_System_Collections_Generic_IList_1_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_string__intptr_

LDIFF_SYM272=Lme_d - SQLitePCL_NativeLibrary_Search_System_Collections_Generic_IList_1_string_SQLitePCL_NativeLibrary_Loader_System_Action_1_string_string__intptr_
	.long LDIFF_SYM272
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,150,10,151,9,68,152,8,68,154,7
	.align 3
Lfde13_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_34:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM273=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM273
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM274=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM274
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM275=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM275
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM276=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM276
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM277=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM277
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM278=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM278
LTDIE_34_POINTER:

	.byte 13
LDIFF_SYM279=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM279
LTDIE_34_REFERENCE:

	.byte 14
LDIFF_SYM280=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM280
	.byte 2
	.asciz "SQLitePCL.NativeLibrary:MakePossibilitiesFor"
	.asciz "SQLitePCL_NativeLibrary_MakePossibilitiesFor_string_System_Reflection_Assembly_int_SQLitePCL_NativeLibrary_LibSuffix"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_MakePossibilitiesFor_string_System_Reflection_Assembly_int_SQLitePCL_NativeLibrary_LibSuffix
	.quad Lme_e

	.byte 2,118,16,3
	.asciz "basename"

LDIFF_SYM281=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM281
	.byte 1,103,3
	.asciz "assy"

LDIFF_SYM282=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM282
	.byte 1,104,3
	.asciz "flags"

LDIFF_SYM283=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM283
	.byte 1,105,3
	.asciz "suffix"

LDIFF_SYM284=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM284
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM285=LTDIE_34_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM285
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM286=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM286
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM287=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM287
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM288=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM288
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM289=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM289
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM290=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM290
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM291=Lfde14_end - Lfde14_start
	.long LDIFF_SYM291
Lfde14_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_MakePossibilitiesFor_string_System_Reflection_Assembly_int_SQLitePCL_NativeLibrary_LibSuffix

LDIFF_SYM292=Lme_e - SQLitePCL_NativeLibrary_MakePossibilitiesFor_string_System_Reflection_Assembly_int_SQLitePCL_NativeLibrary_LibSuffix
	.long LDIFF_SYM292
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,147,14,148,13,68,149,12,150,11,68,151,10,152,9,68,153,8
	.byte 154,7
	.align 3
Lfde14_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary:MyLoad"
	.asciz "SQLitePCL_NativeLibrary_MyLoad_string_System_Reflection_Assembly_int_System_Action_1_string"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary_MyLoad_string_System_Reflection_Assembly_int_System_Action_1_string
	.quad Lme_f

	.byte 2,118,16,3
	.asciz "basename"

LDIFF_SYM293=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM293
	.byte 2,141,48,3
	.asciz "assy"

LDIFF_SYM294=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM294
	.byte 1,104,3
	.asciz "flags"

LDIFF_SYM295=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM295
	.byte 1,105,3
	.asciz "log"

LDIFF_SYM296=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM296
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM297=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM297
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM298=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM298
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM299=LTDIE_34_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM299
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM300=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM300
	.byte 3,141,208,0,11
	.asciz "V_4"

LDIFF_SYM301=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM301
	.byte 3,141,216,0,11
	.asciz "V_5"

LDIFF_SYM302=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM302
	.byte 2,141,56,11
	.asciz "V_6"

LDIFF_SYM303=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM303
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM304=Lfde15_end - Lfde15_start
	.long LDIFF_SYM304
Lfde15_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary_MyLoad_string_System_Reflection_Assembly_int_System_Action_1_string

LDIFF_SYM305=Lme_f - SQLitePCL_NativeLibrary_MyLoad_string_System_Reflection_Assembly_int_System_Action_1_string
	.long LDIFF_SYM305
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,150,18,68,152,17,153,16,68,154,15
	.align 3
Lfde15_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary/<>c:.cctor"
	.asciz "SQLitePCL_NativeLibrary__c__cctor"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary__c__cctor
	.quad Lme_16

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM306=Lfde16_end - Lfde16_start
	.long LDIFF_SYM306
Lfde16_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary__c__cctor

LDIFF_SYM307=Lme_16 - SQLitePCL_NativeLibrary__c__cctor
	.long LDIFF_SYM307
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde16_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_35:

	.byte 5
	.asciz "_<>c"

	.byte 16,16
LDIFF_SYM308=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM308
	.byte 2,35,0,0,7
	.asciz "_<>c"

LDIFF_SYM309=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM309
LTDIE_35_POINTER:

	.byte 13
LDIFF_SYM310=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM310
LTDIE_35_REFERENCE:

	.byte 14
LDIFF_SYM311=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM311
	.byte 2
	.asciz "SQLitePCL.NativeLibrary/<>c:.ctor"
	.asciz "SQLitePCL_NativeLibrary__c__ctor"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary__c__ctor
	.quad Lme_17

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM312=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM312
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM313=Lfde17_end - Lfde17_start
	.long LDIFF_SYM313
Lfde17_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary__c__ctor

LDIFF_SYM314=Lme_17 - SQLitePCL_NativeLibrary__c__ctor
	.long LDIFF_SYM314
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde17_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary/<>c:<Load>b__7_0"
	.asciz "SQLitePCL_NativeLibrary__c__Loadb__7_0_string"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary__c__Loadb__7_0_string
	.quad Lme_18

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM315=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM315
	.byte 0,3
	.asciz "s"

LDIFF_SYM316=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM316
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM317=Lfde18_end - Lfde18_start
	.long LDIFF_SYM317
Lfde18_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary__c__Loadb__7_0_string

LDIFF_SYM318=Lme_18 - SQLitePCL_NativeLibrary__c__Loadb__7_0_string
	.long LDIFF_SYM318
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde18_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "SQLitePCL.NativeLibrary/<>c:<TryLoad>b__11_0"
	.asciz "SQLitePCL_NativeLibrary__c__TryLoadb__11_0_string"

	.byte 0,0
	.quad SQLitePCL_NativeLibrary__c__TryLoadb__11_0_string
	.quad Lme_19

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM319=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM319
	.byte 0,3
	.asciz "s"

LDIFF_SYM320=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM320
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM321=Lfde19_end - Lfde19_start
	.long LDIFF_SYM321
Lfde19_start:

	.long 0
	.align 3
	.quad SQLitePCL_NativeLibrary__c__TryLoadb__11_0_string

LDIFF_SYM322=Lme_19 - SQLitePCL_NativeLibrary__c__TryLoadb__11_0_string
	.long LDIFF_SYM322
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde19_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_36:

	.byte 5
	.asciz "System_Array"

	.byte 16,16
LDIFF_SYM323=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM323
	.byte 2,35,0,0,7
	.asciz "System_Array"

LDIFF_SYM324=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM324
LTDIE_36_POINTER:

	.byte 13
LDIFF_SYM325=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM325
LTDIE_36_REFERENCE:

	.byte 14
LDIFF_SYM326=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM326
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<string>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string
	.quad Lme_1b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM327=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM327
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM328=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM328
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM329=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM329
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM330=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM330
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM331=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM331
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM332=LTDIE_7_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM332
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM333=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM333
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM334=Lfde20_end - Lfde20_start
	.long LDIFF_SYM334
Lfde20_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string

LDIFF_SYM335=Lme_1b - wrapper_delegate_invoke_System_Action_1_string_invoke_void_T_string
	.long LDIFF_SYM335
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde20_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_37:

	.byte 5
	.asciz "System_Predicate`1"

	.byte 128,1,16
LDIFF_SYM336=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM336
	.byte 2,35,0,0,7
	.asciz "System_Predicate`1"

LDIFF_SYM337=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM337
LTDIE_37_POINTER:

	.byte 13
LDIFF_SYM338=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM338
LTDIE_37_REFERENCE:

	.byte 14
LDIFF_SYM339=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM339
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Predicate`1<string>:invoke_bool_T"
	.asciz "wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string
	.quad Lme_1c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM340=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM340
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM341=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM341
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM342=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM342
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM343=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM343
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM344=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM344
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM345=LTDIE_7_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM345
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM346=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM346
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM347=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM347
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM348=Lfde21_end - Lfde21_start
	.long LDIFF_SYM348
Lfde21_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string

LDIFF_SYM349=Lme_1c - wrapper_delegate_invoke_System_Predicate_1_string_invoke_bool_T_string
	.long LDIFF_SYM349
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde21_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_38:

	.byte 5
	.asciz "System_Comparison`1"

	.byte 128,1,16
LDIFF_SYM350=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM350
	.byte 2,35,0,0,7
	.asciz "System_Comparison`1"

LDIFF_SYM351=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM351
LTDIE_38_POINTER:

	.byte 13
LDIFF_SYM352=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM352
LTDIE_38_REFERENCE:

	.byte 14
LDIFF_SYM353=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM353
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Comparison`1<string>:invoke_int_T_T"
	.asciz "wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string
	.quad Lme_1d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM354=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM354
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM355=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM355
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM356=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM356
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM357=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM357
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM358=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM358
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM359=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM359
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM360=LTDIE_7_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM360
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM361=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM361
	.byte 1,103,11
	.asciz "V_5"

LDIFF_SYM362=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM362
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM363=Lfde22_end - Lfde22_start
	.long LDIFF_SYM363
Lfde22_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string

LDIFF_SYM364=Lme_1d - wrapper_delegate_invoke_System_Comparison_1_string_invoke_int_T_T_string_string
	.long LDIFF_SYM364
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde22_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_managed-to-native)_SQLitePCL.NativeLibrary/NativeLib_dlopen:dlopen"
	.asciz "wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int"

	.byte 0,0
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int
	.quad Lme_1e

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM365=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM365
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM366=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM366
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM367=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM367
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM368=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM368
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM369=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM369
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM370=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM370
	.byte 1,106,11
	.asciz "V_4"

LDIFF_SYM371=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM371
	.byte 0,11
	.asciz "V_5"

LDIFF_SYM372=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM372
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM373=Lfde23_end - Lfde23_start
	.long LDIFF_SYM373
Lfde23_start:

	.long 0
	.align 3
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int

LDIFF_SYM374=Lme_1e - wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlopen_string_int
	.long LDIFF_SYM374
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,76,147,15,148,14,68,149,13,150,12,68,151,11,152,10,68,153,9
	.byte 154,8,68,155,7,156,6
	.align 3
Lfde23_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_managed-to-native)_SQLitePCL.NativeLibrary/NativeLib_dlopen:dlsym"
	.asciz "wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string"

	.byte 0,0
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string
	.quad Lme_1f

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM375=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM375
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM376=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM376
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM377=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM377
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM378=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM378
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM379=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM379
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM380=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM380
	.byte 1,105,11
	.asciz "V_4"

LDIFF_SYM381=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM381
	.byte 0,11
	.asciz "V_5"

LDIFF_SYM382=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM382
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM383=Lfde24_end - Lfde24_start
	.long LDIFF_SYM383
Lfde24_start:

	.long 0
	.align 3
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string

LDIFF_SYM384=Lme_1f - wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlsym_intptr_string
	.long LDIFF_SYM384
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,76,147,15,148,14,68,149,13,150,12,68,151,11,152,10,68,153,9
	.byte 154,8,68,155,7,156,6
	.align 3
Lfde24_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_managed-to-native)_SQLitePCL.NativeLibrary/NativeLib_dlopen:dlclose"
	.asciz "wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr"

	.byte 0,0
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr
	.quad Lme_20

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM385=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM385
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM386=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM386
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM387=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM387
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM388=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM388
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM389=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM389
	.byte 1,106,11
	.asciz "V_4"

LDIFF_SYM390=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM390
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM391=Lfde25_end - Lfde25_start
	.long LDIFF_SYM391
Lfde25_start:

	.long 0
	.align 3
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr

LDIFF_SYM392=Lme_20 - wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_dlopen_dlclose_intptr
	.long LDIFF_SYM392
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,76,147,15,148,14,68,149,13,150,12,68,151,11,152,10,68,153,9
	.byte 154,8,68,155,7,156,6
	.align 3
Lfde25_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_managed-to-native)_SQLitePCL.NativeLibrary/NativeLib_Win:LoadLibrary"
	.asciz "wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string"

	.byte 0,0
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string
	.quad Lme_21

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM393=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM393
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM394=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM394
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM395=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM395
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM396=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM396
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM397=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM397
	.byte 1,104,11
	.asciz "V_4"

LDIFF_SYM398=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM398
	.byte 0,11
	.asciz "V_5"

LDIFF_SYM399=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM399
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM400=Lfde26_end - Lfde26_start
	.long LDIFF_SYM400
Lfde26_start:

	.long 0
	.align 3
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string

LDIFF_SYM401=Lme_21 - wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_LoadLibrary_string
	.long LDIFF_SYM401
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,76,147,15,148,14,68,149,13,150,12,68,151,11,152,10,68,153,9
	.byte 154,8,68,155,7,156,6
	.align 3
Lfde26_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_managed-to-native)_SQLitePCL.NativeLibrary/NativeLib_Win:GetProcAddress"
	.asciz "wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string"

	.byte 0,0
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string
	.quad Lme_22

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM402=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM402
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM403=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM403
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM404=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM404
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM405=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM405
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM406=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM406
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM407=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM407
	.byte 1,105,11
	.asciz "V_4"

LDIFF_SYM408=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM408
	.byte 0,11
	.asciz "V_5"

LDIFF_SYM409=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM409
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM410=Lfde27_end - Lfde27_start
	.long LDIFF_SYM410
Lfde27_start:

	.long 0
	.align 3
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string

LDIFF_SYM411=Lme_22 - wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_GetProcAddress_intptr_string
	.long LDIFF_SYM411
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,76,147,15,148,14,68,149,13,150,12,68,151,11,152,10,68,153,9
	.byte 154,8,68,155,7,156,6
	.align 3
Lfde27_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_managed-to-native)_SQLitePCL.NativeLibrary/NativeLib_Win:FreeLibrary"
	.asciz "wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr"

	.byte 0,0
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr
	.quad Lme_23

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM412=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM412
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM413=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM413
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM414=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM414
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM415=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM415
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM416=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM416
	.byte 1,106,11
	.asciz "V_4"

LDIFF_SYM417=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM417
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM418=Lfde28_end - Lfde28_start
	.long LDIFF_SYM418
Lfde28_start:

	.long 0
	.align 3
	.quad wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr

LDIFF_SYM419=Lme_23 - wrapper_managed_to_native_SQLitePCL_NativeLibrary_NativeLib_Win_FreeLibrary_intptr
	.long LDIFF_SYM419
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29,76,147,15,148,14,68,149,13,150,12,68,151,11,152,10,68,153,9
	.byte 154,8,68,155,7,156,6
	.align 3
Lfde28_end:

.section __DWARF, __debug_info,regular,debug

	.byte 0
Ldebug_info_end:
.text
	.align 3
mem_end:
