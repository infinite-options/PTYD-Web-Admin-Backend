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
	.asciz "Xamarin.Forms.Maps.dll"
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
	.no_dead_strip ThisAssembly__ctor
ThisAssembly__ctor:
.file 1 "<unknown>"
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_0:
.text
	.align 4
	.no_dead_strip ThisAssembly_Git__ctor
ThisAssembly_Git__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_1:
.text
	.align 4
	.no_dead_strip ThisAssembly_Git_BaseVersion__ctor
ThisAssembly_Git_BaseVersion__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_2:
.text
	.align 4
	.no_dead_strip ThisAssembly_Git_SemVer__ctor
ThisAssembly_Git_SemVer__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_3:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Circle_get_Center
Xamarin_Forms_Maps_Circle_get_Center:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #200]
.word 0xf9400001
.word 0xf9402ba0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54000261
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #208]
.word 0xeb02003f
.word 0x10000011
.word 0x54000161
.word 0x91004000
.word 0xf9400001
.word 0xf9000ba1
.word 0xf9400400
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_4:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Circle_set_Center_Xamarin_Forms_Maps_Position
Xamarin_Forms_Maps_Circle_set_Center_Xamarin_Forms_Maps_Position:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #200]
.word 0xf9400000
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e2
.word 0xf94033a1
.word 0x91004040
.word 0xf9400fa3
.word 0xf9000003
.word 0xf94013a3
.word 0xf9000403
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_5:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Circle_get_Radius
Xamarin_Forms_Maps_Circle_get_Radius:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #224]
.word 0xf9400001
.word 0xf9402ba0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54000201
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #232]
.word 0xeb02003f
.word 0x10000011
.word 0x54000101
.word 0x91004000
.word 0xf9400000
.word 0xf9000ba0
.word 0xfd400ba0
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_6:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Circle_set_Radius_Xamarin_Forms_Maps_Distance
Xamarin_Forms_Maps_Circle_set_Radius_Xamarin_Forms_Maps_Distance:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #224]
.word 0xf9400000
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #240]
.word 0xd2800301
bl _p_3
.word 0xaa0003e2
.word 0xf94033a1
.word 0x91004040
.word 0xf9400fa3
.word 0xf9000003
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_7:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Circle_get_FillColor
Xamarin_Forms_Maps_Circle_get_FillColor:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba8
.word 0xf9000fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #248]
.word 0xf9400001
.word 0xf9400fa0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540005c1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #256]
.word 0xeb02003f
.word 0x10000011
.word 0x540004c1
.word 0x91004000
.word 0xb9800001
.word 0xb90023a1
.word 0xb9800401
.word 0xb90027a1
.word 0xb9800801
.word 0xb9002ba1
.word 0xb9800c01
.word 0xb9002fa1
.word 0xb9801001
.word 0xb90033a1
.word 0xb9801401
.word 0xb90037a1
.word 0xb9801801
.word 0xb9003ba1
.word 0xb9801c00
.word 0xb9003fa0
.word 0xf9400ba0
.word 0xb98023a1
.word 0xb9000001
.word 0xb98027a1
.word 0xb9000401
.word 0xb9802ba1
.word 0xb9000801
.word 0xb9802fa1
.word 0xb9000c01
.word 0xb98033a1
.word 0xb9001001
.word 0xb98037a1
.word 0xb9001401
.word 0xb9803ba1
.word 0xb9001801
.word 0xb9803fa1
.word 0xb9001c01
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_8:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Circle_set_FillColor_Xamarin_Forms_Color
Xamarin_Forms_Maps_Circle_set_FillColor_Xamarin_Forms_Color:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #248]
.word 0xf9400000
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #264]
.word 0xd2800601
bl _p_3
.word 0xaa0003e2
.word 0xf94013a1
.word 0xf9400fa3
.word 0x91004040
.word 0xb9800064
.word 0xb9000004
.word 0xb9800464
.word 0xb9000404
.word 0xb9800864
.word 0xb9000804
.word 0xb9800c64
.word 0xb9000c04
.word 0xb9801064
.word 0xb9001004
.word 0xb9801464
.word 0xb9001404
.word 0xb9801864
.word 0xb9001804
.word 0xb9801c63
.word 0xb9001c03
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_9:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Circle__ctor
Xamarin_Forms_Maps_Circle__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
bl _p_5
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Circle__cctor
Xamarin_Forms_Maps_Circle__cctor:
.loc 1 1 0
.word 0xa9b57bfd
.word 0x910003fd
.word 0xd2800210
.word 0x910003f1
.word 0xcb100231
.word 0x9100023f

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #272]
.word 0xf9004fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #280]
.word 0xf90053a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #288]
.word 0xf90057a0
.word 0xd2800000
.word 0xf9001fa0
.word 0xf90023a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e3
.word 0xf9404fa0
.word 0xf94053a1
.word 0xf94057a2
.word 0x91004064
.word 0xf9401fa5
.word 0xf9000085
.word 0xf94023a5
.word 0xf9000485
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #200]
.word 0xf9004ba0
.word 0xd5033bbf
.word 0xf9404ba0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #296]
.word 0xf9003fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #304]
.word 0xf90043a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #288]
.word 0xf90047a0
.word 0xf9001bbf

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #240]
.word 0xd2800301
bl _p_3
.word 0xaa0003e3
.word 0xf9403fa0
.word 0xf94043a1
.word 0xf94047a2
.word 0x91004064
.word 0xf9401ba5
.word 0xf9000085
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #224]
.word 0xf9003ba0
.word 0xd5033bbf
.word 0xf9403ba0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #312]
.word 0xf9002fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #320]
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #288]
.word 0xf90037a0
.word 0x910043a8
bl _p_7

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #264]
.word 0xd2800601
bl _p_3
.word 0xaa0003e3
.word 0xf9402fa0
.word 0xf94033a1
.word 0xf94037a2
.word 0x91004064
.word 0xb98013a5
.word 0xb9000085
.word 0xb98017a5
.word 0xb9000485
.word 0xb9801ba5
.word 0xb9000885
.word 0xb9801fa5
.word 0xb9000c85
.word 0xb98023a5
.word 0xb9001085
.word 0xb98027a5
.word 0xb9001485
.word 0xb9802ba5
.word 0xb9001885
.word 0xb9802fa5
.word 0xb9001c85
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #248]
.word 0xf9002ba0
.word 0xd5033bbf
.word 0xf9402ba0
.word 0xf9000001
.word 0x910003bf
.word 0xa8cb7bfd
.word 0xd65f03c0

Lme_b:
.text
ut_12:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance__ctor_double
ut_end:
.section __TEXT, __const
_unbox_trampoline_p:

	.long 0
LDIFF_SYM3=ut_end - ut_12
	.long LDIFF_SYM3
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance__ctor_double
Xamarin_Forms_Maps_Distance__ctor_double:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd400fa0
.word 0xf9400ba0
.word 0xfd000000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_c:
.text
ut_13:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_get_Meters
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_get_Meters
Xamarin_Forms_Maps_Distance_get_Meters:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xfd400000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_d:
.text
ut_14:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_get_Miles
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_get_Miles
Xamarin_Forms_Maps_Distance_get_Miles:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xfd400000
.word 0xd286e99e
.word 0xf2a8313e
.word 0xf2c4ac1e
.word 0xf2e8133e
.word 0x9e6703c1
.word 0x1e611800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_e:
.text
ut_15:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_get_Kilometers
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_get_Kilometers
Xamarin_Forms_Maps_Distance_get_Kilometers:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xfd400000
.word 0xd280001e
.word 0xf2c8001e
.word 0xf2e811fe
.word 0x9e6703c1
.word 0x1e611800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_f:
.text
ut_16:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_FromMiles_double
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_FromMiles_double
Xamarin_Forms_Maps_Distance_FromMiles_double:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xfd002ba0
.word 0xfd402ba0
.word 0x9e6703e1
.word 0x1e612000
.word 0x54000062
.word 0x9e6703e0
.word 0xfd002ba0
.word 0xfd402ba0
.word 0xd286e99e
.word 0xf2a8313e
.word 0xf2c4ac1e
.word 0xf2e8133e
.word 0x9e6703c1
.word 0x1e610800
.word 0xf9002fbf
.word 0xfd002fa0
.word 0xf9402fa0
.word 0xf9000ba0
.word 0xfd400ba0
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_10:
.text
ut_17:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_FromMeters_double
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_FromMeters_double
Xamarin_Forms_Maps_Distance_FromMeters_double:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xfd002ba0
.word 0xfd402ba0
.word 0x9e6703e1
.word 0x1e612000
.word 0x54000062
.word 0x9e6703e0
.word 0xfd002ba0
.word 0xfd402ba0
.word 0xf9002fbf
.word 0xfd002fa0
.word 0xf9402fa0
.word 0xf9000ba0
.word 0xfd400ba0
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_11:
.text
ut_18:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_FromKilometers_double
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_FromKilometers_double
Xamarin_Forms_Maps_Distance_FromKilometers_double:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xfd002ba0
.word 0xfd402ba0
.word 0x9e6703e1
.word 0x1e612000
.word 0x54000062
.word 0x9e6703e0
.word 0xfd002ba0
.word 0xfd402ba0
.word 0xd280001e
.word 0xf2c8001e
.word 0xf2e811fe
.word 0x9e6703c1
.word 0x1e610800
.word 0xf9002fbf
.word 0xfd002fa0
.word 0xf9402fa0
.word 0xf9000ba0
.word 0xfd400ba0
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_12:
.text
ut_19:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_BetweenPositions_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_BetweenPositions_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
Xamarin_Forms_Maps_Distance_BetweenPositions_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.loc 1 1 0
.word 0xa9ab7bfd
.word 0x910003fd
.word 0xfd002ba0
.word 0xfd002fa1
.word 0xfd004ba2
.word 0xfd004fa3
.word 0xfd402ba0
bl _p_8
.word 0xfd00a3a0
.word 0xfd402fa0
bl _p_8
.word 0xfd009ba0
.word 0xfd404ba0
bl _p_8
.word 0xfd009fa0
.word 0xfd404fa0
bl _p_8
.word 0x1e604002
.word 0xfd0097a2
.word 0xfd409fa0
.word 0xfd40a3a1
.word 0xfd008ba0
.word 0xfd008fa1
.word 0x1e613800
.word 0xd280001e
.word 0xf2e8001e
.word 0x9e6703c1
.word 0x1e611800
bl _p_9
.word 0x1e604002
.word 0xfd4097a0
.word 0xfd409ba1
.word 0x1e604043
.word 0x1e604062
.word 0x1e630842
.word 0xfd0093a2
.word 0x1e613800
.word 0xd280001e
.word 0xf2e8001e
.word 0x9e6703c1
.word 0x1e611800
bl _p_9
.word 0x1e604002
.word 0xfd408fa0
.word 0xfd4093a1
.word 0x1e604043
.word 0x1e604062
.word 0x1e630842
.word 0xfd0087a2
.word 0xfd007fa1
bl _p_10
.word 0x1e604001
.word 0xfd0083a1
.word 0xfd408ba0
bl _p_10
.word 0x1e604003
.word 0xfd407fa0
.word 0xfd4083a1
.word 0xfd4087a2
.word 0x1e630821
.word 0x1e620821
.word 0x1e612800
.word 0xd280001e
.word 0xf2dc601e
.word 0xf2e8191e
.word 0x9e6703c1
.word 0xfd0073a1
.word 0xfd007ba0
bl _p_11
.word 0xfd0077a0
.word 0xfd407ba1
.word 0xd280001e
.word 0xf2e7fe1e
.word 0x9e6703c0
.word 0x1e613800
bl _p_11
.word 0x1e604001
.word 0xfd4077a0
bl _p_12
.word 0x1e604001
.word 0xfd4073a0
.word 0x1e610800
.word 0x910043a0
.word 0xf9006ba0
bl _p_13
.word 0xf9406bbe
.word 0xfd0003c0
.word 0xfd400ba0
.word 0x910003bf
.word 0xa8d57bfd
.word 0xd65f03c0

Lme_13:
.text
ut_20:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_Equals_Xamarin_Forms_Maps_Distance
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_Equals_Xamarin_Forms_Maps_Distance
Xamarin_Forms_Maps_Distance_Equals_Xamarin_Forms_Maps_Distance:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0x9e6703e0
.word 0xfd002fa0
.word 0xf9400ba0
.word 0xfd400000
.word 0xfd002fa0
.word 0xfd400fa0
.word 0x910163a0
bl _p_14
.word 0x53001c00
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_14:
.text
ut_21:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_Equals_object
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_Equals_object
Xamarin_Forms_Maps_Distance_Equals_object:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9000fba
.word 0xf90013a0
.word 0xaa0103fa
.word 0xb500007a
.word 0xd2800000
.word 0x14000025
.word 0xaa1a03f8
.word 0xeb1f035f
.word 0x54000160
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #232]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800018
.word 0xb40002d8
.word 0xf9400340
.word 0x3940b001
.word 0xeb1f003f
.word 0x10000011
.word 0x540002e1
.word 0xf9400000
.word 0xf9400000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #232]
.word 0xeb01001f
.word 0x10000011
.word 0x540001e1
.word 0x91004340
.word 0xf9400000
.word 0xf90017a0
.word 0xf94013a0
.word 0xfd4017a0
bl _p_15
.word 0x53001c00
.word 0x14000002
.word 0xd2800000
.word 0xf9400bb8
.word 0xf9400fba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_15:
.text
ut_22:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_GetHashCode
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_GetHashCode
Xamarin_Forms_Maps_Distance_GetHashCode:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xfd400340
.word 0xfd000fa0
.word 0xf9400fba
.word 0xaa1a03e0
.word 0xd1000400
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x5400008b
.word 0xd2800000
.word 0xf2effe00
.word 0x8a00035a
.word 0x93407f40
.word 0x9360ff41
.word 0x93407c21
.word 0x4a010000
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_16:
.text
ut_23:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_op_Equality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_op_Equality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance
Xamarin_Forms_Maps_Distance_op_Equality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance:
.loc 1 1 0
.word 0xa9b77bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd002ba1
.word 0x910043a0
.word 0xfd402ba0
bl _p_15
.word 0x53001c00
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_17:
.text
ut_24:
add x0, x0, 16
b Xamarin_Forms_Maps_Distance_op_Inequality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Distance_op_Inequality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance
Xamarin_Forms_Maps_Distance_op_Inequality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance:
.loc 1 1 0
.word 0xa9b77bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd002ba1
.word 0x910043a0
.word 0xfd402ba0
bl _p_15
.word 0x53001c00
.word 0x6b1f001f
.word 0x9a9f17e0
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_18:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Geocoder_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position
Xamarin_Forms_Maps_Geocoder_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #328]
.word 0xf9400000
.word 0xb40001e0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #328]
.word 0xf9400001
.word 0xaa0103e0
.word 0xfd400fa0
.word 0xfd4013a1
.word 0xf90033a1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf94033a1
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2800621
bl _p_16
.word 0xaa0003e1
.word 0xd2801980
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_19:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Geocoder_GetPositionsForAddressAsync_string
Xamarin_Forms_Maps_Geocoder_GetPositionsForAddressAsync_string:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #336]
.word 0xf9400000
.word 0xb40001c0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #336]
.word 0xf9400002
.word 0xaa0203e0
.word 0xf9400fa1
.word 0xf90013a2
.word 0xf9400c50
.word 0xd63f0200
.word 0xf94013a1
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2800621
bl _p_16
.word 0xaa0003e1
.word 0xd2801980
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_1a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Geocoder__ctor
Xamarin_Forms_Maps_Geocoder__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_1b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_GeographyUtils_ToRadians_double
Xamarin_Forms_Maps_GeographyUtils_ToRadians_double:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd400ba0
.word 0xd285a31e
.word 0xf2aa889e
.word 0xf2c43f7e
.word 0xf2e8013e
.word 0x9e6703c1
.word 0x1e610800
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80cde
.word 0x9e6703c1
.word 0x1e611800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_1c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_GeographyUtils_ToDegrees_double
Xamarin_Forms_Maps_GeographyUtils_ToDegrees_double:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd400ba0
.word 0xd285a31e
.word 0xf2aa889e
.word 0xf2c43f7e
.word 0xf2e8013e
.word 0x9e6703c1
.word 0x1e611800
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80cde
.word 0x9e6703c1
.word 0x1e610800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_1d:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_GeographyUtils_ToCircumferencePositions_Xamarin_Forms_Maps_Circle
Xamarin_Forms_Maps_GeographyUtils_ToCircumferencePositions_Xamarin_Forms_Maps_Circle:
.loc 1 1 0
.word 0xa9af7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003fa
.word 0xd2800000
.word 0xf9003ba0
.word 0xf9003fa0
.word 0xf90037bf

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2800501
bl _p_3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #352]
.word 0xf9400021
.word 0xf9005ba0
.word 0x91004002
.word 0xd5033bbf
.word 0xf9405ba0
.word 0xf9000041
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xaa0003f9
.word 0x9101c3a0
.word 0xf90043a0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_18
.word 0xf94043be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd403ba0
bl _p_8
.word 0xfd0047a0
.word 0x9101c3a0
.word 0xf90043a0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_18
.word 0xf94043be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd403fa0
bl _p_8
.word 0xfd004ba0
.word 0x9101a3a0
.word 0xf90043a0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_19
.word 0xf94043be
.word 0xfd0003c0
.word 0xfd4037a0
.word 0xd280001e
.word 0xf2c8001e
.word 0xf2e811fe
.word 0x9e6703c1
.word 0x1e611800
.word 0xd280001e
.word 0xf2dc601e
.word 0xf2e8171e
.word 0x9e6703c1
.word 0x1e611800
.word 0xfd004fa0
.word 0xd280001a
.word 0x14000076
.word 0x1e620340
bl _p_8
.word 0xfd0053a0
.word 0xfd4047a0
bl _p_9
.word 0xfd0087a0
.word 0xfd404fa0
bl _p_10
.word 0x1e604001
.word 0xfd4087a0
.word 0x1e610800
.word 0xfd007ba0
.word 0xfd4047a0
bl _p_10
.word 0xfd0083a0
.word 0xfd404fa0
bl _p_9
.word 0x1e604001
.word 0xfd4083a0
.word 0x1e610800
.word 0xfd007fa0
.word 0xfd4053a0
bl _p_10
.word 0x1e604002
.word 0xfd407ba0
.word 0xfd407fa1
.word 0x1e620821
.word 0x1e612800
bl _p_20
.word 0xfd0057a0
.word 0xfd404ba0
.word 0xfd0063a0
.word 0xfd4053a0
bl _p_9
.word 0xfd0077a0
.word 0xfd404fa0
bl _p_9
.word 0x1e604001
.word 0xfd4077a0
.word 0x1e610800
.word 0xfd0073a0
.word 0xfd4047a0
bl _p_10
.word 0x1e604001
.word 0xfd4073a0
.word 0x1e610800
.word 0xfd0067a0
.word 0xfd404fa0
bl _p_10
.word 0xfd006ba0
.word 0xfd4047a0
bl _p_9
.word 0xfd006fa0
.word 0xfd4057a0
bl _p_9
.word 0x1e604003
.word 0xfd4067a0
.word 0xfd406ba1
.word 0xfd406fa2
.word 0x1e630842
.word 0x1e623821
bl _p_12
.word 0x1e604001
.word 0xfd4063a0
.word 0x1e612800
.word 0xfd0053a0
.word 0xfd4057a0
bl _p_21
.word 0xfd005fa0
.word 0xfd4053a0
bl _p_21
.word 0x1e604001
.word 0xfd405fa0
.word 0xd2800000
.word 0xf9002fa0
.word 0xf90033a0
.word 0x910163a0
bl _p_22
.word 0xf9402fa0
.word 0xf9001fa0
.word 0xf94033a0
.word 0xf90023a0
.word 0xaa1903f8
.word 0xf9401fa0
.word 0xf90027a0
.word 0xf94023a0
.word 0xf9002ba0
.word 0x3940033e
.word 0xb9802720
.word 0x11000400
.word 0xb9002720
.word 0xf9400b37
.word 0xb9802336
.word 0xaa1603e0
.word 0xb9801ae1
.word 0x6b01001f
.word 0x54000202
.word 0x110006c0
.word 0xb9002300
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000309
.word 0xd37cec00
.word 0x8b0002e0
.word 0x91008000
.word 0xf94027a1
.word 0xf9000001
.word 0xf9402ba1
.word 0xf9000401
.word 0x14000005
.word 0xaa1803e0
.word 0xfd4027a0
.word 0xfd402ba1
bl _p_23
.word 0x1100075a
.word 0xd2802d1e
.word 0x6b1e035f
.word 0x54fff12d
.word 0xaa1903e0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8d17bfd
.word 0xd65f03c0
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_1e:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__ctor_Xamarin_Forms_Maps_MapSpan
Xamarin_Forms_Maps_Map__ctor_Xamarin_Forms_Maps_MapSpan:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #360]
.word 0xd2800701
bl _p_3
.word 0xf9002ba0
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #368]
.word 0x3980b410
.word 0xb5000050
bl _p_24

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #368]
.word 0xd2800501
bl _p_3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #376]
.word 0xf9400021
.word 0xf9002fa0
.word 0x91004002
.word 0xd5033bbf
.word 0xf94033a0
.word 0xf9000041
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0x91004001
.word 0xd5033bbf
.word 0xf9402fa0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0x91062321
.word 0xd5033bbf
.word 0xf9402ba0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #384]
.word 0xd2800701
bl _p_3
.word 0xf9001fa0
.word 0xf90027a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #392]
.word 0x3980b410
.word 0xb5000050
bl _p_24

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #392]
.word 0xd2800501
bl _p_3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #400]
.word 0xf9400021
.word 0xf90023a0
.word 0x91004002
.word 0xd5033bbf
.word 0xf94027a0
.word 0xf9000041
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0x91004001
.word 0xd5033bbf
.word 0xf94023a0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0x91064321
.word 0xd5033bbf
.word 0xf9401fa0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa1903e0
bl _p_25
.word 0x9106a321
.word 0xd5033bbf
.word 0xf9400fa0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #408]
.word 0xb9800000
.word 0xb9002ba0
.word 0xb9802ba0
.word 0xb90023a0
.word 0xaa1903e0
.word 0xf94013a1
bl _p_26
.word 0xaa1903e0
.word 0xf94017a1
bl _p_27
.word 0xf940c720
.word 0xf9001ba0
.word 0xeb1f033f
.word 0x10000011
.word 0x54000640

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #416]
.word 0xd2801001
bl _p_3
.word 0xaa0003e1
.word 0xf9401ba2
.word 0xeb1f033f
.word 0x10000011
.word 0x540004a0
.word 0xd5033bbf
.word 0xf9001039
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #424]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #432]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #440]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0x3901c03f
.word 0xaa0203e0
.word 0x3940005e
bl _p_28
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2800f60
.word 0xaa1103e1
bl _p_2

Lme_1f:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__ctor
Xamarin_Forms_Maps_Map__ctor:
.loc 1 1 0
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xd2800000
.word 0xf90017a0
.word 0xf9001ba0
.word 0x9100a3a0
.word 0xd28d575e
.word 0xf2a473de
.word 0xf2de3e5e
.word 0xf2e8089e
.word 0x9e6703c0
.word 0xd281e37e
.word 0xf2bb16de
.word 0xf2df7dbe
.word 0xf2e8051e
.word 0x9e6703c1
bl _p_22
.word 0xf94017a0
.word 0xf9000fa0
.word 0xf9401ba0
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #448]
.word 0xd2800601
bl _p_3
.word 0xf90023a0
.word 0xfd400fa0
.word 0xfd4013a1
.word 0xd293335e
.word 0xf2b3333e
.word 0xf2d3333e
.word 0xf2e7f73e
.word 0x9e6703c2
.word 0xd293335e
.word 0xf2b3333e
.word 0xf2d3333e
.word 0xf2e7f73e
.word 0x9e6703c3
bl _p_29
.word 0xf94023a1
.word 0xf9400ba0
bl _p_30
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_20:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_HasScrollEnabled
Xamarin_Forms_Maps_Map_get_HasScrollEnabled:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #456]
.word 0xf9400001
.word 0xf9400ba0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540001a1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #464]
.word 0xeb02003f
.word 0x10000011
.word 0x540000a1
.word 0x39404000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_21:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_set_HasScrollEnabled_bool
Xamarin_Forms_Maps_Map_set_HasScrollEnabled_bool:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #456]
.word 0xf9400000
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #472]
.word 0xd2800221
bl _p_3
.word 0xaa0003e2
.word 0xf94013a1
.word 0x394063a0
.word 0x39004040
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_22:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_HasZoomEnabled
Xamarin_Forms_Maps_Map_get_HasZoomEnabled:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #480]
.word 0xf9400001
.word 0xf9400ba0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540001a1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #464]
.word 0xeb02003f
.word 0x10000011
.word 0x540000a1
.word 0x39404000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_23:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_set_HasZoomEnabled_bool
Xamarin_Forms_Maps_Map_set_HasZoomEnabled_bool:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #480]
.word 0xf9400000
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #472]
.word 0xd2800221
bl _p_3
.word 0xaa0003e2
.word 0xf94013a1
.word 0x394063a0
.word 0x39004040
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_24:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_IsShowingUser
Xamarin_Forms_Maps_Map_get_IsShowingUser:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #488]
.word 0xf9400001
.word 0xf9400ba0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540001a1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #464]
.word 0xeb02003f
.word 0x10000011
.word 0x540000a1
.word 0x39404000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_25:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_set_IsShowingUser_bool
Xamarin_Forms_Maps_Map_set_IsShowingUser_bool:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #488]
.word 0xf9400000
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #472]
.word 0xd2800221
bl _p_3
.word 0xaa0003e2
.word 0xf94013a1
.word 0x394063a0
.word 0x39004040
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_26:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_MapType
Xamarin_Forms_Maps_Map_get_MapType:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #496]
.word 0xf9400001
.word 0xf9400ba0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540001a1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #504]
.word 0xeb02003f
.word 0x10000011
.word 0x540000a1
.word 0xb9801000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_27:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_set_MapType_Xamarin_Forms_Maps_MapType
Xamarin_Forms_Maps_Map_set_MapType_Xamarin_Forms_Maps_MapType:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #496]
.word 0xf9400000
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #512]
.word 0xd2800281
bl _p_3
.word 0xaa0003e2
.word 0xf94013a1
.word 0xb9801ba0
.word 0xb9001040
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_28:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_Pins
Xamarin_Forms_Maps_Map_get_Pins:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf940c400
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_29:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_ItemsSource
Xamarin_Forms_Maps_Map_get_ItemsSource:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #520]
.word 0xf9400001
.word 0xaa1a03e0
bl _p_1
.word 0xaa0003fa
.word 0xb400031a
.word 0xf9400340
.word 0xb9402801

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #528]
.word 0xeb02003f
.word 0x10000011
.word 0x540002a3
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #528]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xeb1f001f
.word 0x10000011
.word 0x540000c0
.word 0xaa1a03e0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_2a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_set_ItemsSource_System_Collections_IEnumerable
Xamarin_Forms_Maps_Map_set_ItemsSource_System_Collections_IEnumerable:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #520]
.word 0xf9400001
.word 0xf9400ba0
.word 0xf9400fa2
bl _p_4
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_2b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_ItemTemplate
Xamarin_Forms_Maps_Map_get_ItemTemplate:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #536]
.word 0xf9400001
.word 0xaa1a03e0
bl _p_1
.word 0xaa0003fa
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #544]
.word 0xeb01001f
.word 0x10000011
.word 0x540000c1
.word 0xaa1a03e0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_2c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_set_ItemTemplate_Xamarin_Forms_DataTemplate
Xamarin_Forms_Maps_Map_set_ItemTemplate_Xamarin_Forms_DataTemplate:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #536]
.word 0xf9400001
.word 0xf9400ba0
.word 0xf9400fa2
bl _p_4
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_2d:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_ItemTemplateSelector
Xamarin_Forms_Maps_Map_get_ItemTemplateSelector:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #552]
.word 0xf9400001
.word 0xaa1a03e0
bl _p_1
.word 0xaa0003fa
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #560]
.word 0xeb01001f
.word 0x10000011
.word 0x540000c1
.word 0xaa1a03e0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_2e:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_set_ItemTemplateSelector_Xamarin_Forms_DataTemplateSelector
Xamarin_Forms_Maps_Map_set_ItemTemplateSelector_Xamarin_Forms_DataTemplateSelector:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #552]
.word 0xf9400001
.word 0xf9400ba0
.word 0xf9400fa2
bl _p_4
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_2f:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_MoveToLastRegionOnLayoutChange
Xamarin_Forms_Maps_Map_get_MoveToLastRegionOnLayoutChange:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #568]
.word 0xf9400001
.word 0xf9400ba0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540001a1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #464]
.word 0xeb02003f
.word 0x10000011
.word 0x540000a1
.word 0x39404000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_30:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_set_MoveToLastRegionOnLayoutChange_bool
Xamarin_Forms_Maps_Map_set_MoveToLastRegionOnLayoutChange_bool:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #568]
.word 0xf9400000
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #472]
.word 0xd2800221
bl _p_3
.word 0xaa0003e2
.word 0xf94013a1
.word 0x394063a0
.word 0x39004040
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_31:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_MapElements
Xamarin_Forms_Maps_Map_get_MapElements:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf940c800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_32:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_add_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs
Xamarin_Forms_Maps_Map_add_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf940d338
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_31
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #576]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x91068321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_33:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_remove_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs
Xamarin_Forms_Maps_Map_remove_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf940d338
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_32
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #576]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x91068321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_34:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_SendMapClicked_Xamarin_Forms_Maps_Position
Xamarin_Forms_Maps_Map_SendMapClicked_Xamarin_Forms_Maps_Position:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xf9400fa0
.word 0xf940d000
.word 0xaa0003f9
.word 0xb5000040
.word 0x14000010

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #584]
.word 0xd2800401
bl _p_3
.word 0xaa0003e2
.word 0x91004040
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.word 0xaa1903e0
.word 0xf9400fa1
.word 0xf9400f30
.word 0xd63f0200
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_35:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_SetVisibleRegion_Xamarin_Forms_Maps_MapSpan
Xamarin_Forms_Maps_Map_SetVisibleRegion_Xamarin_Forms_Maps_MapSpan:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_33
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_36:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_VisibleRegion
Xamarin_Forms_Maps_Map_get_VisibleRegion:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf940cc00
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_37:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_set_VisibleRegion_Xamarin_Forms_Maps_MapSpan
Xamarin_Forms_Maps_Map_set_VisibleRegion_Xamarin_Forms_Maps_MapSpan:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf940cf20
.word 0xaa1a03e1
bl _p_34
.word 0x53001c00
.word 0x35000460
.word 0xaa1a03e0
.word 0xd2800001
bl _p_34
.word 0x53001c00
.word 0x35000440

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #592]
.word 0xaa1903e0
.word 0xf9400322
.word 0xf9404850
.word 0xd63f0200
.word 0x91066320
.word 0xf90013a0
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf900001a
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #592]
.word 0xaa1903e0
.word 0xf9400322
.word 0xf9404c50
.word 0xd63f0200
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2801521
bl _p_16
.word 0xaa0003e1
.word 0xd2800f80
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_38:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_get_LastMoveToRegion
Xamarin_Forms_Maps_Map_get_LastMoveToRegion:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf940d400
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_39:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_set_LastMoveToRegion_Xamarin_Forms_Maps_MapSpan
Xamarin_Forms_Maps_Map_set_LastMoveToRegion_Xamarin_Forms_Maps_MapSpan:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0x9106a001
.word 0xd5033bbf
.word 0xf9400fa0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_3a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_System_Collections_IEnumerable_GetEnumerator
Xamarin_Forms_Maps_Map_System_Collections_IEnumerable_GetEnumerator:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
bl _p_35
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_3b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_GetEnumerator
Xamarin_Forms_Maps_Map_GetEnumerator:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf940c401
.word 0xaa0103e0
.word 0x3940003e
bl _p_36
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_3c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_MoveToRegion_Xamarin_Forms_Maps_MapSpan
Xamarin_Forms_Maps_Map_MoveToRegion_Xamarin_Forms_Maps_MapSpan:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xf9000fa0
.word 0xaa0103fa
.word 0xaa1a03e0
.word 0xd2800001
bl _p_34
.word 0x53001c00
.word 0x350003a0
.word 0xf9400fa0
.word 0xf90013a0
.word 0x9106a001
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf900003a
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #600]

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #608]
.word 0xaa1a03e2
bl _p_37
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2801a21
bl _p_16
.word 0xaa0003e1
.word 0xd2800f80
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_3d:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_PinsOnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
Xamarin_Forms_Maps_Map_PinsOnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs:
.loc 1 1 0
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xf90013a0
.word 0xf90017a1
.word 0xaa0203fa
.word 0x3940035e
.word 0xf9400b40
.word 0xb4000a00
.word 0x3940035e
.word 0xf9400b40

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #616]
bl _p_38
.word 0xaa0003e2

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #624]
.word 0xf9400000
.word 0xaa0003e1
.word 0xaa0203fa
.word 0xaa0103f9
.word 0xb5000720

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #632]
.word 0xf9400000
.word 0xf90023a0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000940

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #640]
.word 0xd2801001
bl _p_3
.word 0xf9001fa0
.word 0xf94023a1
.word 0xeb1f003f
.word 0x10000011
.word 0x540007a0
.word 0xd5033bbf
.word 0xf9401fa0
.word 0xf9001001
.word 0x91008002
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #648]
.word 0xf9001401

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #656]
.word 0xf9002001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #664]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0x3901c01f
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #624]
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000020
.word 0xaa0003f9

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #672]
.word 0xaa1a03e0
.word 0xaa1903e1
bl _p_39
.word 0x53001c00
.word 0x350000a0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2802021
bl _p_16
.word 0xaa0003e1
.word 0xd2800f60
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2800f60
.word 0xaa1103e1
bl _p_2

Lme_3e:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_OnItemsSourcePropertyChanged_System_Collections_IEnumerable_System_Collections_IEnumerable
Xamarin_Forms_Maps_Map_OnItemsSourcePropertyChanged_System_Collections_IEnumerable_System_Collections_IEnumerable:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa
.word 0xaa1903f7
.word 0xeb1f033f
.word 0x540002c0
.word 0xf9400336
.word 0xb9402ac0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #680]
.word 0xeb01001f
.word 0x540001c3
.word 0xf94012c0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #680]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xb5000040
.word 0xd2800017
.word 0xaa1703f9
.word 0xb4000677
.word 0xeb1f031f
.word 0x10000011
.word 0x54001160

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #416]
.word 0xd2801001
bl _p_3
.word 0xaa0003e1
.word 0xeb1f031f
.word 0x10000011
.word 0x54000fe0
.word 0xd5033bbf
.word 0xf9001038
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #688]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #696]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #704]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901c03f
.word 0xaa1903e0
.word 0xf9400322

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #712]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xaa1a03f9
.word 0xeb1f035f
.word 0x540002c0
.word 0xf9400357
.word 0xb9402ae0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #680]
.word 0xeb01001f
.word 0x540001c3
.word 0xf94012e0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #680]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xb5000040
.word 0xd2800019
.word 0xaa1903fa
.word 0xb4000679
.word 0xeb1f031f
.word 0x10000011
.word 0x540007e0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #416]
.word 0xd2801001
bl _p_3
.word 0xaa0003e1
.word 0xeb1f031f
.word 0x10000011
.word 0x54000660
.word 0xd5033bbf
.word 0xf9001038
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #688]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #696]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #704]
.word 0xf9401402
.word 0xf9000c22
.word 0xf9401000
.word 0xf9000820
.word 0x3901c03f
.word 0xaa1a03e0
.word 0xf9400342

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #720]
.word 0x928010f0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xf940c701
.word 0xaa0103e0
.word 0x3940003e
bl _p_40
.word 0xaa1803e0
bl _p_41
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2800f60
.word 0xaa1103e1
bl _p_2

Lme_3f:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_OnItemTemplatePropertyChanged_Xamarin_Forms_DataTemplate_Xamarin_Forms_DataTemplate
Xamarin_Forms_Maps_Map_OnItemTemplatePropertyChanged_Xamarin_Forms_DataTemplate_Xamarin_Forms_DataTemplate:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9000fa0
.word 0xf90013a1
.word 0xf90017a2
.word 0xf94017b8
.word 0xf94017a0
.word 0xeb1f001f
.word 0x54000180
.word 0xf94017a0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #560]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800018
.word 0xb5000198
.word 0xf9400fa0
.word 0xf940c401
.word 0xaa0103e0
.word 0x3940003e
bl _p_40
.word 0xf9400fa0
bl _p_41
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #728]
.word 0xd28000a1
bl _p_42
.word 0xf90037a0
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2802ae1
bl _p_16
.word 0xaa0003e2
.word 0xf94037a3
.word 0xaa0303e0
.word 0xd2800001
.word 0xf9400063
.word 0xf9408470
.word 0xd63f0200
.word 0xf94033a3
.word 0xaa0303e0
.word 0xf9002fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #536]
.word 0xf9400000
.word 0xaa0003e1
.word 0x3940003e
.word 0xf9401002
.word 0xaa0303e0
.word 0xd2800021
.word 0xf9400063
.word 0xf9408470
.word 0xd63f0200
.word 0xf9402fa0
.word 0xf9002ba0
.word 0xf90027a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd2802d21
bl _p_16
.word 0xaa0003e2
.word 0xf9402ba3
.word 0xaa0303e0
.word 0xd2800041
.word 0xf9400063
.word 0xf9408470
.word 0xd63f0200
.word 0xf94027a3
.word 0xaa0303e0
.word 0xf90023a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #552]
.word 0xf9400000
.word 0xaa0003e1
.word 0x3940003e
.word 0xf9401002
.word 0xaa0303e0
.word 0xd2800061
.word 0xf9400063
.word 0xf9408470
.word 0xd63f0200
.word 0xf94023a0
.word 0xf9001fa0
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #0]
.word 0xd28039e1
bl _p_16
.word 0xaa0003e2
.word 0xf9401fa3
.word 0xaa0303e0
.word 0xd2800081
.word 0xf9400063
.word 0xf9408470
.word 0xd63f0200
.word 0xf9401ba0
bl _p_43
.word 0xaa0003e1
.word 0xd2801ba0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_40:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_OnItemTemplateSelectorPropertyChanged
Xamarin_Forms_Maps_Map_OnItemTemplateSelectorPropertyChanged:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf940c401
.word 0xaa0103e0
.word 0x3940003e
bl _p_40
.word 0xf9400ba0
bl _p_41
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_41:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_OnItemsSourceCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
Xamarin_Forms_Maps_Map_OnItemsSourceCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs:
.loc 1 1 0
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xf90013a2
.word 0xeb1f033f
.word 0x10000011
.word 0x54001120

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #736]
.word 0xd2801001
bl _p_3
.word 0xf90027a0
.word 0xeb1f033f
.word 0x10000011
.word 0x54000fa0
.word 0xd5033bbf
.word 0xf94027a0
.word 0xf9001019
.word 0x91008001
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #744]
.word 0xf9001401

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #752]
.word 0xf9002001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #760]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0x3901c01f
.word 0xf9001ba0
.word 0xeb1f033f
.word 0x10000011
.word 0x54000bc0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #768]
.word 0xd2801001
bl _p_3
.word 0xf90023a0
.word 0xeb1f033f
.word 0x10000011
.word 0x54000a40
.word 0xd5033bbf
.word 0xf94023a0
.word 0xf9001019
.word 0x91008001
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #776]
.word 0xf9001401

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #784]
.word 0xf9002001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #792]
.word 0xf9401422
.word 0xf9000c02
.word 0xf9401021
.word 0xf9000801
.word 0x3901c01f
.word 0xf9001fa0
.word 0xeb1f033f
.word 0x10000011
.word 0x54000660

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #800]
.word 0xd2801001
bl _p_3
.word 0xaa0003e3
.word 0xf9401ba1
.word 0xf9401fa2
.word 0xeb1f033f
.word 0x10000011
.word 0x540004a0
.word 0xd5033bbf
.word 0xf9001079
.word 0x91008060
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x4, [x16, #16]
.word 0x8b040000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #808]
.word 0xf9001460

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #816]
.word 0xf9002060

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #824]
.word 0xf9401404
.word 0xf9000c64
.word 0xf9401000
.word 0xf9000860
.word 0x3901c07f
.word 0xf94013a0
bl _p_44
.word 0x93407c00
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2800f60
.word 0xaa1103e1
bl _p_2

Lme_42:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_CreatePinItems
Xamarin_Forms_Maps_Map_CreatePinItems:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xf90013bf
.word 0xf90017bf
.word 0xaa1a03e0
bl _p_45
.word 0xb4000d00
.word 0xaa1a03e0
bl _p_46
.word 0xb5000080
.word 0xaa1a03e0
bl _p_47
.word 0xb4000c40
.word 0xaa1a03e0
bl _p_45
.word 0xaa0003e1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #832]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf90013a0
.word 0x1400000f
.word 0xf94013a1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #840]
.word 0x928003f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xaa0003f9
.word 0xaa1a03e0
.word 0xaa1903e1
bl _p_48
.word 0xf94013a1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #848]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fffce0
.word 0xf9001bbf
.word 0x94000005
.word 0xf9401ba0
.word 0xb4000040
bl _p_49
.word 0x14000034
.word 0xf9002bbe
.word 0xf94013a0
.word 0xf9001fa0
.word 0xf9401fa0
.word 0xf90023a0
.word 0xf9401fa0
.word 0xeb1f001f
.word 0x54000380
.word 0xf9401fa0
.word 0xf9400000
.word 0xf90027a0
.word 0xf94027a0
.word 0xb9402800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #856]
.word 0xeb01001f
.word 0x540001e3
.word 0xf94027a0
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #856]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xb5000080
.word 0x14000001
.word 0xf90023bf
.word 0x14000001
.word 0xf94023a0
.word 0xf90017a0
.word 0xf94017a0
.word 0xb4000160
.word 0xf94017a1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #864]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9402bbe
.word 0xd61f03c0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_43:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_CreatePin_object
Xamarin_Forms_Maps_Map_CreatePin_object:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xf90013b9
.word 0xaa0003f9
.word 0xf90017a1
.word 0xaa1903e0
bl _p_46
.word 0xaa0003f8
.word 0xaa1803e0
.word 0xb5000180
.word 0xaa1903e0
bl _p_47
.word 0xaa0003f8
.word 0xb5000060
.word 0xd2800018
.word 0x14000006
.word 0xaa1803e0
.word 0xf94017a1
.word 0xaa1903e2
bl _p_50
.word 0xaa0003f8
.word 0xb4000358
.word 0xaa1803e0
.word 0x3940031e
bl _p_51
.word 0xaa0003f8
.word 0xb4000178
.word 0xf9400300
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #872]
.word 0xeb01001f
.word 0x10000011
.word 0x54000201
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xf94017a1
.word 0x3940031e
bl _p_52
.word 0xf940c722
.word 0xaa0203e0
.word 0xaa1803e1
.word 0x3940005e
bl _p_53
.word 0xa94163b7
.word 0xf94013b9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_44:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map_RemovePin_object
Xamarin_Forms_Maps_Map_RemovePin_object:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xd2800018
.word 0x1400001b
.word 0xf940c722
.word 0xaa0203e0
.word 0xaa1803e1
.word 0x3940005e
bl _p_54
.word 0xaa0003e1
.word 0xaa0103e0
.word 0x3940003e
bl _p_55
.word 0xaa0003f7
.word 0xb5000060
.word 0xd2800017
.word 0x14000007
.word 0xaa1703e0
.word 0xaa1a03e1
.word 0xf94002e2
.word 0xf9403050
.word 0xd63f0200
.word 0x53001c17
.word 0x340000d7
.word 0xf940c722
.word 0xaa0203e0
.word 0xaa1803e1
.word 0x3940005e
bl _p_56
.word 0x11000718
.word 0xf940c721
.word 0xaa0103e0
.word 0x3940003e
bl _p_57
.word 0x93407c00
.word 0x6b00031f
.word 0x54fffc0b
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_45:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__cctor
Xamarin_Forms_Maps_Map__cctor:
.loc 1 1 0
.word 0xa9ad7bfd
.word 0x910003fd
.word 0xd2800210
.word 0x910003f1
.word 0xcb100231
.word 0x9100023f

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #880]
.word 0xf9008ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #888]
.word 0xf9008fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #896]
.word 0xf90093a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #512]
.word 0xd2800281
bl _p_3
.word 0xaa0003e3
.word 0xf9408ba0
.word 0xf9408fa1
.word 0xf94093a2
.word 0xb900107f
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #496]
.word 0xf90087a0
.word 0xd5033bbf
.word 0xf94087a0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #904]
.word 0xf9007ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #912]
.word 0xf9007fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #896]
.word 0xf90083a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #472]
.word 0xd2800221
bl _p_3
.word 0xaa0003e3
.word 0xf9407ba0
.word 0xf9407fa1
.word 0xf94083a2
.word 0x3900407f
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #488]
.word 0xf90077a0
.word 0xd5033bbf
.word 0xf94077a0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #920]
.word 0xf9006ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #912]
.word 0xf9006fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #896]
.word 0xf90073a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #472]
.word 0xd2800221
bl _p_3
.word 0xaa0003e3
.word 0xf9406ba0
.word 0xf9406fa1
.word 0xf94073a2
.word 0xd280003e
.word 0x3900407e
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #456]
.word 0xf90067a0
.word 0xd5033bbf
.word 0xf94067a0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #928]
.word 0xf9005ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #912]
.word 0xf9005fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #896]
.word 0xf90063a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #472]
.word 0xd2800221
bl _p_3
.word 0xaa0003e3
.word 0xf9405ba0
.word 0xf9405fa1
.word 0xf94063a2
.word 0xd280003e
.word 0x3900407e
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #480]
.word 0xf90057a0
.word 0xd5033bbf
.word 0xf94057a0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #936]
.word 0xf90047a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #944]
.word 0xf9004ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #896]
.word 0xf9004fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #632]
.word 0xf9400000
.word 0xf90053a0
.word 0xeb1f001f
.word 0x10000011
.word 0x54002000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #952]
.word 0xd2801001
bl _p_3
.word 0xaa0003e6
.word 0xf9404ba1
.word 0xf9404fa2
.word 0xf94053a3
.word 0xeb1f007f
.word 0x10000011
.word 0x54001e20
.word 0xd5033bbf
.word 0xf94047a0
.word 0xf90010c3
.word 0x910080c4
.word 0xd349fc84
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0084

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x5, [x16, #16]
.word 0x8b050084
.word 0xd280003e
.word 0x3900009e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #960]
.word 0xf90014c3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #968]
.word 0xf90020c3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #976]
.word 0xf9401464
.word 0xf9000cc4
.word 0xf9401063
.word 0xf90008c3
.word 0x3901c0df
.word 0xd2800003
.word 0xd2800044
.word 0xd2800005
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #520]
.word 0xf90043a0
.word 0xd5033bbf
.word 0xf94043a0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #984]
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #992]
.word 0xf90037a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #896]
.word 0xf9003ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #632]
.word 0xf9400000
.word 0xf9003fa0
.word 0xeb1f001f
.word 0x10000011
.word 0x54001660

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #952]
.word 0xd2801001
bl _p_3
.word 0xaa0003e6
.word 0xf94037a1
.word 0xf9403ba2
.word 0xf9403fa3
.word 0xeb1f007f
.word 0x10000011
.word 0x54001480
.word 0xd5033bbf
.word 0xf94033a0
.word 0xf90010c3
.word 0x910080c4
.word 0xd349fc84
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0084

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x5, [x16, #16]
.word 0x8b050084
.word 0xd280003e
.word 0x3900009e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #1000]
.word 0xf90014c3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #1008]
.word 0xf90020c3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #1016]
.word 0xf9401464
.word 0xf9000cc4
.word 0xf9401063
.word 0xf90008c3
.word 0x3901c0df
.word 0xd2800003
.word 0xd2800044
.word 0xd2800005
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #536]
.word 0xf9002fa0
.word 0xd5033bbf
.word 0xf9402fa0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1024]
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1032]
.word 0xf90023a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #896]
.word 0xf90027a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #632]
.word 0xf9400000
.word 0xf9002ba0
.word 0xeb1f001f
.word 0x10000011
.word 0x54000cc0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #952]
.word 0xd2801001
bl _p_3
.word 0xaa0003e6
.word 0xf94023a1
.word 0xf94027a2
.word 0xf9402ba3
.word 0xeb1f007f
.word 0x10000011
.word 0x54000ae0
.word 0xd5033bbf
.word 0xf9401fa0
.word 0xf90010c3
.word 0x910080c4
.word 0xd349fc84
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0084

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x5, [x16, #16]
.word 0x8b050084
.word 0xd280003e
.word 0x3900009e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #1040]
.word 0xf90014c3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #1048]
.word 0xf90020c3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #1056]
.word 0xf9401464
.word 0xf9000cc4
.word 0xf9401063
.word 0xf90008c3
.word 0x3901c0df
.word 0xd2800003
.word 0xd2800044
.word 0xd2800005
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #552]
.word 0xf9001ba0
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1064]
.word 0xf9000fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #912]
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #896]
.word 0xf90017a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #472]
.word 0xd2800221
bl _p_3
.word 0xaa0003e3
.word 0xf9400fa0
.word 0xf94013a1
.word 0xf94017a2
.word 0xd280003e
.word 0x3900407e
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #568]
.word 0xf9000ba0
.word 0xd5033bbf
.word 0xf9400ba0
.word 0xf9000001
.word 0x910003bf
.word 0xa8d37bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2800f60
.word 0xaa1103e1
bl _p_2

Lme_46:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_0_object_int_bool
Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_0_object_int_bool:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf90017a3
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_48
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_47:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_1_object_int
Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_1_object_int:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_58
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_48:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_2
Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_2:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf940c401
.word 0xaa0103e0
.word 0x3940003e
bl _p_40
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_49:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__c__cctor
Xamarin_Forms_Maps_Map__c__cctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1072]
.word 0xd2800201
bl _p_3
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #632]
.word 0xf9000ba0
.word 0xd5033bbf
.word 0xf9400ba0
.word 0xf9000001
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_4a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__c__ctor
Xamarin_Forms_Maps_Map__c__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_4b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__c__PinsOnCollectionChangedb__56_0_Xamarin_Forms_Maps_Pin
Xamarin_Forms_Maps_Map__c__PinsOnCollectionChangedb__56_0_Xamarin_Forms_Maps_Pin:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400fa0
.word 0xf9400fa1
.word 0x3940003e
bl _p_59
.word 0xeb1f001f
.word 0x9a9f17e0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_4c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__c___cctorb__64_0_Xamarin_Forms_BindableObject_object_object
Xamarin_Forms_Maps_Map__c___cctorb__64_0_Xamarin_Forms_BindableObject_object_object:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xf90013a0
.word 0xaa0103f8
.word 0xf90017a2
.word 0xf9001ba3
.word 0xb4000218
.word 0xf9400300
.word 0xf9400000
.word 0x79403001
.word 0xd28000fe
.word 0xeb1e003f
.word 0x10000011
.word 0x54000903
.word 0xf9400800
.word 0xf9401800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1080]
.word 0xeb01001f
.word 0x10000011
.word 0x54000801
.word 0xaa1803f7
.word 0xf94017a0
.word 0xb4000320
.word 0xf94017a0
.word 0xf9400000
.word 0xb9402801

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #528]
.word 0xeb02003f
.word 0x10000011
.word 0x54000683
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #528]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xeb1f001f
.word 0x10000011
.word 0x540004a0
.word 0xf94017b8
.word 0xf9401ba0
.word 0xb4000320
.word 0xf9401ba0
.word 0xf9400000
.word 0xb9402801

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #528]
.word 0xeb02003f
.word 0x10000011
.word 0x54000323
.word 0xf9401000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #528]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xeb1f001f
.word 0x10000011
.word 0x54000140
.word 0xf9401ba2
.word 0xaa1703e0
.word 0xaa1803e1
.word 0x394002fe
bl _p_60
.word 0xa94163b7
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_4d:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__c___cctorb__64_1_Xamarin_Forms_BindableObject_object_object
Xamarin_Forms_Maps_Map__c___cctorb__64_1_Xamarin_Forms_BindableObject_object_object:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xf90013a0
.word 0xaa0103f8
.word 0xf90017a2
.word 0xf9001ba3
.word 0xb4000218
.word 0xf9400300
.word 0xf9400000
.word 0x79403001
.word 0xd28000fe
.word 0xeb1e003f
.word 0x10000011
.word 0x540005c3
.word 0xf9400800
.word 0xf9401800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1080]
.word 0xeb01001f
.word 0x10000011
.word 0x540004c1
.word 0xaa1803f7
.word 0xf94017a0
.word 0xb4000180
.word 0xf94017a0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #544]
.word 0xeb01001f
.word 0x10000011
.word 0x54000301
.word 0xf94017b8
.word 0xf9401ba0
.word 0xb4000180
.word 0xf9401ba0
.word 0xf9400000
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #544]
.word 0xeb01001f
.word 0x10000011
.word 0x54000141
.word 0xf9401ba2
.word 0xaa1703e0
.word 0xaa1803e1
.word 0x394002fe
bl _p_61
.word 0xa94163b7
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_4e:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Map__c___cctorb__64_2_Xamarin_Forms_BindableObject_object_object
Xamarin_Forms_Maps_Map__c___cctorb__64_2_Xamarin_Forms_BindableObject_object_object:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf90017a3
.word 0xf9400fa0
.word 0xb4000220
.word 0xf9400fa0
.word 0xf9400000
.word 0xf9400000
.word 0x79403001
.word 0xd28000fe
.word 0xeb1e003f
.word 0x10000011
.word 0x54000203
.word 0xf9400800
.word 0xf9401800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1080]
.word 0xeb01001f
.word 0x10000011
.word 0x54000101
.word 0xf9400fa1
.word 0xaa0103e0
.word 0x3940003e
bl _p_62
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_4f:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapClickedEventArgs_get_Position
Xamarin_Forms_Maps_MapClickedEventArgs_get_Position:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9402ba0
.word 0x91004000
.word 0xf9400001
.word 0xf9000ba1
.word 0xf9400400
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_50:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapClickedEventArgs__ctor_Xamarin_Forms_Maps_Position
Xamarin_Forms_Maps_MapClickedEventArgs__ctor_Xamarin_Forms_Maps_Position:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xf9400ba0
.word 0x91004000
.word 0xf9400fa1
.word 0xf9000001
.word 0xf94013a1
.word 0xf9000401
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_51:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapElement_get_StrokeColor
Xamarin_Forms_Maps_MapElement_get_StrokeColor:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba8
.word 0xf9000fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1088]
.word 0xf9400001
.word 0xf9400fa0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540005c1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #256]
.word 0xeb02003f
.word 0x10000011
.word 0x540004c1
.word 0x91004000
.word 0xb9800001
.word 0xb90023a1
.word 0xb9800401
.word 0xb90027a1
.word 0xb9800801
.word 0xb9002ba1
.word 0xb9800c01
.word 0xb9002fa1
.word 0xb9801001
.word 0xb90033a1
.word 0xb9801401
.word 0xb90037a1
.word 0xb9801801
.word 0xb9003ba1
.word 0xb9801c00
.word 0xb9003fa0
.word 0xf9400ba0
.word 0xb98023a1
.word 0xb9000001
.word 0xb98027a1
.word 0xb9000401
.word 0xb9802ba1
.word 0xb9000801
.word 0xb9802fa1
.word 0xb9000c01
.word 0xb98033a1
.word 0xb9001001
.word 0xb98037a1
.word 0xb9001401
.word 0xb9803ba1
.word 0xb9001801
.word 0xb9803fa1
.word 0xb9001c01
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_52:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapElement_set_StrokeColor_Xamarin_Forms_Color
Xamarin_Forms_Maps_MapElement_set_StrokeColor_Xamarin_Forms_Color:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1088]
.word 0xf9400000
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #264]
.word 0xd2800601
bl _p_3
.word 0xaa0003e2
.word 0xf94013a1
.word 0xf9400fa3
.word 0x91004040
.word 0xb9800064
.word 0xb9000004
.word 0xb9800464
.word 0xb9000404
.word 0xb9800864
.word 0xb9000804
.word 0xb9800c64
.word 0xb9000c04
.word 0xb9801064
.word 0xb9001004
.word 0xb9801464
.word 0xb9001404
.word 0xb9801864
.word 0xb9001804
.word 0xb9801c63
.word 0xb9001c03
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_53:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapElement_get_StrokeWidth
Xamarin_Forms_Maps_MapElement_get_StrokeWidth:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1096]
.word 0xf9400001
.word 0xf9400ba0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540001e1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #1104]
.word 0xeb02003f
.word 0x10000011
.word 0x540000e1
.word 0xbd401010
.word 0x1e22c200
.word 0x1e624000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_54:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapElement_set_StrokeWidth_single
Xamarin_Forms_Maps_MapElement_set_StrokeWidth_single:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xbd001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1096]
.word 0xf9400000
.word 0xf90013a0
.word 0xbd401bb0
.word 0x1e22c200
.word 0xfd0017a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1112]
.word 0xd2800281
bl _p_3
.word 0xaa0003e2
.word 0xf94013a1
.word 0xfd4017a0
.word 0x1e624010
.word 0xbd001050
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_55:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapElement_get_MapElementId
Xamarin_Forms_Maps_MapElement_get_MapElementId:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9407400
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_56:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapElement_set_MapElementId_object
Xamarin_Forms_Maps_MapElement_set_MapElementId_object:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0x9103a001
.word 0xd5033bbf
.word 0xf9400fa0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_57:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapElement__ctor
Xamarin_Forms_Maps_MapElement__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
bl _p_63
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_58:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapElement__cctor
Xamarin_Forms_Maps_MapElement__cctor:
.loc 1 1 0
.word 0xa9b87bfd
.word 0x910003fd
.word 0xd2800210
.word 0x910003f1
.word 0xcb100231
.word 0x9100023f

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1120]
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #320]
.word 0xf90037a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1128]
.word 0xf9003ba0
.word 0x910043a8
bl _p_7

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #264]
.word 0xd2800601
bl _p_3
.word 0xaa0003e3
.word 0xf94033a0
.word 0xf94037a1
.word 0xf9403ba2
.word 0x91004064
.word 0xb98013a5
.word 0xb9000085
.word 0xb98017a5
.word 0xb9000485
.word 0xb9801ba5
.word 0xb9000885
.word 0xb9801fa5
.word 0xb9000c85
.word 0xb98023a5
.word 0xb9001085
.word 0xb98027a5
.word 0xb9001485
.word 0xb9802ba5
.word 0xb9001885
.word 0xb9802fa5
.word 0xb9001c85
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1088]
.word 0xf9002fa0
.word 0xd5033bbf
.word 0xf9402fa0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1136]
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1144]
.word 0xf90023a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1128]
.word 0xf90027a0
.word 0xd280001e
.word 0xf2a8141e
.word 0x9e6703d0
.word 0x1e22c200
.word 0xfd002ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1112]
.word 0xd2800281
bl _p_3
.word 0xaa0003e3
.word 0xf9401fa0
.word 0xf94023a1
.word 0xf94027a2
.word 0xfd402ba0
.word 0x1e624010
.word 0xbd001070
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1096]
.word 0xf9001ba0
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000001
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0

Lme_59:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double
Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double:
.loc 1 1 0
.word 0xa9b37bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xfd0033a2
.word 0xfd0037a3
.word 0x91004340
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.word 0xaa1a03f9
.word 0xfd4033a0
.word 0xfd003ba0
.word 0xd2812c1e
.word 0xf2a6835e
.word 0xf2db865e
.word 0xf2e7dc5e
.word 0x9e6703c0
.word 0xfd003fa0
.word 0xfd403ba0
.word 0xd2812c1e
.word 0xf2a6835e
.word 0xf2db865e
.word 0xf2e7dc5e
.word 0x9e6703c1
.word 0x1e612000
.word 0x540000a0
.word 0x5400008b
.word 0xfd403ba0
.word 0xfd003fa0
.word 0x14000014
.word 0xfd403ba0
.word 0xfd0043a0
.word 0xf94043a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd403ba0
.word 0xfd003fa0
.word 0x14000003
.word 0xfd403fa0
.word 0xfd003fa0
.word 0xfd403fa0
.word 0xfd0047a0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ade
.word 0x9e6703c0
.word 0xfd004ba0
.word 0xfd4047a0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ade
.word 0x9e6703c1
.word 0x1e612000
.word 0x54000082
.word 0xfd4047a0
.word 0xfd004ba0
.word 0x14000014
.word 0xfd4047a0
.word 0xfd004fa0
.word 0xf9404fa0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd4047a0
.word 0xfd004ba0
.word 0x14000003
.word 0xfd404ba0
.word 0xfd004ba0
.word 0xfd404ba0
.word 0xfd001320
.word 0xaa1a03f9
.word 0xfd4037a0
.word 0xfd0053a0
.word 0xd2812c1e
.word 0xf2a6835e
.word 0xf2db865e
.word 0xf2e7dc5e
.word 0x9e6703c0
.word 0xfd0057a0
.word 0xfd4053a0
.word 0xd2812c1e
.word 0xf2a6835e
.word 0xf2db865e
.word 0xf2e7dc5e
.word 0x9e6703c1
.word 0x1e612000
.word 0x540000a0
.word 0x5400008b
.word 0xfd4053a0
.word 0xfd0057a0
.word 0x14000014
.word 0xfd4053a0
.word 0xfd005ba0
.word 0xf9405ba0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd4053a0
.word 0xfd0057a0
.word 0x14000003
.word 0xfd4057a0
.word 0xfd0057a0
.word 0xfd4057a0
.word 0xfd005fa0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80cde
.word 0x9e6703c0
.word 0xfd0063a0
.word 0xfd405fa0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80cde
.word 0x9e6703c1
.word 0x1e612000
.word 0x54000082
.word 0xfd405fa0
.word 0xfd0063a0
.word 0x14000014
.word 0xfd405fa0
.word 0xfd0067a0
.word 0xf94067a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd405fa0
.word 0xfd0063a0
.word 0x14000003
.word 0xfd4063a0
.word 0xfd0063a0
.word 0xfd4063a0
.word 0xfd001720
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8cd7bfd
.word 0xd65f03c0

Lme_5a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_get_Center
Xamarin_Forms_Maps_MapSpan_get_Center:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9402ba0
.word 0x91004000
.word 0xf9400001
.word 0xf9000ba1
.word 0xf9400400
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_5b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_get_LatitudeDegrees
Xamarin_Forms_Maps_MapSpan_get_LatitudeDegrees:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xfd401000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_5c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_get_LongitudeDegrees
Xamarin_Forms_Maps_MapSpan_get_LongitudeDegrees:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xfd401400
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_5d:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_get_Radius
Xamarin_Forms_Maps_MapSpan_get_Radius:
.loc 1 1 0
.word 0xa9b67bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xfd401340
bl _p_64
.word 0xfd004ba0
.word 0x91004340
.word 0xf9400001
.word 0xf9002fa1
.word 0xf9400400
.word 0xf90033a0
.word 0xfd401740
.word 0x1e604002
.word 0xfd402fa0
.word 0xfd4033a1
bl _p_65
.word 0xfd404ba1
.word 0xd280001e
.word 0xf2c8001e
.word 0xf2e811fe
.word 0x9e6703c2
.word 0xfd003ba2
.word 0xfd003fa1
.word 0xfd0043a0
.word 0xfd403fa0
.word 0xfd4043a1
.word 0x1e612000
.word 0x54000082
.word 0xfd403fa0
.word 0xfd0043a0
.word 0x14000014
.word 0xfd403fa0
.word 0xfd0047a0
.word 0xf94047a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd403fa0
.word 0xfd0043a0
.word 0x14000003
.word 0xfd4043a0
.word 0xfd0043a0
.word 0xfd4043a1
.word 0xfd403ba0
.word 0x1e610800
.word 0xd280001e
.word 0xf2e8001e
.word 0x9e6703c1
.word 0x1e611800
.word 0xf90037bf
.word 0xfd0037a0
.word 0xf94037a0
.word 0xf9000fa0
.word 0xf9400bba
.word 0xfd400fa0
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_5e:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_ClampLatitude_double_double
Xamarin_Forms_Maps_MapSpan_ClampLatitude_double_double:
.loc 1 1 0
.word 0xa9ac7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xd2800000
.word 0xf90027a0
.word 0xf9002ba0
.word 0xfd400fa0
.word 0xfd002fa0
.word 0x9e6703e0
.word 0xfd0033a0
.word 0xfd402fa0
.word 0x9e6703e1
.word 0x1e612000
.word 0x540000a0
.word 0x5400008b
.word 0xfd402fa0
.word 0xfd0033a0
.word 0x14000014
.word 0xfd402fa0
.word 0xfd0037a0
.word 0xf94037a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd402fa0
.word 0xfd0033a0
.word 0x14000003
.word 0xfd4033a0
.word 0xfd0033a0
.word 0xfd4033a0
.word 0xfd003ba0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ade
.word 0x9e6703c0
.word 0xfd003fa0
.word 0xfd403ba0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ade
.word 0x9e6703c1
.word 0x1e612000
.word 0x54000082
.word 0xfd403ba0
.word 0xfd003fa0
.word 0x14000014
.word 0xfd403ba0
.word 0xfd0043a0
.word 0xf94043a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd403ba0
.word 0xfd003fa0
.word 0x14000003
.word 0xfd403fa0
.word 0xfd003fa0
.word 0xfd403fa0
.word 0xfd000fa0
.word 0xfd4013a0
.word 0xfd0047a0
.word 0x9e6703e0
.word 0xfd004ba0
.word 0xfd4047a0
.word 0x9e6703e1
.word 0x1e612000
.word 0x54000082
.word 0xfd4047a0
.word 0xfd004ba0
.word 0x14000014
.word 0xfd4047a0
.word 0xfd004fa0
.word 0xf9404fa0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd4047a0
.word 0xfd004ba0
.word 0x14000003
.word 0xfd404ba0
.word 0xfd004ba0
.word 0xfd404ba0
.word 0xfd0053a0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2f80ade
.word 0x9e6703c0
.word 0xfd0057a0
.word 0xfd4053a0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2f80ade
.word 0x9e6703c1
.word 0x1e612000
.word 0x540000a0
.word 0x5400008b
.word 0xfd4053a0
.word 0xfd0057a0
.word 0x14000014
.word 0xfd4053a0
.word 0xfd005ba0
.word 0xf9405ba0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd4053a0
.word 0xfd0057a0
.word 0x14000003
.word 0xfd4057a0
.word 0xfd0057a0
.word 0xfd4057a0
.word 0xfd0013a0
.word 0x91004340
.word 0xf9400001
.word 0xf90027a1
.word 0xf9400400
.word 0xf9002ba0
.word 0xfd4027a0
.word 0x1e604001
.word 0xfd400fa0
.word 0xfd005fa1
.word 0xfd0063a0
.word 0xfd405fa0
.word 0xfd4063a1
.word 0x1e612000
.word 0x54000082
.word 0xfd405fa0
.word 0xfd0063a0
.word 0x14000014
.word 0xfd405fa0
.word 0xfd0067a0
.word 0xf94067a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd405fa0
.word 0xfd0063a0
.word 0x14000003
.word 0xfd4063a0
.word 0xfd0063a0
.word 0xfd4063a1
.word 0xfd4013a0
.word 0xfd006ba1
.word 0xfd006fa0
.word 0xfd406ba0
.word 0xfd406fa1
.word 0x1e612000
.word 0x540000a0
.word 0x5400008b
.word 0xfd406ba0
.word 0xfd006fa0
.word 0x14000014
.word 0xfd406ba0
.word 0xfd0073a0
.word 0xf94073a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd406ba0
.word 0xfd006fa0
.word 0x14000003
.word 0xfd406fa0
.word 0xfd006fa0
.word 0xfd406fa0
.word 0xfd0077a0
.word 0xfd400fa0
.word 0xfd4077a2
.word 0x1e604001
.word 0x1e623821
.word 0xfd4013a0
.word 0x1e614000
.word 0xfd4077a2
.word 0x1e622800
.word 0xfd007ba1
.word 0xfd007fa0
.word 0xfd407ba0
.word 0xfd407fa1
.word 0x1e612000
.word 0x54000082
.word 0xfd407ba0
.word 0xfd007fa0
.word 0x14000014
.word 0xfd407ba0
.word 0xfd0083a0
.word 0xf94083a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd407ba0
.word 0xfd007fa0
.word 0x14000003
.word 0xfd407fa0
.word 0xfd007fa0
.word 0xfd407fa0
.word 0xd280001e
.word 0xf2e8001e
.word 0x9e6703c1
.word 0x1e610800
.word 0xfd0087a0
.word 0xfd4077a0
.word 0x91004340
.word 0xf9400001
.word 0xf90027a1
.word 0xf9400400
.word 0xf9002ba0
.word 0xfd402ba1
.word 0xd2800000
.word 0xf9001fa0
.word 0xf90023a0
.word 0x9100e3a0
bl _p_22
.word 0xf9401fa0
.word 0xf90017a0
.word 0xf94023a0
.word 0xf9001ba0
.word 0xfd401340
.word 0x1e604001
.word 0xfd4087a0
.word 0xfd0087a1
.word 0xfd008ba0
.word 0xfd4087a0
.word 0xfd408ba1
.word 0x1e612000
.word 0x54000082
.word 0xfd4087a0
.word 0xfd008ba0
.word 0x14000014
.word 0xfd4087a0
.word 0xfd008fa0
.word 0xf9408fa0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd4087a0
.word 0xfd008ba0
.word 0x14000003
.word 0xfd408ba0
.word 0xfd008ba0
.word 0xfd408ba0
.word 0xfd0097a0
.word 0xfd401740
.word 0xfd009ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #448]
.word 0xd2800601
bl _p_3
.word 0xfd4097a2
.word 0xfd409ba3
.word 0xf90093a0
.word 0xfd4017a0
.word 0xfd401ba1
bl _p_29
.word 0xf94093a0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8d47bfd
.word 0xd65f03c0

Lme_5f:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_Equals_object
Xamarin_Forms_Maps_MapSpan_Equals_object:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9000fba
.word 0xf90013a0
.word 0xaa0103fa
.word 0xb500007a
.word 0xd2800000
.word 0x14000025
.word 0xf94013a0
.word 0xeb1a001f
.word 0x54000061
.word 0xd2800020
.word 0x14000020
.word 0xaa1a03f8
.word 0xeb1f035f
.word 0x54000160
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400400

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1152]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800018
.word 0xb4000238
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400400

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1152]
.word 0xeb01001f
.word 0x10000011
.word 0x54000181
.word 0xf94013a0
.word 0xaa1a03e1
bl _p_66
.word 0x53001c00
.word 0x14000002
.word 0xd2800000
.word 0xf9400bb8
.word 0xf9400fba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_60:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_FromCenterAndRadius_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance
Xamarin_Forms_Maps_MapSpan_FromCenterAndRadius_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance:
.loc 1 1 0
.word 0xa9b47bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd000fa1
.word 0xfd002ba2
.word 0xd280001e
.word 0xf2e8001e
.word 0x9e6703c0
.word 0xfd005ba0
.word 0xfd402ba0
bl _p_67
.word 0x1e604001
.word 0xfd405ba0
.word 0x1e610800
.word 0xfd004fa0
.word 0xd280001e
.word 0xf2e8001e
.word 0x9e6703c0
.word 0xfd0057a0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0xfd402ba2
bl _p_68
.word 0x1e604001
.word 0xfd4057a0
.word 0x1e610800
.word 0xfd0053a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #448]
.word 0xd2800601
bl _p_3
.word 0xfd404fa2
.word 0xfd4053a3
.word 0xf9004ba0
.word 0xfd400ba0
.word 0xfd400fa1
bl _p_29
.word 0xf9404ba0
.word 0x910003bf
.word 0xa8cc7bfd
.word 0xd65f03c0

Lme_61:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_GetHashCode
Xamarin_Forms_Maps_MapSpan_GetHashCode:
.loc 1 1 0
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xd2800000
.word 0xf90017a0
.word 0xf9001ba0
.word 0x91004340
.word 0xf9400001
.word 0xf90017a1
.word 0xf9400400
.word 0xf9001ba0
.word 0x9100a3a0
bl _p_69
.word 0x93407c00
.word 0xd28031be
.word 0x1b1e7c19
.word 0xfd401740
.word 0xfd001fa0
.word 0xfd401fa0
.word 0xfd0023a0
.word 0xf94023b8
.word 0xaa1803e0
.word 0xd1000400
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x5400008b
.word 0xd2800000
.word 0xf2effe00
.word 0x8a000318
.word 0x93407f00
.word 0x9360ff01
.word 0x93407c21
.word 0x4a010000
.word 0x4a000320
.word 0xd28031be
.word 0x1b1e7c19
.word 0xfd401340
.word 0xfd001fa0
.word 0xfd401fa0
.word 0xfd0027a0
.word 0xf94027ba
.word 0xaa1a03e0
.word 0xd1000400
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x5400008b
.word 0xd2800000
.word 0xf2effe00
.word 0x8a00035a
.word 0x93407f40
.word 0x9360ff41
.word 0x93407c21
.word 0x4a010000
.word 0x4a000320
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_62:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_op_Equality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan
Xamarin_Forms_Maps_MapSpan_op_Equality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_70
.word 0x53001c00
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_63:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_op_Inequality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan
Xamarin_Forms_Maps_MapSpan_op_Inequality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_70
.word 0x53001c00
.word 0x6b1f001f
.word 0x9a9f17e0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_64:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_WithZoom_double
Xamarin_Forms_Maps_MapSpan_WithZoom_double:
.loc 1 1 0
.word 0xa9b77bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xfd000fa0
.word 0xd2800000
.word 0xf9001ba0
.word 0xf9001fa0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ade
.word 0x9e6703c0
.word 0x91004340
.word 0xf9400001
.word 0xf9001ba1
.word 0xf9400400
.word 0xf9001fa0
.word 0xfd401ba1
.word 0x1e604022
.word 0x1e604001
.word 0x1e623821
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ade
.word 0x9e6703c0
.word 0x91004340
.word 0xf9400001
.word 0xf9001ba1
.word 0xf9400400
.word 0xf9001fa0
.word 0xfd401ba2
.word 0x1e622800
.word 0xfd0023a1
.word 0xfd0027a0
.word 0xfd4023a0
.word 0xfd4027a1
.word 0x1e612000
.word 0x54000082
.word 0xfd4023a0
.word 0xfd0027a0
.word 0x14000014
.word 0xfd4023a0
.word 0xfd002ba0
.word 0xf9402ba0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd4023a0
.word 0xfd0027a0
.word 0x14000003
.word 0xfd4027a0
.word 0xfd0027a0
.word 0xfd4027a0
.word 0xd280001e
.word 0xf2e8001e
.word 0x9e6703c1
.word 0x1e610800
.word 0xfd002fa0
.word 0x91004340
.word 0xf9400001
.word 0xf90013a1
.word 0xf9400400
.word 0xf90017a0
.word 0xfd401340
.word 0xfd400fa2
.word 0x1e604001
.word 0x1e621821
.word 0xfd402fa0
.word 0xfd002fa1
.word 0xfd0033a0
.word 0xfd402fa0
.word 0xfd4033a1
.word 0x1e612000
.word 0x54000082
.word 0xfd402fa0
.word 0xfd0033a0
.word 0x14000014
.word 0xfd402fa0
.word 0xfd0037a0
.word 0xf94037a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd402fa0
.word 0xfd0033a0
.word 0x14000003
.word 0xfd4033a0
.word 0xfd0033a0
.word 0xfd4033a0
.word 0xfd003fa0
.word 0xfd401740
.word 0xfd400fa1
.word 0x1e611800
.word 0xfd0043a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #448]
.word 0xd2800601
bl _p_3
.word 0xfd403fa2
.word 0xfd4043a3
.word 0xf9003ba0
.word 0xfd4013a0
.word 0xfd4017a1
bl _p_29
.word 0xf9403ba0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_65:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_DistanceToLatitudeDegrees_Xamarin_Forms_Maps_Distance
Xamarin_Forms_Maps_MapSpan_DistanceToLatitudeDegrees_Xamarin_Forms_Maps_Distance:
.loc 1 1 0
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd400ba0
.word 0xd280001e
.word 0xf2c8001e
.word 0xf2e811fe
.word 0x9e6703c1
.word 0x1e611800
.word 0xd29cae5e
.word 0xf2b1c21e
.word 0xf2d178be
.word 0xf2e81c7e
.word 0x9e6703c1
.word 0x1e611800
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ede
.word 0x9e6703c1
.word 0x1e610800
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_66:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_DistanceToLongitudeDegrees_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance
Xamarin_Forms_Maps_MapSpan_DistanceToLongitudeDegrees_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance:
.loc 1 1 0
.word 0xa9b77bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd000fa1
.word 0xfd002ba2
.word 0xfd400ba0
.word 0xfd400fa1
bl _p_71
.word 0x1e604001
.word 0xfd402ba0
.word 0xd280001e
.word 0xf2c8001e
.word 0xf2e811fe
.word 0x9e6703c2
.word 0x1e621800
.word 0x1e611800
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ede
.word 0x9e6703c1
.word 0x1e610800
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_67:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_Equals_Xamarin_Forms_Maps_MapSpan
Xamarin_Forms_Maps_MapSpan_Equals_Xamarin_Forms_Maps_MapSpan:
.loc 1 1 0
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xd2800000
.word 0xf9001ba0
.word 0xf9001fa0
.word 0x9e6703e0
.word 0xfd0023a0
.word 0x91004320
.word 0xf9400001
.word 0xf9001ba1
.word 0xf9400400
.word 0xf9001fa0
.word 0x3940035e
.word 0x91004340
.word 0xf9400001
.word 0xf90013a1
.word 0xf9400400
.word 0xf90017a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e1
.word 0x91004020
.word 0xf94013a2
.word 0xf9000002
.word 0xf94017a2
.word 0xf9000402
.word 0x9100c3a0
bl _p_72
.word 0x53001c00
.word 0x34000220
.word 0xfd401720
.word 0xfd0023a0
.word 0x3940035e
.word 0xfd401740
.word 0x910103a0
bl _p_14
.word 0x53001c00
.word 0x34000120
.word 0xfd401320
.word 0xfd0023a0
.word 0x3940035e
.word 0xfd401340
.word 0x910103a0
bl _p_14
.word 0x53001c00
.word 0x14000002
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_68:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_LatitudeCircumferenceKm_Xamarin_Forms_Maps_Position
Xamarin_Forms_Maps_MapSpan_LatitudeCircumferenceKm_Xamarin_Forms_Maps_Position:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd000fa1
.word 0xd29cae5e
.word 0xf2b1c21e
.word 0xf2d178be
.word 0xf2e81c7e
.word 0x9e6703c0
.word 0xfd002ba0
.word 0xfd400ba0
.word 0xd285a31e
.word 0xf2aa889e
.word 0xf2c43f7e
.word 0xf2e8013e
.word 0x9e6703c1
.word 0x1e610800
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80cde
.word 0x9e6703c1
.word 0x1e611800
bl _p_10
.word 0x1e604001
.word 0xfd402ba0
.word 0x1e610800
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_69:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_LatitudeDegreesToKm_double
Xamarin_Forms_Maps_MapSpan_LatitudeDegreesToKm_double:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xd29cae5e
.word 0xf2b1c21e
.word 0xf2d178be
.word 0xf2e81c7e
.word 0x9e6703c0
.word 0xfd400ba1
.word 0x1e610800
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ede
.word 0x9e6703c1
.word 0x1e611800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_6a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_MapSpan_LongitudeDegreesToKm_Xamarin_Forms_Maps_Position_double
Xamarin_Forms_Maps_MapSpan_LongitudeDegreesToKm_Xamarin_Forms_Maps_Position_double:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd000fa1
.word 0xfd002ba2
.word 0xfd400ba0
.word 0xfd400fa1
bl _p_71
.word 0xfd402ba1
.word 0x1e610800
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ede
.word 0x9e6703c1
.word 0x1e611800
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_6b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_get_Address
Xamarin_Forms_Maps_Pin_get_Address:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1160]
.word 0xf9400001
.word 0xaa1a03e0
bl _p_1
.word 0xaa0003fa
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400400

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1168]
.word 0xeb01001f
.word 0x10000011
.word 0x540000c1
.word 0xaa1a03e0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_6c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_set_Address_string
Xamarin_Forms_Maps_Pin_set_Address_string:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1160]
.word 0xf9400001
.word 0xf9400ba0
.word 0xf9400fa2
bl _p_4
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_6d:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_get_Label
Xamarin_Forms_Maps_Pin_get_Label:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xf9400001
.word 0xaa1a03e0
bl _p_1
.word 0xaa0003fa
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400400

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1168]
.word 0xeb01001f
.word 0x10000011
.word 0x540000c1
.word 0xaa1a03e0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_6e:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_set_Label_string
Xamarin_Forms_Maps_Pin_set_Label_string:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xf9400001
.word 0xf9400ba0
.word 0xf9400fa2
bl _p_4
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_6f:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_get_Position
Xamarin_Forms_Maps_Pin_get_Position:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1184]
.word 0xf9400001
.word 0xf9402ba0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54000261
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #208]
.word 0xeb02003f
.word 0x10000011
.word 0x54000161
.word 0x91004000
.word 0xf9400001
.word 0xf9000ba1
.word 0xf9400400
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_70:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_set_Position_Xamarin_Forms_Maps_Position
Xamarin_Forms_Maps_Pin_set_Position_Xamarin_Forms_Maps_Position:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1184]
.word 0xf9400000
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e2
.word 0xf94033a1
.word 0x91004040
.word 0xf9400fa3
.word 0xf9000003
.word 0xf94013a3
.word 0xf9000403
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_71:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_get_Type
Xamarin_Forms_Maps_Pin_get_Type:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1192]
.word 0xf9400001
.word 0xf9400ba0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540001a1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #504]
.word 0xeb02003f
.word 0x10000011
.word 0x540000a1
.word 0xb9801000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_72:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_set_Type_Xamarin_Forms_Maps_PinType
Xamarin_Forms_Maps_Pin_set_Type_Xamarin_Forms_Maps_PinType:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1192]
.word 0xf9400000
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1200]
.word 0xd2800281
bl _p_3
.word 0xaa0003e2
.word 0xf94013a1
.word 0xb9801ba0
.word 0xb9001040
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_73:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_get_Id
Xamarin_Forms_Maps_Pin_get_Id:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9407800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_74:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_set_Id_object
Xamarin_Forms_Maps_Pin_set_Id_object:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0x9103c320
.word 0xf90017a0
.word 0xd5033bbf
.word 0xf94017a0
.word 0xf900001a
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.word 0x9103a320
.word 0xf90013a0
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf900001a
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_75:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_get_MarkerId
Xamarin_Forms_Maps_Pin_get_MarkerId:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9407400
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_76:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_set_MarkerId_object
Xamarin_Forms_Maps_Pin_set_MarkerId_object:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0x9103a320
.word 0xf90017a0
.word 0xd5033bbf
.word 0xf94017a0
.word 0xf900001a
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.word 0x9103c320
.word 0xf90013a0
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf900001a
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_77:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_add_Clicked_System_EventHandler
Xamarin_Forms_Maps_Pin_add_Clicked_System_EventHandler:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9407f38
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_31
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1208]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x9103e321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_78:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_remove_Clicked_System_EventHandler
Xamarin_Forms_Maps_Pin_remove_Clicked_System_EventHandler:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9407f38
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_32
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1208]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x9103e321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_79:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_add_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
Xamarin_Forms_Maps_Pin_add_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9408338
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_31
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1216]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x91040321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_7a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_remove_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
Xamarin_Forms_Maps_Pin_remove_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9408338
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_32
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1216]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x91040321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_7b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_add_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
Xamarin_Forms_Maps_Pin_add_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9408738
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_31
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1216]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x91042321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_7c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_remove_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
Xamarin_Forms_Maps_Pin_remove_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9408738
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_32
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1216]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x91042321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_7d:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_Equals_object
Xamarin_Forms_Maps_Pin_Equals_object:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xb500007a
.word 0xd2800000
.word 0x14000020
.word 0xeb1a033f
.word 0x54000061
.word 0xd2800020
.word 0x1400001c
.word 0xf9400340
.word 0xf9400c00
.word 0xf9400321
.word 0xf9400c21
.word 0xeb01001f
.word 0x9a9f17e0
.word 0x6b1f001f
.word 0x9a9f17e0
.word 0x53001c00
.word 0x34000060
.word 0xd2800000
.word 0x14000010
.word 0xb400017a
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #872]
.word 0xeb01001f
.word 0x10000011
.word 0x54000121
.word 0xaa1903e0
.word 0xaa1a03e1
bl _p_73
.word 0x53001c00
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_7e:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_GetHashCode
Xamarin_Forms_Maps_Pin_GetHashCode:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xd2800000
.word 0xf90013a0
.word 0xf90017a0
.word 0xaa1a03e0
bl _p_59
.word 0xaa0003f9
.word 0xb5000060
.word 0xd2800019
.word 0x14000007
.word 0xaa1903e0
.word 0xf9400321
.word 0xf9402830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003f9
.word 0xd28031be
.word 0x1b1e7f20
.word 0xf9002ba0
.word 0x910083a0
.word 0xf9001ba0
.word 0xaa1a03e0
bl _p_74
.word 0xf9401bbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0x910083a0
bl _p_69
.word 0x93407c00
.word 0xaa0003e1
.word 0xf9402ba0
.word 0x4a010000
.word 0xd28031be
.word 0x1b1e7c00
.word 0xf90027a0
.word 0xaa1a03e0
bl _p_75
.word 0x93407c00
.word 0xaa0003e1
.word 0xf94027a0
.word 0x4a010000
.word 0xd28031be
.word 0x1b1e7c00
.word 0xf90023a0
.word 0xaa1a03e0
bl _p_76
.word 0xf94023a2
.word 0xaa0003e1
.word 0xaa0203f9
.word 0xaa0103fa
.word 0xb5000060
.word 0xd280001a
.word 0x14000007
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9402830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003fa
.word 0x4a1a0320
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_7f:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_op_Equality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin
Xamarin_Forms_Maps_Pin_op_Equality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_70
.word 0x53001c00
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_80:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_op_Inequality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin
Xamarin_Forms_Maps_Pin_op_Inequality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9400fa1
bl _p_70
.word 0x53001c00
.word 0x6b1f001f
.word 0x9a9f17e0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_81:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_SendTap
Xamarin_Forms_Maps_Pin_SendTap:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xf9400fa0
.word 0xf9407c19
.word 0xaa1903e0
.word 0xb5000060
.word 0xd2800000
.word 0x1400000a

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1224]
.word 0xf9400002
.word 0xaa1903e0
.word 0xf9400fa1
.word 0xf9400f30
.word 0xd63f0200
.word 0xd2800020
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_82:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_SendMarkerClick
Xamarin_Forms_Maps_Pin_SendMarkerClick:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1232]
.word 0xd2800221
bl _p_3
.word 0x3900401f
.word 0xaa0003f9
.word 0xf94013a0
.word 0xf9408000
.word 0xaa0003f8
.word 0xb5000040
.word 0x14000006
.word 0xaa1803e0
.word 0xf94013a1
.word 0xaa1903e2
.word 0xf9400f10
.word 0xd63f0200
.word 0x3940033e
.word 0x39404320
.word 0x53001c00
.word 0xa94167b8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_83:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_SendInfoWindowClick
Xamarin_Forms_Maps_Pin_SendInfoWindowClick:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1232]
.word 0xd2800221
bl _p_3
.word 0x3900401f
.word 0xaa0003f9
.word 0xf94013a0
.word 0xf9408400
.word 0xaa0003f8
.word 0xb5000040
.word 0x14000006
.word 0xaa1803e0
.word 0xf94013a1
.word 0xaa1903e2
.word 0xf9400f10
.word 0xd63f0200
.word 0x3940033e
.word 0x39404320
.word 0x53001c00
.word 0xa94167b8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_84:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin_Equals_Xamarin_Forms_Maps_Pin
Xamarin_Forms_Maps_Pin_Equals_Xamarin_Forms_Maps_Pin:
.loc 1 1 0
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xaa1903e0
bl _p_59
.word 0xf9002ba0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_59
.word 0xaa0003e1
.word 0xf9402ba0
bl _p_77
.word 0x53001c00
.word 0x34000820
.word 0x9100c3a0
.word 0xf90023a0
.word 0xaa1903e0
bl _p_74
.word 0xf94023be
.word 0xfd0003c0
.word 0xfd0007c1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xf9002ba0
.word 0x91004000
.word 0xf9401ba1
.word 0xf9000001
.word 0xf9401fa1
.word 0xf9000401
.word 0x910083a0
.word 0xf90023a0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_74
.word 0xf94023be
.word 0xfd0003c0
.word 0xfd0007c1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e1
.word 0xf9402ba0
.word 0x91004022
.word 0xf94013a3
.word 0xf9000043
.word 0xf94017a3
.word 0xf9000443
bl _p_70
.word 0x53001c00
.word 0x34000300
.word 0xaa1903e0
bl _p_75
.word 0x93407c00
.word 0xf9002ba0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_75
.word 0x93407c00
.word 0xaa0003e1
.word 0xf9402ba0
.word 0x6b01001f
.word 0x54000181
.word 0xaa1903e0
bl _p_76
.word 0xf9002ba0
.word 0xaa1a03e0
.word 0x3940035e
bl _p_76
.word 0xaa0003e1
.word 0xf9402ba0
bl _p_77
.word 0x53001c00
.word 0x14000002
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_85:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin__ctor
Xamarin_Forms_Maps_Pin__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
bl _p_63
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_86:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Pin__cctor
Xamarin_Forms_Maps_Pin__cctor:
.loc 1 1 0
.word 0xa9b97bfd
.word 0x910003fd
.word 0xd2800210
.word 0x910003f1
.word 0xcb100231
.word 0x9100023f

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1240]
.word 0xf9002fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1248]
.word 0xf90033a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1256]
.word 0xf90037a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1200]
.word 0xd2800281
bl _p_3
.word 0xaa0003e3
.word 0xf9402fa0
.word 0xf94033a1
.word 0xf94037a2
.word 0xb900107f
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1192]
.word 0xf9002ba0
.word 0xd5033bbf
.word 0xf9402ba0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1264]
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #280]
.word 0xf90023a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1256]
.word 0xf90027a0
.word 0xd2800000
.word 0xf9000ba0
.word 0xf9000fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e3
.word 0xf9401fa0
.word 0xf94023a1
.word 0xf94027a2
.word 0x91004064
.word 0xf9400ba5
.word 0xf9000085
.word 0xf9400fa5
.word 0xf9000485
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1184]
.word 0xf9001ba0
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1272]

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1280]

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #1256]
.word 0xd2800003
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1160]
.word 0xf90017a0
.word 0xd5033bbf
.word 0xf94017a0
.word 0xf9000001

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1288]

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1280]

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #1256]
.word 0xd2800003
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1176]
.word 0xf90013a0
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf9000001
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_87:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_PinClickedEventArgs_get_HideInfoWindow
Xamarin_Forms_Maps_PinClickedEventArgs_get_HideInfoWindow:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0x39404000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_88:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_PinClickedEventArgs_set_HideInfoWindow_bool
Xamarin_Forms_Maps_PinClickedEventArgs_set_HideInfoWindow_bool:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0x394063a1
.word 0x39004001
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_89:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_PinClickedEventArgs__ctor
Xamarin_Forms_Maps_PinClickedEventArgs__ctor:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0x3900401f
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_8a:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Polygon_get_FillColor
Xamarin_Forms_Maps_Polygon_get_FillColor:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba8
.word 0xf9000fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1296]
.word 0xf9400001
.word 0xf9400fa0
bl _p_1
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540005c1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #256]
.word 0xeb02003f
.word 0x10000011
.word 0x540004c1
.word 0x91004000
.word 0xb9800001
.word 0xb90023a1
.word 0xb9800401
.word 0xb90027a1
.word 0xb9800801
.word 0xb9002ba1
.word 0xb9800c01
.word 0xb9002fa1
.word 0xb9801001
.word 0xb90033a1
.word 0xb9801401
.word 0xb90037a1
.word 0xb9801801
.word 0xb9003ba1
.word 0xb9801c00
.word 0xb9003fa0
.word 0xf9400ba0
.word 0xb98023a1
.word 0xb9000001
.word 0xb98027a1
.word 0xb9000401
.word 0xb9802ba1
.word 0xb9000801
.word 0xb9802fa1
.word 0xb9000c01
.word 0xb98033a1
.word 0xb9001001
.word 0xb98037a1
.word 0xb9001401
.word 0xb9803ba1
.word 0xb9001801
.word 0xb9803fa1
.word 0xb9001c01
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_8b:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Polygon_set_FillColor_Xamarin_Forms_Color
Xamarin_Forms_Maps_Polygon_set_FillColor_Xamarin_Forms_Color:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1296]
.word 0xf9400000
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #264]
.word 0xd2800601
bl _p_3
.word 0xaa0003e2
.word 0xf94013a1
.word 0xf9400fa3
.word 0x91004040
.word 0xb9800064
.word 0xb9000004
.word 0xb9800464
.word 0xb9000404
.word 0xb9800864
.word 0xb9000804
.word 0xb9800c64
.word 0xb9000c04
.word 0xb9801064
.word 0xb9001004
.word 0xb9801464
.word 0xb9001404
.word 0xb9801864
.word 0xb9001804
.word 0xb9801c63
.word 0xb9001c03
.word 0xf9400ba0
bl _p_4
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_8c:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Polygon_get_Geopath
Xamarin_Forms_Maps_Polygon_get_Geopath:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9407800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_8d:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Polygon__ctor
Xamarin_Forms_Maps_Polygon__ctor:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xaa1a03e0
bl _p_5

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1304]
.word 0xd2800701
bl _p_3
.word 0xf9001ba0
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #344]
.word 0x3980b410
.word 0xb5000050
bl _p_24

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2800501
bl _p_3
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xf9400002
.word 0x91004023
.word 0xd5033bbf
.word 0xf9401fa0
.word 0xf9000062
.word 0xd349fc63
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0063

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x4, [x16, #16]
.word 0x8b040063
.word 0xd280003e
.word 0x3900007e
.word 0x91004002
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000041
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xf90013a0
.word 0xf90017a0
.word 0xeb1f035f
.word 0x10000011
.word 0x54000800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #416]
.word 0xd2801001
bl _p_3
.word 0xaa0003e1
.word 0xf94017a2
.word 0xeb1f035f
.word 0x10000011
.word 0x54000660
.word 0xd5033bbf
.word 0xf900103a
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1312]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1320]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1328]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0x3901c03f
.word 0xaa0203e0
.word 0x3940005e
bl _p_78
.word 0x9103c341
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2800f60
.word 0xaa1103e1
bl _p_2

Lme_8e:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Polygon__cctor
Xamarin_Forms_Maps_Polygon__cctor:
.loc 1 1 0
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xd2800210
.word 0x910003f1
.word 0xcb100231
.word 0x9100023f

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #312]
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #320]
.word 0xf90023a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1336]
.word 0xf90027a0
.word 0xb90013bf
.word 0xb90017bf
.word 0xb9001bbf
.word 0xb9001fbf
.word 0xb90023bf
.word 0xb90027bf
.word 0xb9002bbf
.word 0xb9002fbf

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #264]
.word 0xd2800601
bl _p_3
.word 0xaa0003e3
.word 0xf9401fa0
.word 0xf94023a1
.word 0xf94027a2
.word 0x91004064
.word 0xb98013a5
.word 0xb9000085
.word 0xb98017a5
.word 0xb9000485
.word 0xb9801ba5
.word 0xb9000885
.word 0xb9801fa5
.word 0xb9000c85
.word 0xb98023a5
.word 0xb9001085
.word 0xb98027a5
.word 0xb9001485
.word 0xb9802ba5
.word 0xb9001885
.word 0xb9802fa5
.word 0xb9001c85
.word 0xd2800044
.word 0xd2800005
.word 0xd2800006
.word 0xd2800007
.word 0xf90003ff
.word 0xf90007ff
bl _p_6
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1296]
.word 0xf9001ba0
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000001
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_8f:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Polygon___ctorb__7_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
Xamarin_Forms_Maps_Polygon___ctorb__7_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1344]
.word 0xf9400ba0
.word 0xf9400ba2
.word 0xf9400042
.word 0xf9404c50
.word 0xd63f0200
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_90:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Polyline_get_Geopath
Xamarin_Forms_Maps_Polyline_get_Geopath:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9407800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_91:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Polyline__ctor
Xamarin_Forms_Maps_Polyline__ctor:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xaa1a03e0
bl _p_5

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1304]
.word 0xd2800701
bl _p_3
.word 0xf9001ba0
.word 0xf9001fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #344]
.word 0x3980b410
.word 0xb5000050
bl _p_24

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2800501
bl _p_3
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xf9400002
.word 0x91004023
.word 0xd5033bbf
.word 0xf9401fa0
.word 0xf9000062
.word 0xd349fc63
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0063

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x4, [x16, #16]
.word 0x8b040063
.word 0xd280003e
.word 0x3900007e
.word 0x91004002
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000041
.word 0xd349fc42
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030042
.word 0xd280003e
.word 0x3900005e
.word 0xf90013a0
.word 0xf90017a0
.word 0xeb1f035f
.word 0x10000011
.word 0x54000800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #416]
.word 0xd2801001
bl _p_3
.word 0xaa0003e1
.word 0xf94017a2
.word 0xeb1f035f
.word 0x10000011
.word 0x54000660
.word 0xd5033bbf
.word 0xf900103a
.word 0x91008020
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #16]
.word 0x8b030000
.word 0xd280003e
.word 0x3900001e

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1352]
.word 0xf9001420

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1360]
.word 0xf9002020

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1368]
.word 0xf9401403
.word 0xf9000c23
.word 0xf9401000
.word 0xf9000820
.word 0x3901c03f
.word 0xaa0203e0
.word 0x3940005e
bl _p_78
.word 0x9103c341
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2800f60
.word 0xaa1103e1
bl _p_2

Lme_92:
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Polyline___ctorb__3_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
Xamarin_Forms_Maps_Polyline___ctorb__3_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1344]
.word 0xf9400ba0
.word 0xf9400ba2
.word 0xf9400042
.word 0xf9404c50
.word 0xd63f0200
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_93:
.text
ut_148:
add x0, x0, 16
b Xamarin_Forms_Maps_Position__ctor_double_double
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Position__ctor_double_double
Xamarin_Forms_Maps_Position__ctor_double_double:
.loc 1 1 0
.word 0xa9b77bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xf9400fb9
.word 0xfd4013a0
.word 0xfd001ba0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2f80ade
.word 0x9e6703c0
.word 0xfd001fa0
.word 0xfd401ba0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2f80ade
.word 0x9e6703c1
.word 0x1e612000
.word 0x540000a0
.word 0x5400008b
.word 0xfd401ba0
.word 0xfd001fa0
.word 0x14000014
.word 0xfd401ba0
.word 0xfd0023a0
.word 0xf94023a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd401ba0
.word 0xfd001fa0
.word 0x14000003
.word 0xfd401fa0
.word 0xfd001fa0
.word 0xfd401fa0
.word 0xfd0027a0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ade
.word 0x9e6703c0
.word 0xfd002ba0
.word 0xfd4027a0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80ade
.word 0x9e6703c1
.word 0x1e612000
.word 0x54000082
.word 0xfd4027a0
.word 0xfd002ba0
.word 0x14000014
.word 0xfd4027a0
.word 0xfd002fa0
.word 0xf9402fa0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd4027a0
.word 0xfd002ba0
.word 0x14000003
.word 0xfd402ba0
.word 0xfd002ba0
.word 0xfd402ba0
.word 0xfd000320
.word 0xf9400fb9
.word 0xfd4017a0
.word 0xfd0033a0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2f80cde
.word 0x9e6703c0
.word 0xfd0037a0
.word 0xfd4033a0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2f80cde
.word 0x9e6703c1
.word 0x1e612000
.word 0x540000a0
.word 0x5400008b
.word 0xfd4033a0
.word 0xfd0037a0
.word 0x14000014
.word 0xfd4033a0
.word 0xfd003ba0
.word 0xf9403ba0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd4033a0
.word 0xfd0037a0
.word 0x14000003
.word 0xfd4037a0
.word 0xfd0037a0
.word 0xfd4037a0
.word 0xfd003fa0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80cde
.word 0x9e6703c0
.word 0xfd0043a0
.word 0xfd403fa0
.word 0xd280001e
.word 0xf2d0001e
.word 0xf2e80cde
.word 0x9e6703c1
.word 0x1e612000
.word 0x54000082
.word 0xfd403fa0
.word 0xfd0043a0
.word 0x14000014
.word 0xfd403fa0
.word 0xfd0047a0
.word 0xf94047a0
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x9a9fd7e0
.word 0x53001c00
.word 0x34000080
.word 0xfd403fa0
.word 0xfd0043a0
.word 0x14000003
.word 0xfd4043a0
.word 0xfd0043a0
.word 0xfd4043a0
.word 0xfd000720
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_94:
.text
ut_149:
add x0, x0, 16
b Xamarin_Forms_Maps_Position_get_Latitude
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Position_get_Latitude
Xamarin_Forms_Maps_Position_get_Latitude:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xfd400000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_95:
.text
ut_150:
add x0, x0, 16
b Xamarin_Forms_Maps_Position_get_Longitude
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Position_get_Longitude
Xamarin_Forms_Maps_Position_get_Longitude:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xfd400400
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_96:
.text
ut_151:
add x0, x0, 16
b Xamarin_Forms_Maps_Position_Equals_object
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Position_Equals_object
Xamarin_Forms_Maps_Position_Equals_object:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xd2800000
.word 0xf9001ba0
.word 0xf9001fa0
.word 0xb500007a
.word 0xd2800000
.word 0x1400002e
.word 0xf9400340
.word 0xf9400c00
.word 0xf9400321
.word 0xf90013a1
.word 0xf9400721
.word 0xf90017a1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #280]
.word 0xeb01001f
.word 0x9a9f17e0
.word 0x6b1f001f
.word 0x9a9f17e0
.word 0x53001c00
.word 0x34000060
.word 0xd2800000
.word 0x1400001d
.word 0xf9400340
.word 0x3940b001
.word 0xeb1f003f
.word 0x10000011
.word 0x54000381
.word 0xf9400000
.word 0xf9400000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #208]
.word 0xeb01001f
.word 0x10000011
.word 0x54000281
.word 0x91004340
.word 0xf9400001
.word 0xf9001ba1
.word 0xf9400400
.word 0xf9001fa0
.word 0xfd400320
.word 0xfd401ba1
.word 0x1e612000
.word 0x540000c1
.word 0xfd400720
.word 0xfd401fa1
.word 0x1e612000
.word 0x9a9f17e0
.word 0x14000002
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_97:
.text
ut_152:
add x0, x0, 16
b Xamarin_Forms_Maps_Position_GetHashCode
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Position_GetHashCode
Xamarin_Forms_Maps_Position_GetHashCode:
.loc 1 1 0
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xfd400340
.word 0xfd0013a0
.word 0xfd4013a0
.word 0xfd0017a0
.word 0xf94017b9
.word 0xaa1903e0
.word 0xd1000400
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x5400008b
.word 0xd2800000
.word 0xf2effe00
.word 0x8a000339
.word 0x93407f20
.word 0x9360ff21
.word 0x93407c21
.word 0x4a010000
.word 0xd28031be
.word 0x1b1e7c19
.word 0xfd400740
.word 0xfd0013a0
.word 0xfd4013a0
.word 0xfd001ba0
.word 0xf9401bba
.word 0xaa1a03e0
.word 0xd1000400
.word 0xd29fffe1
.word 0xf2bfffe1
.word 0xf2dfffe1
.word 0xf2efffe1
.word 0x8a010000
.word 0xd2800001
.word 0xf2effe01
.word 0xeb01001f
.word 0x5400008b
.word 0xd2800000
.word 0xf2effe00
.word 0x8a00035a
.word 0x93407f40
.word 0x9360ff41
.word 0x93407c21
.word 0x4a010000
.word 0x4a000320
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_98:
.text
ut_153:
add x0, x0, 16
b Xamarin_Forms_Maps_Position_op_Equality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Position_op_Equality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
Xamarin_Forms_Maps_Position_op_Equality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.loc 1 1 0
.word 0xa9b67bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd000fa1
.word 0xfd002ba2
.word 0xfd002fa3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xf9004ba0
.word 0x91004000
.word 0xf9400ba1
.word 0xf9000001
.word 0xf9400fa1
.word 0xf9000401

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e1
.word 0xf9404ba0
.word 0x91004022
.word 0xf9402ba3
.word 0xf9000043
.word 0xf9402fa3
.word 0xf9000443
bl _p_70
.word 0x53001c00
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_99:
.text
ut_154:
add x0, x0, 16
b Xamarin_Forms_Maps_Position_op_Inequality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
.text
	.align 4
	.no_dead_strip Xamarin_Forms_Maps_Position_op_Inequality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
Xamarin_Forms_Maps_Position_op_Inequality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.loc 1 1 0
.word 0xa9b67bfd
.word 0x910003fd
.word 0xfd000ba0
.word 0xfd000fa1
.word 0xfd002ba2
.word 0xfd002fa3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xf9004ba0
.word 0x91004000
.word 0xf9400ba1
.word 0xf9000001
.word 0xf9400fa1
.word 0xf9000401

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e1
.word 0xf9404ba0
.word 0x91004022
.word 0xf9402ba3
.word 0xf9000043
.word 0xf9402fa3
.word 0xf9000443
bl _p_70
.word 0x53001c00
.word 0x6b1f001f
.word 0x9a9f17e0
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0

Lme_9a:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xfd001ba0
.word 0xfd001fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000720
.word 0x14000001
.word 0xf9403f59
.word 0xaa1903e0
.word 0xb5000220
.word 0xf9401359
.word 0xaa1903e0
.word 0xb4000100
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0020
.word 0x14000021
.word 0xf9401f40
.word 0xf9400b40
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0000
.word 0x1400001b
.word 0xb9801b20
.word 0xaa0003fa
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000429
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xf9003ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9403ba1
.word 0xaa0003f7
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffd6b
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0x91022320
.word 0xd280003e
.word 0xb900001e
.word 0xaa1903e0
bl _p_79
bl _p_80
.word 0xaa0003f9
.word 0xb5ffff20
.word 0x17ffffc6
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_a0:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string
wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x350006e0
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
.word 0x1400001f
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400001a
.word 0xb9801b00
.word 0xaa0003f9
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000429
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
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
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
bl _p_79
bl _p_80
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffc8
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_a1:
.text
ut_163:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array:
.file 2 "/Library/Frameworks/Xamarin.iOS.framework/Versions/Current/src/Xamarin.iOS/mcs/class/corlib/System/Array.cs"
.loc 2 250 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xd5033bbf
.word 0xf9400fa0
.word 0xf9000320
.word 0xd349ff21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 2 251 0
.word 0x9280003e
.word 0xf2bffffe
.word 0xb9000b3e
.loc 2 252 0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_a3:
.text
ut_164:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose:
.loc 2 256 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_a4:
.text
ut_165:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext:
.loc 2 260 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xb9800b40
.word 0x9280003e
.word 0xf2bffffe
.word 0x6b1e001f
.word 0x54000081
.loc 2 261 0
.word 0xf9400340
.word 0xb9801800
.word 0xb9000b40
.loc 2 263 0
.word 0xb9800b40
.word 0x9280001e
.word 0xf2bffffe
.word 0x6b1e001f
.word 0x54000180
.word 0xb9800b40
.word 0x51000419
.word 0xaa1903e0
.word 0xb9000b40
.word 0x9280001e
.word 0xf2bffffe
.word 0x6b1e033f
.word 0x9a9f17e0
.word 0x6b1f001f
.word 0x9a9f17e0
.word 0x14000002
.word 0xd2800000
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_a5:
.text
ut_166:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current:
.loc 2 268 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xb9800b40
.word 0x9280003e
.word 0xf2bffffe
.word 0x6b1e001f
.word 0x54000380
.loc 2 270 0
.word 0xb9800b40
.word 0x9280001e
.word 0xf2bffffe
.word 0x6b1e001f
.word 0x540003c0
.loc 2 273 0
.word 0xf9400340
.word 0xf9400341
.word 0xb9801821
.word 0x51000421
.word 0xb9800b42
.word 0x4b020021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1376]
.word 0x3940001e
.word 0x910063a2
.word 0xf9002fa2
bl _p_81
.word 0xf9402fbe
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xf9400bba
.word 0xfd400fa0
.word 0xfd4013a1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.loc 2 269 0
.word 0xd2935940
bl _p_82
.word 0xaa0003e1
.word 0xd2801980
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17
.loc 2 271 0
.word 0xd2936400
bl _p_82
.word 0xaa0003e1
.word 0xd2801980
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_a6:
.text
ut_167:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset:
.loc 2 279 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0x9280003e
.word 0xf2bffffe
.word 0xb900081e
.loc 2 280 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_a7:
.text
ut_168:
add x0, x0, 16
b System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
.text
	.align 4
	.no_dead_strip System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current:
.loc 2 284 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x910063a0
.word 0xf90017a0
.word 0xf9400ba0
bl _p_83
.word 0xf94017be
.word 0xfd0003c0
.word 0xfd0007c1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0x91004001
.word 0xf9400fa2
.word 0xf9000022
.word 0xf94013a2
.word 0xf9000422
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_a8:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position
System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position:
.loc 2 84 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xb9801800
.word 0x350000c0
.loc 2 85 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1392]
.word 0xf9400000
.word 0x14000027
.loc 2 87 0
.word 0xd2800000
.word 0xf90017a0
.word 0xf9001ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1384]
.word 0x9100a3a0
.word 0xf9400ba1
bl _p_84
.word 0xf94017a0
.word 0xf9000fa0
.word 0xf9401ba0
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1384]
.word 0xd2800401
bl _p_3
.word 0xf90023a0
.word 0x91004003
.word 0xaa0303e1
.word 0xd5033bbf
.word 0xf94023a0
.word 0xf9400fa2
.word 0xf9000062
.word 0xd349fc23
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0063

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x4, [x16, #16]
.word 0x8b040063
.word 0xd280003e
.word 0x3900007e
.word 0x91002021
.word 0xf94013a2
.word 0xf9000022
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_a9:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.loc 2 97 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xd2929780
bl _p_82
.word 0xaa0003e1
.word 0xd2801ba0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_b1:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.loc 2 102 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xd2929780
bl _p_82
.word 0xaa0003e1
.word 0xd2801ba0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_b2:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.loc 2 107 0 prologue_end
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xfd0017a0
.word 0xfd001ba1
.word 0xd2800000
.word 0xf9003fa0
.word 0xf90043a0
.word 0xf9400340
.word 0x3940b000
.word 0xd280003e
.word 0x6b1e001f
.word 0x540005cc
.loc 2 110 0
.word 0xb9801b59
.loc 2 111 0
.word 0xd2800018
.word 0x14000023
.loc 2 114 0
.word 0x93407f00
.word 0xd37cec00
.word 0x8b000340
.word 0x91008000
.word 0xf9400001
.word 0xf9003fa1
.word 0xf9400400
.word 0xf90043a0
.loc 2 115 0
.word 0x14000004
.loc 2 116 0
.word 0x14000018
.loc 2 117 0
.word 0xd2800020
.word 0x1400001a
.loc 2 123 0
.word 0xf9403fa0
.word 0xf90037a0
.word 0xf94043a0
.word 0xf9003ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e1
.word 0x91004020
.word 0xf94037a2
.word 0xf9000002
.word 0xf9403ba2
.word 0xf9000402
.word 0x9100a3a0
bl _p_72
.word 0x53001c00
.word 0x34000060
.loc 2 124 0
.word 0xd2800020
.word 0x14000005
.loc 2 111 0
.word 0x11000718
.word 0x6b19031f
.word 0x54fffbab
.loc 2 128 0
.word 0xd2800000
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.loc 2 108 0
.word 0xd2929f00
bl _p_82
.word 0xaa0003e1
.word 0xd2801da0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_b3:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int
System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int:
.loc 2 133 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb6
.word 0xf9000fb8
.word 0xaa0003f8
.word 0xf90013a1
.word 0xf90017a2
.word 0xf9001bb8
.word 0xf9400b16
.word 0xeb1f02df
.word 0x54000060
.word 0xb98006d6
.word 0x14000002
.word 0xd2800016
.word 0xb9801b04
.word 0xf9401ba0
.word 0xaa1603e1
.word 0xf94013a2
.word 0xb9802ba3
bl _p_85
.loc 2 134 0
.word 0xf9400bb6
.word 0xf9400fb8
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_b4:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xfd001ba0
.word 0xfd001fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x350006e0
.word 0x14000001
.word 0xf9403f59
.word 0xaa1903e0
.word 0xb5000220
.word 0xf9401359
.word 0xaa1903e0
.word 0xb4000100
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0020
.word 0x1400001f
.word 0xf9401f40
.word 0xf9400b40
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0000
.word 0x14000019
.word 0xb9801b20
.word 0xaa0003fa
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xf9003ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9403ba0
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffd8b
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0x91022320
.word 0xd280003e
.word 0xb900001e
.word 0xaa1903e0
bl _p_79
bl _p_80
.word 0xaa0003f9
.word 0xb5ffff20
.word 0x17ffffc8
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_b9:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position:
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xfd001ba0
.word 0xfd001fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000780
.word 0x14000001
.word 0xf9403f59
.word 0xaa1903e0
.word 0xb5000260
.word 0xf9401359
.word 0xaa1903e0
.word 0xb4000120
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0020
.word 0x53001c00
.word 0x14000023
.word 0xf9401f40
.word 0xf9400b40
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xd63f0000
.word 0x53001c00
.word 0x1400001c
.word 0xb9801b20
.word 0xaa0003fa
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000449
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xf9003ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9403ba1
.word 0x53001c00
.word 0x53001c17
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffd4b
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.word 0x91022320
.word 0xd280003e
.word 0xb900001e
.word 0xaa1903e0
bl _p_79
bl _p_80
.word 0xaa0003f9
.word 0xb5ffff20
.word 0x17ffffc3
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_bf:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.word 0xa9b47bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xfd001ba0
.word 0xfd001fa1
.word 0xfd003ba2
.word 0xfd003fa3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000840
.word 0x14000001
.word 0xf9403f59
.word 0xaa1903e0
.word 0xb50002e0
.word 0xf9401359
.word 0xaa1903e0
.word 0xb4000160
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xfd403ba2
.word 0xfd403fa3
.word 0xd63f0020
.word 0x93407c00
.word 0x14000027
.word 0xf9401f40
.word 0xf9400b40
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xfd403ba2
.word 0xfd403fa3
.word 0xd63f0000
.word 0x93407c00
.word 0x1400001e
.word 0xb9801b20
.word 0xaa0003fa
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x54000489
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xfd401ba0
.word 0xfd401fa1
.word 0xfd403ba2
.word 0xfd403fa3
.word 0xf9005ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0x93407c00
.word 0xf9405ba1
.word 0xaa0003f7
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffd0b
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8cc7bfd
.word 0xd65f03c0
.word 0x91022320
.word 0xd280003e
.word 0xb900001e
.word 0xaa1903e0
bl _p_79
bl _p_80
.word 0xaa0003f9
.word 0xb5ffff20
.word 0x17ffffbd
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_c5:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_MapClickedEventArgs
wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_MapClickedEventArgs:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000700
.word 0x14000001
.word 0xf9403f17
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001f
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000019
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000409
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
.word 0xf94023a0
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd8b
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
bl _p_79
bl _p_80
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffc7
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_c6:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Pin_bool_invoke_TResult_T_Xamarin_Forms_Maps_Pin
wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Pin_bool_invoke_TResult_T_Xamarin_Forms_Maps_Pin:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
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
bl _p_79
bl _p_80
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffc5
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_cb:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_3_object_int_bool_invoke_void_T1_T2_T3_object_int_bool
wrapper_delegate_invoke_System_Action_3_object_int_bool_invoke_void_T1_T2_T3_object_int_bool:
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa90157b4
.word 0xa9025fb6
.word 0xa90367b8
.word 0xf90023ba
.word 0xaa0003f7
.word 0xaa0103f8
.word 0xaa0203f9
.word 0xaa0303fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000780
.word 0x14000001
.word 0xf9403ef6
.word 0xaa1603e0
.word 0xb5000260
.word 0xf94012f6
.word 0xaa1603e0
.word 0xb4000120
.word 0xf9401ee0
.word 0xf9400ae4
.word 0xaa1603e0
.word 0xaa1803e1
.word 0xaa1903e2
.word 0xaa1a03e3
.word 0xd63f0080
.word 0x14000021
.word 0xf9401ee0
.word 0xf9400ae3
.word 0xaa1803e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001a
.word 0xb9801ac0
.word 0xaa0003f7
.word 0xd2800015
.word 0x93407ea0
.word 0xb9801ac1
.word 0xeb00003f
.word 0x10000011
.word 0x54000449
.word 0xd37df000
.word 0x8b0002c0
.word 0x91008000
.word 0xf9400014
.word 0xaa1403e4
.word 0xaa0403e0
.word 0xaa1803e1
.word 0xaa1903e2
.word 0xaa1a03e3
.word 0xf9002ba4
.word 0xf9400c90
.word 0xd63f0200
.word 0xf9402ba0
.word 0x110006b5
.word 0xaa1503e0
.word 0x6b17001f
.word 0x54fffd6b
.word 0xa94157b4
.word 0xa9425fb6
.word 0xa94367b8
.word 0xf94023ba
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0x910222c0
.word 0xd280003e
.word 0xb900001e
.word 0xaa1603e0
bl _p_79
bl _p_80
.word 0xaa0003f6
.word 0xb5ffff20
.word 0x17ffffc3
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_d0:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_2_object_int_invoke_void_T1_T2_object_int
wrapper_delegate_invoke_System_Action_2_object_int_invoke_void_T1_T2_object_int:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000700
.word 0x14000001
.word 0xf9403f17
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001f
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000019
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000409
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
.word 0xf94023a0
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd8b
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
bl _p_79
bl _p_80
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffc7
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_d5:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_PinClickedEventArgs
wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_PinClickedEventArgs:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000700
.word 0x14000001
.word 0xf9403f17
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001f
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000019
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000409
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
.word 0xf94023a0
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd8b
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
bl _p_79
bl _p_80
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffc7
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_d6:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor:
.file 3 "/Library/Frameworks/Xamarin.iOS.framework/Versions/Current/src/Xamarin.iOS/external/corefx/src/System.ObjectModel/src/System/Collections/ObjectModel/ObservableCollection.cs"
.loc 3 50 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #344]
.word 0x3980b410
.word 0xb5000050
bl _p_24

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2800501
bl _p_3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #352]
.word 0xf9400021
.word 0xf90017a1
.word 0xf90013a0
.word 0x91004001
.word 0xd5033bbf
.word 0xf94017a0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xf9400ba0
.word 0x91004001
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_d7:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position:
.loc 3 63 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1400]

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1304]
.word 0xf9400fa0
bl _p_86
.word 0xaa0003e1
.word 0xf9400ba0
bl _p_87
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_d8:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CreateCopy_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_string
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CreateCopy_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_string:
.loc 3 79 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xb40001a0
.loc 3 82 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2800501
bl _p_3
.word 0xf90013a0
.word 0xf9400ba1
bl _p_88
.word 0xf94013a0
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.loc 3 80 0
.word 0xd2800f80
.word 0xf2a04000
.word 0xf9400fa1
bl _mono_create_corlib_exception_1
bl _p_17

Lme_d9:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_Move_int_int
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_Move_int_int:
.loc 3 101 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf9400ba0
.word 0xb9801ba1
.word 0xb98023a2
.word 0xf9400ba3
.word 0x3940007e
bl _p_89
.loc 3 102 0
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_da:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler:
.loc 3 125 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf9400ba2
.word 0x3940005e
bl _p_90
.loc 3 126 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_db:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler:
.loc 3 129 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf9400ba2
.word 0x3940005e
bl _p_91
.loc 3 130 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_dc:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9401338
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_31
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1408]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x91008321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_dd:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9401338
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_32
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1408]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x91008321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_de:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_ClearItems
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_ClearItems:
.loc 3 162 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xaa1a03e0
bl _p_92
.loc 3 163 0
.word 0xaa1a03e0
bl _p_93
.loc 3 164 0
.word 0xaa1a03e0
bl _p_94
.loc 3 165 0
.word 0xaa1a03e0
bl _p_95
.loc 3 166 0
.word 0xaa1a03e0
bl _p_96
.loc 3 167 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_df:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_RemoveItem_int
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_RemoveItem_int:
.loc 3 175 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xaa1903e0
bl _p_92
.loc 3 176 0
.word 0x910083a0
.word 0xf9001ba0
.word 0xaa1903e0
.word 0xb9801ba1
bl _p_97
.word 0xf9401bbe
.word 0xfd0003c0
.word 0xfd0007c1
.loc 3 178 0
.word 0xaa1903e0
.word 0xb9801ba1
bl _p_98
.loc 3 180 0
.word 0xaa1903e0
bl _p_94
.loc 3 181 0
.word 0xaa1903e0
bl _p_95
.loc 3 182 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e2
.word 0x91004040
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.word 0xaa1903e0
.word 0xd2800021
.word 0xb9801ba3
bl _p_99
.loc 3 183 0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_e0:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position:
.loc 3 191 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xaa1903e0
bl _p_92
.loc 3 192 0
.word 0xaa1903e0
.word 0xb9801ba1
.word 0xfd4013a0
.word 0xfd4017a1
bl _p_100
.loc 3 194 0
.word 0xaa1903e0
bl _p_94
.loc 3 195 0
.word 0xaa1903e0
bl _p_95
.loc 3 196 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e2
.word 0x91004040
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.word 0xaa1903e0
.word 0xd2800001
.word 0xb9801ba3
bl _p_99
.loc 3 197 0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_e1:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position:
.loc 3 205 0 prologue_end
.word 0xa9b77bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xaa1903e0
bl _p_92
.loc 3 206 0
.word 0x910183a0
.word 0xf9003ba0
.word 0xaa1903e0
.word 0xb9801ba1
bl _p_97
.word 0xf9403bbe
.word 0xfd0003c0
.word 0xfd0007c1
.loc 3 207 0
.word 0xaa1903e0
.word 0xb9801ba1
.word 0xfd4013a0
.word 0xfd4017a1
bl _p_101
.loc 3 209 0
.word 0xaa1903e0
bl _p_95
.loc 3 210 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xf90043a0
.word 0x91004000
.word 0xf94033a1
.word 0xf9000001
.word 0xf94037a1
.word 0xf9000401

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e3
.word 0xf94043a2
.word 0x91004060
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.word 0xaa1903e0
.word 0xd2800041
.word 0xb9801ba4
bl _p_102
.loc 3 211 0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0

Lme_e2:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_MoveItem_int_int
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_MoveItem_int_int:
.loc 3 219 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xaa0003f8
.word 0xf9000fa1
.word 0xf90013a2
.word 0xaa1803e0
bl _p_92
.loc 3 221 0
.word 0x9100a3a0
.word 0xf9001fa0
.word 0xaa1803e0
.word 0xb9801ba1
bl _p_97
.word 0xf9401fbe
.word 0xfd0003c0
.word 0xfd0007c1
.loc 3 223 0
.word 0xaa1803e0
.word 0xb9801ba1
bl _p_98
.loc 3 224 0
.word 0xaa1803e0
.word 0xb98023a1
.word 0xfd4017a0
.word 0xfd401ba1
bl _p_100
.loc 3 226 0
.word 0xaa1803e0
bl _p_95
.loc 3 227 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e2
.word 0x91004040
.word 0xf94017a1
.word 0xf9000001
.word 0xf9401ba1
.word 0xf9000401
.word 0xaa1803e0
.word 0xd2800061
.word 0xb98023a3
.word 0xb9801ba4
bl _p_103
.loc 3 228 0
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_e3:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnPropertyChanged_System_ComponentModel_PropertyChangedEventArgs
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnPropertyChanged_System_ComponentModel_PropertyChangedEventArgs:
.loc 3 236 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bb8
.word 0xf9000fa0
.word 0xf90013a1
.word 0xf9400fa0
.word 0xf9401400
.word 0xaa0003f8
.word 0xb5000040
.word 0x14000006
.word 0xaa1803e0
.word 0xf9400fa1
.word 0xf94013a2
.word 0xf9400f10
.word 0xd63f0200
.loc 3 237 0
.word 0xf9400bb8
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_e4:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9401738
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_31
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1416]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x9100a321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_e5:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9401738
.word 0xaa1803f7
.word 0xaa1803e0
.word 0xaa1a03e1
bl _p_32
.word 0xaa0003f6
.word 0xb4000176
.word 0xf94002c0
.word 0xf9400000
.word 0xf9400800
.word 0xf9400c00

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1416]
.word 0xeb01001f
.word 0x10000011
.word 0x54000481
.word 0xaa1603f5
.word 0xeb1f033f
.word 0x10000011
.word 0x540003a0
.word 0x9100a321
.word 0xd5033bbf
.word 0xc85f7c30
.word 0xeb18021f
.word 0x54000061
.word 0xc811fc36
.word 0x35ffff91
.word 0xd5033bbf
.word 0xaa1003e0
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f8
.word 0xeb17001f
.word 0x54fffae1
.word 0xa9415bb5
.word 0xa94263b7
.word 0xa9436bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0xd2801bc0
.word 0xaa1103e1
bl _p_2
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_e6:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventArgs
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventArgs:
.loc 3 256 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xf9000fa0
.word 0xf90013a1
.word 0xf9400fa0
.word 0xf9401019
.loc 3 257 0
.word 0xaa1903e0
.word 0xb4000320
.loc 3 260 0
.word 0xf9400fa0
.word 0xf9400fa1
.word 0xb9803021
.word 0x11000421
.word 0xb9003001
.loc 3 263 0
.word 0xf9400fa1
.word 0xaa1903e0
.word 0xf94013a2
.word 0xf9400f30
.word 0xd63f0200
.loc 3 264 0
.word 0xf90017bf
.word 0x94000005
.word 0xf94017a0
.word 0xb4000040
bl _p_49
.word 0x14000009
.word 0xf9001bbe
.loc 3 267 0
.word 0xf9400fa0
.word 0xf9400fa1
.word 0xb9803021
.word 0x51000421
.word 0xb9003001
.loc 3 268 0
.word 0xf9401bbe
.word 0xd61f03c0
.loc 3 270 0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_e7:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CheckReentrancy
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CheckReentrancy:
.loc 3 296 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xb9803340
.word 0x6b1f001f
.word 0x5400020d
.loc 3 302 0
.word 0xf9401340
.word 0xaa0003fa
.word 0xb5000060
.word 0xd280001a
.word 0x1400000a
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf9404430
.word 0xd63f0200
.word 0xaa0003e1
.word 0xb9801820
.word 0xd280003e
.word 0x6b1e001f
.word 0x9a9fd7fa
.word 0x350000ba
.loc 3 305 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.loc 3 303 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1424]
.word 0xd28837e1
.word 0xf2a00021
bl _p_16
.word 0xaa0003e1
.word 0xd2801980
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_e8:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCountPropertyChanged
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCountPropertyChanged:
.loc 3 322 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1432]
.word 0xf9400001
.word 0xf9400ba0
.word 0xf9400ba2
.word 0x3940005e
bl _p_104
.loc 3 323 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_e9:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnIndexerPropertyChanged
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnIndexerPropertyChanged:
.loc 3 330 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1440]
.word 0xf9400001
.word 0xf9400ba0
.word 0xf9400ba2
.word 0x3940005e
bl _p_104
.loc 3 331 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_ea:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int:
.loc 3 338 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf90017a3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1448]
.word 0xd2800601
bl _p_3
.word 0xf9001ba0
.word 0xb9801ba1
.word 0xf94013a2
.word 0xb9802ba3
bl _p_105
.word 0xf9401ba1
.word 0xf9400ba0
.word 0xf9400ba2
.word 0x3940005e
bl _p_106
.loc 3 339 0
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_eb:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int:
.loc 3 346 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf90017a3
.word 0xf9001ba4

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1448]
.word 0xd2800601
bl _p_3
.word 0xf90023a0
.word 0xb9801ba1
.word 0xf94013a2
.word 0xb9802ba3
.word 0xb98033a4
bl _p_107
.word 0xf94023a1
.word 0xf9400ba0
.word 0xf9400ba2
.word 0x3940005e
bl _p_106
.loc 3 347 0
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_ec:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int:
.loc 3 354 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf90017a3
.word 0xf9001ba4

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1448]
.word 0xd2800601
bl _p_3
.word 0xf90023a0
.word 0xb9801ba1
.word 0xf94017a2
.word 0xf94013a3
.word 0xb98033a4
bl _p_108
.word 0xf94023a1
.word 0xf9400ba0
.word 0xf9400ba2
.word 0x3940005e
bl _p_106
.loc 3 355 0
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0

Lme_ed:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionReset
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionReset:
.loc 3 362 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1456]
.word 0xf9400001
.word 0xf9400ba0
.word 0xf9400ba2
.word 0x3940005e
bl _p_106
.loc 3 363 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_ee:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_EnsureMonitorInitialized
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_EnsureMonitorInitialized:
.loc 3 367 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xf9400f40
.word 0xaa0003f9
.word 0xb50004c0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1464]
.word 0xd2800401
bl _p_3
.word 0xf90017a0
.word 0x91004001
.word 0xd5033bbf
.word 0xf94017a0
.word 0xf900003a
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xf90013a0
.word 0xaa0003f9
.word 0x91006341
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xaa0003f9
.word 0xaa1903e0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_ef:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnSerializing_System_Runtime_Serialization_StreamingContext
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnSerializing_System_Runtime_Serialization_StreamingContext:
.loc 3 373 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9000fa1
.word 0xf90013a2
.word 0xaa1a03e0
bl _p_109
.loc 3 374 0
.word 0xf9400f40
.word 0xb9803341
.word 0xb9001801
.loc 3 375 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_f0:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnDeserialized_System_Runtime_Serialization_StreamingContext
System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnDeserialized_System_Runtime_Serialization_StreamingContext:
.loc 3 380 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf9400f40
.word 0xb4000280
.loc 3 382 0
.word 0xf9400f40
.word 0xb9801800
.word 0xb9003340
.loc 3 383 0
.word 0xf9400f40
.word 0x91004000
.word 0xf9001ba0
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf900001a
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.loc 3 385 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_f1:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position__ctor_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position__ctor_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position:
.loc 3 410 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0x91004001
.word 0xd5033bbf
.word 0xf9400fa0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 3 411 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_f2:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position_Dispose
System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position_Dispose:
.loc 3 415 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9400800
.word 0xaa0003e2
.word 0xb9803001
.word 0x51000421
.word 0xb9003001
.loc 3 416 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_f3:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor:
.file 4 "/Library/Frameworks/Xamarin.iOS.framework/Versions/Current/src/Xamarin.iOS/external/corefx/src/Common/src/CoreLib/System/Collections/ObjectModel/Collection.cs"
.loc 4 22 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #344]
.word 0xd2800501
bl _p_3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #352]
.word 0xf9400021
.word 0xf90017a1
.word 0xf90013a0
.word 0x91004001
.word 0xd5033bbf
.word 0xf94017a0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.word 0xf9400ba0
.word 0x91004001
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 23 0
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_f4:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_Xamarin_Forms_Maps_Position:
.loc 4 27 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400fa0
.word 0xb4000260
.loc 4 31 0
.word 0xf9400ba0
.word 0x91004001
.word 0xd5033bbf
.word 0xf9400fa0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 4 32 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.loc 4 29 0
.word 0xd28000e0
bl _p_110
.word 0x17ffffec

Lme_f5:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Count
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Count:
.loc 4 36 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1472]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_f6:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Items
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Items:
.loc 4 41 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9400800
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_f7:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Item_int
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Item_int:
.loc 4 46 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xf9402ba0
.word 0xf9400802
.word 0x910043a0
.word 0xf90033a0
.word 0xaa0203e0
.word 0xb9805ba1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1480]
.word 0x92800df0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xf94033be
.word 0xfd0003c0
.word 0xfd0007c1
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0

Lme_f8:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_set_Item_int_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_set_Item_int_Xamarin_Forms_Maps_Position:
.loc 4 49 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xf9400b21
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35000360
.loc 4 54 0
.word 0xf9400b21
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1472]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003e1
.word 0xb9801ba0
.word 0x6b01001f
.word 0x540001e2
.loc 4 59 0
.word 0xaa1903e0
.word 0xb9801ba1
.word 0xfd4013a0
.word 0xfd4017a1
.word 0xf9400322
.word 0xf940b050
.word 0xd63f0200
.loc 4 60 0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.loc 4 51 0
.word 0xd2800380
bl _p_111
.word 0x17ffffe4
.loc 4 56 0
bl _p_112
.word 0x17fffff1

Lme_f9:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position:
.loc 4 65 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xf9400b41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35000300
.loc 4 70 0
.word 0xf9400b41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1472]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xb9005ba0
.loc 4 71 0
.word 0xaa1a03e0
.word 0xb9805ba1
.word 0xfd400fa0
.word 0xfd4013a1
.word 0xf9400342
.word 0xf940b850
.word 0xd63f0200
.loc 4 72 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.loc 4 67 0
.word 0xd2800380
bl _p_111
.word 0x17ffffe7

Lme_fa:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Clear
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Clear:
.loc 4 76 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xf9400b41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35000120
.loc 4 81 0
.word 0xaa1a03e0
.word 0xf9400341
.word 0xf940bc30
.word 0xd63f0200
.loc 4 82 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.loc 4 78 0
.word 0xd2800380
bl _p_111
.word 0x17fffff6

Lme_fb:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int:
.loc 4 86 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf9400ba0
.word 0xf9400803
.word 0xaa0303e0
.word 0xf9400fa1
.word 0xb98023a2
.word 0xf9400063

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1496]
.word 0x928007f0
.word 0xf2bffff0
.word 0xf8706870
.word 0xd63f0200
.loc 4 87 0
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_fc:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Contains_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Contains_Xamarin_Forms_Maps_Position:
.loc 4 91 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xfd400fa0
.word 0xfd4013a1
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1504]
.word 0x928006f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_fd:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_GetEnumerator
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_GetEnumerator:
.loc 4 96 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1512]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_fe:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IndexOf_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IndexOf_Xamarin_Forms_Maps_Position:
.loc 4 101 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xfd400fa0
.word 0xfd4013a1
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_ff:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Insert_int_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Insert_int_Xamarin_Forms_Maps_Position:
.loc 4 106 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xf9400b21
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35000360
.loc 4 111 0
.word 0xf9400b21
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1472]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003e1
.word 0xb9801ba0
.word 0x6b01001f
.word 0x540001e8
.loc 4 116 0
.word 0xaa1903e0
.word 0xb9801ba1
.word 0xfd4013a0
.word 0xfd4017a1
.word 0xf9400322
.word 0xf940b850
.word 0xd63f0200
.loc 4 117 0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.loc 4 108 0
.word 0xd2800380
bl _p_111
.word 0x17ffffe4
.loc 4 113 0
bl _p_112
.word 0x17fffff1

Lme_100:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Remove_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Remove_Xamarin_Forms_Maps_Position:
.loc 4 121 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xf9400b41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x350003c0
.loc 4 126 0
.word 0xf9400b41
.word 0xaa0103e0
.word 0xfd4013a0
.word 0xfd4017a1
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1520]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003f9
.loc 4 127 0
.word 0xaa1903e0
.word 0x6b1f001f
.word 0x5400006a
.word 0xd2800000
.word 0x14000007
.loc 4 128 0
.word 0xaa1a03e0
.word 0xaa1903e1
.word 0xf9400342
.word 0xf940b450
.word 0xd63f0200
.loc 4 129 0
.word 0xd2800020
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.loc 4 123 0
.word 0xd2800380
bl _p_111
.word 0x17ffffe1

Lme_101:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveAt_int
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveAt_int:
.loc 4 134 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000bb9
.word 0xaa0003f9
.word 0xf9000fa1
.word 0xf9400b21
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35000320
.loc 4 139 0
.word 0xf9400b21
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1472]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003e1
.word 0xb9801ba0
.word 0x6b01001f
.word 0x540001a2
.loc 4 144 0
.word 0xaa1903e0
.word 0xb9801ba1
.word 0xf9400322
.word 0xf940b450
.word 0xd63f0200
.loc 4 145 0
.word 0xf9400bb9
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0
.loc 4 136 0
.word 0xd2800380
bl _p_111
.word 0x17ffffe6
.loc 4 141 0
bl _p_112
.word 0x17fffff3

Lme_102:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_ClearItems
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_ClearItems:
.loc 4 149 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1528]
.word 0x928000f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.loc 4 150 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_103:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position:
.loc 4 154 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xf9400ba0
.word 0xf9400802
.word 0xaa0203e0
.word 0xb9801ba1
.word 0xfd4013a0
.word 0xfd4017a1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1536]
.word 0x92800af0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.loc 4 155 0
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_104:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveItem_int
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveItem_int:
.loc 4 159 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9400802
.word 0xaa0203e0
.word 0xb9801ba1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1544]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.loc 4 160 0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_105:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position:
.loc 4 164 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xf9400ba0
.word 0xf9400802
.word 0xaa0203e0
.word 0xb9801ba1
.word 0xfd4013a0
.word 0xfd4017a1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1552]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.loc 4 165 0
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_106:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_Generic_ICollection_T_get_IsReadOnly
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_Generic_ICollection_T_get_IsReadOnly:
.loc 4 171 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_107:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator:
.loc 4 177 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #832]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_108:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_IsSynchronized
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_IsSynchronized:
.loc 4 182 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xd2800000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_109:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_SyncRoot
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_SyncRoot:
.loc 4 189 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xf90013b9
.word 0xf90017a0
.word 0xf94017a0
.word 0xf9400819
.word 0xaa1903f8
.word 0xeb1f033f
.word 0x540002c0
.word 0xf9400337
.word 0xb9402ae0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1560]
.word 0xeb01001f
.word 0x540001c3
.word 0xf94012e0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1560]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xb5000040
.word 0xd2800018
.word 0xaa1803f9
.word 0xb5000078
.word 0xf94017a0
.word 0x1400000a
.word 0xaa1903e0
.word 0xf9400321

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1568]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xa94163b7
.word 0xf94013b9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_10a:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_CopyTo_System_Array_int
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_CopyTo_System_Array_int:
.loc 4 195 0 prologue_end
.word 0xa9b77bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa
.word 0xb40018b9
.loc 4 200 0
.word 0xf9400320
.word 0x3940b000
.word 0xd280003e
.word 0x6b1e001f
.word 0x540016a1
.loc 4 205 0
.word 0xf9400b37
.word 0xeb1f02ff
.word 0x54000060
.word 0xb98006f7
.word 0x14000002
.word 0xd2800017
.word 0x35001637
.loc 4 210 0
.word 0x6b1f035f
.word 0x5400164b
.loc 4 215 0
.word 0xb9801b20
.word 0x4b1a0000
.word 0xf90043a0
.word 0xaa1803e0
bl _p_113
.word 0x93407c00
.word 0xaa0003e1
.word 0xf94043a0
.word 0x6b01001f
.word 0x5400154b
.loc 4 220 0
.word 0xaa1903f7
.word 0xeb1f033f
.word 0x54000240
.word 0xf9400336
.word 0xf9400b20
.word 0xb50001c0
.word 0x3940b2c0
.word 0xd280003e
.word 0xeb1e001f
.word 0x54000141
.word 0xf94002c0
.word 0xf9400400
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #208]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800017
.word 0xaa1703f6
.word 0xb40001d7
.loc 4 222 0
.word 0xf9400b03
.word 0xaa0303e0
.word 0xaa1603e1
.word 0xaa1a03e2
.word 0xf9400063

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1496]
.word 0x928007f0
.word 0xf2bffff0
.word 0xf8706870
.word 0xd63f0200
.loc 4 223 0
.word 0x14000079
.loc 4 232 0
.word 0xf9400320
.word 0xf9400c01
.word 0xaa0103e0
.word 0xf9400021
.word 0xf9413c30
.word 0xd63f0200
.word 0xaa0003f7
.loc 4 233 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x22, [x16, #1576]
.loc 4 234 0
.word 0xaa1703e0
.word 0xaa1603e1
.word 0xf94002e2
.word 0xf9418850
.word 0xd63f0200
.word 0x53001c00
.word 0x35000100
.word 0xaa1603e0
.word 0xaa1703e1
.word 0xf94002c2
.word 0xf9418850
.word 0xd63f0200
.word 0x53001c00
.word 0x34000ea0
.loc 4 243 0
.word 0xaa1903f7
.word 0xeb1f033f
.word 0x540003c0
.word 0xf9400336
.word 0xf9400b20
.word 0xb5000340
.word 0x3940b2c0
.word 0xd280003e
.word 0xeb1e001f
.word 0x540002c1
.word 0xf94002c0
.word 0xf9400419
.word 0xf9401736
.word 0x39406f20
.word 0xf9002ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1584]
.word 0xeb0002df
.word 0x540000e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1592]
.word 0xeb00033f
.word 0x54000100
.word 0x14000006
.word 0xb50000d6
.word 0xf9402ba0
.word 0xd28000de
.word 0xeb1e001f
.word 0x54000041
.word 0xd2800017
.word 0xaa1703f9
.loc 4 244 0
.word 0xb4000ab7
.loc 4 249 0
.word 0xf9400b01
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1472]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003f7
.loc 4 252 0
.word 0xd2800016
.word 0x14000025
.loc 4 254 0
.word 0xaa1a03e0
.word 0xf90043a0
.word 0x1100075a
.word 0xf9400b02
.word 0x9100e3a0
.word 0xf90027a0
.word 0xaa0203e0
.word 0xaa1603e1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1480]
.word 0x92800df0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xf94027be
.word 0xfd0003c0
.word 0xfd0007c1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e2
.word 0xf94043a1
.word 0x91004040
.word 0xf9401fa3
.word 0xf9000003
.word 0xf94023a3
.word 0xf9000403
.word 0xaa1903e0
.word 0xf9400323
.word 0xf9408470
.word 0xd63f0200
.loc 4 252 0
.word 0x110006d6
.word 0x6b1702df
.word 0x54fffb6b
.loc 4 256 0
.word 0x1400000a
.word 0xf9002fa0
.loc 4 259 0
bl _p_114
.loc 4 260 0
bl _p_115
.word 0xf9003ba0
.word 0xf9403ba0
.word 0xb4000060
.word 0xf9403ba0
bl _p_17
.word 0x14000001
.loc 4 262 0
.word 0xa9415fb6
.word 0xa94267b8
.word 0xf9401bba
.word 0x910003bf
.word 0xa8c97bfd
.word 0xd65f03c0
.loc 4 202 0
.word 0xd28000e0
bl _p_116
.word 0x17ffff4a
.loc 4 207 0
.word 0xd28000c0
bl _p_116
.word 0x17ffff4e
.loc 4 212 0
bl _p_117
.word 0x17ffff4e
.loc 4 217 0
.word 0xd28000a0
bl _p_116
.word 0x17ffff55
.loc 4 197 0
.word 0xd2800060
bl _p_110
.word 0x17ffff3a
.loc 4 236 0
bl _p_114
.word 0x17ffff8b
.loc 4 246 0
bl _p_114
.word 0x17ffffab

Lme_10b:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_Item_int
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_Item_int:
.loc 4 266 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9400802
.word 0x910083a0
.word 0xf9001ba0
.word 0xaa0203e0
.word 0xb9801ba1
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1480]
.word 0x92800df0
.word 0xf2bffff0
.word 0xf8706850
.word 0xd63f0200
.word 0xf9401bbe
.word 0xfd0003c0
.word 0xfd0007c1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0x91004001
.word 0xf94013a2
.word 0xf9000022
.word 0xf94017a2
.word 0xf9000422
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_10c:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_set_Item_int_object
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_set_Item_int_object:
.loc 4 269 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf94013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1600]
.word 0xd28001e1
bl _p_118
.loc 4 273 0
.word 0xf94013a0
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x54000481
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #208]
.word 0xeb02003f
.word 0x10000011
.word 0x54000381
.word 0x91004000
.word 0xf9400001
.word 0xf90017a1
.word 0xf9400400
.word 0xf9001ba0
.word 0xf9400ba0
.word 0xb9801ba1
.word 0xfd4017a0
.word 0xfd401ba1
bl _p_119
.loc 4 274 0
.word 0x1400000e
.word 0xf9001fa0
.loc 4 277 0
.word 0xf94013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1576]
bl _p_120
.loc 4 278 0
bl _p_115
.word 0xf9002ba0
.word 0xf9402ba0
.word 0xb4000060
.word 0xf9402ba0
bl _p_17
.word 0x14000001
.loc 4 279 0
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_10d:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsReadOnly
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsReadOnly:
.loc 4 286 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_10e:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsFixedSize
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsFixedSize:
.loc 4 298 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa
.word 0xf9400b59
.word 0xaa1903f8
.word 0xeb1f033f
.word 0x540002c0
.word 0xf9400337
.word 0xb9402ae0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1608]
.word 0xeb01001f
.word 0x540001c3
.word 0xf94012e0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1608]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xb5000040
.word 0xd2800018
.word 0xaa1803f9
.word 0xb4000198
.loc 4 300 0
.word 0xaa1903e0
.word 0xf9400321

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1616]
.word 0x92800ff0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x1400000c
.loc 4 302 0
.word 0xf9400b41
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_10f:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Add_object
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Add_object:
.loc 4 308 0 prologue_end
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35000660
.loc 4 312 0
.word 0xf9400fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1600]
.word 0xd28001e1
bl _p_118
.loc 4 316 0
.word 0xf9400ba0
.word 0xf9400fa1
.word 0xf9400022
.word 0x3940b043
.word 0xeb1f007f
.word 0x10000011
.word 0x54000521
.word 0xf9400042
.word 0xf9400042

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x3, [x16, #208]
.word 0xeb03005f
.word 0x10000011
.word 0x54000421
.word 0x91004021
.word 0xf9400022
.word 0xf90013a2
.word 0xf9400421
.word 0xf90017a1
.word 0xfd4013a0
.word 0xfd4017a1
bl _p_121
.loc 4 317 0
.word 0x1400000e
.word 0xf9001ba0
.loc 4 320 0
.word 0xf9400fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1576]
bl _p_120
.loc 4 321 0
bl _p_115
.word 0xf90027a0
.word 0xf94027a0
.word 0xb4000060
.word 0xf94027a0
bl _p_17
.word 0x14000001
.loc 4 323 0
.word 0xf9400ba0
bl _p_113
.word 0x93407c00
.word 0x51000400
.word 0x910003bf
.word 0xa8c57bfd
.word 0xd65f03c0
.loc 4 310 0
.word 0xd2800380
bl _p_111
.word 0x17ffffcc
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_110:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Contains_object
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Contains_object:
.loc 4 328 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xf9000fa0
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1624]
.word 0xaa1a03e0
bl _p_122
.word 0x53001c00
.word 0x34000320
.loc 4 330 0
.word 0xf9400340
.word 0x3940b001
.word 0xeb1f003f
.word 0x10000011
.word 0x54000321
.word 0xf9400000
.word 0xf9400000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #208]
.word 0xeb01001f
.word 0x10000011
.word 0x54000221
.word 0x91004340
.word 0xf9400001
.word 0xf90013a1
.word 0xf9400400
.word 0xf90017a0
.word 0xf9400fa0
.word 0xfd4013a0
.word 0xfd4017a1
bl _p_123
.word 0x53001c00
.word 0x14000002
.loc 4 332 0
.word 0xd2800000
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_111:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_IndexOf_object
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_IndexOf_object:
.loc 4 337 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xf9000fa0
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1624]
.word 0xaa1a03e0
bl _p_122
.word 0x53001c00
.word 0x34000320
.loc 4 339 0
.word 0xf9400340
.word 0x3940b001
.word 0xeb1f003f
.word 0x10000011
.word 0x54000341
.word 0xf9400000
.word 0xf9400000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #208]
.word 0xeb01001f
.word 0x10000011
.word 0x54000241
.word 0x91004340
.word 0xf9400001
.word 0xf90013a1
.word 0xf9400400
.word 0xf90017a0
.word 0xf9400fa0
.word 0xfd4013a0
.word 0xfd4017a1
bl _p_124
.word 0x93407c00
.word 0x14000003
.loc 4 341 0
.word 0x92800000
.word 0xf2bfffe0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_112:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Insert_int_object
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Insert_int_object:
.loc 4 346 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf9400ba0
.word 0xf9400801
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35000600
.loc 4 350 0
.word 0xf94013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1600]
.word 0xd28001e1
bl _p_118
.loc 4 354 0
.word 0xf94013a0
.word 0xf9400001
.word 0x3940b022
.word 0xeb1f005f
.word 0x10000011
.word 0x540004e1
.word 0xf9400021
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #208]
.word 0xeb02003f
.word 0x10000011
.word 0x540003e1
.word 0x91004000
.word 0xf9400001
.word 0xf90017a1
.word 0xf9400400
.word 0xf9001ba0
.word 0xf9400ba0
.word 0xb9801ba1
.word 0xfd4017a0
.word 0xfd401ba1
bl _p_125
.loc 4 355 0
.word 0x1400000e
.word 0xf9001fa0
.loc 4 358 0
.word 0xf94013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1576]
bl _p_120
.loc 4 359 0
bl _p_115
.word 0xf9002ba0
.word 0xf9402ba0
.word 0xb4000060
.word 0xf9402ba0
bl _p_17
.word 0x14000001
.loc 4 360 0
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.loc 4 348 0
.word 0xd2800380
bl _p_111
.word 0x17ffffcf
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_113:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Remove_object
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Remove_object:
.loc 4 364 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xf9000fa0
.word 0xaa0103fa
.word 0xf9400fa0
.word 0xf9400801
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1488]
.word 0x92800cf0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35000440
.loc 4 369 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1624]
.word 0xaa1a03e0
bl _p_122
.word 0x53001c00
.word 0x340002e0
.loc 4 371 0
.word 0xf9400340
.word 0x3940b001
.word 0xeb1f003f
.word 0x10000011
.word 0x54000321
.word 0xf9400000
.word 0xf9400000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #208]
.word 0xeb01001f
.word 0x10000011
.word 0x54000221
.word 0x91004340
.word 0xf9400001
.word 0xf90013a1
.word 0xf9400400
.word 0xf90017a0
.word 0xf9400fa0
.word 0xfd4013a0
.word 0xfd4017a1
bl _p_126
.loc 4 373 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.loc 4 366 0
.word 0xd2800380
bl _p_111
.word 0x17ffffdd
.word 0xd2801960
.word 0xaa1103e1
bl _p_2

Lme_114:
.text
	.align 4
	.no_dead_strip System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IsCompatibleObject_object
System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IsCompatibleObject_object:
.loc 4 379 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003fa
.word 0xd2800000
.word 0xf9001ba0
.word 0xf9001fa0
.word 0xaa1a03f9
.word 0xeb1f035f
.word 0x54000160
.word 0xf9400340
.word 0xf9400000
.word 0xf9400800
.word 0xf9400800

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #208]
.word 0xeb01001f
.word 0x54000040
.word 0xd2800019
.word 0xb5000319
.word 0xb50002ba
.word 0xd2800000
.word 0xf9001ba0
.word 0xf9001fa0
.word 0xf9401ba0
.word 0xf90013a0
.word 0xf9401fa0
.word 0xf90017a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0x91004001
.word 0xf94013a2
.word 0xf9000022
.word 0xf94017a2
.word 0xf9000422
.word 0xeb1f001f
.word 0x9a9f17e0
.word 0x14000004
.word 0xd2800000
.word 0x14000002
.word 0xd2800020
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0

Lme_115:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__Insert_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position
System_Array_InternalArray__Insert_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position:
.loc 2 154 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xfd0013a0
.word 0xfd0017a1
.word 0xd2929780
bl _p_82
.word 0xaa0003e1
.word 0xd2801ba0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_11b:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__IndexOf_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
System_Array_InternalArray__IndexOf_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position:
.loc 2 164 0 prologue_end
.word 0xa9b87bfd
.word 0x910003fd
.word 0xa90167b8
.word 0xf90013ba
.word 0xaa0003fa
.word 0xfd0017a0
.word 0xfd001ba1
.word 0xd2800000
.word 0xf90037a0
.word 0xf9003ba0
.word 0xf9400340
.word 0x3940b000
.word 0xd280003e
.word 0x6b1e001f
.word 0x540007cc
.loc 2 167 0
.word 0xb9801b59
.loc 2 168 0
.word 0xd2800018
.word 0x1400002d
.loc 2 171 0
.word 0x93407f00
.word 0xd37cec00
.word 0x8b000340
.word 0x91008000
.word 0xf9400001
.word 0xf90037a1
.word 0xf9400400
.word 0xf9003ba0
.loc 2 172 0
.word 0x1400000b
.loc 2 173 0
.word 0x14000022
.loc 2 174 0
.word 0xaa1803f9
.word 0xf9400b58
.word 0xeb1f031f
.word 0x54000060
.word 0xb980071a
.word 0x14000002
.word 0xd280001a
.word 0xb1a0320
.word 0x14000023
.loc 2 178 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e1
.word 0x91004020
.word 0xf94017a2
.word 0xf9000002
.word 0xf9401ba2
.word 0xf9000402
.word 0x9101a3a0
bl _p_72
.word 0x53001c00
.word 0x34000140
.loc 2 181 0
.word 0xaa1803f9
.word 0xf9400b58
.word 0xeb1f031f
.word 0x54000060
.word 0xb980071a
.word 0x14000002
.word 0xd280001a
.word 0xb1a0320
.word 0x1400000b
.loc 2 168 0
.word 0x11000718
.word 0x6b19031f
.word 0x54fffa6b
.loc 2 186 0
.word 0xf9400b59
.word 0xeb1f033f
.word 0x54000060
.word 0xb980073a
.word 0x14000002
.word 0xd280001a
.word 0x51000740
.word 0xa94167b8
.word 0xf94013ba
.word 0x910003bf
.word 0xa8c87bfd
.word 0xd65f03c0
.loc 2 165 0
.word 0xd2929f00
bl _p_82
.word 0xaa0003e1
.word 0xd2801da0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_11c:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int
System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int:
.loc 2 192 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xf9002fa1
.word 0xd2800000
.word 0xf90033a0
.word 0xf90037a0
.word 0xf9402ba0
.word 0xb9801801
.word 0xb9805ba0
.word 0x6b01001f
.word 0x54000282
.loc 2 197 0
.word 0xb9805ba0
.word 0x93407c00
.word 0xd37cec01
.word 0xf9402ba0
.word 0x8b010000
.word 0x91008000
.word 0xf9400001
.word 0xf90033a1
.word 0xf9400400
.word 0xf90037a0
.loc 2 198 0
.word 0xf94033a0
.word 0xf9000ba0
.word 0xf94037a0
.word 0xf9000fa0
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.loc 2 193 0
.word 0xd2843a40
bl _p_82
.word 0xaa0003e1
.word 0xd2800fa0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_11d:
.text
	.align 4
	.no_dead_strip System_Array_InternalArray__set_Item_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position
System_Array_InternalArray__set_Item_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position:
.loc 2 203 0 prologue_end
.word 0xa9b67bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xaa0003f9
.word 0xf9001ba1
.word 0xfd001fa0
.word 0xfd0023a1
.word 0xb9801b21
.word 0xb98033a0
.word 0x6b01001f
.word 0x54000942
.loc 2 206 0
.word 0xaa1903f8
.word 0xeb1f033f
.word 0x540003c0
.word 0xf9400337
.word 0xf9400b20
.word 0xb5000340
.word 0x3940b2e0
.word 0xd280003e
.word 0xeb1e001f
.word 0x540002c1
.word 0xf94002e0
.word 0xf9400417
.word 0xf94016f6
.word 0x39406ee0
.word 0xf9004fa0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1584]
.word 0xeb0002df
.word 0x540000e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1592]
.word 0xeb0002ff
.word 0x54000100
.word 0x14000006
.word 0xb50000d6
.word 0xf9404fa0
.word 0xd28000de
.word 0xeb1e001f
.word 0x54000041
.word 0xd2800018
.word 0xaa1803f7
.loc 2 207 0
.word 0xb40002d8
.loc 2 208 0
.word 0xf9401fa0
.word 0xf90047a0
.word 0xf94023a0
.word 0xf9004ba0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0xaa0003e2
.word 0x91004040
.word 0xf94047a1
.word 0xf9000001
.word 0xf9404ba1
.word 0xf9000401
.word 0xaa1703e0
.word 0xb98033a1
.word 0xf94002e3
.word 0xf9408470
.word 0xd63f0200
.loc 2 209 0
.word 0x1400000e
.loc 2 212 0
.word 0xb98033a0
.word 0x93407c00
.word 0xd37cec00
.word 0x8b000320
.word 0x91008000
.word 0xf9401fa1
.word 0xf9003fa1
.word 0xf94023a1
.word 0xf90043a1
.word 0xf9403fa1
.word 0xf9000001
.word 0xf94043a1
.word 0xf9000401
.loc 2 213 0
.word 0xa9415fb6
.word 0xa94267b8
.word 0x910003bf
.word 0xa8ca7bfd
.word 0xd65f03c0
.loc 2 204 0
.word 0xd2843a40
bl _p_82
.word 0xaa0003e1
.word 0xd2800fa0
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17

Lme_11e:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult
wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000660
.word 0x14000001
.word 0xf9403f59
.word 0xaa1903e0
.word 0xb50001a0
.word 0xf9401359
.word 0xaa1903e0
.word 0xb40000c0
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xd63f0020
.word 0x1400001d
.word 0xf9401f40
.word 0xf9400b40
.word 0xd63f0000
.word 0x14000019
.word 0xb9801b20
.word 0xaa0003fa
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xf9001ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9401ba1
.word 0xaa0003f7
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffdab
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0x91022320
.word 0xd280003e
.word 0xb900001e
.word 0xaa1903e0
bl _p_79
bl _p_80
.word 0xaa0003f9
.word 0xb5ffff20
.word 0x17ffffcc
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_11f:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object
wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x350006e0
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
.word 0x1400001f
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400001a
.word 0xb9801b00
.word 0xaa0003f9
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000429
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
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
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
bl _p_79
bl _p_80
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffc8
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_120:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string
wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
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
bl _p_79
bl _p_80
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffca
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_121:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object
wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000700
.word 0x14000001
.word 0xf9403f17
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001f
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000019
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000409
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
.word 0xf94023a0
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd8b
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
bl _p_79
bl _p_80
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffc7
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_122:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult
wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x350006e0
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
.word 0x1400001f
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400001a
.word 0xb9801b00
.word 0xaa0003f9
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000429
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
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
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
bl _p_79
bl _p_80
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffc8
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_123:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
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
bl _p_79
bl _p_80
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffca
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_124:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000740
.word 0x14000001
.word 0xf9403f17
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x14000021
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x1400001b
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000449
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
.word 0xf94023a1
.word 0xaa0003f5
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd6b
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
bl _p_79
bl _p_80
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffc5
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_125:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult
wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult:
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000660
.word 0x14000001
.word 0xf9403f59
.word 0xaa1903e0
.word 0xb50001a0
.word 0xf9401359
.word 0xaa1903e0
.word 0xb40000c0
.word 0xf9401f40
.word 0xf9400b41
.word 0xaa1903e0
.word 0xd63f0020
.word 0x1400001d
.word 0xf9401f40
.word 0xf9400b40
.word 0xd63f0000
.word 0x14000019
.word 0xb9801b20
.word 0xaa0003fa
.word 0xd2800018
.word 0x93407f00
.word 0xb9801b21
.word 0xeb00003f
.word 0x10000011
.word 0x540003e9
.word 0xd37df000
.word 0x8b000320
.word 0x91008000
.word 0xf9400017
.word 0xaa1703e1
.word 0xaa0103e0
.word 0xf9001ba1
.word 0xf9400c30
.word 0xd63f0200
.word 0xf9401ba1
.word 0xaa0003f7
.word 0x11000718
.word 0xaa1803e0
.word 0x6b1a001f
.word 0x54fffdab
.word 0xaa1703e0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.word 0x91022320
.word 0xd280003e
.word 0xb900001e
.word 0xaa1903e0
bl _p_79
bl _p_80
.word 0xaa0003f9
.word 0xb5ffff20
.word 0x17ffffcc
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_126:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object
wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x350006e0
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
.word 0x1400001f
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400001a
.word 0xb9801b00
.word 0xaa0003f9
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000429
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
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
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
bl _p_79
bl _p_80
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffc8
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_127:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
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
bl _p_79
bl _p_80
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffca
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_128:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object
wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015bb5
.word 0xa90263b7
.word 0xa9036bb9
.word 0xaa0003f8
.word 0xaa0103f9
.word 0xaa0203fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x35000700
.word 0x14000001
.word 0xf9403f17
.word 0xaa1703e0
.word 0xb5000220
.word 0xf9401317
.word 0xaa1703e0
.word 0xb4000100
.word 0xf9401f00
.word 0xf9400b03
.word 0xaa1703e0
.word 0xaa1903e1
.word 0xaa1a03e2
.word 0xd63f0060
.word 0x1400001f
.word 0xf9401f00
.word 0xf9400b02
.word 0xaa1903e0
.word 0xaa1a03e1
.word 0xd63f0040
.word 0x14000019
.word 0xb9801ae0
.word 0xaa0003f8
.word 0xd2800016
.word 0x93407ec0
.word 0xb9801ae1
.word 0xeb00003f
.word 0x10000011
.word 0x54000409
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
.word 0xf94023a0
.word 0x110006d6
.word 0xaa1603e0
.word 0x6b18001f
.word 0x54fffd8b
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
bl _p_79
bl _p_80
.word 0xaa0003f7
.word 0xb5ffff20
.word 0x17ffffc7
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_129:
.text
	.align 4
	.no_dead_strip wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult
wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult:
.word 0xa9bb7bfd
.word 0x910003fd
.word 0xa9015fb6
.word 0xa90267b8
.word 0xf9001bba
.word 0xaa0003f9
.word 0xaa0103fa

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #48]
.word 0xb9400000
.word 0x350006e0
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
.word 0x1400001f
.word 0xf9401f20
.word 0xf9400b21
.word 0xaa1a03e0
.word 0xd63f0020
.word 0x1400001a
.word 0xb9801b00
.word 0xaa0003f9
.word 0xd2800017
.word 0x93407ee0
.word 0xb9801b01
.word 0xeb00003f
.word 0x10000011
.word 0x54000429
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
.word 0xaa0003f6
.word 0x110006f7
.word 0xaa1703e0
.word 0x6b19001f
.word 0x54fffd8b
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
bl _p_79
bl _p_80
.word 0xaa0003f8
.word 0xb5ffff20
.word 0x17ffffc8
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_12a:
.text
ut_299:
add x0, x0, 16
b wrapper_other_Xamarin_Forms_Maps_Distance_StructureToPtr_object_intptr_bool
.text
	.align 4
	.no_dead_strip wrapper_other_Xamarin_Forms_Maps_Distance_StructureToPtr_object_intptr_bool
wrapper_other_Xamarin_Forms_Maps_Distance_StructureToPtr_object_intptr_bool:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf9400ba0
.word 0xf9400801
.word 0xf9400fa0
.word 0xf9000001
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_12b:
.text
ut_300:
add x0, x0, 16
b wrapper_other_Xamarin_Forms_Maps_Distance_PtrToStructure_intptr_object
.text
	.align 4
	.no_dead_strip wrapper_other_Xamarin_Forms_Maps_Distance_PtrToStructure_intptr_object
wrapper_other_Xamarin_Forms_Maps_Distance_PtrToStructure_intptr_object:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400fa0
.word 0x91004000
.word 0xf9400ba1
.word 0xf9400021
.word 0xf9000001
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_12c:
.text
ut_301:
add x0, x0, 16
b wrapper_other_Xamarin_Forms_Maps_Position_StructureToPtr_object_intptr_bool
.text
	.align 4
	.no_dead_strip wrapper_other_Xamarin_Forms_Maps_Position_StructureToPtr_object_intptr_bool
wrapper_other_Xamarin_Forms_Maps_Position_StructureToPtr_object_intptr_bool:
.loc 1 1 0
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf90013a2
.word 0xf9400ba0
.word 0x91004001
.word 0xf9400802
.word 0xf9400fa0
.word 0xf9000002
.word 0xf9400421
.word 0xf9000401
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_12d:
.text
ut_302:
add x0, x0, 16
b wrapper_other_Xamarin_Forms_Maps_Position_PtrToStructure_intptr_object
.text
	.align 4
	.no_dead_strip wrapper_other_Xamarin_Forms_Maps_Position_PtrToStructure_intptr_object
wrapper_other_Xamarin_Forms_Maps_Position_PtrToStructure_intptr_object:
.loc 1 1 0
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xf9400fa0
.word 0x91004000
.word 0xf9400ba1
.word 0xf9400022
.word 0xf9000002
.word 0xf9400421
.word 0xf9000401
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_12e:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position:
.file 5 "/Library/Frameworks/Xamarin.iOS.framework/Versions/Current/src/Xamarin.iOS/external/corefx/src/Common/src/CoreLib/System/Collections/Generic/List.cs"
.loc 5 230 0 prologue_end
.word 0xa9b97bfd
.word 0x910003fd
.word 0xf9000bba
.word 0xaa0003fa
.word 0xfd000fa0
.word 0xfd0013a1
.word 0xb9802340
.loc 5 231 0
.word 0xf90033a0
.word 0x11000401
.word 0xaa1a03e0
bl _p_127
.word 0xf94033a1
.loc 5 232 0
.word 0x11000420
.word 0xb9002340
.loc 5 233 0
.word 0xf9400b40
.word 0x93407c21
.word 0xb9801802
.word 0xeb01005f
.word 0x10000011
.word 0x54000189
.word 0xd37cec21
.word 0x8b010000
.word 0x91008000
.word 0xf9400fa1
.word 0xf9000001
.word 0xf94013a1
.word 0xf9000401
.loc 5 234 0
.word 0xf9400bba
.word 0x910003bf
.word 0xa8c77bfd
.word 0xd65f03c0
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_12f:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor:
.loc 5 34 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1632]
.word 0xd2800001
bl _p_42
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xf9000ba0
.word 0xd5033bbf
.word 0xf9400ba0
.word 0xf9000001
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_130:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor:
.loc 2 311 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1640]
.word 0xd2800201
bl _p_3
.word 0xaa0003e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1392]
.word 0xf9000ba0
.word 0xd5033bbf
.word 0xf9400ba0
.word 0xf9000001
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_131:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position:
.loc 5 66 0 prologue_end
.word 0xa9bc7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xa9026bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xb40010fa
.loc 5 69 0
.word 0xaa1a03f8
.word 0xeb1f035f
.word 0x54000480
.word 0xf9400357
.word 0xb9402ae0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1648]
.word 0xeb01001f
.word 0x540001c3
.word 0xf94012e0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1648]
.word 0x9343fc22
.word 0x8b020000
.word 0x39400000
.word 0xd28000fe
.word 0xa1e0022
.word 0xd2800021
.word 0x1ac22021
.word 0xa010000
.word 0xb5000200
.word 0x3940b2e0
.word 0xd280003e
.word 0xeb1e001f
.word 0x54000161

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #1656]

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #1664]
.word 0xaa1a03e0
bl _p_128
.word 0xaa0003f8
.word 0x14000002
.word 0xd2800018
.word 0xaa1803f7
.word 0xb4000878
.loc 5 71 0
.word 0xaa1703e0
.word 0xf94002e1

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1472]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x93407c00
.word 0xaa0003fa
.loc 5 72 0
.word 0xaa1a03e0
.word 0x350002a0
.loc 5 74 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xf9400000
.word 0xf9001ba0
.word 0x91004321
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 5 75 0
.word 0x14000039
.loc 5 78 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1632]
.word 0xaa1a03e1
bl _p_42
.word 0xf9001ba0
.word 0x91004321
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 5 79 0
.word 0xf9400b21
.word 0xaa1703e0
.word 0xd2800002
.word 0xf94002e3

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1496]
.word 0x928007f0
.word 0xf2bffff0
.word 0xf8706870
.word 0xd63f0200
.loc 5 80 0
.word 0xb900233a
.loc 5 82 0
.word 0x14000018
.loc 5 85 0
.word 0xb900233f
.loc 5 86 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xf9400000
.word 0xf9001ba0
.word 0x91004321
.word 0xd5033bbf
.word 0xf9401ba0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 5 87 0
.word 0xaa1903e0
.word 0xaa1a03e1
bl _p_129
.loc 5 89 0
.word 0xa94163b7
.word 0xa9426bb9
.word 0x910003bf
.word 0xa8c47bfd
.word 0xd65f03c0
.loc 5 67 0
.word 0xd28000c0
bl _p_110
.word 0x17ffff78

Lme_132:
.text
	.align 4
	.no_dead_strip System_ThrowHelper_IfNullAndNullsAreIllegalThenThrow_Xamarin_Forms_Maps_Position_object_System_ExceptionArgument
System_ThrowHelper_IfNullAndNullsAreIllegalThenThrow_Xamarin_Forms_Maps_Position_object_System_ExceptionArgument:
.file 6 "/Library/Frameworks/Xamarin.iOS.framework/Versions/Current/src/Xamarin.iOS/mcs/class/referencesource/mscorlib/system/throwhelper.cs"
.loc 6 242 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xf9000fa1
.word 0xd2800000
.word 0xf90013a0
.word 0xf90017a0
.word 0xf9400ba0
.word 0xb50000e0
.word 0xd2800000
.word 0xf90013a0
.word 0xf90017a0
.word 0x14000001
.loc 6 243 0
.word 0xb9801ba0
bl _p_110
.loc 6 244 0
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_133:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int:
.loc 5 415 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa90163b7
.word 0xf90013b9
.word 0xaa0003f9
.word 0xf90017a1
.word 0xf9400b21
.word 0xb9801820
.word 0xb9802ba1
.word 0x6b01001f
.word 0x540002ea
.loc 5 417 0
.word 0xf9400b21
.word 0xb9801820
.word 0x340000a0
.word 0xf9400b21
.word 0xb9801820
.word 0x531f7818
.word 0x14000002
.word 0xd2800098
.word 0xaa1803f7
.loc 5 421 0
.word 0xd29ffffe
.word 0xf2affdfe
.word 0x6b1e031f
.word 0x54000069
.word 0xd29ffff7
.word 0xf2affdf7
.loc 5 425 0
.word 0xb9802ba0
.word 0x6b0002ff
.word 0x5400004a
.word 0xb9802bb7
.loc 5 426 0
.word 0xaa1903e0
.word 0xaa1703e1
bl _p_130
.loc 5 428 0
.word 0xa94163b7
.word 0xf94013b9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_134:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose:
.loc 2 315 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_135:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext:
.loc 2 320 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xd2800000
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_136:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current:
.loc 2 325 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xf9002ba0
.word 0xd2935940
bl _p_82
.word 0xaa0003e1
.word 0xd2801980
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17
.word 0xfd400ba0
.word 0xfd400fa1
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0

Lme_137:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current:
.loc 2 331 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0xd2935940
bl _p_82
.word 0xaa0003e1
.word 0xd2801980
.word 0xf2a04000
bl _mono_create_corlib_exception_1
bl _p_17
.word 0xd2800000
.word 0xf9000fa0
.word 0xf90013a0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #216]
.word 0xd2800401
bl _p_3
.word 0x91004001
.word 0xf9400fa2
.word 0xf9000022
.word 0xf94013a2
.word 0xf9000422
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0

Lme_138:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset:
.loc 2 337 0 prologue_end
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_139:
.text
	.align 4
	.no_dead_strip System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor
System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor:
.word 0xa9be7bfd
.word 0x910003fd
.word 0xf9000ba0
.word 0x910003bf
.word 0xa8c27bfd
.word 0xd65f03c0

Lme_13a:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddEnumerable_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddEnumerable_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position:
.loc 5 1104 0 prologue_end
.word 0xa9ba7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xf9001bbf
.word 0xd2800000
.word 0xf90013a0
.word 0xf90017a0
.word 0xb9802720
.word 0x11000400
.word 0xb9002720
.loc 5 1105 0
.word 0xaa1a03e0
.word 0xf9400341

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1512]
.word 0x928012f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9001ba0
.word 0x1400002a
.loc 5 1112 0
.word 0xf9401ba1
.word 0x910083a0
.word 0xf9001fa0
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #1672]
.word 0x928005f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf9401fbe
.word 0xfd0003c0
.word 0xfd0007c1
.loc 5 1114 0
.word 0xb9802320
.word 0xf9400b22
.word 0xb9801841
.word 0x6b01001f
.word 0x540000a1
.loc 5 1116 0
.word 0xb9802320
.word 0x11000401
.word 0xaa1903e0
bl _p_127
.loc 5 1119 0
.word 0xf9400b20
.word 0xb980233a
.word 0xaa1a03e1
.word 0x11000421
.word 0xb9002321
.word 0x93407f41
.word 0xb9801802
.word 0xeb01005f
.word 0x10000011
.word 0x540005a9
.word 0xd37cec21
.word 0x8b010000
.word 0x91008000
.word 0xf94013a1
.word 0xf9000001
.word 0xf94017a1
.word 0xf9000401
.loc 5 1108 0
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #848]
.word 0x92800ef0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0x53001c00
.word 0x35fff980
.loc 5 1121 0
.word 0xf90023bf
.word 0x94000005
.word 0xf94023a0
.word 0xb4000040
bl _p_49
.word 0x14000010
.word 0xf90027be
.word 0xf9401ba0
.word 0xb4000160
.word 0xf9401ba1
.word 0xaa0103e0
.word 0xf9400021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x15, [x16, #864]
.word 0x928004f0
.word 0xf2bffff0
.word 0xf8706830
.word 0xd63f0200
.word 0xf94027be
.word 0xd61f03c0
.loc 5 1122 0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c67bfd
.word 0xd65f03c0
.word 0xd28018c0
.word 0xaa1103e1
bl _p_2

Lme_13b:
.text
	.align 4
	.no_dead_strip System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int
System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int:
.loc 5 103 0 prologue_end
.word 0xa9bd7bfd
.word 0x910003fd
.word 0xa9016bb9
.word 0xaa0003f9
.word 0xaa0103fa
.word 0xb9802320
.word 0x6b00035f
.word 0x540007ab
.loc 5 108 0
.word 0xf9400b21
.word 0xb9801820
.word 0x6b00035f
.word 0x540006a0
.loc 5 110 0
.word 0x6b1f035f
.word 0x5400040d
.loc 5 112 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #1632]
.word 0xaa1a03e1
bl _p_42
.word 0xaa0003fa
.loc 5 113 0
.word 0xb9802320
.word 0x6b1f001f
.word 0x540000ed
.loc 5 115 0
.word 0xf9400b20
.word 0xb9802324
.word 0xd2800001
.word 0xaa1a03e2
.word 0xd2800003
bl _p_85
.loc 5 117 0
.word 0x91004320
.word 0xf90013a0
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf900001a
.word 0xd349fc00
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0000

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x1, [x16, #16]
.word 0x8b010000
.word 0xd280003e
.word 0x3900001e
.loc 5 118 0
.word 0x14000014
.loc 5 121 0

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x0, [x16, #352]
.word 0xf9400000
.word 0xf90013a0
.word 0x91004321
.word 0xd5033bbf
.word 0xf94013a0
.word 0xf9000020
.word 0xd349fc21
.word 0xd29ffffe
.word 0xf2a00ffe
.word 0x8a1e0021

adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x2, [x16, #16]
.word 0x8b020021
.word 0xd280003e
.word 0x3900003e
.loc 5 124 0
.word 0xa9416bb9
.word 0x910003bf
.word 0xa8c37bfd
.word 0xd65f03c0
.loc 5 105 0
.word 0xd28001e0
.word 0xd28002a1
bl _p_131
.word 0x17ffffc1

Lme_13c:
.text
	.align 3
jit_code_end:

	.byte 0,0,0,0
.text
	.align 3
method_addresses:
	.no_dead_strip method_addresses
bl ThisAssembly__ctor
bl ThisAssembly_Git__ctor
bl ThisAssembly_Git_BaseVersion__ctor
bl ThisAssembly_Git_SemVer__ctor
bl Xamarin_Forms_Maps_Circle_get_Center
bl Xamarin_Forms_Maps_Circle_set_Center_Xamarin_Forms_Maps_Position
bl Xamarin_Forms_Maps_Circle_get_Radius
bl Xamarin_Forms_Maps_Circle_set_Radius_Xamarin_Forms_Maps_Distance
bl Xamarin_Forms_Maps_Circle_get_FillColor
bl Xamarin_Forms_Maps_Circle_set_FillColor_Xamarin_Forms_Color
bl Xamarin_Forms_Maps_Circle__ctor
bl Xamarin_Forms_Maps_Circle__cctor
bl Xamarin_Forms_Maps_Distance__ctor_double
bl Xamarin_Forms_Maps_Distance_get_Meters
bl Xamarin_Forms_Maps_Distance_get_Miles
bl Xamarin_Forms_Maps_Distance_get_Kilometers
bl Xamarin_Forms_Maps_Distance_FromMiles_double
bl Xamarin_Forms_Maps_Distance_FromMeters_double
bl Xamarin_Forms_Maps_Distance_FromKilometers_double
bl Xamarin_Forms_Maps_Distance_BetweenPositions_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl Xamarin_Forms_Maps_Distance_Equals_Xamarin_Forms_Maps_Distance
bl Xamarin_Forms_Maps_Distance_Equals_object
bl Xamarin_Forms_Maps_Distance_GetHashCode
bl Xamarin_Forms_Maps_Distance_op_Equality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance
bl Xamarin_Forms_Maps_Distance_op_Inequality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance
bl Xamarin_Forms_Maps_Geocoder_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position
bl Xamarin_Forms_Maps_Geocoder_GetPositionsForAddressAsync_string
bl Xamarin_Forms_Maps_Geocoder__ctor
bl Xamarin_Forms_Maps_GeographyUtils_ToRadians_double
bl Xamarin_Forms_Maps_GeographyUtils_ToDegrees_double
bl Xamarin_Forms_Maps_GeographyUtils_ToCircumferencePositions_Xamarin_Forms_Maps_Circle
bl Xamarin_Forms_Maps_Map__ctor_Xamarin_Forms_Maps_MapSpan
bl Xamarin_Forms_Maps_Map__ctor
bl Xamarin_Forms_Maps_Map_get_HasScrollEnabled
bl Xamarin_Forms_Maps_Map_set_HasScrollEnabled_bool
bl Xamarin_Forms_Maps_Map_get_HasZoomEnabled
bl Xamarin_Forms_Maps_Map_set_HasZoomEnabled_bool
bl Xamarin_Forms_Maps_Map_get_IsShowingUser
bl Xamarin_Forms_Maps_Map_set_IsShowingUser_bool
bl Xamarin_Forms_Maps_Map_get_MapType
bl Xamarin_Forms_Maps_Map_set_MapType_Xamarin_Forms_Maps_MapType
bl Xamarin_Forms_Maps_Map_get_Pins
bl Xamarin_Forms_Maps_Map_get_ItemsSource
bl Xamarin_Forms_Maps_Map_set_ItemsSource_System_Collections_IEnumerable
bl Xamarin_Forms_Maps_Map_get_ItemTemplate
bl Xamarin_Forms_Maps_Map_set_ItemTemplate_Xamarin_Forms_DataTemplate
bl Xamarin_Forms_Maps_Map_get_ItemTemplateSelector
bl Xamarin_Forms_Maps_Map_set_ItemTemplateSelector_Xamarin_Forms_DataTemplateSelector
bl Xamarin_Forms_Maps_Map_get_MoveToLastRegionOnLayoutChange
bl Xamarin_Forms_Maps_Map_set_MoveToLastRegionOnLayoutChange_bool
bl Xamarin_Forms_Maps_Map_get_MapElements
bl Xamarin_Forms_Maps_Map_add_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs
bl Xamarin_Forms_Maps_Map_remove_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs
bl Xamarin_Forms_Maps_Map_SendMapClicked_Xamarin_Forms_Maps_Position
bl Xamarin_Forms_Maps_Map_SetVisibleRegion_Xamarin_Forms_Maps_MapSpan
bl Xamarin_Forms_Maps_Map_get_VisibleRegion
bl Xamarin_Forms_Maps_Map_set_VisibleRegion_Xamarin_Forms_Maps_MapSpan
bl Xamarin_Forms_Maps_Map_get_LastMoveToRegion
bl Xamarin_Forms_Maps_Map_set_LastMoveToRegion_Xamarin_Forms_Maps_MapSpan
bl Xamarin_Forms_Maps_Map_System_Collections_IEnumerable_GetEnumerator
bl Xamarin_Forms_Maps_Map_GetEnumerator
bl Xamarin_Forms_Maps_Map_MoveToRegion_Xamarin_Forms_Maps_MapSpan
bl Xamarin_Forms_Maps_Map_PinsOnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
bl Xamarin_Forms_Maps_Map_OnItemsSourcePropertyChanged_System_Collections_IEnumerable_System_Collections_IEnumerable
bl Xamarin_Forms_Maps_Map_OnItemTemplatePropertyChanged_Xamarin_Forms_DataTemplate_Xamarin_Forms_DataTemplate
bl Xamarin_Forms_Maps_Map_OnItemTemplateSelectorPropertyChanged
bl Xamarin_Forms_Maps_Map_OnItemsSourceCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
bl Xamarin_Forms_Maps_Map_CreatePinItems
bl Xamarin_Forms_Maps_Map_CreatePin_object
bl Xamarin_Forms_Maps_Map_RemovePin_object
bl Xamarin_Forms_Maps_Map__cctor
bl Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_0_object_int_bool
bl Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_1_object_int
bl Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_2
bl Xamarin_Forms_Maps_Map__c__cctor
bl Xamarin_Forms_Maps_Map__c__ctor
bl Xamarin_Forms_Maps_Map__c__PinsOnCollectionChangedb__56_0_Xamarin_Forms_Maps_Pin
bl Xamarin_Forms_Maps_Map__c___cctorb__64_0_Xamarin_Forms_BindableObject_object_object
bl Xamarin_Forms_Maps_Map__c___cctorb__64_1_Xamarin_Forms_BindableObject_object_object
bl Xamarin_Forms_Maps_Map__c___cctorb__64_2_Xamarin_Forms_BindableObject_object_object
bl Xamarin_Forms_Maps_MapClickedEventArgs_get_Position
bl Xamarin_Forms_Maps_MapClickedEventArgs__ctor_Xamarin_Forms_Maps_Position
bl Xamarin_Forms_Maps_MapElement_get_StrokeColor
bl Xamarin_Forms_Maps_MapElement_set_StrokeColor_Xamarin_Forms_Color
bl Xamarin_Forms_Maps_MapElement_get_StrokeWidth
bl Xamarin_Forms_Maps_MapElement_set_StrokeWidth_single
bl Xamarin_Forms_Maps_MapElement_get_MapElementId
bl Xamarin_Forms_Maps_MapElement_set_MapElementId_object
bl Xamarin_Forms_Maps_MapElement__ctor
bl Xamarin_Forms_Maps_MapElement__cctor
bl Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double
bl Xamarin_Forms_Maps_MapSpan_get_Center
bl Xamarin_Forms_Maps_MapSpan_get_LatitudeDegrees
bl Xamarin_Forms_Maps_MapSpan_get_LongitudeDegrees
bl Xamarin_Forms_Maps_MapSpan_get_Radius
bl Xamarin_Forms_Maps_MapSpan_ClampLatitude_double_double
bl Xamarin_Forms_Maps_MapSpan_Equals_object
bl Xamarin_Forms_Maps_MapSpan_FromCenterAndRadius_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance
bl Xamarin_Forms_Maps_MapSpan_GetHashCode
bl Xamarin_Forms_Maps_MapSpan_op_Equality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan
bl Xamarin_Forms_Maps_MapSpan_op_Inequality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan
bl Xamarin_Forms_Maps_MapSpan_WithZoom_double
bl Xamarin_Forms_Maps_MapSpan_DistanceToLatitudeDegrees_Xamarin_Forms_Maps_Distance
bl Xamarin_Forms_Maps_MapSpan_DistanceToLongitudeDegrees_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance
bl Xamarin_Forms_Maps_MapSpan_Equals_Xamarin_Forms_Maps_MapSpan
bl Xamarin_Forms_Maps_MapSpan_LatitudeCircumferenceKm_Xamarin_Forms_Maps_Position
bl Xamarin_Forms_Maps_MapSpan_LatitudeDegreesToKm_double
bl Xamarin_Forms_Maps_MapSpan_LongitudeDegreesToKm_Xamarin_Forms_Maps_Position_double
bl Xamarin_Forms_Maps_Pin_get_Address
bl Xamarin_Forms_Maps_Pin_set_Address_string
bl Xamarin_Forms_Maps_Pin_get_Label
bl Xamarin_Forms_Maps_Pin_set_Label_string
bl Xamarin_Forms_Maps_Pin_get_Position
bl Xamarin_Forms_Maps_Pin_set_Position_Xamarin_Forms_Maps_Position
bl Xamarin_Forms_Maps_Pin_get_Type
bl Xamarin_Forms_Maps_Pin_set_Type_Xamarin_Forms_Maps_PinType
bl Xamarin_Forms_Maps_Pin_get_Id
bl Xamarin_Forms_Maps_Pin_set_Id_object
bl Xamarin_Forms_Maps_Pin_get_MarkerId
bl Xamarin_Forms_Maps_Pin_set_MarkerId_object
bl Xamarin_Forms_Maps_Pin_add_Clicked_System_EventHandler
bl Xamarin_Forms_Maps_Pin_remove_Clicked_System_EventHandler
bl Xamarin_Forms_Maps_Pin_add_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
bl Xamarin_Forms_Maps_Pin_remove_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
bl Xamarin_Forms_Maps_Pin_add_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
bl Xamarin_Forms_Maps_Pin_remove_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
bl Xamarin_Forms_Maps_Pin_Equals_object
bl Xamarin_Forms_Maps_Pin_GetHashCode
bl Xamarin_Forms_Maps_Pin_op_Equality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin
bl Xamarin_Forms_Maps_Pin_op_Inequality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin
bl Xamarin_Forms_Maps_Pin_SendTap
bl Xamarin_Forms_Maps_Pin_SendMarkerClick
bl Xamarin_Forms_Maps_Pin_SendInfoWindowClick
bl Xamarin_Forms_Maps_Pin_Equals_Xamarin_Forms_Maps_Pin
bl Xamarin_Forms_Maps_Pin__ctor
bl Xamarin_Forms_Maps_Pin__cctor
bl Xamarin_Forms_Maps_PinClickedEventArgs_get_HideInfoWindow
bl Xamarin_Forms_Maps_PinClickedEventArgs_set_HideInfoWindow_bool
bl Xamarin_Forms_Maps_PinClickedEventArgs__ctor
bl Xamarin_Forms_Maps_Polygon_get_FillColor
bl Xamarin_Forms_Maps_Polygon_set_FillColor_Xamarin_Forms_Color
bl Xamarin_Forms_Maps_Polygon_get_Geopath
bl Xamarin_Forms_Maps_Polygon__ctor
bl Xamarin_Forms_Maps_Polygon__cctor
bl Xamarin_Forms_Maps_Polygon___ctorb__7_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
bl Xamarin_Forms_Maps_Polyline_get_Geopath
bl Xamarin_Forms_Maps_Polyline__ctor
bl Xamarin_Forms_Maps_Polyline___ctorb__3_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
bl Xamarin_Forms_Maps_Position__ctor_double_double
bl Xamarin_Forms_Maps_Position_get_Latitude
bl Xamarin_Forms_Maps_Position_get_Longitude
bl Xamarin_Forms_Maps_Position_Equals_object
bl Xamarin_Forms_Maps_Position_GetHashCode
bl Xamarin_Forms_Maps_Position_op_Equality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl Xamarin_Forms_Maps_Position_op_Inequality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position
bl wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string
bl method_addresses
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
bl System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
bl System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_MapClickedEventArgs
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Pin_bool_invoke_TResult_T_Xamarin_Forms_Maps_Pin
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Action_3_object_int_bool_invoke_void_T1_T2_T3_object_int_bool
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl wrapper_delegate_invoke_System_Action_2_object_int_invoke_void_T1_T2_object_int
bl wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_PinClickedEventArgs
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CreateCopy_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_string
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_Move_int_int
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_ClearItems
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_RemoveItem_int
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_MoveItem_int_int
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnPropertyChanged_System_ComponentModel_PropertyChangedEventArgs
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventArgs
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CheckReentrancy
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCountPropertyChanged
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnIndexerPropertyChanged
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionReset
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_EnsureMonitorInitialized
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnSerializing_System_Runtime_Serialization_StreamingContext
bl System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnDeserialized_System_Runtime_Serialization_StreamingContext
bl System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position__ctor_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position_Dispose
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Count
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Items
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Item_int
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_set_Item_int_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Clear
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Contains_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_GetEnumerator
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IndexOf_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Insert_int_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Remove_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveAt_int
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_ClearItems
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveItem_int
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_Generic_ICollection_T_get_IsReadOnly
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_IsSynchronized
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_SyncRoot
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_CopyTo_System_Array_int
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_Item_int
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_set_Item_int_object
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsReadOnly
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsFixedSize
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Add_object
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Contains_object
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_IndexOf_object
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Insert_int_object
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Remove_object
bl System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IsCompatibleObject_object
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl method_addresses
bl System_Array_InternalArray__Insert_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position
bl System_Array_InternalArray__IndexOf_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
bl System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int
bl System_Array_InternalArray__set_Item_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position
bl wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult
bl wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object
bl wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string
bl wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object
bl wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult
bl wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
bl wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
bl wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult
bl wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object
bl wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
bl wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object
bl wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult
bl wrapper_other_Xamarin_Forms_Maps_Distance_StructureToPtr_object_intptr_bool
bl wrapper_other_Xamarin_Forms_Maps_Distance_PtrToStructure_intptr_object
bl wrapper_other_Xamarin_Forms_Maps_Position_StructureToPtr_object_intptr_bool
bl wrapper_other_Xamarin_Forms_Maps_Position_PtrToStructure_intptr_object
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
bl System_ThrowHelper_IfNullAndNullsAreIllegalThenThrow_Xamarin_Forms_Maps_Position_object_System_ExceptionArgument
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
bl System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddEnumerable_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
bl System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int
method_addresses_end:

.section __TEXT, __const
	.align 3
unbox_trampolines:

	.long 12,13,14,15,16,17,18,19
	.long 20,21,22,23,24,148,149,150
	.long 151,152,153,154,163,164,165,166
	.long 167,168,299,300,301,302
unbox_trampolines_end:

	.long 0
.text
	.align 3
unbox_trampoline_addresses:
bl ut_12
bl ut_13
bl ut_14
bl ut_15
bl ut_16
bl ut_17
bl ut_18
bl ut_19
bl ut_20
bl ut_21
bl ut_22
bl ut_23
bl ut_24
bl ut_148
bl ut_149
bl ut_150
bl ut_151
bl ut_152
bl ut_153
bl ut_154
bl ut_163
bl ut_164
bl ut_165
bl ut_166
bl ut_167
bl ut_168
bl ut_299
bl ut_300
bl ut_301
bl ut_302

	.long 0
.section __TEXT, __const
	.align 3
unwind_info:

	.byte 0,13,12,31,0,68,14,32,157,4,158,3,68,13,29,13,12,31,0,68,14,96,157,12,158,11,68,13,29,13,12,31
	.byte 0,68,14,112,157,14,158,13,68,13,29,13,12,31,0,68,14,64,157,8,158,7,68,13,29,13,12,31,0,68,14,48
	.byte 157,6,158,5,68,13,29,14,12,31,0,68,14,176,1,157,22,158,21,68,13,29,14,12,31,0,68,14,208,2,157,42
	.byte 158,41,68,13,29,19,12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,68,154,3,16,12,31,0,68,14,32
	.byte 157,4,158,3,68,13,29,68,154,2,14,12,31,0,68,14,144,1,157,18,158,17,68,13,29,27,12,31,0,68,14,144
	.byte 2,157,34,158,33,68,13,29,68,150,32,151,31,68,152,30,153,29,68,154,28,16,12,31,0,68,14,112,157,14,158,13
	.byte 68,13,29,68,153,12,13,12,31,0,68,14,80,157,10,158,9,68,13,29,28,12,31,0,68,14,64,157,8,158,7,68
	.byte 13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1,16,12,31,0,68,14,96,157,12,158,11,68,13,29,68
	.byte 153,10,18,12,31,0,68,14,48,157,6,158,5,68,13,29,68,153,4,154,3,16,12,31,0,68,14,48,157,6,158,5
	.byte 68,13,29,68,154,4,18,12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7,26,12,31,0,68,14,64
	.byte 157,8,158,7,68,13,29,68,150,6,151,5,68,152,4,153,3,68,154,2,16,12,31,0,68,14,112,157,14,158,13,68
	.byte 13,29,68,152,12,16,12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,18,12,31,0,68,14,96,157,12,158
	.byte 11,68,13,29,68,153,10,154,9,21,12,31,0,68,14,48,157,6,158,5,68,13,29,68,151,4,152,3,68,153,2,23
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,151,4,152,3,68,153,2,154,1,14,12,31,0,68,14,176,2,157
	.byte 38,158,37,68,13,29,18,12,31,0,68,14,64,157,8,158,7,68,13,29,68,151,6,152,5,14,12,31,0,68,14,128
	.byte 1,157,16,158,15,68,13,29,19,12,31,0,68,14,208,1,157,26,158,25,68,13,29,68,153,24,154,23,17,12,31,0
	.byte 68,14,160,1,157,20,158,19,68,13,29,68,154,18,17,12,31,0,68,14,192,2,157,40,158,39,68,13,29,68,154,38
	.byte 14,12,31,0,68,14,192,1,157,24,158,23,68,13,29,21,12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8
	.byte 153,7,68,154,6,17,12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,154,16,18,12,31,0,68,14,32,157,4
	.byte 158,3,68,13,29,68,153,2,154,1,16,12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2,18,12,31,0,68
	.byte 14,48,157,6,158,5,68,13,29,68,152,4,153,3,16,12,31,0,68,14,64,157,8,158,7,68,13,29,68,154,6,17
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,153,16,18,12,31,0,68,14,64,157,8,158,7,68,13,29,68
	.byte 153,6,154,5,14,12,31,0,68,14,160,1,157,20,158,19,68,13,29,24,12,31,0,68,14,128,1,157,16,158,15,68
	.byte 13,29,68,151,14,152,13,68,153,12,154,11,26,12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68
	.byte 152,6,153,5,68,154,4,16,12,31,0,68,14,96,157,12,158,11,68,13,29,68,154,10,22,12,31,0,68,14,144,1
	.byte 157,18,158,17,68,13,29,68,152,16,153,15,68,154,14,19,12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6
	.byte 68,152,5,24,12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,151,22,152,21,68,153,20,154,19,28,12,31,0
	.byte 68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3,31,12,31,0,68,14,96
	.byte 157,12,158,11,68,13,29,68,148,10,149,9,68,150,8,151,7,68,152,6,153,5,68,154,4,16,12,31,0,68,14,64
	.byte 157,8,158,7,68,13,29,68,153,6,16,12,31,0,68,14,64,157,8,158,7,68,13,29,68,152,6,16,12,31,0,68
	.byte 14,48,157,6,158,5,68,13,29,68,152,4,27,12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,150,16,151,15
	.byte 68,152,14,153,13,68,154,12,22,12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,152,14,153,13,68,154,12,24
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,150,18,151,17,68,152,16,153,15,23,12,31,0,68,14,64,157
	.byte 8,158,7,68,13,29,68,151,6,152,5,68,153,4,154,3,16,12,31,0,68,14,112,157,14,158,13,68,13,29,68,154
	.byte 12

.text
	.align 4
plt:
mono_aot_Xamarin_Forms_Maps_plt:
	.no_dead_strip plt_Xamarin_Forms_BindableObject_GetValue_Xamarin_Forms_BindableProperty
plt_Xamarin_Forms_BindableObject_GetValue_Xamarin_Forms_BindableProperty:
_p_1:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1688]
br x16
.word 4231
	.no_dead_strip plt__jit_icall_mono_arch_throw_corlib_exception
plt__jit_icall_mono_arch_throw_corlib_exception:
_p_2:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1696]
br x16
.word 4236
	.no_dead_strip plt_wrapper_alloc_object_AllocSmall_intptr_intptr
plt_wrapper_alloc_object_AllocSmall_intptr_intptr:
_p_3:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1704]
br x16
.word 4238
	.no_dead_strip plt_Xamarin_Forms_BindableObject_SetValue_Xamarin_Forms_BindableProperty_object
plt_Xamarin_Forms_BindableObject_SetValue_Xamarin_Forms_BindableProperty_object:
_p_4:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1712]
br x16
.word 4246
	.no_dead_strip plt_Xamarin_Forms_Maps_MapElement__ctor
plt_Xamarin_Forms_Maps_MapElement__ctor:
_p_5:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1720]
br x16
.word 4251
	.no_dead_strip plt_Xamarin_Forms_BindableProperty_Create_string_System_Type_System_Type_object_Xamarin_Forms_BindingMode_Xamarin_Forms_BindableProperty_ValidateValueDelegate_Xamarin_Forms_BindableProperty_BindingPropertyChangedDelegate_Xamarin_Forms_BindableProperty_BindingPropertyChangingDelegate_Xamarin_Forms_BindableProperty_CoerceValueDelegate_Xamarin_Forms_BindableProperty_CreateDefaultValueDelegate
plt_Xamarin_Forms_BindableProperty_Create_string_System_Type_System_Type_object_Xamarin_Forms_BindingMode_Xamarin_Forms_BindableProperty_ValidateValueDelegate_Xamarin_Forms_BindableProperty_BindingPropertyChangedDelegate_Xamarin_Forms_BindableProperty_BindingPropertyChangingDelegate_Xamarin_Forms_BindableProperty_CoerceValueDelegate_Xamarin_Forms_BindableProperty_CreateDefaultValueDelegate:
_p_6:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1728]
br x16
.word 4253
	.no_dead_strip plt_Xamarin_Forms_Color_get_Default
plt_Xamarin_Forms_Color_get_Default:
_p_7:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1736]
br x16
.word 4258
	.no_dead_strip plt_Xamarin_Forms_Maps_GeographyUtils_ToRadians_double
plt_Xamarin_Forms_Maps_GeographyUtils_ToRadians_double:
_p_8:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1744]
br x16
.word 4263
	.no_dead_strip plt_System_Math_Sin_double
plt_System_Math_Sin_double:
_p_9:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1752]
br x16
.word 4265
	.no_dead_strip plt_System_Math_Cos_double
plt_System_Math_Cos_double:
_p_10:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1760]
br x16
.word 4270
	.no_dead_strip plt_System_Math_Sqrt_double
plt_System_Math_Sqrt_double:
_p_11:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1768]
br x16
.word 4275
	.no_dead_strip plt_System_Math_Atan2_double_double
plt_System_Math_Atan2_double_double:
_p_12:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1776]
br x16
.word 4280
	.no_dead_strip plt_Xamarin_Forms_Maps_Distance_FromKilometers_double
plt_Xamarin_Forms_Maps_Distance_FromKilometers_double:
_p_13:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1784]
br x16
.word 4285
	.no_dead_strip plt_double_Equals_double
plt_double_Equals_double:
_p_14:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1792]
br x16
.word 4287
	.no_dead_strip plt_Xamarin_Forms_Maps_Distance_Equals_Xamarin_Forms_Maps_Distance
plt_Xamarin_Forms_Maps_Distance_Equals_Xamarin_Forms_Maps_Distance:
_p_15:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1800]
br x16
.word 4292
	.no_dead_strip plt__jit_icall_mono_helper_ldstr
plt__jit_icall_mono_helper_ldstr:
_p_16:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1808]
br x16
.word 4294
	.no_dead_strip plt__jit_icall_mono_arch_throw_exception
plt__jit_icall_mono_arch_throw_exception:
_p_17:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1816]
br x16
.word 4297
	.no_dead_strip plt_Xamarin_Forms_Maps_Circle_get_Center
plt_Xamarin_Forms_Maps_Circle_get_Center:
_p_18:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1824]
br x16
.word 4299
	.no_dead_strip plt_Xamarin_Forms_Maps_Circle_get_Radius
plt_Xamarin_Forms_Maps_Circle_get_Radius:
_p_19:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1832]
br x16
.word 4301
	.no_dead_strip plt_System_Math_Asin_double
plt_System_Math_Asin_double:
_p_20:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1840]
br x16
.word 4303
	.no_dead_strip plt_Xamarin_Forms_Maps_GeographyUtils_ToDegrees_double
plt_Xamarin_Forms_Maps_GeographyUtils_ToDegrees_double:
_p_21:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1848]
br x16
.word 4308
	.no_dead_strip plt_Xamarin_Forms_Maps_Position__ctor_double_double
plt_Xamarin_Forms_Maps_Position__ctor_double_double:
_p_22:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1856]
br x16
.word 4310
	.no_dead_strip plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position
plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position:
_p_23:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1864]
br x16
.word 4313
	.no_dead_strip plt__jit_icall_mono_generic_class_init
plt__jit_icall_mono_generic_class_init:
_p_24:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1872]
br x16
.word 4330
	.no_dead_strip plt_Xamarin_Forms_View__ctor
plt_Xamarin_Forms_View__ctor:
_p_25:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1880]
br x16
.word 4333
	.no_dead_strip plt_Xamarin_Forms_View_set_HorizontalOptions_Xamarin_Forms_LayoutOptions
plt_Xamarin_Forms_View_set_HorizontalOptions_Xamarin_Forms_LayoutOptions:
_p_26:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1888]
br x16
.word 4338
	.no_dead_strip plt_Xamarin_Forms_View_set_VerticalOptions_Xamarin_Forms_LayoutOptions
plt_Xamarin_Forms_View_set_VerticalOptions_Xamarin_Forms_LayoutOptions:
_p_27:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1896]
br x16
.word 4343
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Pin_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Pin_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler:
_p_28:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1904]
br x16
.word 4348
	.no_dead_strip plt_Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double
plt_Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double:
_p_29:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1912]
br x16
.word 4359
	.no_dead_strip plt_Xamarin_Forms_Maps_Map__ctor_Xamarin_Forms_Maps_MapSpan
plt_Xamarin_Forms_Maps_Map__ctor_Xamarin_Forms_Maps_MapSpan:
_p_30:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1920]
br x16
.word 4361
	.no_dead_strip plt_System_Delegate_Combine_System_Delegate_System_Delegate
plt_System_Delegate_Combine_System_Delegate_System_Delegate:
_p_31:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1928]
br x16
.word 4363
	.no_dead_strip plt_System_Delegate_Remove_System_Delegate_System_Delegate
plt_System_Delegate_Remove_System_Delegate_System_Delegate:
_p_32:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1936]
br x16
.word 4368
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_set_VisibleRegion_Xamarin_Forms_Maps_MapSpan
plt_Xamarin_Forms_Maps_Map_set_VisibleRegion_Xamarin_Forms_Maps_MapSpan:
_p_33:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1944]
br x16
.word 4373
	.no_dead_strip plt_Xamarin_Forms_Maps_MapSpan_op_Equality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan
plt_Xamarin_Forms_Maps_MapSpan_op_Equality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan:
_p_34:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1952]
br x16
.word 4375
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_GetEnumerator
plt_Xamarin_Forms_Maps_Map_GetEnumerator:
_p_35:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1960]
br x16
.word 4377
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_GetEnumerator
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_GetEnumerator:
_p_36:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1968]
br x16
.word 4379
	.no_dead_strip plt_Xamarin_Forms_MessagingCenter_Send_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_Map_string_Xamarin_Forms_Maps_MapSpan
plt_Xamarin_Forms_MessagingCenter_Send_Xamarin_Forms_Maps_Map_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_Map_string_Xamarin_Forms_Maps_MapSpan:
_p_37:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1976]
br x16
.word 4390
	.no_dead_strip plt_System_Linq_Enumerable_Cast_Xamarin_Forms_Maps_Pin_System_Collections_IEnumerable
plt_System_Linq_Enumerable_Cast_Xamarin_Forms_Maps_Pin_System_Collections_IEnumerable:
_p_38:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1984]
br x16
.word 4402
	.no_dead_strip plt_System_Linq_Enumerable_Any_Xamarin_Forms_Maps_Pin_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Pin_System_Func_2_Xamarin_Forms_Maps_Pin_bool
plt_System_Linq_Enumerable_Any_Xamarin_Forms_Maps_Pin_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Pin_System_Func_2_Xamarin_Forms_Maps_Pin_bool:
_p_39:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #1992]
br x16
.word 4414
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_Clear
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_Clear:
_p_40:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2000]
br x16
.word 4426
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_CreatePinItems
plt_Xamarin_Forms_Maps_Map_CreatePinItems:
_p_41:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2008]
br x16
.word 4437
	.no_dead_strip plt_wrapper_alloc_object_AllocVector_intptr_intptr
plt_wrapper_alloc_object_AllocVector_intptr_intptr:
_p_42:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2016]
br x16
.word 4439
	.no_dead_strip plt_string_Concat_string__
plt_string_Concat_string__:
_p_43:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2024]
br x16
.word 4447
	.no_dead_strip plt_Xamarin_Forms_Internals_NotifyCollectionChangedEventArgsExtensions_Apply_System_Collections_Specialized_NotifyCollectionChangedEventArgs_System_Action_3_object_int_bool_System_Action_2_object_int_System_Action
plt_Xamarin_Forms_Internals_NotifyCollectionChangedEventArgsExtensions_Apply_System_Collections_Specialized_NotifyCollectionChangedEventArgs_System_Action_3_object_int_bool_System_Action_2_object_int_System_Action:
_p_44:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2032]
br x16
.word 4452
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_get_ItemsSource
plt_Xamarin_Forms_Maps_Map_get_ItemsSource:
_p_45:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2040]
br x16
.word 4457
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_get_ItemTemplate
plt_Xamarin_Forms_Maps_Map_get_ItemTemplate:
_p_46:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2048]
br x16
.word 4459
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_get_ItemTemplateSelector
plt_Xamarin_Forms_Maps_Map_get_ItemTemplateSelector:
_p_47:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2056]
br x16
.word 4461
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_CreatePin_object
plt_Xamarin_Forms_Maps_Map_CreatePin_object:
_p_48:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2064]
br x16
.word 4463
	.no_dead_strip plt__jit_icall_ves_icall_thread_finish_async_abort
plt__jit_icall_ves_icall_thread_finish_async_abort:
_p_49:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2072]
br x16
.word 4465
	.no_dead_strip plt_Xamarin_Forms_DataTemplateSelector_SelectTemplate_object_Xamarin_Forms_BindableObject
plt_Xamarin_Forms_DataTemplateSelector_SelectTemplate_object_Xamarin_Forms_BindableObject:
_p_50:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2080]
br x16
.word 4468
	.no_dead_strip plt_Xamarin_Forms_ElementTemplate_CreateContent
plt_Xamarin_Forms_ElementTemplate_CreateContent:
_p_51:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2088]
br x16
.word 4473
	.no_dead_strip plt_Xamarin_Forms_BindableObject_set_BindingContext_object
plt_Xamarin_Forms_BindableObject_set_BindingContext_object:
_p_52:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2096]
br x16
.word 4478
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_Add_Xamarin_Forms_Maps_Pin
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_Add_Xamarin_Forms_Maps_Pin:
_p_53:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2104]
br x16
.word 4483
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_get_Item_int
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_get_Item_int:
_p_54:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2112]
br x16
.word 4494
	.no_dead_strip plt_Xamarin_Forms_BindableObject_get_BindingContext
plt_Xamarin_Forms_BindableObject_get_BindingContext:
_p_55:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2120]
br x16
.word 4505
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_RemoveAt_int
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_RemoveAt_int:
_p_56:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2128]
br x16
.word 4510
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_get_Count
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Pin_get_Count:
_p_57:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2136]
br x16
.word 4521
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_RemovePin_object
plt_Xamarin_Forms_Maps_Map_RemovePin_object:
_p_58:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2144]
br x16
.word 4532
	.no_dead_strip plt_Xamarin_Forms_Maps_Pin_get_Label
plt_Xamarin_Forms_Maps_Pin_get_Label:
_p_59:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2152]
br x16
.word 4534
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_OnItemsSourcePropertyChanged_System_Collections_IEnumerable_System_Collections_IEnumerable
plt_Xamarin_Forms_Maps_Map_OnItemsSourcePropertyChanged_System_Collections_IEnumerable_System_Collections_IEnumerable:
_p_60:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2160]
br x16
.word 4536
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_OnItemTemplatePropertyChanged_Xamarin_Forms_DataTemplate_Xamarin_Forms_DataTemplate
plt_Xamarin_Forms_Maps_Map_OnItemTemplatePropertyChanged_Xamarin_Forms_DataTemplate_Xamarin_Forms_DataTemplate:
_p_61:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2168]
br x16
.word 4538
	.no_dead_strip plt_Xamarin_Forms_Maps_Map_OnItemTemplateSelectorPropertyChanged
plt_Xamarin_Forms_Maps_Map_OnItemTemplateSelectorPropertyChanged:
_p_62:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2176]
br x16
.word 4540
	.no_dead_strip plt_Xamarin_Forms_Element__ctor
plt_Xamarin_Forms_Element__ctor:
_p_63:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2184]
br x16
.word 4542
	.no_dead_strip plt_Xamarin_Forms_Maps_MapSpan_LatitudeDegreesToKm_double
plt_Xamarin_Forms_Maps_MapSpan_LatitudeDegreesToKm_double:
_p_64:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2192]
br x16
.word 4547
	.no_dead_strip plt_Xamarin_Forms_Maps_MapSpan_LongitudeDegreesToKm_Xamarin_Forms_Maps_Position_double
plt_Xamarin_Forms_Maps_MapSpan_LongitudeDegreesToKm_Xamarin_Forms_Maps_Position_double:
_p_65:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2200]
br x16
.word 4549
	.no_dead_strip plt_Xamarin_Forms_Maps_MapSpan_Equals_Xamarin_Forms_Maps_MapSpan
plt_Xamarin_Forms_Maps_MapSpan_Equals_Xamarin_Forms_Maps_MapSpan:
_p_66:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2208]
br x16
.word 4551
	.no_dead_strip plt_Xamarin_Forms_Maps_MapSpan_DistanceToLatitudeDegrees_Xamarin_Forms_Maps_Distance
plt_Xamarin_Forms_Maps_MapSpan_DistanceToLatitudeDegrees_Xamarin_Forms_Maps_Distance:
_p_67:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2216]
br x16
.word 4553
	.no_dead_strip plt_Xamarin_Forms_Maps_MapSpan_DistanceToLongitudeDegrees_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance
plt_Xamarin_Forms_Maps_MapSpan_DistanceToLongitudeDegrees_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance:
_p_68:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2224]
br x16
.word 4555
	.no_dead_strip plt_Xamarin_Forms_Maps_Position_GetHashCode
plt_Xamarin_Forms_Maps_Position_GetHashCode:
_p_69:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2232]
br x16
.word 4557
	.no_dead_strip plt_object_Equals_object_object
plt_object_Equals_object_object:
_p_70:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2240]
br x16
.word 4560
	.no_dead_strip plt_Xamarin_Forms_Maps_MapSpan_LatitudeCircumferenceKm_Xamarin_Forms_Maps_Position
plt_Xamarin_Forms_Maps_MapSpan_LatitudeCircumferenceKm_Xamarin_Forms_Maps_Position:
_p_71:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2248]
br x16
.word 4565
	.no_dead_strip plt_Xamarin_Forms_Maps_Position_Equals_object
plt_Xamarin_Forms_Maps_Position_Equals_object:
_p_72:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2256]
br x16
.word 4567
	.no_dead_strip plt_Xamarin_Forms_Maps_Pin_Equals_Xamarin_Forms_Maps_Pin
plt_Xamarin_Forms_Maps_Pin_Equals_Xamarin_Forms_Maps_Pin:
_p_73:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2264]
br x16
.word 4570
	.no_dead_strip plt_Xamarin_Forms_Maps_Pin_get_Position
plt_Xamarin_Forms_Maps_Pin_get_Position:
_p_74:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2272]
br x16
.word 4573
	.no_dead_strip plt_Xamarin_Forms_Maps_Pin_get_Type
plt_Xamarin_Forms_Maps_Pin_get_Type:
_p_75:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2280]
br x16
.word 4575
	.no_dead_strip plt_Xamarin_Forms_Maps_Pin_get_Address
plt_Xamarin_Forms_Maps_Pin_get_Address:
_p_76:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2288]
br x16
.word 4577
	.no_dead_strip plt_string_Equals_string_string
plt_string_Equals_string_string:
_p_77:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2296]
br x16
.word 4579
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler:
_p_78:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2304]
br x16
.word 4584
	.no_dead_strip plt__jit_icall_mono_arch_rethrow_exception
plt__jit_icall_mono_arch_rethrow_exception:
_p_79:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2312]
br x16
.word 4595
	.no_dead_strip plt__jit_icall_mono_thread_interruption_checkpoint
plt__jit_icall_mono_thread_interruption_checkpoint:
_p_80:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2320]
br x16
.word 4597
	.no_dead_strip plt_System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int
plt_System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int:
_p_81:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2328]
br x16
.word 4600
	.no_dead_strip plt__jit_icall_mono_helper_ldstr_mscorlib
plt__jit_icall_mono_helper_ldstr_mscorlib:
_p_82:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2336]
br x16
.word 4616
	.no_dead_strip plt_System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
plt_System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current:
_p_83:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2344]
br x16
.word 4619
	.no_dead_strip plt_System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
plt_System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array:
_p_84:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2352]
br x16
.word 4634
	.no_dead_strip plt_System_Array_Copy_System_Array_int_System_Array_int_int
plt_System_Array_Copy_System_Array_int_System_Array_int_int:
_p_85:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2360]
br x16
.word 4649
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CreateCopy_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_string
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CreateCopy_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_string:
_p_86:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2368]
br x16
.word 4654
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_Xamarin_Forms_Maps_Position
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_Xamarin_Forms_Maps_Position:
_p_87:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2376]
br x16
.word 4671
	.no_dead_strip plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position:
_p_88:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2384]
br x16
.word 4686
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_MoveItem_int_int
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_MoveItem_int_int:
_p_89:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2392]
br x16
.word 4703
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler:
_p_90:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2400]
br x16
.word 4720
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler:
_p_91:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2408]
br x16
.word 4737
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CheckReentrancy
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CheckReentrancy:
_p_92:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2416]
br x16
.word 4754
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_ClearItems
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_ClearItems:
_p_93:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2424]
br x16
.word 4771
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCountPropertyChanged
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCountPropertyChanged:
_p_94:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2432]
br x16
.word 4786
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnIndexerPropertyChanged
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnIndexerPropertyChanged:
_p_95:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2440]
br x16
.word 4803
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionReset
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionReset:
_p_96:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2448]
br x16
.word 4820
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Item_int
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Item_int:
_p_97:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2456]
br x16
.word 4837
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveItem_int
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveItem_int:
_p_98:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2464]
br x16
.word 4852
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int:
_p_99:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2472]
br x16
.word 4867
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position:
_p_100:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2480]
br x16
.word 4884
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position:
_p_101:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2488]
br x16
.word 4899
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int:
_p_102:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2496]
br x16
.word 4914
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int:
_p_103:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2504]
br x16
.word 4931
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnPropertyChanged_System_ComponentModel_PropertyChangedEventArgs
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnPropertyChanged_System_ComponentModel_PropertyChangedEventArgs:
_p_104:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2512]
br x16
.word 4948
	.no_dead_strip plt_System_Collections_Specialized_NotifyCollectionChangedEventArgs__ctor_System_Collections_Specialized_NotifyCollectionChangedAction_object_int
plt_System_Collections_Specialized_NotifyCollectionChangedEventArgs__ctor_System_Collections_Specialized_NotifyCollectionChangedAction_object_int:
_p_105:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2520]
br x16
.word 4965
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventArgs
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventArgs:
_p_106:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2528]
br x16
.word 4970
	.no_dead_strip plt_System_Collections_Specialized_NotifyCollectionChangedEventArgs__ctor_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int
plt_System_Collections_Specialized_NotifyCollectionChangedEventArgs__ctor_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int:
_p_107:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2536]
br x16
.word 4987
	.no_dead_strip plt_System_Collections_Specialized_NotifyCollectionChangedEventArgs__ctor_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int
plt_System_Collections_Specialized_NotifyCollectionChangedEventArgs__ctor_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int:
_p_108:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2544]
br x16
.word 4992
	.no_dead_strip plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_EnsureMonitorInitialized
plt_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_EnsureMonitorInitialized:
_p_109:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2552]
br x16
.word 4997
	.no_dead_strip plt_System_ThrowHelper_ThrowArgumentNullException_System_ExceptionArgument
plt_System_ThrowHelper_ThrowArgumentNullException_System_ExceptionArgument:
_p_110:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2560]
br x16
.word 5014
	.no_dead_strip plt_System_ThrowHelper_ThrowNotSupportedException_System_ExceptionResource
plt_System_ThrowHelper_ThrowNotSupportedException_System_ExceptionResource:
_p_111:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2568]
br x16
.word 5019
	.no_dead_strip plt_System_ThrowHelper_ThrowArgumentOutOfRange_IndexException
plt_System_ThrowHelper_ThrowArgumentOutOfRange_IndexException:
_p_112:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2576]
br x16
.word 5024
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Count
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Count:
_p_113:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2584]
br x16
.word 5029
	.no_dead_strip plt_System_ThrowHelper_ThrowArgumentException_Argument_InvalidArrayType
plt_System_ThrowHelper_ThrowArgumentException_Argument_InvalidArrayType:
_p_114:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2592]
br x16
.word 5044
	.no_dead_strip plt__jit_icall_mono_thread_get_undeniable_exception
plt__jit_icall_mono_thread_get_undeniable_exception:
_p_115:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2600]
br x16
.word 5049
	.no_dead_strip plt_System_ThrowHelper_ThrowArgumentException_System_ExceptionResource
plt_System_ThrowHelper_ThrowArgumentException_System_ExceptionResource:
_p_116:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2608]
br x16
.word 5052
	.no_dead_strip plt_System_ThrowHelper_ThrowIndexArgumentOutOfRange_NeedNonNegNumException
plt_System_ThrowHelper_ThrowIndexArgumentOutOfRange_NeedNonNegNumException:
_p_117:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2616]
br x16
.word 5057
	.no_dead_strip plt_System_ThrowHelper_IfNullAndNullsAreIllegalThenThrow_Xamarin_Forms_Maps_Position_object_System_ExceptionArgument
plt_System_ThrowHelper_IfNullAndNullsAreIllegalThenThrow_Xamarin_Forms_Maps_Position_object_System_ExceptionArgument:
_p_118:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2624]
br x16
.word 5062
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_set_Item_int_Xamarin_Forms_Maps_Position
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_set_Item_int_Xamarin_Forms_Maps_Position:
_p_119:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2632]
br x16
.word 5078
	.no_dead_strip plt_System_ThrowHelper_ThrowWrongValueTypeArgumentException_object_System_Type
plt_System_ThrowHelper_ThrowWrongValueTypeArgumentException_object_System_Type:
_p_120:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2640]
br x16
.word 5093
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position:
_p_121:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2648]
br x16
.word 5098
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IsCompatibleObject_object
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IsCompatibleObject_object:
_p_122:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2656]
br x16
.word 5113
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Contains_Xamarin_Forms_Maps_Position
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Contains_Xamarin_Forms_Maps_Position:
_p_123:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2664]
br x16
.word 5128
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IndexOf_Xamarin_Forms_Maps_Position
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IndexOf_Xamarin_Forms_Maps_Position:
_p_124:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2672]
br x16
.word 5143
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Insert_int_Xamarin_Forms_Maps_Position
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Insert_int_Xamarin_Forms_Maps_Position:
_p_125:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2680]
br x16
.word 5158
	.no_dead_strip plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Remove_Xamarin_Forms_Maps_Position
plt_System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Remove_Xamarin_Forms_Maps_Position:
_p_126:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2688]
br x16
.word 5173
	.no_dead_strip plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int
plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int:
_p_127:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2696]
br x16
.word 5188
	.no_dead_strip plt_wrapper_castclass_object___isinst_with_cache_object_intptr_intptr
plt_wrapper_castclass_object___isinst_with_cache_object_intptr_intptr:
_p_128:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2704]
br x16
.word 5205
	.no_dead_strip plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddEnumerable_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddEnumerable_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position:
_p_129:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2712]
br x16
.word 5213
	.no_dead_strip plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int
plt_System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int:
_p_130:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2720]
br x16
.word 5230
	.no_dead_strip plt_System_ThrowHelper_ThrowArgumentOutOfRangeException_System_ExceptionArgument_System_ExceptionResource
plt_System_ThrowHelper_ThrowArgumentOutOfRangeException_System_ExceptionArgument_System_ExceptionResource:
_p_131:
adrp x16, mono_aot_Xamarin_Forms_Maps_got@PAGE+0
add x16, x16, mono_aot_Xamarin_Forms_Maps_got@PAGEOFF
ldr x16, [x16, #2728]
br x16
.word 5247
plt_end:
.section __DATA, __bss
	.align 3
.lcomm mono_aot_Xamarin_Forms_Maps_got, 2736
got_end:
.section __TEXT, __const
	.align 3
Lglobals_hash:

	.short 11, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 1, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0
.section __TEXT, __const
	.align 2
name_0:
	.asciz "_unbox_trampoline_p"
.data
	.align 3
globals:
	.align 3
	.quad Lglobals_hash
	.align 3
	.quad name_0
	.align 3
	.quad _unbox_trampoline_p

	.long 0,0
.section __TEXT, __const
	.align 2
runtime_version:
	.asciz ""
.section __TEXT, __const
	.align 2
assembly_guid:
	.asciz "49F30164-98BB-44B0-AAA7-82835EB754B2"
.section __TEXT, __const
	.align 2
assembly_name:
	.asciz "Xamarin.Forms.Maps"
.data
	.align 3
_mono_aot_file_info:

	.long 172,0
	.align 3
	.quad mono_aot_Xamarin_Forms_Maps_got
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

	.long 210,2736,132,317,26,98,387000831,0
	.long 8154,128,8,8,8,9,8388607,0
	.long 4,25,14728,0,0,6568,6128,5136
	.long 0,5600,6072,5304,0,3840,472,6560
	.long 0,0,0,0,0,0,0,0
	.long 0,0,0,0,0,0,0,0
	.long 0,0,0,0,0,0,0,0
	.byte 156,148,46,196,166,245,155,58,62,0,174,87,227,53,56,174
	.globl _mono_aot_module_Xamarin_Forms_Maps_info
	.align 3
_mono_aot_module_Xamarin_Forms_Maps_info:
	.align 3
	.quad _mono_aot_file_info
.section __DWARF, __debug_info,regular,debug
LTDIE_1:

	.byte 17
	.asciz "System_Object"

	.byte 16,7
	.asciz "System_Object"

LDIFF_SYM4=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM4
LTDIE_1_POINTER:

	.byte 13
LDIFF_SYM5=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM5
LTDIE_1_REFERENCE:

	.byte 14
LDIFF_SYM6=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM6
LTDIE_0:

	.byte 5
	.asciz "_ThisAssembly"

	.byte 16,16
LDIFF_SYM7=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM7
	.byte 2,35,0,0,7
	.asciz "_ThisAssembly"

LDIFF_SYM8=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM8
LTDIE_0_POINTER:

	.byte 13
LDIFF_SYM9=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM9
LTDIE_0_REFERENCE:

	.byte 14
LDIFF_SYM10=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM10
	.byte 2
	.asciz "ThisAssembly:.ctor"
	.asciz "ThisAssembly__ctor"

	.byte 0,0
	.quad ThisAssembly__ctor
	.quad Lme_0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM11=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM11
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM12=Lfde0_end - Lfde0_start
	.long LDIFF_SYM12
Lfde0_start:

	.long 0
	.align 3
	.quad ThisAssembly__ctor

LDIFF_SYM13=Lme_0 - ThisAssembly__ctor
	.long LDIFF_SYM13
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde0_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_2:

	.byte 5
	.asciz "_Git"

	.byte 16,16
LDIFF_SYM14=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM14
	.byte 2,35,0,0,7
	.asciz "_Git"

LDIFF_SYM15=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM15
LTDIE_2_POINTER:

	.byte 13
LDIFF_SYM16=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM16
LTDIE_2_REFERENCE:

	.byte 14
LDIFF_SYM17=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM17
	.byte 2
	.asciz "ThisAssembly/Git:.ctor"
	.asciz "ThisAssembly_Git__ctor"

	.byte 0,0
	.quad ThisAssembly_Git__ctor
	.quad Lme_1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM18=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM18
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM19=Lfde1_end - Lfde1_start
	.long LDIFF_SYM19
Lfde1_start:

	.long 0
	.align 3
	.quad ThisAssembly_Git__ctor

LDIFF_SYM20=Lme_1 - ThisAssembly_Git__ctor
	.long LDIFF_SYM20
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde1_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_3:

	.byte 5
	.asciz "_BaseVersion"

	.byte 16,16
LDIFF_SYM21=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM21
	.byte 2,35,0,0,7
	.asciz "_BaseVersion"

LDIFF_SYM22=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM22
LTDIE_3_POINTER:

	.byte 13
LDIFF_SYM23=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM23
LTDIE_3_REFERENCE:

	.byte 14
LDIFF_SYM24=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM24
	.byte 2
	.asciz "ThisAssembly/Git/BaseVersion:.ctor"
	.asciz "ThisAssembly_Git_BaseVersion__ctor"

	.byte 0,0
	.quad ThisAssembly_Git_BaseVersion__ctor
	.quad Lme_2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM25=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM25
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM26=Lfde2_end - Lfde2_start
	.long LDIFF_SYM26
Lfde2_start:

	.long 0
	.align 3
	.quad ThisAssembly_Git_BaseVersion__ctor

LDIFF_SYM27=Lme_2 - ThisAssembly_Git_BaseVersion__ctor
	.long LDIFF_SYM27
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde2_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_4:

	.byte 5
	.asciz "_SemVer"

	.byte 16,16
LDIFF_SYM28=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM28
	.byte 2,35,0,0,7
	.asciz "_SemVer"

LDIFF_SYM29=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM29
LTDIE_4_POINTER:

	.byte 13
LDIFF_SYM30=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM30
LTDIE_4_REFERENCE:

	.byte 14
LDIFF_SYM31=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM31
	.byte 2
	.asciz "ThisAssembly/Git/SemVer:.ctor"
	.asciz "ThisAssembly_Git_SemVer__ctor"

	.byte 0,0
	.quad ThisAssembly_Git_SemVer__ctor
	.quad Lme_3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM32=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM32
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM33=Lfde3_end - Lfde3_start
	.long LDIFF_SYM33
Lfde3_start:

	.long 0
	.align 3
	.quad ThisAssembly_Git_SemVer__ctor

LDIFF_SYM34=Lme_3 - ThisAssembly_Git_SemVer__ctor
	.long LDIFF_SYM34
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde3_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_9:

	.byte 17
	.asciz "Xamarin_Forms_IDispatcher"

	.byte 16,7
	.asciz "Xamarin_Forms_IDispatcher"

LDIFF_SYM35=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM35
LTDIE_9_POINTER:

	.byte 13
LDIFF_SYM36=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM36
LTDIE_9_REFERENCE:

	.byte 14
LDIFF_SYM37=LTDIE_9 - Ldebug_info_start
	.long LDIFF_SYM37
LTDIE_12:

	.byte 5
	.asciz "System_ValueType"

	.byte 16,16
LDIFF_SYM38=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM38
	.byte 2,35,0,0,7
	.asciz "System_ValueType"

LDIFF_SYM39=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM39
LTDIE_12_POINTER:

	.byte 13
LDIFF_SYM40=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM40
LTDIE_12_REFERENCE:

	.byte 14
LDIFF_SYM41=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM41
LTDIE_11:

	.byte 5
	.asciz "System_Int32"

	.byte 20,16
LDIFF_SYM42=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM42
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM43=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM43
	.byte 2,35,16,0,7
	.asciz "System_Int32"

LDIFF_SYM44=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM44
LTDIE_11_POINTER:

	.byte 13
LDIFF_SYM45=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM45
LTDIE_11_REFERENCE:

	.byte 14
LDIFF_SYM46=LTDIE_11 - Ldebug_info_start
	.long LDIFF_SYM46
LTDIE_13:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM47=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM47
LTDIE_13_POINTER:

	.byte 13
LDIFF_SYM48=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM48
LTDIE_13_REFERENCE:

	.byte 14
LDIFF_SYM49=LTDIE_13 - Ldebug_info_start
	.long LDIFF_SYM49
LTDIE_14:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM50=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM50
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM51=LTDIE_10_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM51
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM52=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM52
LTDIE_14_POINTER:

	.byte 13
LDIFF_SYM53=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM53
LTDIE_14_REFERENCE:

	.byte 14
LDIFF_SYM54=LTDIE_14 - Ldebug_info_start
	.long LDIFF_SYM54
LTDIE_15:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM55=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM55
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM56=LTDIE_10_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM56
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM57=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM57
LTDIE_15_POINTER:

	.byte 13
LDIFF_SYM58=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM58
LTDIE_15_REFERENCE:

	.byte 14
LDIFF_SYM59=LTDIE_15 - Ldebug_info_start
	.long LDIFF_SYM59
LTDIE_10:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM60=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM60
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM61=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM61
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM62=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM62
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM63=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM63
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM64=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM64
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM65=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM65
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM66=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM66
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM67=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM67
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM68=LTDIE_14_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM68
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM69=LTDIE_15_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM69
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM70=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM70
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM71=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM71
LTDIE_10_POINTER:

	.byte 13
LDIFF_SYM72=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM72
LTDIE_10_REFERENCE:

	.byte 14
LDIFF_SYM73=LTDIE_10 - Ldebug_info_start
	.long LDIFF_SYM73
LTDIE_16:

	.byte 5
	.asciz "System_Boolean"

	.byte 17,16
LDIFF_SYM74=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM74
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM75=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM75
	.byte 2,35,16,0,7
	.asciz "System_Boolean"

LDIFF_SYM76=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM76
LTDIE_16_POINTER:

	.byte 13
LDIFF_SYM77=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM77
LTDIE_16_REFERENCE:

	.byte 14
LDIFF_SYM78=LTDIE_16 - Ldebug_info_start
	.long LDIFF_SYM78
LTDIE_22:

	.byte 5
	.asciz "System_Reflection_MemberInfo"

	.byte 16,16
LDIFF_SYM79=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM79
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MemberInfo"

LDIFF_SYM80=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM80
LTDIE_22_POINTER:

	.byte 13
LDIFF_SYM81=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM81
LTDIE_22_REFERENCE:

	.byte 14
LDIFF_SYM82=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM82
LTDIE_21:

	.byte 5
	.asciz "System_Reflection_MethodBase"

	.byte 16,16
LDIFF_SYM83=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM83
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MethodBase"

LDIFF_SYM84=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM84
LTDIE_21_POINTER:

	.byte 13
LDIFF_SYM85=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM85
LTDIE_21_REFERENCE:

	.byte 14
LDIFF_SYM86=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM86
LTDIE_20:

	.byte 5
	.asciz "System_Reflection_MethodInfo"

	.byte 16,16
LDIFF_SYM87=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM87
	.byte 2,35,0,0,7
	.asciz "System_Reflection_MethodInfo"

LDIFF_SYM88=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM88
LTDIE_20_POINTER:

	.byte 13
LDIFF_SYM89=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM89
LTDIE_20_REFERENCE:

	.byte 14
LDIFF_SYM90=LTDIE_20 - Ldebug_info_start
	.long LDIFF_SYM90
LTDIE_24:

	.byte 5
	.asciz "System_Type"

	.byte 24,16
LDIFF_SYM91=LTDIE_22 - Ldebug_info_start
	.long LDIFF_SYM91
	.byte 2,35,0,6
	.asciz "_impl"

LDIFF_SYM92=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM92
	.byte 2,35,16,0,7
	.asciz "System_Type"

LDIFF_SYM93=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM93
LTDIE_24_POINTER:

	.byte 13
LDIFF_SYM94=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM94
LTDIE_24_REFERENCE:

	.byte 14
LDIFF_SYM95=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM95
LTDIE_23:

	.byte 5
	.asciz "System_DelegateData"

	.byte 40,16
LDIFF_SYM96=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM96
	.byte 2,35,0,6
	.asciz "target_type"

LDIFF_SYM97=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM97
	.byte 2,35,16,6
	.asciz "method_name"

LDIFF_SYM98=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM98
	.byte 2,35,24,6
	.asciz "curried_first_arg"

LDIFF_SYM99=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM99
	.byte 2,35,32,0,7
	.asciz "System_DelegateData"

LDIFF_SYM100=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM100
LTDIE_23_POINTER:

	.byte 13
LDIFF_SYM101=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM101
LTDIE_23_REFERENCE:

	.byte 14
LDIFF_SYM102=LTDIE_23 - Ldebug_info_start
	.long LDIFF_SYM102
LTDIE_19:

	.byte 5
	.asciz "System_Delegate"

	.byte 120,16
LDIFF_SYM103=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM103
	.byte 2,35,0,6
	.asciz "method_ptr"

LDIFF_SYM104=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM104
	.byte 2,35,16,6
	.asciz "invoke_impl"

LDIFF_SYM105=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM105
	.byte 2,35,24,6
	.asciz "m_target"

LDIFF_SYM106=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM106
	.byte 2,35,32,6
	.asciz "method"

LDIFF_SYM107=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM107
	.byte 2,35,40,6
	.asciz "delegate_trampoline"

LDIFF_SYM108=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM108
	.byte 2,35,48,6
	.asciz "extra_arg"

LDIFF_SYM109=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM109
	.byte 2,35,56,6
	.asciz "method_code"

LDIFF_SYM110=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM110
	.byte 2,35,64,6
	.asciz "interp_method"

LDIFF_SYM111=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM111
	.byte 2,35,72,6
	.asciz "interp_invoke_impl"

LDIFF_SYM112=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM112
	.byte 2,35,80,6
	.asciz "method_info"

LDIFF_SYM113=LTDIE_20_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM113
	.byte 2,35,88,6
	.asciz "original_method_info"

LDIFF_SYM114=LTDIE_20_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM114
	.byte 2,35,96,6
	.asciz "data"

LDIFF_SYM115=LTDIE_23_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM115
	.byte 2,35,104,6
	.asciz "method_is_virtual"

LDIFF_SYM116=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM116
	.byte 2,35,112,0,7
	.asciz "System_Delegate"

LDIFF_SYM117=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM117
LTDIE_19_POINTER:

	.byte 13
LDIFF_SYM118=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM118
LTDIE_19_REFERENCE:

	.byte 14
LDIFF_SYM119=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM119
LTDIE_18:

	.byte 5
	.asciz "System_MulticastDelegate"

	.byte 128,1,16
LDIFF_SYM120=LTDIE_19 - Ldebug_info_start
	.long LDIFF_SYM120
	.byte 2,35,0,6
	.asciz "delegates"

LDIFF_SYM121=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM121
	.byte 2,35,120,0,7
	.asciz "System_MulticastDelegate"

LDIFF_SYM122=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM122
LTDIE_18_POINTER:

	.byte 13
LDIFF_SYM123=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM123
LTDIE_18_REFERENCE:

	.byte 14
LDIFF_SYM124=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM124
LTDIE_17:

	.byte 5
	.asciz "System_ComponentModel_PropertyChangedEventHandler"

	.byte 128,1,16
LDIFF_SYM125=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM125
	.byte 2,35,0,0,7
	.asciz "System_ComponentModel_PropertyChangedEventHandler"

LDIFF_SYM126=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM126
LTDIE_17_POINTER:

	.byte 13
LDIFF_SYM127=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM127
LTDIE_17_REFERENCE:

	.byte 14
LDIFF_SYM128=LTDIE_17 - Ldebug_info_start
	.long LDIFF_SYM128
LTDIE_25:

	.byte 5
	.asciz "Xamarin_Forms_PropertyChangingEventHandler"

	.byte 128,1,16
LDIFF_SYM129=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM129
	.byte 2,35,0,0,7
	.asciz "Xamarin_Forms_PropertyChangingEventHandler"

LDIFF_SYM130=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM130
LTDIE_25_POINTER:

	.byte 13
LDIFF_SYM131=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM131
LTDIE_25_REFERENCE:

	.byte 14
LDIFF_SYM132=LTDIE_25 - Ldebug_info_start
	.long LDIFF_SYM132
LTDIE_26:

	.byte 5
	.asciz "System_EventHandler"

	.byte 128,1,16
LDIFF_SYM133=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM133
	.byte 2,35,0,0,7
	.asciz "System_EventHandler"

LDIFF_SYM134=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM134
LTDIE_26_POINTER:

	.byte 13
LDIFF_SYM135=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM135
LTDIE_26_REFERENCE:

	.byte 14
LDIFF_SYM136=LTDIE_26 - Ldebug_info_start
	.long LDIFF_SYM136
LTDIE_8:

	.byte 5
	.asciz "Xamarin_Forms_BindableObject"

	.byte 72,16
LDIFF_SYM137=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM137
	.byte 2,35,0,6
	.asciz "_dispatcher"

LDIFF_SYM138=LTDIE_9_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM138
	.byte 2,35,16,6
	.asciz "_properties"

LDIFF_SYM139=LTDIE_10_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM139
	.byte 2,35,24,6
	.asciz "_applying"

LDIFF_SYM140=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM140
	.byte 2,35,64,6
	.asciz "_inheritedContext"

LDIFF_SYM141=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM141
	.byte 2,35,32,6
	.asciz "PropertyChanged"

LDIFF_SYM142=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM142
	.byte 2,35,40,6
	.asciz "PropertyChanging"

LDIFF_SYM143=LTDIE_25_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM143
	.byte 2,35,48,6
	.asciz "BindingContextChanged"

LDIFF_SYM144=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM144
	.byte 2,35,56,0,7
	.asciz "Xamarin_Forms_BindableObject"

LDIFF_SYM145=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM145
LTDIE_8_POINTER:

	.byte 13
LDIFF_SYM146=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM146
LTDIE_8_REFERENCE:

	.byte 14
LDIFF_SYM147=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM147
LTDIE_27:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM148=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM148
LTDIE_27_POINTER:

	.byte 13
LDIFF_SYM149=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM149
LTDIE_27_REFERENCE:

	.byte 14
LDIFF_SYM150=LTDIE_27 - Ldebug_info_start
	.long LDIFF_SYM150
LTDIE_28:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM151=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM151
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM152=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM152
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM153=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM153
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM154=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM154
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM155=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM155
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM156=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM156
LTDIE_28_POINTER:

	.byte 13
LDIFF_SYM157=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM157
LTDIE_28_REFERENCE:

	.byte 14
LDIFF_SYM158=LTDIE_28 - Ldebug_info_start
	.long LDIFF_SYM158
LTDIE_30:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM159=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM159
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM160=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM160
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM161=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM161
LTDIE_30_POINTER:

	.byte 13
LDIFF_SYM162=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM162
LTDIE_30_REFERENCE:

	.byte 14
LDIFF_SYM163=LTDIE_30 - Ldebug_info_start
	.long LDIFF_SYM163
LTDIE_31:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM164=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM164
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM165=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM165
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM166=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM166
LTDIE_31_POINTER:

	.byte 13
LDIFF_SYM167=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM167
LTDIE_31_REFERENCE:

	.byte 14
LDIFF_SYM168=LTDIE_31 - Ldebug_info_start
	.long LDIFF_SYM168
LTDIE_29:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM169=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM169
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM170=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM170
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM171=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM171
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM172=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM172
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM173=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM173
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM174=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM174
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM175=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM175
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM176=LTDIE_13_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM176
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM177=LTDIE_30_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM177
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM178=LTDIE_31_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM178
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM179=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM179
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM180=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM180
LTDIE_29_POINTER:

	.byte 13
LDIFF_SYM181=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM181
LTDIE_29_REFERENCE:

	.byte 14
LDIFF_SYM182=LTDIE_29 - Ldebug_info_start
	.long LDIFF_SYM182
LTDIE_32:

	.byte 17
	.asciz "Xamarin_Forms_IEffectControlProvider"

	.byte 16,7
	.asciz "Xamarin_Forms_IEffectControlProvider"

LDIFF_SYM183=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM183
LTDIE_32_POINTER:

	.byte 13
LDIFF_SYM184=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM184
LTDIE_32_REFERENCE:

	.byte 14
LDIFF_SYM185=LTDIE_32 - Ldebug_info_start
	.long LDIFF_SYM185
LTDIE_36:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM186=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM186
LTDIE_36_POINTER:

	.byte 13
LDIFF_SYM187=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM187
LTDIE_36_REFERENCE:

	.byte 14
LDIFF_SYM188=LTDIE_36 - Ldebug_info_start
	.long LDIFF_SYM188
LTDIE_35:

	.byte 5
	.asciz "System_Collections_ObjectModel_Collection`1"

	.byte 24,16
LDIFF_SYM189=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM189
	.byte 2,35,0,6
	.asciz "items"

LDIFF_SYM190=LTDIE_36_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM190
	.byte 2,35,16,0,7
	.asciz "System_Collections_ObjectModel_Collection`1"

LDIFF_SYM191=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM191
LTDIE_35_POINTER:

	.byte 13
LDIFF_SYM192=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM192
LTDIE_35_REFERENCE:

	.byte 14
LDIFF_SYM193=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM193
LTDIE_37:

	.byte 5
	.asciz "_SimpleMonitor"

	.byte 32,16
LDIFF_SYM194=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM194
	.byte 2,35,0,6
	.asciz "_busyCount"

LDIFF_SYM195=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM195
	.byte 2,35,24,6
	.asciz "_collection"

LDIFF_SYM196=LTDIE_34_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM196
	.byte 2,35,16,0,7
	.asciz "_SimpleMonitor"

LDIFF_SYM197=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM197
LTDIE_37_POINTER:

	.byte 13
LDIFF_SYM198=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM198
LTDIE_37_REFERENCE:

	.byte 14
LDIFF_SYM199=LTDIE_37 - Ldebug_info_start
	.long LDIFF_SYM199
LTDIE_38:

	.byte 5
	.asciz "System_Collections_Specialized_NotifyCollectionChangedEventHandler"

	.byte 128,1,16
LDIFF_SYM200=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM200
	.byte 2,35,0,0,7
	.asciz "System_Collections_Specialized_NotifyCollectionChangedEventHandler"

LDIFF_SYM201=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM201
LTDIE_38_POINTER:

	.byte 13
LDIFF_SYM202=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM202
LTDIE_38_REFERENCE:

	.byte 14
LDIFF_SYM203=LTDIE_38 - Ldebug_info_start
	.long LDIFF_SYM203
LTDIE_34:

	.byte 5
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

	.byte 56,16
LDIFF_SYM204=LTDIE_35 - Ldebug_info_start
	.long LDIFF_SYM204
	.byte 2,35,0,6
	.asciz "_monitor"

LDIFF_SYM205=LTDIE_37_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM205
	.byte 2,35,24,6
	.asciz "_blockReentrancyCount"

LDIFF_SYM206=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM206
	.byte 2,35,48,6
	.asciz "CollectionChanged"

LDIFF_SYM207=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM207
	.byte 2,35,32,6
	.asciz "PropertyChanged"

LDIFF_SYM208=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM208
	.byte 2,35,40,0,7
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

LDIFF_SYM209=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM209
LTDIE_34_POINTER:

	.byte 13
LDIFF_SYM210=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM210
LTDIE_34_REFERENCE:

	.byte 14
LDIFF_SYM211=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM211
LTDIE_33:

	.byte 5
	.asciz "Xamarin_Forms_TrackableCollection`1"

	.byte 64,16
LDIFF_SYM212=LTDIE_34 - Ldebug_info_start
	.long LDIFF_SYM212
	.byte 2,35,0,6
	.asciz "Clearing"

LDIFF_SYM213=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM213
	.byte 2,35,56,0,7
	.asciz "Xamarin_Forms_TrackableCollection`1"

LDIFF_SYM214=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM214
LTDIE_33_POINTER:

	.byte 13
LDIFF_SYM215=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM215
LTDIE_33_REFERENCE:

	.byte 14
LDIFF_SYM216=LTDIE_33 - Ldebug_info_start
	.long LDIFF_SYM216
LTDIE_39:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 128,1,16
LDIFF_SYM217=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM217
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM218=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM218
LTDIE_39_POINTER:

	.byte 13
LDIFF_SYM219=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM219
LTDIE_39_REFERENCE:

	.byte 14
LDIFF_SYM220=LTDIE_39 - Ldebug_info_start
	.long LDIFF_SYM220
LTDIE_40:

	.byte 17
	.asciz "Xamarin_Forms_Internals_IPlatform"

	.byte 16,7
	.asciz "Xamarin_Forms_Internals_IPlatform"

LDIFF_SYM221=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM221
LTDIE_40_POINTER:

	.byte 13
LDIFF_SYM222=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM222
LTDIE_40_REFERENCE:

	.byte 14
LDIFF_SYM223=LTDIE_40 - Ldebug_info_start
	.long LDIFF_SYM223
LTDIE_7:

	.byte 5
	.asciz "Xamarin_Forms_Element"

	.byte 232,1,16
LDIFF_SYM224=LTDIE_8 - Ldebug_info_start
	.long LDIFF_SYM224
	.byte 2,35,0,6
	.asciz "_bindableResources"

LDIFF_SYM225=LTDIE_27_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM225
	.byte 2,35,72,6
	.asciz "_changeHandlers"

LDIFF_SYM226=LTDIE_28_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM226
	.byte 2,35,80,6
	.asciz "_dynamicResources"

LDIFF_SYM227=LTDIE_29_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM227
	.byte 2,35,88,6
	.asciz "_effectControlProvider"

LDIFF_SYM228=LTDIE_32_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM228
	.byte 2,35,96,6
	.asciz "_effects"

LDIFF_SYM229=LTDIE_33_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM229
	.byte 2,35,104,6
	.asciz "_id"

LDIFF_SYM230=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM230
	.byte 3,35,208,1,6
	.asciz "_parentOverride"

LDIFF_SYM231=LTDIE_7_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM231
	.byte 2,35,112,6
	.asciz "_styleId"

LDIFF_SYM232=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM232
	.byte 2,35,120,6
	.asciz "<Owned>k__BackingField"

LDIFF_SYM233=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM233
	.byte 3,35,228,1,6
	.asciz "<RealParent>k__BackingField"

LDIFF_SYM234=LTDIE_7_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM234
	.byte 3,35,128,1,6
	.asciz "<IsTemplateRoot>k__BackingField"

LDIFF_SYM235=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM235
	.byte 3,35,229,1,6
	.asciz "ChildAdded"

LDIFF_SYM236=LTDIE_39_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM236
	.byte 3,35,136,1,6
	.asciz "ChildRemoved"

LDIFF_SYM237=LTDIE_39_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM237
	.byte 3,35,144,1,6
	.asciz "DescendantAdded"

LDIFF_SYM238=LTDIE_39_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM238
	.byte 3,35,152,1,6
	.asciz "DescendantRemoved"

LDIFF_SYM239=LTDIE_39_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM239
	.byte 3,35,160,1,6
	.asciz "ParentSet"

LDIFF_SYM240=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM240
	.byte 3,35,168,1,6
	.asciz "_platform"

LDIFF_SYM241=LTDIE_40_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM241
	.byte 3,35,176,1,6
	.asciz "PlatformSet"

LDIFF_SYM242=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM242
	.byte 3,35,184,1,6
	.asciz "_cssFallbackTypeName"

LDIFF_SYM243=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM243
	.byte 3,35,192,1,6
	.asciz "_styleSelectableNameAndBaseNames"

LDIFF_SYM244=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM244
	.byte 3,35,200,1,0,7
	.asciz "Xamarin_Forms_Element"

LDIFF_SYM245=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM245
LTDIE_7_POINTER:

	.byte 13
LDIFF_SYM246=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM246
LTDIE_7_REFERENCE:

	.byte 14
LDIFF_SYM247=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM247
LTDIE_6:

	.byte 5
	.asciz "Xamarin_Forms_Maps_MapElement"

	.byte 240,1,16
LDIFF_SYM248=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM248
	.byte 2,35,0,6
	.asciz "<MapElementId>k__BackingField"

LDIFF_SYM249=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM249
	.byte 3,35,232,1,0,7
	.asciz "Xamarin_Forms_Maps_MapElement"

LDIFF_SYM250=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM250
LTDIE_6_POINTER:

	.byte 13
LDIFF_SYM251=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM251
LTDIE_6_REFERENCE:

	.byte 14
LDIFF_SYM252=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM252
LTDIE_5:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Circle"

	.byte 240,1,16
LDIFF_SYM253=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM253
	.byte 2,35,0,0,7
	.asciz "Xamarin_Forms_Maps_Circle"

LDIFF_SYM254=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM254
LTDIE_5_POINTER:

	.byte 13
LDIFF_SYM255=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM255
LTDIE_5_REFERENCE:

	.byte 14
LDIFF_SYM256=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM256
	.byte 2
	.asciz "Xamarin.Forms.Maps.Circle:get_Center"
	.asciz "Xamarin_Forms_Maps_Circle_get_Center"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Circle_get_Center
	.quad Lme_4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM257=LTDIE_5_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM257
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM258=Lfde4_end - Lfde4_start
	.long LDIFF_SYM258
Lfde4_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Circle_get_Center

LDIFF_SYM259=Lme_4 - Xamarin_Forms_Maps_Circle_get_Center
	.long LDIFF_SYM259
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde4_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Circle:set_Center"
	.asciz "Xamarin_Forms_Maps_Circle_set_Center_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Circle_set_Center_Xamarin_Forms_Maps_Position
	.quad Lme_5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM260=LTDIE_5_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM260
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM261=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM261
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM262=Lfde5_end - Lfde5_start
	.long LDIFF_SYM262
Lfde5_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Circle_set_Center_Xamarin_Forms_Maps_Position

LDIFF_SYM263=Lme_5 - Xamarin_Forms_Maps_Circle_set_Center_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM263
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde5_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Circle:get_Radius"
	.asciz "Xamarin_Forms_Maps_Circle_get_Radius"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Circle_get_Radius
	.quad Lme_6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM264=LTDIE_5_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM264
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM265=Lfde6_end - Lfde6_start
	.long LDIFF_SYM265
Lfde6_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Circle_get_Radius

LDIFF_SYM266=Lme_6 - Xamarin_Forms_Maps_Circle_get_Radius
	.long LDIFF_SYM266
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde6_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Circle:set_Radius"
	.asciz "Xamarin_Forms_Maps_Circle_set_Radius_Xamarin_Forms_Maps_Distance"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Circle_set_Radius_Xamarin_Forms_Maps_Distance
	.quad Lme_7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM267=LTDIE_5_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM267
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM268=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM268
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM269=Lfde7_end - Lfde7_start
	.long LDIFF_SYM269
Lfde7_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Circle_set_Radius_Xamarin_Forms_Maps_Distance

LDIFF_SYM270=Lme_7 - Xamarin_Forms_Maps_Circle_set_Radius_Xamarin_Forms_Maps_Distance
	.long LDIFF_SYM270
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde7_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Circle:get_FillColor"
	.asciz "Xamarin_Forms_Maps_Circle_get_FillColor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Circle_get_FillColor
	.quad Lme_8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM271=LTDIE_5_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM271
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM272=Lfde8_end - Lfde8_start
	.long LDIFF_SYM272
Lfde8_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Circle_get_FillColor

LDIFF_SYM273=Lme_8 - Xamarin_Forms_Maps_Circle_get_FillColor
	.long LDIFF_SYM273
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde8_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Circle:set_FillColor"
	.asciz "Xamarin_Forms_Maps_Circle_set_FillColor_Xamarin_Forms_Color"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Circle_set_FillColor_Xamarin_Forms_Color
	.quad Lme_9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM274=LTDIE_5_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM274
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM275=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM275
	.byte 1,80,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM276=Lfde9_end - Lfde9_start
	.long LDIFF_SYM276
Lfde9_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Circle_set_FillColor_Xamarin_Forms_Color

LDIFF_SYM277=Lme_9 - Xamarin_Forms_Maps_Circle_set_FillColor_Xamarin_Forms_Color
	.long LDIFF_SYM277
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde9_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Circle:.ctor"
	.asciz "Xamarin_Forms_Maps_Circle__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Circle__ctor
	.quad Lme_a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM278=LTDIE_5_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM278
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM279=Lfde10_end - Lfde10_start
	.long LDIFF_SYM279
Lfde10_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Circle__ctor

LDIFF_SYM280=Lme_a - Xamarin_Forms_Maps_Circle__ctor
	.long LDIFF_SYM280
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde10_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Circle:.cctor"
	.asciz "Xamarin_Forms_Maps_Circle__cctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Circle__cctor
	.quad Lme_b

	.byte 2,118,16,11
	.asciz "V_0"

LDIFF_SYM281=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM281
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM282=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM282
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM283=Lfde11_end - Lfde11_start
	.long LDIFF_SYM283
Lfde11_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Circle__cctor

LDIFF_SYM284=Lme_b - Xamarin_Forms_Maps_Circle__cctor
	.long LDIFF_SYM284
	.long 0
	.byte 12,31,0,68,14,176,1,157,22,158,21,68,13,29
	.align 3
Lfde11_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_42:

	.byte 5
	.asciz "System_Double"

	.byte 24,16
LDIFF_SYM285=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM285
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM286=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM286
	.byte 2,35,16,0,7
	.asciz "System_Double"

LDIFF_SYM287=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM287
LTDIE_42_POINTER:

	.byte 13
LDIFF_SYM288=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM288
LTDIE_42_REFERENCE:

	.byte 14
LDIFF_SYM289=LTDIE_42 - Ldebug_info_start
	.long LDIFF_SYM289
LTDIE_41:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Distance"

	.byte 24,16
LDIFF_SYM290=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM290
	.byte 2,35,0,6
	.asciz "<Meters>k__BackingField"

LDIFF_SYM291=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM291
	.byte 2,35,0,0,7
	.asciz "Xamarin_Forms_Maps_Distance"

LDIFF_SYM292=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM292
LTDIE_41_POINTER:

	.byte 13
LDIFF_SYM293=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM293
LTDIE_41_REFERENCE:

	.byte 14
LDIFF_SYM294=LTDIE_41 - Ldebug_info_start
	.long LDIFF_SYM294
	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:.ctor"
	.asciz "Xamarin_Forms_Maps_Distance__ctor_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance__ctor_double
	.quad Lme_c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM295=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM295
	.byte 2,141,16,3
	.asciz "meters"

LDIFF_SYM296=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM296
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM297=Lfde12_end - Lfde12_start
	.long LDIFF_SYM297
Lfde12_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance__ctor_double

LDIFF_SYM298=Lme_c - Xamarin_Forms_Maps_Distance__ctor_double
	.long LDIFF_SYM298
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde12_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:get_Meters"
	.asciz "Xamarin_Forms_Maps_Distance_get_Meters"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_get_Meters
	.quad Lme_d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM299=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM299
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM300=Lfde13_end - Lfde13_start
	.long LDIFF_SYM300
Lfde13_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_get_Meters

LDIFF_SYM301=Lme_d - Xamarin_Forms_Maps_Distance_get_Meters
	.long LDIFF_SYM301
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde13_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:get_Miles"
	.asciz "Xamarin_Forms_Maps_Distance_get_Miles"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_get_Miles
	.quad Lme_e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM302=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM302
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM303=Lfde14_end - Lfde14_start
	.long LDIFF_SYM303
Lfde14_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_get_Miles

LDIFF_SYM304=Lme_e - Xamarin_Forms_Maps_Distance_get_Miles
	.long LDIFF_SYM304
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde14_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:get_Kilometers"
	.asciz "Xamarin_Forms_Maps_Distance_get_Kilometers"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_get_Kilometers
	.quad Lme_f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM305=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM305
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM306=Lfde15_end - Lfde15_start
	.long LDIFF_SYM306
Lfde15_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_get_Kilometers

LDIFF_SYM307=Lme_f - Xamarin_Forms_Maps_Distance_get_Kilometers
	.long LDIFF_SYM307
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde15_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:FromMiles"
	.asciz "Xamarin_Forms_Maps_Distance_FromMiles_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_FromMiles_double
	.quad Lme_10

	.byte 2,118,16,3
	.asciz "miles"

LDIFF_SYM308=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM308
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM309=Lfde16_end - Lfde16_start
	.long LDIFF_SYM309
Lfde16_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_FromMiles_double

LDIFF_SYM310=Lme_10 - Xamarin_Forms_Maps_Distance_FromMiles_double
	.long LDIFF_SYM310
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde16_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:FromMeters"
	.asciz "Xamarin_Forms_Maps_Distance_FromMeters_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_FromMeters_double
	.quad Lme_11

	.byte 2,118,16,3
	.asciz "meters"

LDIFF_SYM311=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM311
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM312=Lfde17_end - Lfde17_start
	.long LDIFF_SYM312
Lfde17_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_FromMeters_double

LDIFF_SYM313=Lme_11 - Xamarin_Forms_Maps_Distance_FromMeters_double
	.long LDIFF_SYM313
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde17_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:FromKilometers"
	.asciz "Xamarin_Forms_Maps_Distance_FromKilometers_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_FromKilometers_double
	.quad Lme_12

	.byte 2,118,16,3
	.asciz "kilometers"

LDIFF_SYM314=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM314
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM315=Lfde18_end - Lfde18_start
	.long LDIFF_SYM315
Lfde18_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_FromKilometers_double

LDIFF_SYM316=Lme_12 - Xamarin_Forms_Maps_Distance_FromKilometers_double
	.long LDIFF_SYM316
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde18_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:BetweenPositions"
	.asciz "Xamarin_Forms_Maps_Distance_BetweenPositions_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_BetweenPositions_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_13

	.byte 2,118,16,3
	.asciz "position1"

LDIFF_SYM317=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM317
	.byte 3,141,208,0,3
	.asciz "position2"

LDIFF_SYM318=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM318
	.byte 3,141,144,1,11
	.asciz "V_0"

LDIFF_SYM319=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM319
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM320=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM320
	.byte 0,11
	.asciz "V_2"

LDIFF_SYM321=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM321
	.byte 0,11
	.asciz "V_3"

LDIFF_SYM322=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM322
	.byte 0,11
	.asciz "V_4"

LDIFF_SYM323=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM323
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM324=Lfde19_end - Lfde19_start
	.long LDIFF_SYM324
Lfde19_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_BetweenPositions_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM325=Lme_13 - Xamarin_Forms_Maps_Distance_BetweenPositions_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM325
	.long 0
	.byte 12,31,0,68,14,208,2,157,42,158,41,68,13,29
	.align 3
Lfde19_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:Equals"
	.asciz "Xamarin_Forms_Maps_Distance_Equals_Xamarin_Forms_Maps_Distance"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_Equals_Xamarin_Forms_Maps_Distance
	.quad Lme_14

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM326=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM326
	.byte 2,141,16,3
	.asciz "other"

LDIFF_SYM327=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM327
	.byte 2,141,24,11
	.asciz "V_0"

LDIFF_SYM328=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM328
	.byte 3,141,216,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM329=Lfde20_end - Lfde20_start
	.long LDIFF_SYM329
Lfde20_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_Equals_Xamarin_Forms_Maps_Distance

LDIFF_SYM330=Lme_14 - Xamarin_Forms_Maps_Distance_Equals_Xamarin_Forms_Maps_Distance
	.long LDIFF_SYM330
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde20_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:Equals"
	.asciz "Xamarin_Forms_Maps_Distance_Equals_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_Equals_object
	.quad Lme_15

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM331=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM331
	.byte 2,141,32,3
	.asciz "obj"

LDIFF_SYM332=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM332
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM333=Lfde21_end - Lfde21_start
	.long LDIFF_SYM333
Lfde21_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_Equals_object

LDIFF_SYM334=Lme_15 - Xamarin_Forms_Maps_Distance_Equals_object
	.long LDIFF_SYM334
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,68,154,3
	.align 3
Lfde21_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:GetHashCode"
	.asciz "Xamarin_Forms_Maps_Distance_GetHashCode"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_GetHashCode
	.quad Lme_16

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM335=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM335
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM336=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM336
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM337=Lfde22_end - Lfde22_start
	.long LDIFF_SYM337
Lfde22_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_GetHashCode

LDIFF_SYM338=Lme_16 - Xamarin_Forms_Maps_Distance_GetHashCode
	.long LDIFF_SYM338
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde22_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:op_Equality"
	.asciz "Xamarin_Forms_Maps_Distance_op_Equality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_op_Equality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance
	.quad Lme_17

	.byte 2,118,16,3
	.asciz "left"

LDIFF_SYM339=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM339
	.byte 2,141,16,3
	.asciz "right"

LDIFF_SYM340=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM340
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM341=Lfde23_end - Lfde23_start
	.long LDIFF_SYM341
Lfde23_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_op_Equality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance

LDIFF_SYM342=Lme_17 - Xamarin_Forms_Maps_Distance_op_Equality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance
	.long LDIFF_SYM342
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29
	.align 3
Lfde23_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Distance:op_Inequality"
	.asciz "Xamarin_Forms_Maps_Distance_op_Inequality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Distance_op_Inequality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance
	.quad Lme_18

	.byte 2,118,16,3
	.asciz "left"

LDIFF_SYM343=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM343
	.byte 2,141,16,3
	.asciz "right"

LDIFF_SYM344=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM344
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM345=Lfde24_end - Lfde24_start
	.long LDIFF_SYM345
Lfde24_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Distance_op_Inequality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance

LDIFF_SYM346=Lme_18 - Xamarin_Forms_Maps_Distance_op_Inequality_Xamarin_Forms_Maps_Distance_Xamarin_Forms_Maps_Distance
	.long LDIFF_SYM346
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29
	.align 3
Lfde24_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_43:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Geocoder"

	.byte 16,16
LDIFF_SYM347=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM347
	.byte 2,35,0,0,7
	.asciz "Xamarin_Forms_Maps_Geocoder"

LDIFF_SYM348=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM348
LTDIE_43_POINTER:

	.byte 13
LDIFF_SYM349=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM349
LTDIE_43_REFERENCE:

	.byte 14
LDIFF_SYM350=LTDIE_43 - Ldebug_info_start
	.long LDIFF_SYM350
	.byte 2
	.asciz "Xamarin.Forms.Maps.Geocoder:GetAddressesForPositionAsync"
	.asciz "Xamarin_Forms_Maps_Geocoder_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Geocoder_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position
	.quad Lme_19

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM351=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM351
	.byte 0,3
	.asciz "position"

LDIFF_SYM352=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM352
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM353=Lfde25_end - Lfde25_start
	.long LDIFF_SYM353
Lfde25_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Geocoder_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position

LDIFF_SYM354=Lme_19 - Xamarin_Forms_Maps_Geocoder_GetAddressesForPositionAsync_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM354
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde25_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Geocoder:GetPositionsForAddressAsync"
	.asciz "Xamarin_Forms_Maps_Geocoder_GetPositionsForAddressAsync_string"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Geocoder_GetPositionsForAddressAsync_string
	.quad Lme_1a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM355=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM355
	.byte 0,3
	.asciz "address"

LDIFF_SYM356=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM356
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM357=Lfde26_end - Lfde26_start
	.long LDIFF_SYM357
Lfde26_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Geocoder_GetPositionsForAddressAsync_string

LDIFF_SYM358=Lme_1a - Xamarin_Forms_Maps_Geocoder_GetPositionsForAddressAsync_string
	.long LDIFF_SYM358
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde26_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Geocoder:.ctor"
	.asciz "Xamarin_Forms_Maps_Geocoder__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Geocoder__ctor
	.quad Lme_1b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM359=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM359
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM360=Lfde27_end - Lfde27_start
	.long LDIFF_SYM360
Lfde27_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Geocoder__ctor

LDIFF_SYM361=Lme_1b - Xamarin_Forms_Maps_Geocoder__ctor
	.long LDIFF_SYM361
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde27_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.GeographyUtils:ToRadians"
	.asciz "Xamarin_Forms_Maps_GeographyUtils_ToRadians_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_GeographyUtils_ToRadians_double
	.quad Lme_1c

	.byte 2,118,16,3
	.asciz "degrees"

LDIFF_SYM362=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM362
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM363=Lfde28_end - Lfde28_start
	.long LDIFF_SYM363
Lfde28_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_GeographyUtils_ToRadians_double

LDIFF_SYM364=Lme_1c - Xamarin_Forms_Maps_GeographyUtils_ToRadians_double
	.long LDIFF_SYM364
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde28_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.GeographyUtils:ToDegrees"
	.asciz "Xamarin_Forms_Maps_GeographyUtils_ToDegrees_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_GeographyUtils_ToDegrees_double
	.quad Lme_1d

	.byte 2,118,16,3
	.asciz "radians"

LDIFF_SYM365=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM365
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM366=Lfde29_end - Lfde29_start
	.long LDIFF_SYM366
Lfde29_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_GeographyUtils_ToDegrees_double

LDIFF_SYM367=Lme_1d - Xamarin_Forms_Maps_GeographyUtils_ToDegrees_double
	.long LDIFF_SYM367
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde29_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_44:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM368=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM368
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM369=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM369
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM370=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM370
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM371=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM371
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM372=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM372
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM373=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM373
LTDIE_44_POINTER:

	.byte 13
LDIFF_SYM374=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM374
LTDIE_44_REFERENCE:

	.byte 14
LDIFF_SYM375=LTDIE_44 - Ldebug_info_start
	.long LDIFF_SYM375
	.byte 2
	.asciz "Xamarin.Forms.Maps.GeographyUtils:ToCircumferencePositions"
	.asciz "Xamarin_Forms_Maps_GeographyUtils_ToCircumferencePositions_Xamarin_Forms_Maps_Circle"

	.byte 0,0
	.quad Xamarin_Forms_Maps_GeographyUtils_ToCircumferencePositions_Xamarin_Forms_Maps_Circle
	.quad Lme_1e

	.byte 2,118,16,3
	.asciz "circle"

LDIFF_SYM376=LTDIE_5_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM376
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM377=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM377
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM378=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM378
	.byte 3,141,136,1,11
	.asciz "V_2"

LDIFF_SYM379=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM379
	.byte 3,141,144,1,11
	.asciz "V_3"

LDIFF_SYM380=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM380
	.byte 3,141,152,1,11
	.asciz "V_4"

LDIFF_SYM381=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM381
	.byte 3,141,240,0,11
	.asciz "V_5"

LDIFF_SYM382=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM382
	.byte 3,141,232,0,11
	.asciz "V_6"

LDIFF_SYM383=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM383
	.byte 1,106,11
	.asciz "V_7"

LDIFF_SYM384=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM384
	.byte 3,141,160,1,11
	.asciz "V_8"

LDIFF_SYM385=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM385
	.byte 3,141,168,1,11
	.asciz "V_9"

LDIFF_SYM386=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM386
	.byte 3,141,160,1,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM387=Lfde30_end - Lfde30_start
	.long LDIFF_SYM387
Lfde30_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_GeographyUtils_ToCircumferencePositions_Xamarin_Forms_Maps_Circle

LDIFF_SYM388=Lme_1e - Xamarin_Forms_Maps_GeographyUtils_ToCircumferencePositions_Xamarin_Forms_Maps_Circle
	.long LDIFF_SYM388
	.long 0
	.byte 12,31,0,68,14,144,2,157,34,158,33,68,13,29,68,150,32,151,31,68,152,30,153,29,68,154,28
	.align 3
Lfde30_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_50:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM389=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM389
LTDIE_50_POINTER:

	.byte 13
LDIFF_SYM390=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM390
LTDIE_50_REFERENCE:

	.byte 14
LDIFF_SYM391=LTDIE_50 - Ldebug_info_start
	.long LDIFF_SYM391
LTDIE_51:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM392=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM392
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM393=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM393
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM394=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM394
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM395=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM395
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM396=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM396
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM397=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM397
LTDIE_51_POINTER:

	.byte 13
LDIFF_SYM398=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM398
LTDIE_51_REFERENCE:

	.byte 14
LDIFF_SYM399=LTDIE_51 - Ldebug_info_start
	.long LDIFF_SYM399
LTDIE_52:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM400=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM400
LTDIE_52_POINTER:

	.byte 13
LDIFF_SYM401=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM401
LTDIE_52_REFERENCE:

	.byte 14
LDIFF_SYM402=LTDIE_52 - Ldebug_info_start
	.long LDIFF_SYM402
LTDIE_53:

	.byte 17
	.asciz "Xamarin_Forms_IStyle"

	.byte 16,7
	.asciz "Xamarin_Forms_IStyle"

LDIFF_SYM403=LTDIE_53 - Ldebug_info_start
	.long LDIFF_SYM403
LTDIE_53_POINTER:

	.byte 13
LDIFF_SYM404=LTDIE_53 - Ldebug_info_start
	.long LDIFF_SYM404
LTDIE_53_REFERENCE:

	.byte 14
LDIFF_SYM405=LTDIE_53 - Ldebug_info_start
	.long LDIFF_SYM405
LTDIE_54:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM406=LTDIE_54 - Ldebug_info_start
	.long LDIFF_SYM406
LTDIE_54_POINTER:

	.byte 13
LDIFF_SYM407=LTDIE_54 - Ldebug_info_start
	.long LDIFF_SYM407
LTDIE_54_REFERENCE:

	.byte 14
LDIFF_SYM408=LTDIE_54 - Ldebug_info_start
	.long LDIFF_SYM408
LTDIE_49:

	.byte 5
	.asciz "Xamarin_Forms_MergedStyle"

	.byte 80,16
LDIFF_SYM409=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM409
	.byte 2,35,0,6
	.asciz "_classStyleProperties"

LDIFF_SYM410=LTDIE_50_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM410
	.byte 2,35,16,6
	.asciz "_implicitStyles"

LDIFF_SYM411=LTDIE_51_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM411
	.byte 2,35,24,6
	.asciz "_classStyles"

LDIFF_SYM412=LTDIE_52_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM412
	.byte 2,35,32,6
	.asciz "_implicitStyle"

LDIFF_SYM413=LTDIE_53_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM413
	.byte 2,35,40,6
	.asciz "_style"

LDIFF_SYM414=LTDIE_53_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM414
	.byte 2,35,48,6
	.asciz "_styleClass"

LDIFF_SYM415=LTDIE_54_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM415
	.byte 2,35,56,6
	.asciz "<Target>k__BackingField"

LDIFF_SYM416=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM416
	.byte 2,35,64,6
	.asciz "<TargetType>k__BackingField"

LDIFF_SYM417=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM417
	.byte 2,35,72,0,7
	.asciz "Xamarin_Forms_MergedStyle"

LDIFF_SYM418=LTDIE_49 - Ldebug_info_start
	.long LDIFF_SYM418
LTDIE_49_POINTER:

	.byte 13
LDIFF_SYM419=LTDIE_49 - Ldebug_info_start
	.long LDIFF_SYM419
LTDIE_49_REFERENCE:

	.byte 14
LDIFF_SYM420=LTDIE_49 - Ldebug_info_start
	.long LDIFF_SYM420
LTDIE_48:

	.byte 5
	.asciz "Xamarin_Forms_NavigableElement"

	.byte 240,1,16
LDIFF_SYM421=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM421
	.byte 2,35,0,6
	.asciz "_mergedStyle"

LDIFF_SYM422=LTDIE_49_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM422
	.byte 3,35,232,1,0,7
	.asciz "Xamarin_Forms_NavigableElement"

LDIFF_SYM423=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM423
LTDIE_48_POINTER:

	.byte 13
LDIFF_SYM424=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM424
LTDIE_48_REFERENCE:

	.byte 14
LDIFF_SYM425=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM425
LTDIE_55:

	.byte 17
	.asciz "Xamarin_Forms_IVisual"

	.byte 16,7
	.asciz "Xamarin_Forms_IVisual"

LDIFF_SYM426=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM426
LTDIE_55_POINTER:

	.byte 13
LDIFF_SYM427=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM427
LTDIE_55_REFERENCE:

	.byte 14
LDIFF_SYM428=LTDIE_55 - Ldebug_info_start
	.long LDIFF_SYM428
LTDIE_56:

	.byte 8
	.asciz "Xamarin_Forms_EffectiveFlowDirection"

	.byte 4
LDIFF_SYM429=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM429
	.byte 9
	.asciz "RightToLeft"

	.byte 1,9
	.asciz "Explicit"

	.byte 2,0,7
	.asciz "Xamarin_Forms_EffectiveFlowDirection"

LDIFF_SYM430=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM430
LTDIE_56_POINTER:

	.byte 13
LDIFF_SYM431=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM431
LTDIE_56_REFERENCE:

	.byte 14
LDIFF_SYM432=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM432
LTDIE_58:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM433=LTDIE_58 - Ldebug_info_start
	.long LDIFF_SYM433
LTDIE_58_POINTER:

	.byte 13
LDIFF_SYM434=LTDIE_58 - Ldebug_info_start
	.long LDIFF_SYM434
LTDIE_58_REFERENCE:

	.byte 14
LDIFF_SYM435=LTDIE_58 - Ldebug_info_start
	.long LDIFF_SYM435
LTDIE_59:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM436=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM436
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM437=LTDIE_57_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM437
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM438=LTDIE_59 - Ldebug_info_start
	.long LDIFF_SYM438
LTDIE_59_POINTER:

	.byte 13
LDIFF_SYM439=LTDIE_59 - Ldebug_info_start
	.long LDIFF_SYM439
LTDIE_59_REFERENCE:

	.byte 14
LDIFF_SYM440=LTDIE_59 - Ldebug_info_start
	.long LDIFF_SYM440
LTDIE_60:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM441=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM441
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM442=LTDIE_57_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM442
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM443=LTDIE_60 - Ldebug_info_start
	.long LDIFF_SYM443
LTDIE_60_POINTER:

	.byte 13
LDIFF_SYM444=LTDIE_60 - Ldebug_info_start
	.long LDIFF_SYM444
LTDIE_60_REFERENCE:

	.byte 14
LDIFF_SYM445=LTDIE_60 - Ldebug_info_start
	.long LDIFF_SYM445
LTDIE_57:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM446=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM446
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM447=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM447
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM448=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM448
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM449=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM449
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM450=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM450
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM451=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM451
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM452=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM452
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM453=LTDIE_58_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM453
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM454=LTDIE_59_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM454
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM455=LTDIE_60_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM455
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM456=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM456
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM457=LTDIE_57 - Ldebug_info_start
	.long LDIFF_SYM457
LTDIE_57_POINTER:

	.byte 13
LDIFF_SYM458=LTDIE_57 - Ldebug_info_start
	.long LDIFF_SYM458
LTDIE_57_REFERENCE:

	.byte 14
LDIFF_SYM459=LTDIE_57 - Ldebug_info_start
	.long LDIFF_SYM459
LTDIE_61:

	.byte 8
	.asciz "Xamarin_Forms_LayoutConstraint"

	.byte 4
LDIFF_SYM460=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM460
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "HorizontallyFixed"

	.byte 1,9
	.asciz "VerticallyFixed"

	.byte 2,9
	.asciz "Fixed"

	.byte 3,0,7
	.asciz "Xamarin_Forms_LayoutConstraint"

LDIFF_SYM461=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM461
LTDIE_61_POINTER:

	.byte 13
LDIFF_SYM462=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM462
LTDIE_61_REFERENCE:

	.byte 14
LDIFF_SYM463=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM463
LTDIE_64:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM464=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM464
LTDIE_64_POINTER:

	.byte 13
LDIFF_SYM465=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM465
LTDIE_64_REFERENCE:

	.byte 14
LDIFF_SYM466=LTDIE_64 - Ldebug_info_start
	.long LDIFF_SYM466
LTDIE_65:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM467=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM467
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM468=LTDIE_63_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM468
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM469=LTDIE_65 - Ldebug_info_start
	.long LDIFF_SYM469
LTDIE_65_POINTER:

	.byte 13
LDIFF_SYM470=LTDIE_65 - Ldebug_info_start
	.long LDIFF_SYM470
LTDIE_65_REFERENCE:

	.byte 14
LDIFF_SYM471=LTDIE_65 - Ldebug_info_start
	.long LDIFF_SYM471
LTDIE_66:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM472=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM472
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM473=LTDIE_63_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM473
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM474=LTDIE_66 - Ldebug_info_start
	.long LDIFF_SYM474
LTDIE_66_POINTER:

	.byte 13
LDIFF_SYM475=LTDIE_66 - Ldebug_info_start
	.long LDIFF_SYM475
LTDIE_66_REFERENCE:

	.byte 14
LDIFF_SYM476=LTDIE_66 - Ldebug_info_start
	.long LDIFF_SYM476
LTDIE_63:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM477=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM477
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM478=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM478
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM479=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM479
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM480=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM480
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM481=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM481
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM482=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM482
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM483=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM483
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM484=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM484
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM485=LTDIE_65_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM485
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM486=LTDIE_66_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM486
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM487=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM487
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM488=LTDIE_63 - Ldebug_info_start
	.long LDIFF_SYM488
LTDIE_63_POINTER:

	.byte 13
LDIFF_SYM489=LTDIE_63 - Ldebug_info_start
	.long LDIFF_SYM489
LTDIE_63_REFERENCE:

	.byte 14
LDIFF_SYM490=LTDIE_63 - Ldebug_info_start
	.long LDIFF_SYM490
LTDIE_69:

	.byte 8
	.asciz "System_UriSyntaxFlags"

	.byte 4
LDIFF_SYM491=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM491
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "MustHaveAuthority"

	.byte 1,9
	.asciz "OptionalAuthority"

	.byte 2,9
	.asciz "MayHaveUserInfo"

	.byte 4,9
	.asciz "MayHavePort"

	.byte 8,9
	.asciz "MayHavePath"

	.byte 16,9
	.asciz "MayHaveQuery"

	.byte 32,9
	.asciz "MayHaveFragment"

	.byte 192,0,9
	.asciz "AllowEmptyHost"

	.byte 128,1,9
	.asciz "AllowUncHost"

	.byte 128,2,9
	.asciz "AllowDnsHost"

	.byte 128,4,9
	.asciz "AllowIPv4Host"

	.byte 128,8,9
	.asciz "AllowIPv6Host"

	.byte 128,16,9
	.asciz "AllowAnInternetHost"

	.byte 128,28,9
	.asciz "AllowAnyOtherHost"

	.byte 128,32,9
	.asciz "FileLikeUri"

	.byte 128,192,0,9
	.asciz "MailToLikeUri"

	.byte 128,128,1,9
	.asciz "V1_UnknownUri"

	.byte 128,128,4,9
	.asciz "SimpleUserSyntax"

	.byte 128,128,8,9
	.asciz "BuiltInSyntax"

	.byte 128,128,16,9
	.asciz "ParserSchemeOnly"

	.byte 128,128,32,9
	.asciz "AllowDOSPath"

	.byte 128,128,192,0,9
	.asciz "PathIsRooted"

	.byte 128,128,128,1,9
	.asciz "ConvertPathSlashes"

	.byte 128,128,128,2,9
	.asciz "CompressPath"

	.byte 128,128,128,4,9
	.asciz "CanonicalizeAsFilePath"

	.byte 128,128,128,8,9
	.asciz "UnEscapeDotsAndSlashes"

	.byte 128,128,128,16,9
	.asciz "AllowIdn"

	.byte 128,128,128,32,9
	.asciz "AllowIriParsing"

	.byte 128,128,128,128,1,0,7
	.asciz "System_UriSyntaxFlags"

LDIFF_SYM492=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM492
LTDIE_69_POINTER:

	.byte 13
LDIFF_SYM493=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM493
LTDIE_69_REFERENCE:

	.byte 14
LDIFF_SYM494=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM494
LTDIE_68:

	.byte 5
	.asciz "System_UriParser"

	.byte 40,16
LDIFF_SYM495=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM495
	.byte 2,35,0,6
	.asciz "m_Flags"

LDIFF_SYM496=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM496
	.byte 2,35,24,6
	.asciz "m_UpdatableFlags"

LDIFF_SYM497=LTDIE_69 - Ldebug_info_start
	.long LDIFF_SYM497
	.byte 2,35,28,6
	.asciz "m_UpdatableFlagsUsed"

LDIFF_SYM498=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM498
	.byte 2,35,32,6
	.asciz "m_Port"

LDIFF_SYM499=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM499
	.byte 2,35,36,6
	.asciz "m_Scheme"

LDIFF_SYM500=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM500
	.byte 2,35,16,0,7
	.asciz "System_UriParser"

LDIFF_SYM501=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM501
LTDIE_68_POINTER:

	.byte 13
LDIFF_SYM502=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM502
LTDIE_68_REFERENCE:

	.byte 14
LDIFF_SYM503=LTDIE_68 - Ldebug_info_start
	.long LDIFF_SYM503
LTDIE_70:

	.byte 8
	.asciz "_Flags"

	.byte 8
LDIFF_SYM504=LDIE_U8 - Ldebug_info_start
	.long LDIFF_SYM504
	.byte 9
	.asciz "Zero"

	.byte 0,9
	.asciz "SchemeNotCanonical"

	.byte 1,9
	.asciz "UserNotCanonical"

	.byte 2,9
	.asciz "HostNotCanonical"

	.byte 4,9
	.asciz "PortNotCanonical"

	.byte 8,9
	.asciz "PathNotCanonical"

	.byte 16,9
	.asciz "QueryNotCanonical"

	.byte 32,9
	.asciz "FragmentNotCanonical"

	.byte 192,0,9
	.asciz "CannotDisplayCanonical"

	.byte 255,0,9
	.asciz "E_UserNotCanonical"

	.byte 128,1,9
	.asciz "E_HostNotCanonical"

	.byte 128,2,9
	.asciz "E_PortNotCanonical"

	.byte 128,4,9
	.asciz "E_PathNotCanonical"

	.byte 128,8,9
	.asciz "E_QueryNotCanonical"

	.byte 128,16,9
	.asciz "E_FragmentNotCanonical"

	.byte 128,32,9
	.asciz "E_CannotDisplayCanonical"

	.byte 128,63,9
	.asciz "ShouldBeCompressed"

	.byte 128,192,0,9
	.asciz "FirstSlashAbsent"

	.byte 128,128,1,9
	.asciz "BackslashInPath"

	.byte 128,128,2,9
	.asciz "IndexMask"

	.byte 255,255,3,9
	.asciz "HostTypeMask"

	.byte 128,128,28,9
	.asciz "HostNotParsed"

	.byte 0,9
	.asciz "IPv6HostType"

	.byte 128,128,4,9
	.asciz "IPv4HostType"

	.byte 128,128,8,9
	.asciz "DnsHostType"

	.byte 128,128,12,9
	.asciz "UncHostType"

	.byte 128,128,16,9
	.asciz "BasicHostType"

	.byte 128,128,20,9
	.asciz "UnusedHostType"

	.byte 128,128,24,9
	.asciz "UnknownHostType"

	.byte 128,128,28,9
	.asciz "UserEscaped"

	.byte 128,128,32,9
	.asciz "AuthorityFound"

	.byte 128,128,192,0,9
	.asciz "HasUserInfo"

	.byte 128,128,128,1,9
	.asciz "LoopbackHost"

	.byte 128,128,128,2,9
	.asciz "NotDefaultPort"

	.byte 128,128,128,4,9
	.asciz "UserDrivenParsing"

	.byte 128,128,128,8,9
	.asciz "CanonicalDnsHost"

	.byte 128,128,128,16,9
	.asciz "ErrorOrParsingRecursion"

	.byte 128,128,128,32,9
	.asciz "DosPath"

	.byte 128,128,128,192,0,9
	.asciz "UncPath"

	.byte 128,128,128,128,1,9
	.asciz "ImplicitFile"

	.byte 128,128,128,128,2,9
	.asciz "MinimalUriInfoSet"

	.byte 128,128,128,128,4,9
	.asciz "AllUriInfoSet"

	.byte 128,128,128,128,8,9
	.asciz "IdnHost"

	.byte 128,128,128,128,16,9
	.asciz "HasUnicode"

	.byte 128,128,128,128,32,9
	.asciz "HostUnicodeNormalized"

	.byte 128,128,128,128,192,0,9
	.asciz "RestUnicodeNormalized"

	.byte 128,128,128,128,128,1,9
	.asciz "UnicodeHost"

	.byte 128,128,128,128,128,2,9
	.asciz "IntranetUri"

	.byte 128,128,128,128,128,4,9
	.asciz "UseOrigUncdStrOffset"

	.byte 128,128,128,128,128,8,9
	.asciz "UserIriCanonical"

	.byte 128,128,128,128,128,16,9
	.asciz "PathIriCanonical"

	.byte 128,128,128,128,128,32,9
	.asciz "QueryIriCanonical"

	.byte 128,128,128,128,128,192,0,9
	.asciz "FragmentIriCanonical"

	.byte 128,128,128,128,128,128,1,9
	.asciz "IriCanonical"

	.byte 128,128,128,128,128,240,1,9
	.asciz "CompressedSlashes"

	.byte 128,128,128,128,128,128,4,0,7
	.asciz "_Flags"

LDIFF_SYM505=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM505
LTDIE_70_POINTER:

	.byte 13
LDIFF_SYM506=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM506
LTDIE_70_REFERENCE:

	.byte 14
LDIFF_SYM507=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM507
LTDIE_72:

	.byte 5
	.asciz "_MoreInfo"

	.byte 64,16
LDIFF_SYM508=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM508
	.byte 2,35,0,6
	.asciz "Path"

LDIFF_SYM509=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM509
	.byte 2,35,16,6
	.asciz "Query"

LDIFF_SYM510=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM510
	.byte 2,35,24,6
	.asciz "Fragment"

LDIFF_SYM511=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM511
	.byte 2,35,32,6
	.asciz "AbsoluteUri"

LDIFF_SYM512=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM512
	.byte 2,35,40,6
	.asciz "Hash"

LDIFF_SYM513=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM513
	.byte 2,35,56,6
	.asciz "RemoteUrl"

LDIFF_SYM514=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM514
	.byte 2,35,48,0,7
	.asciz "_MoreInfo"

LDIFF_SYM515=LTDIE_72 - Ldebug_info_start
	.long LDIFF_SYM515
LTDIE_72_POINTER:

	.byte 13
LDIFF_SYM516=LTDIE_72 - Ldebug_info_start
	.long LDIFF_SYM516
LTDIE_72_REFERENCE:

	.byte 14
LDIFF_SYM517=LTDIE_72 - Ldebug_info_start
	.long LDIFF_SYM517
LTDIE_71:

	.byte 5
	.asciz "_UriInfo"

	.byte 72,16
LDIFF_SYM518=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM518
	.byte 2,35,0,6
	.asciz "Host"

LDIFF_SYM519=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM519
	.byte 2,35,16,6
	.asciz "ScopeId"

LDIFF_SYM520=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM520
	.byte 2,35,24,6
	.asciz "String"

LDIFF_SYM521=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM521
	.byte 2,35,32,6
	.asciz "Offset"

LDIFF_SYM522=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM522
	.byte 2,35,56,6
	.asciz "DnsSafeHost"

LDIFF_SYM523=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM523
	.byte 2,35,40,6
	.asciz "MoreInfo"

LDIFF_SYM524=LTDIE_72_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM524
	.byte 2,35,48,0,7
	.asciz "_UriInfo"

LDIFF_SYM525=LTDIE_71 - Ldebug_info_start
	.long LDIFF_SYM525
LTDIE_71_POINTER:

	.byte 13
LDIFF_SYM526=LTDIE_71 - Ldebug_info_start
	.long LDIFF_SYM526
LTDIE_71_REFERENCE:

	.byte 14
LDIFF_SYM527=LTDIE_71 - Ldebug_info_start
	.long LDIFF_SYM527
LTDIE_67:

	.byte 5
	.asciz "System_Uri"

	.byte 72,16
LDIFF_SYM528=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM528
	.byte 2,35,0,6
	.asciz "m_String"

LDIFF_SYM529=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM529
	.byte 2,35,16,6
	.asciz "m_originalUnicodeString"

LDIFF_SYM530=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM530
	.byte 2,35,24,6
	.asciz "m_Syntax"

LDIFF_SYM531=LTDIE_68_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM531
	.byte 2,35,32,6
	.asciz "m_DnsSafeHost"

LDIFF_SYM532=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM532
	.byte 2,35,40,6
	.asciz "m_Flags"

LDIFF_SYM533=LTDIE_70 - Ldebug_info_start
	.long LDIFF_SYM533
	.byte 2,35,56,6
	.asciz "m_Info"

LDIFF_SYM534=LTDIE_71_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM534
	.byte 2,35,48,6
	.asciz "m_iriParsing"

LDIFF_SYM535=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM535
	.byte 2,35,64,0,7
	.asciz "System_Uri"

LDIFF_SYM536=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM536
LTDIE_67_POINTER:

	.byte 13
LDIFF_SYM537=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM537
LTDIE_67_REFERENCE:

	.byte 14
LDIFF_SYM538=LTDIE_67 - Ldebug_info_start
	.long LDIFF_SYM538
LTDIE_75:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM539=LTDIE_75 - Ldebug_info_start
	.long LDIFF_SYM539
LTDIE_75_POINTER:

	.byte 13
LDIFF_SYM540=LTDIE_75 - Ldebug_info_start
	.long LDIFF_SYM540
LTDIE_75_REFERENCE:

	.byte 14
LDIFF_SYM541=LTDIE_75 - Ldebug_info_start
	.long LDIFF_SYM541
LTDIE_74:

	.byte 5
	.asciz "System_Collections_ObjectModel_Collection`1"

	.byte 24,16
LDIFF_SYM542=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM542
	.byte 2,35,0,6
	.asciz "items"

LDIFF_SYM543=LTDIE_75_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM543
	.byte 2,35,16,0,7
	.asciz "System_Collections_ObjectModel_Collection`1"

LDIFF_SYM544=LTDIE_74 - Ldebug_info_start
	.long LDIFF_SYM544
LTDIE_74_POINTER:

	.byte 13
LDIFF_SYM545=LTDIE_74 - Ldebug_info_start
	.long LDIFF_SYM545
LTDIE_74_REFERENCE:

	.byte 14
LDIFF_SYM546=LTDIE_74 - Ldebug_info_start
	.long LDIFF_SYM546
LTDIE_76:

	.byte 5
	.asciz "_SimpleMonitor"

	.byte 32,16
LDIFF_SYM547=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM547
	.byte 2,35,0,6
	.asciz "_busyCount"

LDIFF_SYM548=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM548
	.byte 2,35,24,6
	.asciz "_collection"

LDIFF_SYM549=LTDIE_73_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM549
	.byte 2,35,16,0,7
	.asciz "_SimpleMonitor"

LDIFF_SYM550=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM550
LTDIE_76_POINTER:

	.byte 13
LDIFF_SYM551=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM551
LTDIE_76_REFERENCE:

	.byte 14
LDIFF_SYM552=LTDIE_76 - Ldebug_info_start
	.long LDIFF_SYM552
LTDIE_73:

	.byte 5
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

	.byte 56,16
LDIFF_SYM553=LTDIE_74 - Ldebug_info_start
	.long LDIFF_SYM553
	.byte 2,35,0,6
	.asciz "_monitor"

LDIFF_SYM554=LTDIE_76_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM554
	.byte 2,35,24,6
	.asciz "_blockReentrancyCount"

LDIFF_SYM555=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM555
	.byte 2,35,48,6
	.asciz "CollectionChanged"

LDIFF_SYM556=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM556
	.byte 2,35,32,6
	.asciz "PropertyChanged"

LDIFF_SYM557=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM557
	.byte 2,35,40,0,7
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

LDIFF_SYM558=LTDIE_73 - Ldebug_info_start
	.long LDIFF_SYM558
LTDIE_73_POINTER:

	.byte 13
LDIFF_SYM559=LTDIE_73 - Ldebug_info_start
	.long LDIFF_SYM559
LTDIE_73_REFERENCE:

	.byte 14
LDIFF_SYM560=LTDIE_73 - Ldebug_info_start
	.long LDIFF_SYM560
LTDIE_77:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM561=LTDIE_77 - Ldebug_info_start
	.long LDIFF_SYM561
LTDIE_77_POINTER:

	.byte 13
LDIFF_SYM562=LTDIE_77 - Ldebug_info_start
	.long LDIFF_SYM562
LTDIE_77_REFERENCE:

	.byte 14
LDIFF_SYM563=LTDIE_77 - Ldebug_info_start
	.long LDIFF_SYM563
LTDIE_78:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 128,1,16
LDIFF_SYM564=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM564
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM565=LTDIE_78 - Ldebug_info_start
	.long LDIFF_SYM565
LTDIE_78_POINTER:

	.byte 13
LDIFF_SYM566=LTDIE_78 - Ldebug_info_start
	.long LDIFF_SYM566
LTDIE_78_REFERENCE:

	.byte 14
LDIFF_SYM567=LTDIE_78 - Ldebug_info_start
	.long LDIFF_SYM567
LTDIE_62:

	.byte 5
	.asciz "Xamarin_Forms_ResourceDictionary"

	.byte 80,16
LDIFF_SYM568=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM568
	.byte 2,35,0,6
	.asciz "_innerDictionary"

LDIFF_SYM569=LTDIE_63_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM569
	.byte 2,35,16,6
	.asciz "_mergedInstance"

LDIFF_SYM570=LTDIE_62_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM570
	.byte 2,35,24,6
	.asciz "_mergedWith"

LDIFF_SYM571=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM571
	.byte 2,35,32,6
	.asciz "_source"

LDIFF_SYM572=LTDIE_67_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM572
	.byte 2,35,40,6
	.asciz "_mergedDictionaries"

LDIFF_SYM573=LTDIE_73_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM573
	.byte 2,35,48,6
	.asciz "<StyleSheets>k__BackingField"

LDIFF_SYM574=LTDIE_77_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM574
	.byte 2,35,56,6
	.asciz "_collectionTrack"

LDIFF_SYM575=LTDIE_75_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM575
	.byte 2,35,64,6
	.asciz "ValuesChanged"

LDIFF_SYM576=LTDIE_78_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM576
	.byte 2,35,72,0,7
	.asciz "Xamarin_Forms_ResourceDictionary"

LDIFF_SYM577=LTDIE_62 - Ldebug_info_start
	.long LDIFF_SYM577
LTDIE_62_POINTER:

	.byte 13
LDIFF_SYM578=LTDIE_62 - Ldebug_info_start
	.long LDIFF_SYM578
LTDIE_62_REFERENCE:

	.byte 14
LDIFF_SYM579=LTDIE_62 - Ldebug_info_start
	.long LDIFF_SYM579
LTDIE_79:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 128,1,16
LDIFF_SYM580=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM580
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM581=LTDIE_79 - Ldebug_info_start
	.long LDIFF_SYM581
LTDIE_79_POINTER:

	.byte 13
LDIFF_SYM582=LTDIE_79 - Ldebug_info_start
	.long LDIFF_SYM582
LTDIE_79_REFERENCE:

	.byte 14
LDIFF_SYM583=LTDIE_79 - Ldebug_info_start
	.long LDIFF_SYM583
LTDIE_80:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 128,1,16
LDIFF_SYM584=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM584
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM585=LTDIE_80 - Ldebug_info_start
	.long LDIFF_SYM585
LTDIE_80_POINTER:

	.byte 13
LDIFF_SYM586=LTDIE_80 - Ldebug_info_start
	.long LDIFF_SYM586
LTDIE_80_REFERENCE:

	.byte 14
LDIFF_SYM587=LTDIE_80 - Ldebug_info_start
	.long LDIFF_SYM587
LTDIE_81:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 128,1,16
LDIFF_SYM588=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM588
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM589=LTDIE_81 - Ldebug_info_start
	.long LDIFF_SYM589
LTDIE_81_POINTER:

	.byte 13
LDIFF_SYM590=LTDIE_81 - Ldebug_info_start
	.long LDIFF_SYM590
LTDIE_81_REFERENCE:

	.byte 14
LDIFF_SYM591=LTDIE_81 - Ldebug_info_start
	.long LDIFF_SYM591
LTDIE_47:

	.byte 5
	.asciz "Xamarin_Forms_VisualElement"

	.byte 248,2,16
LDIFF_SYM592=LTDIE_48 - Ldebug_info_start
	.long LDIFF_SYM592
	.byte 2,35,0,6
	.asciz "_effectiveVisual"

LDIFF_SYM593=LTDIE_55_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM593
	.byte 3,35,240,1,6
	.asciz "_effectiveFlowDirection"

LDIFF_SYM594=LTDIE_56 - Ldebug_info_start
	.long LDIFF_SYM594
	.byte 3,35,192,2,6
	.asciz "_measureCache"

LDIFF_SYM595=LTDIE_57_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM595
	.byte 3,35,248,1,6
	.asciz "_batched"

LDIFF_SYM596=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM596
	.byte 3,35,196,2,6
	.asciz "_computedConstraint"

LDIFF_SYM597=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM597
	.byte 3,35,200,2,6
	.asciz "_isInNativeLayout"

LDIFF_SYM598=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM598
	.byte 3,35,204,2,6
	.asciz "_isNativeStateConsistent"

LDIFF_SYM599=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM599
	.byte 3,35,205,2,6
	.asciz "_isPlatformEnabled"

LDIFF_SYM600=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM600
	.byte 3,35,206,2,6
	.asciz "_mockHeight"

LDIFF_SYM601=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM601
	.byte 3,35,208,2,6
	.asciz "_mockWidth"

LDIFF_SYM602=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM602
	.byte 3,35,216,2,6
	.asciz "_mockX"

LDIFF_SYM603=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM603
	.byte 3,35,224,2,6
	.asciz "_mockY"

LDIFF_SYM604=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM604
	.byte 3,35,232,2,6
	.asciz "_selfConstraint"

LDIFF_SYM605=LTDIE_61 - Ldebug_info_start
	.long LDIFF_SYM605
	.byte 3,35,240,2,6
	.asciz "<DisableLayout>k__BackingField"

LDIFF_SYM606=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM606
	.byte 3,35,244,2,6
	.asciz "_resources"

LDIFF_SYM607=LTDIE_62_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM607
	.byte 3,35,128,2,6
	.asciz "ChildrenReordered"

LDIFF_SYM608=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM608
	.byte 3,35,136,2,6
	.asciz "Focused"

LDIFF_SYM609=LTDIE_79_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM609
	.byte 3,35,144,2,6
	.asciz "MeasureInvalidated"

LDIFF_SYM610=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM610
	.byte 3,35,152,2,6
	.asciz "SizeChanged"

LDIFF_SYM611=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM611
	.byte 3,35,160,2,6
	.asciz "Unfocused"

LDIFF_SYM612=LTDIE_79_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM612
	.byte 3,35,168,2,6
	.asciz "BatchCommitted"

LDIFF_SYM613=LTDIE_80_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM613
	.byte 3,35,176,2,6
	.asciz "FocusChangeRequested"

LDIFF_SYM614=LTDIE_81_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM614
	.byte 3,35,184,2,0,7
	.asciz "Xamarin_Forms_VisualElement"

LDIFF_SYM615=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM615
LTDIE_47_POINTER:

	.byte 13
LDIFF_SYM616=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM616
LTDIE_47_REFERENCE:

	.byte 14
LDIFF_SYM617=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM617
LTDIE_84:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM618=LTDIE_84 - Ldebug_info_start
	.long LDIFF_SYM618
LTDIE_84_POINTER:

	.byte 13
LDIFF_SYM619=LTDIE_84 - Ldebug_info_start
	.long LDIFF_SYM619
LTDIE_84_REFERENCE:

	.byte 14
LDIFF_SYM620=LTDIE_84 - Ldebug_info_start
	.long LDIFF_SYM620
LTDIE_83:

	.byte 5
	.asciz "System_Collections_ObjectModel_Collection`1"

	.byte 24,16
LDIFF_SYM621=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM621
	.byte 2,35,0,6
	.asciz "items"

LDIFF_SYM622=LTDIE_84_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM622
	.byte 2,35,16,0,7
	.asciz "System_Collections_ObjectModel_Collection`1"

LDIFF_SYM623=LTDIE_83 - Ldebug_info_start
	.long LDIFF_SYM623
LTDIE_83_POINTER:

	.byte 13
LDIFF_SYM624=LTDIE_83 - Ldebug_info_start
	.long LDIFF_SYM624
LTDIE_83_REFERENCE:

	.byte 14
LDIFF_SYM625=LTDIE_83 - Ldebug_info_start
	.long LDIFF_SYM625
LTDIE_85:

	.byte 5
	.asciz "_SimpleMonitor"

	.byte 32,16
LDIFF_SYM626=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM626
	.byte 2,35,0,6
	.asciz "_busyCount"

LDIFF_SYM627=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM627
	.byte 2,35,24,6
	.asciz "_collection"

LDIFF_SYM628=LTDIE_82_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM628
	.byte 2,35,16,0,7
	.asciz "_SimpleMonitor"

LDIFF_SYM629=LTDIE_85 - Ldebug_info_start
	.long LDIFF_SYM629
LTDIE_85_POINTER:

	.byte 13
LDIFF_SYM630=LTDIE_85 - Ldebug_info_start
	.long LDIFF_SYM630
LTDIE_85_REFERENCE:

	.byte 14
LDIFF_SYM631=LTDIE_85 - Ldebug_info_start
	.long LDIFF_SYM631
LTDIE_82:

	.byte 5
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

	.byte 56,16
LDIFF_SYM632=LTDIE_83 - Ldebug_info_start
	.long LDIFF_SYM632
	.byte 2,35,0,6
	.asciz "_monitor"

LDIFF_SYM633=LTDIE_85_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM633
	.byte 2,35,24,6
	.asciz "_blockReentrancyCount"

LDIFF_SYM634=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM634
	.byte 2,35,48,6
	.asciz "CollectionChanged"

LDIFF_SYM635=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM635
	.byte 2,35,32,6
	.asciz "PropertyChanged"

LDIFF_SYM636=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM636
	.byte 2,35,40,0,7
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

LDIFF_SYM637=LTDIE_82 - Ldebug_info_start
	.long LDIFF_SYM637
LTDIE_82_POINTER:

	.byte 13
LDIFF_SYM638=LTDIE_82 - Ldebug_info_start
	.long LDIFF_SYM638
LTDIE_82_REFERENCE:

	.byte 14
LDIFF_SYM639=LTDIE_82 - Ldebug_info_start
	.long LDIFF_SYM639
LTDIE_46:

	.byte 5
	.asciz "Xamarin_Forms_View"

	.byte 136,3,16
LDIFF_SYM640=LTDIE_47 - Ldebug_info_start
	.long LDIFF_SYM640
	.byte 2,35,0,6
	.asciz "_gestureRecognizers"

LDIFF_SYM641=LTDIE_82_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM641
	.byte 3,35,248,2,6
	.asciz "_compositeGestureRecognizers"

LDIFF_SYM642=LTDIE_82_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM642
	.byte 3,35,128,3,0,7
	.asciz "Xamarin_Forms_View"

LDIFF_SYM643=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM643
LTDIE_46_POINTER:

	.byte 13
LDIFF_SYM644=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM644
LTDIE_46_REFERENCE:

	.byte 14
LDIFF_SYM645=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM645
LTDIE_88:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM646=LTDIE_88 - Ldebug_info_start
	.long LDIFF_SYM646
LTDIE_88_POINTER:

	.byte 13
LDIFF_SYM647=LTDIE_88 - Ldebug_info_start
	.long LDIFF_SYM647
LTDIE_88_REFERENCE:

	.byte 14
LDIFF_SYM648=LTDIE_88 - Ldebug_info_start
	.long LDIFF_SYM648
LTDIE_87:

	.byte 5
	.asciz "System_Collections_ObjectModel_Collection`1"

	.byte 24,16
LDIFF_SYM649=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM649
	.byte 2,35,0,6
	.asciz "items"

LDIFF_SYM650=LTDIE_88_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM650
	.byte 2,35,16,0,7
	.asciz "System_Collections_ObjectModel_Collection`1"

LDIFF_SYM651=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM651
LTDIE_87_POINTER:

	.byte 13
LDIFF_SYM652=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM652
LTDIE_87_REFERENCE:

	.byte 14
LDIFF_SYM653=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM653
LTDIE_89:

	.byte 5
	.asciz "_SimpleMonitor"

	.byte 32,16
LDIFF_SYM654=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM654
	.byte 2,35,0,6
	.asciz "_busyCount"

LDIFF_SYM655=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM655
	.byte 2,35,24,6
	.asciz "_collection"

LDIFF_SYM656=LTDIE_86_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM656
	.byte 2,35,16,0,7
	.asciz "_SimpleMonitor"

LDIFF_SYM657=LTDIE_89 - Ldebug_info_start
	.long LDIFF_SYM657
LTDIE_89_POINTER:

	.byte 13
LDIFF_SYM658=LTDIE_89 - Ldebug_info_start
	.long LDIFF_SYM658
LTDIE_89_REFERENCE:

	.byte 14
LDIFF_SYM659=LTDIE_89 - Ldebug_info_start
	.long LDIFF_SYM659
LTDIE_86:

	.byte 5
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

	.byte 56,16
LDIFF_SYM660=LTDIE_87 - Ldebug_info_start
	.long LDIFF_SYM660
	.byte 2,35,0,6
	.asciz "_monitor"

LDIFF_SYM661=LTDIE_89_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM661
	.byte 2,35,24,6
	.asciz "_blockReentrancyCount"

LDIFF_SYM662=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM662
	.byte 2,35,48,6
	.asciz "CollectionChanged"

LDIFF_SYM663=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM663
	.byte 2,35,32,6
	.asciz "PropertyChanged"

LDIFF_SYM664=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM664
	.byte 2,35,40,0,7
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

LDIFF_SYM665=LTDIE_86 - Ldebug_info_start
	.long LDIFF_SYM665
LTDIE_86_POINTER:

	.byte 13
LDIFF_SYM666=LTDIE_86 - Ldebug_info_start
	.long LDIFF_SYM666
LTDIE_86_REFERENCE:

	.byte 14
LDIFF_SYM667=LTDIE_86 - Ldebug_info_start
	.long LDIFF_SYM667
LTDIE_92:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM668=LTDIE_92 - Ldebug_info_start
	.long LDIFF_SYM668
LTDIE_92_POINTER:

	.byte 13
LDIFF_SYM669=LTDIE_92 - Ldebug_info_start
	.long LDIFF_SYM669
LTDIE_92_REFERENCE:

	.byte 14
LDIFF_SYM670=LTDIE_92 - Ldebug_info_start
	.long LDIFF_SYM670
LTDIE_91:

	.byte 5
	.asciz "System_Collections_ObjectModel_Collection`1"

	.byte 24,16
LDIFF_SYM671=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM671
	.byte 2,35,0,6
	.asciz "items"

LDIFF_SYM672=LTDIE_92_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM672
	.byte 2,35,16,0,7
	.asciz "System_Collections_ObjectModel_Collection`1"

LDIFF_SYM673=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM673
LTDIE_91_POINTER:

	.byte 13
LDIFF_SYM674=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM674
LTDIE_91_REFERENCE:

	.byte 14
LDIFF_SYM675=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM675
LTDIE_93:

	.byte 5
	.asciz "_SimpleMonitor"

	.byte 32,16
LDIFF_SYM676=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM676
	.byte 2,35,0,6
	.asciz "_busyCount"

LDIFF_SYM677=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM677
	.byte 2,35,24,6
	.asciz "_collection"

LDIFF_SYM678=LTDIE_90_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM678
	.byte 2,35,16,0,7
	.asciz "_SimpleMonitor"

LDIFF_SYM679=LTDIE_93 - Ldebug_info_start
	.long LDIFF_SYM679
LTDIE_93_POINTER:

	.byte 13
LDIFF_SYM680=LTDIE_93 - Ldebug_info_start
	.long LDIFF_SYM680
LTDIE_93_REFERENCE:

	.byte 14
LDIFF_SYM681=LTDIE_93 - Ldebug_info_start
	.long LDIFF_SYM681
LTDIE_90:

	.byte 5
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

	.byte 56,16
LDIFF_SYM682=LTDIE_91 - Ldebug_info_start
	.long LDIFF_SYM682
	.byte 2,35,0,6
	.asciz "_monitor"

LDIFF_SYM683=LTDIE_93_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM683
	.byte 2,35,24,6
	.asciz "_blockReentrancyCount"

LDIFF_SYM684=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM684
	.byte 2,35,48,6
	.asciz "CollectionChanged"

LDIFF_SYM685=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM685
	.byte 2,35,32,6
	.asciz "PropertyChanged"

LDIFF_SYM686=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM686
	.byte 2,35,40,0,7
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

LDIFF_SYM687=LTDIE_90 - Ldebug_info_start
	.long LDIFF_SYM687
LTDIE_90_POINTER:

	.byte 13
LDIFF_SYM688=LTDIE_90 - Ldebug_info_start
	.long LDIFF_SYM688
LTDIE_90_REFERENCE:

	.byte 14
LDIFF_SYM689=LTDIE_90 - Ldebug_info_start
	.long LDIFF_SYM689
LTDIE_94:

	.byte 5
	.asciz "Xamarin_Forms_Maps_MapSpan"

	.byte 48,16
LDIFF_SYM690=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM690
	.byte 2,35,0,6
	.asciz "<Center>k__BackingField"

LDIFF_SYM691=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM691
	.byte 2,35,16,6
	.asciz "<LatitudeDegrees>k__BackingField"

LDIFF_SYM692=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM692
	.byte 2,35,32,6
	.asciz "<LongitudeDegrees>k__BackingField"

LDIFF_SYM693=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM693
	.byte 2,35,40,0,7
	.asciz "Xamarin_Forms_Maps_MapSpan"

LDIFF_SYM694=LTDIE_94 - Ldebug_info_start
	.long LDIFF_SYM694
LTDIE_94_POINTER:

	.byte 13
LDIFF_SYM695=LTDIE_94 - Ldebug_info_start
	.long LDIFF_SYM695
LTDIE_94_REFERENCE:

	.byte 14
LDIFF_SYM696=LTDIE_94 - Ldebug_info_start
	.long LDIFF_SYM696
LTDIE_95:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 128,1,16
LDIFF_SYM697=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM697
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM698=LTDIE_95 - Ldebug_info_start
	.long LDIFF_SYM698
LTDIE_95_POINTER:

	.byte 13
LDIFF_SYM699=LTDIE_95 - Ldebug_info_start
	.long LDIFF_SYM699
LTDIE_95_REFERENCE:

	.byte 14
LDIFF_SYM700=LTDIE_95 - Ldebug_info_start
	.long LDIFF_SYM700
LTDIE_45:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Map"

	.byte 176,3,16
LDIFF_SYM701=LTDIE_46 - Ldebug_info_start
	.long LDIFF_SYM701
	.byte 2,35,0,6
	.asciz "_pins"

LDIFF_SYM702=LTDIE_86_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM702
	.byte 3,35,136,3,6
	.asciz "_mapElements"

LDIFF_SYM703=LTDIE_90_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM703
	.byte 3,35,144,3,6
	.asciz "_visibleRegion"

LDIFF_SYM704=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM704
	.byte 3,35,152,3,6
	.asciz "MapClicked"

LDIFF_SYM705=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM705
	.byte 3,35,160,3,6
	.asciz "<LastMoveToRegion>k__BackingField"

LDIFF_SYM706=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM706
	.byte 3,35,168,3,0,7
	.asciz "Xamarin_Forms_Maps_Map"

LDIFF_SYM707=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM707
LTDIE_45_POINTER:

	.byte 13
LDIFF_SYM708=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM708
LTDIE_45_REFERENCE:

	.byte 14
LDIFF_SYM709=LTDIE_45 - Ldebug_info_start
	.long LDIFF_SYM709
	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:.ctor"
	.asciz "Xamarin_Forms_Maps_Map__ctor_Xamarin_Forms_Maps_MapSpan"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__ctor_Xamarin_Forms_Maps_MapSpan
	.quad Lme_1f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM710=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM710
	.byte 1,105,3
	.asciz "region"

LDIFF_SYM711=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM711
	.byte 2,141,24,11
	.asciz "V_0"

LDIFF_SYM712=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM712
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM713=Lfde31_end - Lfde31_start
	.long LDIFF_SYM713
Lfde31_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__ctor_Xamarin_Forms_Maps_MapSpan

LDIFF_SYM714=Lme_1f - Xamarin_Forms_Maps_Map__ctor_Xamarin_Forms_Maps_MapSpan
	.long LDIFF_SYM714
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,153,12
	.align 3
Lfde31_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:.ctor"
	.asciz "Xamarin_Forms_Maps_Map__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__ctor
	.quad Lme_20

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM715=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM715
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM716=Lfde32_end - Lfde32_start
	.long LDIFF_SYM716
Lfde32_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__ctor

LDIFF_SYM717=Lme_20 - Xamarin_Forms_Maps_Map__ctor
	.long LDIFF_SYM717
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde32_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_HasScrollEnabled"
	.asciz "Xamarin_Forms_Maps_Map_get_HasScrollEnabled"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_HasScrollEnabled
	.quad Lme_21

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM718=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM718
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM719=Lfde33_end - Lfde33_start
	.long LDIFF_SYM719
Lfde33_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_HasScrollEnabled

LDIFF_SYM720=Lme_21 - Xamarin_Forms_Maps_Map_get_HasScrollEnabled
	.long LDIFF_SYM720
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde33_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:set_HasScrollEnabled"
	.asciz "Xamarin_Forms_Maps_Map_set_HasScrollEnabled_bool"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_set_HasScrollEnabled_bool
	.quad Lme_22

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM721=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM721
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM722=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM722
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM723=Lfde34_end - Lfde34_start
	.long LDIFF_SYM723
Lfde34_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_set_HasScrollEnabled_bool

LDIFF_SYM724=Lme_22 - Xamarin_Forms_Maps_Map_set_HasScrollEnabled_bool
	.long LDIFF_SYM724
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde34_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_HasZoomEnabled"
	.asciz "Xamarin_Forms_Maps_Map_get_HasZoomEnabled"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_HasZoomEnabled
	.quad Lme_23

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM725=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM725
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM726=Lfde35_end - Lfde35_start
	.long LDIFF_SYM726
Lfde35_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_HasZoomEnabled

LDIFF_SYM727=Lme_23 - Xamarin_Forms_Maps_Map_get_HasZoomEnabled
	.long LDIFF_SYM727
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde35_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:set_HasZoomEnabled"
	.asciz "Xamarin_Forms_Maps_Map_set_HasZoomEnabled_bool"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_set_HasZoomEnabled_bool
	.quad Lme_24

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM728=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM728
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM729=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM729
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM730=Lfde36_end - Lfde36_start
	.long LDIFF_SYM730
Lfde36_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_set_HasZoomEnabled_bool

LDIFF_SYM731=Lme_24 - Xamarin_Forms_Maps_Map_set_HasZoomEnabled_bool
	.long LDIFF_SYM731
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde36_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_IsShowingUser"
	.asciz "Xamarin_Forms_Maps_Map_get_IsShowingUser"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_IsShowingUser
	.quad Lme_25

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM732=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM732
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM733=Lfde37_end - Lfde37_start
	.long LDIFF_SYM733
Lfde37_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_IsShowingUser

LDIFF_SYM734=Lme_25 - Xamarin_Forms_Maps_Map_get_IsShowingUser
	.long LDIFF_SYM734
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde37_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:set_IsShowingUser"
	.asciz "Xamarin_Forms_Maps_Map_set_IsShowingUser_bool"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_set_IsShowingUser_bool
	.quad Lme_26

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM735=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM735
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM736=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM736
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM737=Lfde38_end - Lfde38_start
	.long LDIFF_SYM737
Lfde38_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_set_IsShowingUser_bool

LDIFF_SYM738=Lme_26 - Xamarin_Forms_Maps_Map_set_IsShowingUser_bool
	.long LDIFF_SYM738
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde38_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_MapType"
	.asciz "Xamarin_Forms_Maps_Map_get_MapType"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_MapType
	.quad Lme_27

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM739=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM739
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM740=Lfde39_end - Lfde39_start
	.long LDIFF_SYM740
Lfde39_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_MapType

LDIFF_SYM741=Lme_27 - Xamarin_Forms_Maps_Map_get_MapType
	.long LDIFF_SYM741
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde39_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_96:

	.byte 8
	.asciz "Xamarin_Forms_Maps_MapType"

	.byte 4
LDIFF_SYM742=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM742
	.byte 9
	.asciz "Street"

	.byte 0,9
	.asciz "Satellite"

	.byte 1,9
	.asciz "Hybrid"

	.byte 2,0,7
	.asciz "Xamarin_Forms_Maps_MapType"

LDIFF_SYM743=LTDIE_96 - Ldebug_info_start
	.long LDIFF_SYM743
LTDIE_96_POINTER:

	.byte 13
LDIFF_SYM744=LTDIE_96 - Ldebug_info_start
	.long LDIFF_SYM744
LTDIE_96_REFERENCE:

	.byte 14
LDIFF_SYM745=LTDIE_96 - Ldebug_info_start
	.long LDIFF_SYM745
	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:set_MapType"
	.asciz "Xamarin_Forms_Maps_Map_set_MapType_Xamarin_Forms_Maps_MapType"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_set_MapType_Xamarin_Forms_Maps_MapType
	.quad Lme_28

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM746=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM746
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM747=LTDIE_96 - Ldebug_info_start
	.long LDIFF_SYM747
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM748=Lfde40_end - Lfde40_start
	.long LDIFF_SYM748
Lfde40_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_set_MapType_Xamarin_Forms_Maps_MapType

LDIFF_SYM749=Lme_28 - Xamarin_Forms_Maps_Map_set_MapType_Xamarin_Forms_Maps_MapType
	.long LDIFF_SYM749
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde40_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_Pins"
	.asciz "Xamarin_Forms_Maps_Map_get_Pins"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_Pins
	.quad Lme_29

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM750=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM750
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM751=Lfde41_end - Lfde41_start
	.long LDIFF_SYM751
Lfde41_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_Pins

LDIFF_SYM752=Lme_29 - Xamarin_Forms_Maps_Map_get_Pins
	.long LDIFF_SYM752
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde41_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_ItemsSource"
	.asciz "Xamarin_Forms_Maps_Map_get_ItemsSource"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_ItemsSource
	.quad Lme_2a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM753=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM753
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM754=Lfde42_end - Lfde42_start
	.long LDIFF_SYM754
Lfde42_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_ItemsSource

LDIFF_SYM755=Lme_2a - Xamarin_Forms_Maps_Map_get_ItemsSource
	.long LDIFF_SYM755
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde42_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_97:

	.byte 17
	.asciz "System_Collections_IEnumerable"

	.byte 16,7
	.asciz "System_Collections_IEnumerable"

LDIFF_SYM756=LTDIE_97 - Ldebug_info_start
	.long LDIFF_SYM756
LTDIE_97_POINTER:

	.byte 13
LDIFF_SYM757=LTDIE_97 - Ldebug_info_start
	.long LDIFF_SYM757
LTDIE_97_REFERENCE:

	.byte 14
LDIFF_SYM758=LTDIE_97 - Ldebug_info_start
	.long LDIFF_SYM758
	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:set_ItemsSource"
	.asciz "Xamarin_Forms_Maps_Map_set_ItemsSource_System_Collections_IEnumerable"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_set_ItemsSource_System_Collections_IEnumerable
	.quad Lme_2b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM759=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM759
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM760=LTDIE_97_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM760
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM761=Lfde43_end - Lfde43_start
	.long LDIFF_SYM761
Lfde43_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_set_ItemsSource_System_Collections_IEnumerable

LDIFF_SYM762=Lme_2b - Xamarin_Forms_Maps_Map_set_ItemsSource_System_Collections_IEnumerable
	.long LDIFF_SYM762
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde43_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_ItemTemplate"
	.asciz "Xamarin_Forms_Maps_Map_get_ItemTemplate"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_ItemTemplate
	.quad Lme_2c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM763=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM763
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM764=Lfde44_end - Lfde44_start
	.long LDIFF_SYM764
Lfde44_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_ItemTemplate

LDIFF_SYM765=Lme_2c - Xamarin_Forms_Maps_Map_get_ItemTemplate
	.long LDIFF_SYM765
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde44_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_100:

	.byte 5
	.asciz "System_Func`1"

	.byte 128,1,16
LDIFF_SYM766=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM766
	.byte 2,35,0,0,7
	.asciz "System_Func`1"

LDIFF_SYM767=LTDIE_100 - Ldebug_info_start
	.long LDIFF_SYM767
LTDIE_100_POINTER:

	.byte 13
LDIFF_SYM768=LTDIE_100 - Ldebug_info_start
	.long LDIFF_SYM768
LTDIE_100_REFERENCE:

	.byte 14
LDIFF_SYM769=LTDIE_100 - Ldebug_info_start
	.long LDIFF_SYM769
LTDIE_99:

	.byte 5
	.asciz "Xamarin_Forms_ElementTemplate"

	.byte 48,16
LDIFF_SYM770=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM770
	.byte 2,35,0,6
	.asciz "_changeHandlers"

LDIFF_SYM771=LTDIE_28_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM771
	.byte 2,35,16,6
	.asciz "_parent"

LDIFF_SYM772=LTDIE_7_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM772
	.byte 2,35,24,6
	.asciz "_canRecycle"

LDIFF_SYM773=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM773
	.byte 2,35,40,6
	.asciz "<LoadTemplate>k__BackingField"

LDIFF_SYM774=LTDIE_100_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM774
	.byte 2,35,32,0,7
	.asciz "Xamarin_Forms_ElementTemplate"

LDIFF_SYM775=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM775
LTDIE_99_POINTER:

	.byte 13
LDIFF_SYM776=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM776
LTDIE_99_REFERENCE:

	.byte 14
LDIFF_SYM777=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM777
LTDIE_101:

	.byte 17
	.asciz "System_Collections_Generic_IDictionary`2"

	.byte 16,7
	.asciz "System_Collections_Generic_IDictionary`2"

LDIFF_SYM778=LTDIE_101 - Ldebug_info_start
	.long LDIFF_SYM778
LTDIE_101_POINTER:

	.byte 13
LDIFF_SYM779=LTDIE_101 - Ldebug_info_start
	.long LDIFF_SYM779
LTDIE_101_REFERENCE:

	.byte 14
LDIFF_SYM780=LTDIE_101 - Ldebug_info_start
	.long LDIFF_SYM780
LTDIE_102:

	.byte 17
	.asciz "System_Collections_Generic_IDictionary`2"

	.byte 16,7
	.asciz "System_Collections_Generic_IDictionary`2"

LDIFF_SYM781=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM781
LTDIE_102_POINTER:

	.byte 13
LDIFF_SYM782=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM782
LTDIE_102_REFERENCE:

	.byte 14
LDIFF_SYM783=LTDIE_102 - Ldebug_info_start
	.long LDIFF_SYM783
LTDIE_98:

	.byte 5
	.asciz "Xamarin_Forms_DataTemplate"

	.byte 80,16
LDIFF_SYM784=LTDIE_99 - Ldebug_info_start
	.long LDIFF_SYM784
	.byte 2,35,0,6
	.asciz "_id"

LDIFF_SYM785=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM785
	.byte 2,35,72,6
	.asciz "_idString"

LDIFF_SYM786=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM786
	.byte 2,35,48,6
	.asciz "<Bindings>k__BackingField"

LDIFF_SYM787=LTDIE_101_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM787
	.byte 2,35,56,6
	.asciz "<Values>k__BackingField"

LDIFF_SYM788=LTDIE_102_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM788
	.byte 2,35,64,0,7
	.asciz "Xamarin_Forms_DataTemplate"

LDIFF_SYM789=LTDIE_98 - Ldebug_info_start
	.long LDIFF_SYM789
LTDIE_98_POINTER:

	.byte 13
LDIFF_SYM790=LTDIE_98 - Ldebug_info_start
	.long LDIFF_SYM790
LTDIE_98_REFERENCE:

	.byte 14
LDIFF_SYM791=LTDIE_98 - Ldebug_info_start
	.long LDIFF_SYM791
	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:set_ItemTemplate"
	.asciz "Xamarin_Forms_Maps_Map_set_ItemTemplate_Xamarin_Forms_DataTemplate"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_set_ItemTemplate_Xamarin_Forms_DataTemplate
	.quad Lme_2d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM792=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM792
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM793=LTDIE_98_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM793
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM794=Lfde45_end - Lfde45_start
	.long LDIFF_SYM794
Lfde45_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_set_ItemTemplate_Xamarin_Forms_DataTemplate

LDIFF_SYM795=Lme_2d - Xamarin_Forms_Maps_Map_set_ItemTemplate_Xamarin_Forms_DataTemplate
	.long LDIFF_SYM795
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde45_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_ItemTemplateSelector"
	.asciz "Xamarin_Forms_Maps_Map_get_ItemTemplateSelector"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_ItemTemplateSelector
	.quad Lme_2e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM796=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM796
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM797=Lfde46_end - Lfde46_start
	.long LDIFF_SYM797
Lfde46_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_ItemTemplateSelector

LDIFF_SYM798=Lme_2e - Xamarin_Forms_Maps_Map_get_ItemTemplateSelector
	.long LDIFF_SYM798
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde46_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_105:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM799=LTDIE_105 - Ldebug_info_start
	.long LDIFF_SYM799
LTDIE_105_POINTER:

	.byte 13
LDIFF_SYM800=LTDIE_105 - Ldebug_info_start
	.long LDIFF_SYM800
LTDIE_105_REFERENCE:

	.byte 14
LDIFF_SYM801=LTDIE_105 - Ldebug_info_start
	.long LDIFF_SYM801
LTDIE_106:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM802=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM802
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM803=LTDIE_104_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM803
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM804=LTDIE_106 - Ldebug_info_start
	.long LDIFF_SYM804
LTDIE_106_POINTER:

	.byte 13
LDIFF_SYM805=LTDIE_106 - Ldebug_info_start
	.long LDIFF_SYM805
LTDIE_106_REFERENCE:

	.byte 14
LDIFF_SYM806=LTDIE_106 - Ldebug_info_start
	.long LDIFF_SYM806
LTDIE_107:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM807=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM807
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM808=LTDIE_104_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM808
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM809=LTDIE_107 - Ldebug_info_start
	.long LDIFF_SYM809
LTDIE_107_POINTER:

	.byte 13
LDIFF_SYM810=LTDIE_107 - Ldebug_info_start
	.long LDIFF_SYM810
LTDIE_107_REFERENCE:

	.byte 14
LDIFF_SYM811=LTDIE_107 - Ldebug_info_start
	.long LDIFF_SYM811
LTDIE_104:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM812=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM812
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM813=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM813
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM814=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM814
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM815=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM815
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM816=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM816
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM817=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM817
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM818=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM818
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM819=LTDIE_105_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM819
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM820=LTDIE_106_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM820
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM821=LTDIE_107_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM821
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM822=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM822
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM823=LTDIE_104 - Ldebug_info_start
	.long LDIFF_SYM823
LTDIE_104_POINTER:

	.byte 13
LDIFF_SYM824=LTDIE_104 - Ldebug_info_start
	.long LDIFF_SYM824
LTDIE_104_REFERENCE:

	.byte 14
LDIFF_SYM825=LTDIE_104 - Ldebug_info_start
	.long LDIFF_SYM825
LTDIE_103:

	.byte 5
	.asciz "Xamarin_Forms_DataTemplateSelector"

	.byte 88,16
LDIFF_SYM826=LTDIE_98 - Ldebug_info_start
	.long LDIFF_SYM826
	.byte 2,35,0,6
	.asciz "_dataTemplates"

LDIFF_SYM827=LTDIE_104_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM827
	.byte 2,35,80,0,7
	.asciz "Xamarin_Forms_DataTemplateSelector"

LDIFF_SYM828=LTDIE_103 - Ldebug_info_start
	.long LDIFF_SYM828
LTDIE_103_POINTER:

	.byte 13
LDIFF_SYM829=LTDIE_103 - Ldebug_info_start
	.long LDIFF_SYM829
LTDIE_103_REFERENCE:

	.byte 14
LDIFF_SYM830=LTDIE_103 - Ldebug_info_start
	.long LDIFF_SYM830
	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:set_ItemTemplateSelector"
	.asciz "Xamarin_Forms_Maps_Map_set_ItemTemplateSelector_Xamarin_Forms_DataTemplateSelector"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_set_ItemTemplateSelector_Xamarin_Forms_DataTemplateSelector
	.quad Lme_2f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM831=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM831
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM832=LTDIE_103_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM832
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM833=Lfde47_end - Lfde47_start
	.long LDIFF_SYM833
Lfde47_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_set_ItemTemplateSelector_Xamarin_Forms_DataTemplateSelector

LDIFF_SYM834=Lme_2f - Xamarin_Forms_Maps_Map_set_ItemTemplateSelector_Xamarin_Forms_DataTemplateSelector
	.long LDIFF_SYM834
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde47_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_MoveToLastRegionOnLayoutChange"
	.asciz "Xamarin_Forms_Maps_Map_get_MoveToLastRegionOnLayoutChange"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_MoveToLastRegionOnLayoutChange
	.quad Lme_30

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM835=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM835
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM836=Lfde48_end - Lfde48_start
	.long LDIFF_SYM836
Lfde48_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_MoveToLastRegionOnLayoutChange

LDIFF_SYM837=Lme_30 - Xamarin_Forms_Maps_Map_get_MoveToLastRegionOnLayoutChange
	.long LDIFF_SYM837
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde48_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:set_MoveToLastRegionOnLayoutChange"
	.asciz "Xamarin_Forms_Maps_Map_set_MoveToLastRegionOnLayoutChange_bool"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_set_MoveToLastRegionOnLayoutChange_bool
	.quad Lme_31

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM838=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM838
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM839=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM839
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM840=Lfde49_end - Lfde49_start
	.long LDIFF_SYM840
Lfde49_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_set_MoveToLastRegionOnLayoutChange_bool

LDIFF_SYM841=Lme_31 - Xamarin_Forms_Maps_Map_set_MoveToLastRegionOnLayoutChange_bool
	.long LDIFF_SYM841
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde49_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_MapElements"
	.asciz "Xamarin_Forms_Maps_Map_get_MapElements"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_MapElements
	.quad Lme_32

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM842=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM842
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM843=Lfde50_end - Lfde50_start
	.long LDIFF_SYM843
Lfde50_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_MapElements

LDIFF_SYM844=Lme_32 - Xamarin_Forms_Maps_Map_get_MapElements
	.long LDIFF_SYM844
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde50_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:add_MapClicked"
	.asciz "Xamarin_Forms_Maps_Map_add_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_add_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs
	.quad Lme_33

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM845=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM845
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM846=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM846
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM847=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM847
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM848=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM848
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM849=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM849
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM850=Lfde51_end - Lfde51_start
	.long LDIFF_SYM850
Lfde51_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_add_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs

LDIFF_SYM851=Lme_33 - Xamarin_Forms_Maps_Map_add_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs
	.long LDIFF_SYM851
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde51_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:remove_MapClicked"
	.asciz "Xamarin_Forms_Maps_Map_remove_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_remove_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs
	.quad Lme_34

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM852=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM852
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM853=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM853
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM854=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM854
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM855=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM855
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM856=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM856
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM857=Lfde52_end - Lfde52_start
	.long LDIFF_SYM857
Lfde52_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_remove_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs

LDIFF_SYM858=Lme_34 - Xamarin_Forms_Maps_Map_remove_MapClicked_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs
	.long LDIFF_SYM858
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde52_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:SendMapClicked"
	.asciz "Xamarin_Forms_Maps_Map_SendMapClicked_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_SendMapClicked_Xamarin_Forms_Maps_Position
	.quad Lme_35

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM859=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM859
	.byte 2,141,24,3
	.asciz "position"

LDIFF_SYM860=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM860
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM861=Lfde53_end - Lfde53_start
	.long LDIFF_SYM861
Lfde53_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_SendMapClicked_Xamarin_Forms_Maps_Position

LDIFF_SYM862=Lme_35 - Xamarin_Forms_Maps_Map_SendMapClicked_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM862
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10
	.align 3
Lfde53_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:SetVisibleRegion"
	.asciz "Xamarin_Forms_Maps_Map_SetVisibleRegion_Xamarin_Forms_Maps_MapSpan"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_SetVisibleRegion_Xamarin_Forms_Maps_MapSpan
	.quad Lme_36

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM863=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM863
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM864=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM864
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM865=Lfde54_end - Lfde54_start
	.long LDIFF_SYM865
Lfde54_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_SetVisibleRegion_Xamarin_Forms_Maps_MapSpan

LDIFF_SYM866=Lme_36 - Xamarin_Forms_Maps_Map_SetVisibleRegion_Xamarin_Forms_Maps_MapSpan
	.long LDIFF_SYM866
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde54_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_VisibleRegion"
	.asciz "Xamarin_Forms_Maps_Map_get_VisibleRegion"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_VisibleRegion
	.quad Lme_37

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM867=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM867
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM868=Lfde55_end - Lfde55_start
	.long LDIFF_SYM868
Lfde55_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_VisibleRegion

LDIFF_SYM869=Lme_37 - Xamarin_Forms_Maps_Map_get_VisibleRegion
	.long LDIFF_SYM869
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde55_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:set_VisibleRegion"
	.asciz "Xamarin_Forms_Maps_Map_set_VisibleRegion_Xamarin_Forms_Maps_MapSpan"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_set_VisibleRegion_Xamarin_Forms_Maps_MapSpan
	.quad Lme_38

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM870=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM870
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM871=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM871
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM872=Lfde56_end - Lfde56_start
	.long LDIFF_SYM872
Lfde56_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_set_VisibleRegion_Xamarin_Forms_Maps_MapSpan

LDIFF_SYM873=Lme_38 - Xamarin_Forms_Maps_Map_set_VisibleRegion_Xamarin_Forms_Maps_MapSpan
	.long LDIFF_SYM873
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,153,4,154,3
	.align 3
Lfde56_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:get_LastMoveToRegion"
	.asciz "Xamarin_Forms_Maps_Map_get_LastMoveToRegion"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_get_LastMoveToRegion
	.quad Lme_39

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM874=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM874
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM875=Lfde57_end - Lfde57_start
	.long LDIFF_SYM875
Lfde57_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_get_LastMoveToRegion

LDIFF_SYM876=Lme_39 - Xamarin_Forms_Maps_Map_get_LastMoveToRegion
	.long LDIFF_SYM876
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde57_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:set_LastMoveToRegion"
	.asciz "Xamarin_Forms_Maps_Map_set_LastMoveToRegion_Xamarin_Forms_Maps_MapSpan"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_set_LastMoveToRegion_Xamarin_Forms_Maps_MapSpan
	.quad Lme_3a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM877=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM877
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM878=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM878
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM879=Lfde58_end - Lfde58_start
	.long LDIFF_SYM879
Lfde58_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_set_LastMoveToRegion_Xamarin_Forms_Maps_MapSpan

LDIFF_SYM880=Lme_3a - Xamarin_Forms_Maps_Map_set_LastMoveToRegion_Xamarin_Forms_Maps_MapSpan
	.long LDIFF_SYM880
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde58_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:System.Collections.IEnumerable.GetEnumerator"
	.asciz "Xamarin_Forms_Maps_Map_System_Collections_IEnumerable_GetEnumerator"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_System_Collections_IEnumerable_GetEnumerator
	.quad Lme_3b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM881=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM881
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM882=Lfde59_end - Lfde59_start
	.long LDIFF_SYM882
Lfde59_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_System_Collections_IEnumerable_GetEnumerator

LDIFF_SYM883=Lme_3b - Xamarin_Forms_Maps_Map_System_Collections_IEnumerable_GetEnumerator
	.long LDIFF_SYM883
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde59_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:GetEnumerator"
	.asciz "Xamarin_Forms_Maps_Map_GetEnumerator"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_GetEnumerator
	.quad Lme_3c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM884=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM884
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM885=Lfde60_end - Lfde60_start
	.long LDIFF_SYM885
Lfde60_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_GetEnumerator

LDIFF_SYM886=Lme_3c - Xamarin_Forms_Maps_Map_GetEnumerator
	.long LDIFF_SYM886
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde60_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:MoveToRegion"
	.asciz "Xamarin_Forms_Maps_Map_MoveToRegion_Xamarin_Forms_Maps_MapSpan"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_MoveToRegion_Xamarin_Forms_Maps_MapSpan
	.quad Lme_3d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM887=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM887
	.byte 2,141,24,3
	.asciz "mapSpan"

LDIFF_SYM888=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM888
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM889=Lfde61_end - Lfde61_start
	.long LDIFF_SYM889
Lfde61_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_MoveToRegion_Xamarin_Forms_Maps_MapSpan

LDIFF_SYM890=Lme_3d - Xamarin_Forms_Maps_Map_MoveToRegion_Xamarin_Forms_Maps_MapSpan
	.long LDIFF_SYM890
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,154,4
	.align 3
Lfde61_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_109:

	.byte 5
	.asciz "System_EventArgs"

	.byte 16,16
LDIFF_SYM891=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM891
	.byte 2,35,0,0,7
	.asciz "System_EventArgs"

LDIFF_SYM892=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM892
LTDIE_109_POINTER:

	.byte 13
LDIFF_SYM893=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM893
LTDIE_109_REFERENCE:

	.byte 14
LDIFF_SYM894=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM894
LTDIE_110:

	.byte 8
	.asciz "System_Collections_Specialized_NotifyCollectionChangedAction"

	.byte 4
LDIFF_SYM895=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM895
	.byte 9
	.asciz "Add"

	.byte 0,9
	.asciz "Remove"

	.byte 1,9
	.asciz "Replace"

	.byte 2,9
	.asciz "Move"

	.byte 3,9
	.asciz "Reset"

	.byte 4,0,7
	.asciz "System_Collections_Specialized_NotifyCollectionChangedAction"

LDIFF_SYM896=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM896
LTDIE_110_POINTER:

	.byte 13
LDIFF_SYM897=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM897
LTDIE_110_REFERENCE:

	.byte 14
LDIFF_SYM898=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM898
LTDIE_111:

	.byte 17
	.asciz "System_Collections_IList"

	.byte 16,7
	.asciz "System_Collections_IList"

LDIFF_SYM899=LTDIE_111 - Ldebug_info_start
	.long LDIFF_SYM899
LTDIE_111_POINTER:

	.byte 13
LDIFF_SYM900=LTDIE_111 - Ldebug_info_start
	.long LDIFF_SYM900
LTDIE_111_REFERENCE:

	.byte 14
LDIFF_SYM901=LTDIE_111 - Ldebug_info_start
	.long LDIFF_SYM901
LTDIE_108:

	.byte 5
	.asciz "System_Collections_Specialized_NotifyCollectionChangedEventArgs"

	.byte 48,16
LDIFF_SYM902=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM902
	.byte 2,35,0,6
	.asciz "_action"

LDIFF_SYM903=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM903
	.byte 2,35,32,6
	.asciz "_newItems"

LDIFF_SYM904=LTDIE_111_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM904
	.byte 2,35,16,6
	.asciz "_oldItems"

LDIFF_SYM905=LTDIE_111_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM905
	.byte 2,35,24,6
	.asciz "_newStartingIndex"

LDIFF_SYM906=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM906
	.byte 2,35,36,6
	.asciz "_oldStartingIndex"

LDIFF_SYM907=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM907
	.byte 2,35,40,0,7
	.asciz "System_Collections_Specialized_NotifyCollectionChangedEventArgs"

LDIFF_SYM908=LTDIE_108 - Ldebug_info_start
	.long LDIFF_SYM908
LTDIE_108_POINTER:

	.byte 13
LDIFF_SYM909=LTDIE_108 - Ldebug_info_start
	.long LDIFF_SYM909
LTDIE_108_REFERENCE:

	.byte 14
LDIFF_SYM910=LTDIE_108 - Ldebug_info_start
	.long LDIFF_SYM910
	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:PinsOnCollectionChanged"
	.asciz "Xamarin_Forms_Maps_Map_PinsOnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_PinsOnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.quad Lme_3e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM911=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM911
	.byte 0,3
	.asciz "sender"

LDIFF_SYM912=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM912
	.byte 0,3
	.asciz "e"

LDIFF_SYM913=LTDIE_108_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM913
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM914=Lfde62_end - Lfde62_start
	.long LDIFF_SYM914
Lfde62_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_PinsOnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs

LDIFF_SYM915=Lme_3e - Xamarin_Forms_Maps_Map_PinsOnCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.long LDIFF_SYM915
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7
	.align 3
Lfde62_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_112:

	.byte 17
	.asciz "System_Collections_Specialized_INotifyCollectionChanged"

	.byte 16,7
	.asciz "System_Collections_Specialized_INotifyCollectionChanged"

LDIFF_SYM916=LTDIE_112 - Ldebug_info_start
	.long LDIFF_SYM916
LTDIE_112_POINTER:

	.byte 13
LDIFF_SYM917=LTDIE_112 - Ldebug_info_start
	.long LDIFF_SYM917
LTDIE_112_REFERENCE:

	.byte 14
LDIFF_SYM918=LTDIE_112 - Ldebug_info_start
	.long LDIFF_SYM918
	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:OnItemsSourcePropertyChanged"
	.asciz "Xamarin_Forms_Maps_Map_OnItemsSourcePropertyChanged_System_Collections_IEnumerable_System_Collections_IEnumerable"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_OnItemsSourcePropertyChanged_System_Collections_IEnumerable_System_Collections_IEnumerable
	.quad Lme_3f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM919=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM919
	.byte 1,104,3
	.asciz "oldItemsSource"

LDIFF_SYM920=LTDIE_97_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM920
	.byte 1,105,3
	.asciz "newItemsSource"

LDIFF_SYM921=LTDIE_97_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM921
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM922=LTDIE_112_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM922
	.byte 1,105,11
	.asciz "V_1"

LDIFF_SYM923=LTDIE_112_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM923
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM924=Lfde63_end - Lfde63_start
	.long LDIFF_SYM924
Lfde63_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_OnItemsSourcePropertyChanged_System_Collections_IEnumerable_System_Collections_IEnumerable

LDIFF_SYM925=Lme_3f - Xamarin_Forms_Maps_Map_OnItemsSourcePropertyChanged_System_Collections_IEnumerable_System_Collections_IEnumerable
	.long LDIFF_SYM925
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6,151,5,68,152,4,153,3,68,154,2
	.align 3
Lfde63_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:OnItemTemplatePropertyChanged"
	.asciz "Xamarin_Forms_Maps_Map_OnItemTemplatePropertyChanged_Xamarin_Forms_DataTemplate_Xamarin_Forms_DataTemplate"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_OnItemTemplatePropertyChanged_Xamarin_Forms_DataTemplate_Xamarin_Forms_DataTemplate
	.quad Lme_40

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM926=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM926
	.byte 2,141,24,3
	.asciz "oldItemTemplate"

LDIFF_SYM927=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM927
	.byte 0,3
	.asciz "newItemTemplate"

LDIFF_SYM928=LTDIE_98_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM928
	.byte 2,141,40,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM929=Lfde64_end - Lfde64_start
	.long LDIFF_SYM929
Lfde64_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_OnItemTemplatePropertyChanged_Xamarin_Forms_DataTemplate_Xamarin_Forms_DataTemplate

LDIFF_SYM930=Lme_40 - Xamarin_Forms_Maps_Map_OnItemTemplatePropertyChanged_Xamarin_Forms_DataTemplate_Xamarin_Forms_DataTemplate
	.long LDIFF_SYM930
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,152,12
	.align 3
Lfde64_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:OnItemTemplateSelectorPropertyChanged"
	.asciz "Xamarin_Forms_Maps_Map_OnItemTemplateSelectorPropertyChanged"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_OnItemTemplateSelectorPropertyChanged
	.quad Lme_41

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM931=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM931
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM932=Lfde65_end - Lfde65_start
	.long LDIFF_SYM932
Lfde65_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_OnItemTemplateSelectorPropertyChanged

LDIFF_SYM933=Lme_41 - Xamarin_Forms_Maps_Map_OnItemTemplateSelectorPropertyChanged
	.long LDIFF_SYM933
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde65_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:OnItemsSourceCollectionChanged"
	.asciz "Xamarin_Forms_Maps_Map_OnItemsSourceCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_OnItemsSourceCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.quad Lme_42

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM934=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM934
	.byte 1,105,3
	.asciz "sender"

LDIFF_SYM935=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM935
	.byte 0,3
	.asciz "e"

LDIFF_SYM936=LTDIE_108_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM936
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM937=Lfde66_end - Lfde66_start
	.long LDIFF_SYM937
Lfde66_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_OnItemsSourceCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs

LDIFF_SYM938=Lme_42 - Xamarin_Forms_Maps_Map_OnItemsSourceCollectionChanged_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.long LDIFF_SYM938
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8
	.align 3
Lfde66_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_113:

	.byte 17
	.asciz "System_Collections_IEnumerator"

	.byte 16,7
	.asciz "System_Collections_IEnumerator"

LDIFF_SYM939=LTDIE_113 - Ldebug_info_start
	.long LDIFF_SYM939
LTDIE_113_POINTER:

	.byte 13
LDIFF_SYM940=LTDIE_113 - Ldebug_info_start
	.long LDIFF_SYM940
LTDIE_113_REFERENCE:

	.byte 14
LDIFF_SYM941=LTDIE_113 - Ldebug_info_start
	.long LDIFF_SYM941
LTDIE_114:

	.byte 17
	.asciz "System_IDisposable"

	.byte 16,7
	.asciz "System_IDisposable"

LDIFF_SYM942=LTDIE_114 - Ldebug_info_start
	.long LDIFF_SYM942
LTDIE_114_POINTER:

	.byte 13
LDIFF_SYM943=LTDIE_114 - Ldebug_info_start
	.long LDIFF_SYM943
LTDIE_114_REFERENCE:

	.byte 14
LDIFF_SYM944=LTDIE_114 - Ldebug_info_start
	.long LDIFF_SYM944
	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:CreatePinItems"
	.asciz "Xamarin_Forms_Maps_Map_CreatePinItems"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_CreatePinItems
	.quad Lme_43

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM945=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM945
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM946=LTDIE_113_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM946
	.byte 2,141,32,11
	.asciz "V_1"

LDIFF_SYM947=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM947
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM948=LTDIE_114_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM948
	.byte 2,141,40,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM949=Lfde67_end - Lfde67_start
	.long LDIFF_SYM949
Lfde67_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_CreatePinItems

LDIFF_SYM950=Lme_43 - Xamarin_Forms_Maps_Map_CreatePinItems
	.long LDIFF_SYM950
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10,154,9
	.align 3
Lfde67_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_116:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 128,1,16
LDIFF_SYM951=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM951
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM952=LTDIE_116 - Ldebug_info_start
	.long LDIFF_SYM952
LTDIE_116_POINTER:

	.byte 13
LDIFF_SYM953=LTDIE_116 - Ldebug_info_start
	.long LDIFF_SYM953
LTDIE_116_REFERENCE:

	.byte 14
LDIFF_SYM954=LTDIE_116 - Ldebug_info_start
	.long LDIFF_SYM954
LTDIE_115:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Pin"

	.byte 144,2,16
LDIFF_SYM955=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM955
	.byte 2,35,0,6
	.asciz "_markerId"

LDIFF_SYM956=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM956
	.byte 3,35,232,1,6
	.asciz "_id"

LDIFF_SYM957=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM957
	.byte 3,35,240,1,6
	.asciz "Clicked"

LDIFF_SYM958=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM958
	.byte 3,35,248,1,6
	.asciz "MarkerClicked"

LDIFF_SYM959=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM959
	.byte 3,35,128,2,6
	.asciz "InfoWindowClicked"

LDIFF_SYM960=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM960
	.byte 3,35,136,2,0,7
	.asciz "Xamarin_Forms_Maps_Pin"

LDIFF_SYM961=LTDIE_115 - Ldebug_info_start
	.long LDIFF_SYM961
LTDIE_115_POINTER:

	.byte 13
LDIFF_SYM962=LTDIE_115 - Ldebug_info_start
	.long LDIFF_SYM962
LTDIE_115_REFERENCE:

	.byte 14
LDIFF_SYM963=LTDIE_115 - Ldebug_info_start
	.long LDIFF_SYM963
	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:CreatePin"
	.asciz "Xamarin_Forms_Maps_Map_CreatePin_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_CreatePin_object
	.quad Lme_44

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM964=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM964
	.byte 1,105,3
	.asciz "newItem"

LDIFF_SYM965=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM965
	.byte 2,141,40,11
	.asciz "V_0"

LDIFF_SYM966=LTDIE_98_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM966
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM967=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM967
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM968=Lfde68_end - Lfde68_start
	.long LDIFF_SYM968
Lfde68_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_CreatePin_object

LDIFF_SYM969=Lme_44 - Xamarin_Forms_Maps_Map_CreatePin_object
	.long LDIFF_SYM969
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,151,4,152,3,68,153,2
	.align 3
Lfde68_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:RemovePin"
	.asciz "Xamarin_Forms_Maps_Map_RemovePin_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map_RemovePin_object
	.quad Lme_45

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM970=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM970
	.byte 1,105,3
	.asciz "itemToRemove"

LDIFF_SYM971=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM971
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM972=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM972
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM973=Lfde69_end - Lfde69_start
	.long LDIFF_SYM973
Lfde69_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map_RemovePin_object

LDIFF_SYM974=Lme_45 - Xamarin_Forms_Maps_Map_RemovePin_object
	.long LDIFF_SYM974
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde69_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:.cctor"
	.asciz "Xamarin_Forms_Maps_Map__cctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__cctor
	.quad Lme_46

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM975=Lfde70_end - Lfde70_start
	.long LDIFF_SYM975
Lfde70_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__cctor

LDIFF_SYM976=Lme_46 - Xamarin_Forms_Maps_Map__cctor
	.long LDIFF_SYM976
	.long 0
	.byte 12,31,0,68,14,176,2,157,38,158,37,68,13,29
	.align 3
Lfde70_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:<OnItemsSourceCollectionChanged>b__60_0"
	.asciz "Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_0_object_int_bool"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_0_object_int_bool
	.quad Lme_47

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM977=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM977
	.byte 2,141,16,3
	.asciz "item"

LDIFF_SYM978=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM978
	.byte 2,141,24,3
	.asciz "_"

LDIFF_SYM979=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM979
	.byte 0,3
	.asciz "__"

LDIFF_SYM980=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM980
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM981=Lfde71_end - Lfde71_start
	.long LDIFF_SYM981
Lfde71_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_0_object_int_bool

LDIFF_SYM982=Lme_47 - Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_0_object_int_bool
	.long LDIFF_SYM982
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde71_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:<OnItemsSourceCollectionChanged>b__60_1"
	.asciz "Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_1_object_int"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_1_object_int
	.quad Lme_48

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM983=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM983
	.byte 2,141,16,3
	.asciz "item"

LDIFF_SYM984=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM984
	.byte 2,141,24,3
	.asciz "_"

LDIFF_SYM985=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM985
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM986=Lfde72_end - Lfde72_start
	.long LDIFF_SYM986
Lfde72_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_1_object_int

LDIFF_SYM987=Lme_48 - Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_1_object_int
	.long LDIFF_SYM987
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde72_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map:<OnItemsSourceCollectionChanged>b__60_2"
	.asciz "Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_2"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_2
	.quad Lme_49

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM988=LTDIE_45_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM988
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM989=Lfde73_end - Lfde73_start
	.long LDIFF_SYM989
Lfde73_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_2

LDIFF_SYM990=Lme_49 - Xamarin_Forms_Maps_Map__OnItemsSourceCollectionChangedb__60_2
	.long LDIFF_SYM990
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde73_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map/<>c:.cctor"
	.asciz "Xamarin_Forms_Maps_Map__c__cctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__c__cctor
	.quad Lme_4a

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM991=Lfde74_end - Lfde74_start
	.long LDIFF_SYM991
Lfde74_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__c__cctor

LDIFF_SYM992=Lme_4a - Xamarin_Forms_Maps_Map__c__cctor
	.long LDIFF_SYM992
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde74_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_117:

	.byte 5
	.asciz "_<>c"

	.byte 16,16
LDIFF_SYM993=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM993
	.byte 2,35,0,0,7
	.asciz "_<>c"

LDIFF_SYM994=LTDIE_117 - Ldebug_info_start
	.long LDIFF_SYM994
LTDIE_117_POINTER:

	.byte 13
LDIFF_SYM995=LTDIE_117 - Ldebug_info_start
	.long LDIFF_SYM995
LTDIE_117_REFERENCE:

	.byte 14
LDIFF_SYM996=LTDIE_117 - Ldebug_info_start
	.long LDIFF_SYM996
	.byte 2
	.asciz "Xamarin.Forms.Maps.Map/<>c:.ctor"
	.asciz "Xamarin_Forms_Maps_Map__c__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__c__ctor
	.quad Lme_4b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM997=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM997
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM998=Lfde75_end - Lfde75_start
	.long LDIFF_SYM998
Lfde75_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__c__ctor

LDIFF_SYM999=Lme_4b - Xamarin_Forms_Maps_Map__c__ctor
	.long LDIFF_SYM999
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde75_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map/<>c:<PinsOnCollectionChanged>b__56_0"
	.asciz "Xamarin_Forms_Maps_Map__c__PinsOnCollectionChangedb__56_0_Xamarin_Forms_Maps_Pin"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__c__PinsOnCollectionChangedb__56_0_Xamarin_Forms_Maps_Pin
	.quad Lme_4c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1000=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1000
	.byte 0,3
	.asciz "pin"

LDIFF_SYM1001=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1001
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1002=Lfde76_end - Lfde76_start
	.long LDIFF_SYM1002
Lfde76_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__c__PinsOnCollectionChangedb__56_0_Xamarin_Forms_Maps_Pin

LDIFF_SYM1003=Lme_4c - Xamarin_Forms_Maps_Map__c__PinsOnCollectionChangedb__56_0_Xamarin_Forms_Maps_Pin
	.long LDIFF_SYM1003
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde76_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map/<>c:<.cctor>b__64_0"
	.asciz "Xamarin_Forms_Maps_Map__c___cctorb__64_0_Xamarin_Forms_BindableObject_object_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__c___cctorb__64_0_Xamarin_Forms_BindableObject_object_object
	.quad Lme_4d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1004=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1004
	.byte 0,3
	.asciz "b"

LDIFF_SYM1005=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1005
	.byte 1,104,3
	.asciz "o"

LDIFF_SYM1006=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1006
	.byte 2,141,40,3
	.asciz "n"

LDIFF_SYM1007=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1007
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1008=Lfde77_end - Lfde77_start
	.long LDIFF_SYM1008
Lfde77_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__c___cctorb__64_0_Xamarin_Forms_BindableObject_object_object

LDIFF_SYM1009=Lme_4d - Xamarin_Forms_Maps_Map__c___cctorb__64_0_Xamarin_Forms_BindableObject_object_object
	.long LDIFF_SYM1009
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,151,6,152,5
	.align 3
Lfde77_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map/<>c:<.cctor>b__64_1"
	.asciz "Xamarin_Forms_Maps_Map__c___cctorb__64_1_Xamarin_Forms_BindableObject_object_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__c___cctorb__64_1_Xamarin_Forms_BindableObject_object_object
	.quad Lme_4e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1010=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1010
	.byte 0,3
	.asciz "b"

LDIFF_SYM1011=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1011
	.byte 1,104,3
	.asciz "o"

LDIFF_SYM1012=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1012
	.byte 2,141,40,3
	.asciz "n"

LDIFF_SYM1013=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1013
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1014=Lfde78_end - Lfde78_start
	.long LDIFF_SYM1014
Lfde78_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__c___cctorb__64_1_Xamarin_Forms_BindableObject_object_object

LDIFF_SYM1015=Lme_4e - Xamarin_Forms_Maps_Map__c___cctorb__64_1_Xamarin_Forms_BindableObject_object_object
	.long LDIFF_SYM1015
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,151,6,152,5
	.align 3
Lfde78_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Map/<>c:<.cctor>b__64_2"
	.asciz "Xamarin_Forms_Maps_Map__c___cctorb__64_2_Xamarin_Forms_BindableObject_object_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Map__c___cctorb__64_2_Xamarin_Forms_BindableObject_object_object
	.quad Lme_4f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1016=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1016
	.byte 0,3
	.asciz "b"

LDIFF_SYM1017=LTDIE_8_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1017
	.byte 2,141,24,3
	.asciz "o"

LDIFF_SYM1018=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1018
	.byte 0,3
	.asciz "n"

LDIFF_SYM1019=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1019
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1020=Lfde79_end - Lfde79_start
	.long LDIFF_SYM1020
Lfde79_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Map__c___cctorb__64_2_Xamarin_Forms_BindableObject_object_object

LDIFF_SYM1021=Lme_4f - Xamarin_Forms_Maps_Map__c___cctorb__64_2_Xamarin_Forms_BindableObject_object_object
	.long LDIFF_SYM1021
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde79_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_118:

	.byte 5
	.asciz "Xamarin_Forms_Maps_MapClickedEventArgs"

	.byte 32,16
LDIFF_SYM1022=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1022
	.byte 2,35,0,6
	.asciz "<Position>k__BackingField"

LDIFF_SYM1023=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1023
	.byte 2,35,16,0,7
	.asciz "Xamarin_Forms_Maps_MapClickedEventArgs"

LDIFF_SYM1024=LTDIE_118 - Ldebug_info_start
	.long LDIFF_SYM1024
LTDIE_118_POINTER:

	.byte 13
LDIFF_SYM1025=LTDIE_118 - Ldebug_info_start
	.long LDIFF_SYM1025
LTDIE_118_REFERENCE:

	.byte 14
LDIFF_SYM1026=LTDIE_118 - Ldebug_info_start
	.long LDIFF_SYM1026
	.byte 2
	.asciz "Xamarin.Forms.Maps.MapClickedEventArgs:get_Position"
	.asciz "Xamarin_Forms_Maps_MapClickedEventArgs_get_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapClickedEventArgs_get_Position
	.quad Lme_50

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1027=LTDIE_118_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1027
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1028=Lfde80_end - Lfde80_start
	.long LDIFF_SYM1028
Lfde80_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapClickedEventArgs_get_Position

LDIFF_SYM1029=Lme_50 - Xamarin_Forms_Maps_MapClickedEventArgs_get_Position
	.long LDIFF_SYM1029
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde80_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapClickedEventArgs:.ctor"
	.asciz "Xamarin_Forms_Maps_MapClickedEventArgs__ctor_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapClickedEventArgs__ctor_Xamarin_Forms_Maps_Position
	.quad Lme_51

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1030=LTDIE_118_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1030
	.byte 2,141,16,3
	.asciz "position"

LDIFF_SYM1031=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1031
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1032=Lfde81_end - Lfde81_start
	.long LDIFF_SYM1032
Lfde81_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapClickedEventArgs__ctor_Xamarin_Forms_Maps_Position

LDIFF_SYM1033=Lme_51 - Xamarin_Forms_Maps_MapClickedEventArgs__ctor_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1033
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde81_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapElement:get_StrokeColor"
	.asciz "Xamarin_Forms_Maps_MapElement_get_StrokeColor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapElement_get_StrokeColor
	.quad Lme_52

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1034=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1034
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1035=Lfde82_end - Lfde82_start
	.long LDIFF_SYM1035
Lfde82_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapElement_get_StrokeColor

LDIFF_SYM1036=Lme_52 - Xamarin_Forms_Maps_MapElement_get_StrokeColor
	.long LDIFF_SYM1036
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde82_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapElement:set_StrokeColor"
	.asciz "Xamarin_Forms_Maps_MapElement_set_StrokeColor_Xamarin_Forms_Color"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapElement_set_StrokeColor_Xamarin_Forms_Color
	.quad Lme_53

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1037=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1037
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1038=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1038
	.byte 1,80,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1039=Lfde83_end - Lfde83_start
	.long LDIFF_SYM1039
Lfde83_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapElement_set_StrokeColor_Xamarin_Forms_Color

LDIFF_SYM1040=Lme_53 - Xamarin_Forms_Maps_MapElement_set_StrokeColor_Xamarin_Forms_Color
	.long LDIFF_SYM1040
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde83_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapElement:get_StrokeWidth"
	.asciz "Xamarin_Forms_Maps_MapElement_get_StrokeWidth"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapElement_get_StrokeWidth
	.quad Lme_54

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1041=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1041
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1042=Lfde84_end - Lfde84_start
	.long LDIFF_SYM1042
Lfde84_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapElement_get_StrokeWidth

LDIFF_SYM1043=Lme_54 - Xamarin_Forms_Maps_MapElement_get_StrokeWidth
	.long LDIFF_SYM1043
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde84_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_119:

	.byte 5
	.asciz "System_Single"

	.byte 20,16
LDIFF_SYM1044=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM1044
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM1045=LDIE_R4 - Ldebug_info_start
	.long LDIFF_SYM1045
	.byte 2,35,16,0,7
	.asciz "System_Single"

LDIFF_SYM1046=LTDIE_119 - Ldebug_info_start
	.long LDIFF_SYM1046
LTDIE_119_POINTER:

	.byte 13
LDIFF_SYM1047=LTDIE_119 - Ldebug_info_start
	.long LDIFF_SYM1047
LTDIE_119_REFERENCE:

	.byte 14
LDIFF_SYM1048=LTDIE_119 - Ldebug_info_start
	.long LDIFF_SYM1048
	.byte 2
	.asciz "Xamarin.Forms.Maps.MapElement:set_StrokeWidth"
	.asciz "Xamarin_Forms_Maps_MapElement_set_StrokeWidth_single"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapElement_set_StrokeWidth_single
	.quad Lme_55

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1049=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1049
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1050=LDIE_R4 - Ldebug_info_start
	.long LDIFF_SYM1050
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1051=Lfde85_end - Lfde85_start
	.long LDIFF_SYM1051
Lfde85_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapElement_set_StrokeWidth_single

LDIFF_SYM1052=Lme_55 - Xamarin_Forms_Maps_MapElement_set_StrokeWidth_single
	.long LDIFF_SYM1052
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde85_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapElement:get_MapElementId"
	.asciz "Xamarin_Forms_Maps_MapElement_get_MapElementId"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapElement_get_MapElementId
	.quad Lme_56

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1053=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1053
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1054=Lfde86_end - Lfde86_start
	.long LDIFF_SYM1054
Lfde86_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapElement_get_MapElementId

LDIFF_SYM1055=Lme_56 - Xamarin_Forms_Maps_MapElement_get_MapElementId
	.long LDIFF_SYM1055
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde86_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapElement:set_MapElementId"
	.asciz "Xamarin_Forms_Maps_MapElement_set_MapElementId_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapElement_set_MapElementId_object
	.quad Lme_57

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1056=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1056
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1057=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1057
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1058=Lfde87_end - Lfde87_start
	.long LDIFF_SYM1058
Lfde87_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapElement_set_MapElementId_object

LDIFF_SYM1059=Lme_57 - Xamarin_Forms_Maps_MapElement_set_MapElementId_object
	.long LDIFF_SYM1059
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde87_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapElement:.ctor"
	.asciz "Xamarin_Forms_Maps_MapElement__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapElement__ctor
	.quad Lme_58

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1060=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1060
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1061=Lfde88_end - Lfde88_start
	.long LDIFF_SYM1061
Lfde88_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapElement__ctor

LDIFF_SYM1062=Lme_58 - Xamarin_Forms_Maps_MapElement__ctor
	.long LDIFF_SYM1062
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde88_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapElement:.cctor"
	.asciz "Xamarin_Forms_Maps_MapElement__cctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapElement__cctor
	.quad Lme_59

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1063=Lfde89_end - Lfde89_start
	.long LDIFF_SYM1063
Lfde89_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapElement__cctor

LDIFF_SYM1064=Lme_59 - Xamarin_Forms_Maps_MapElement__cctor
	.long LDIFF_SYM1064
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29
	.align 3
Lfde89_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:.ctor"
	.asciz "Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double
	.quad Lme_5a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1065=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1065
	.byte 1,106,3
	.asciz "center"

LDIFF_SYM1066=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1066
	.byte 2,141,32,3
	.asciz "latitudeDegrees"

LDIFF_SYM1067=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1067
	.byte 3,141,224,0,3
	.asciz "longitudeDegrees"

LDIFF_SYM1068=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1068
	.byte 3,141,232,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1069=Lfde90_end - Lfde90_start
	.long LDIFF_SYM1069
Lfde90_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double

LDIFF_SYM1070=Lme_5a - Xamarin_Forms_Maps_MapSpan__ctor_Xamarin_Forms_Maps_Position_double_double
	.long LDIFF_SYM1070
	.long 0
	.byte 12,31,0,68,14,208,1,157,26,158,25,68,13,29,68,153,24,154,23
	.align 3
Lfde90_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:get_Center"
	.asciz "Xamarin_Forms_Maps_MapSpan_get_Center"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_get_Center
	.quad Lme_5b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1071=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1071
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1072=Lfde91_end - Lfde91_start
	.long LDIFF_SYM1072
Lfde91_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_get_Center

LDIFF_SYM1073=Lme_5b - Xamarin_Forms_Maps_MapSpan_get_Center
	.long LDIFF_SYM1073
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde91_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:get_LatitudeDegrees"
	.asciz "Xamarin_Forms_Maps_MapSpan_get_LatitudeDegrees"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_get_LatitudeDegrees
	.quad Lme_5c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1074=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1074
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1075=Lfde92_end - Lfde92_start
	.long LDIFF_SYM1075
Lfde92_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_get_LatitudeDegrees

LDIFF_SYM1076=Lme_5c - Xamarin_Forms_Maps_MapSpan_get_LatitudeDegrees
	.long LDIFF_SYM1076
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde92_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:get_LongitudeDegrees"
	.asciz "Xamarin_Forms_Maps_MapSpan_get_LongitudeDegrees"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_get_LongitudeDegrees
	.quad Lme_5d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1077=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1077
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1078=Lfde93_end - Lfde93_start
	.long LDIFF_SYM1078
Lfde93_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_get_LongitudeDegrees

LDIFF_SYM1079=Lme_5d - Xamarin_Forms_Maps_MapSpan_get_LongitudeDegrees
	.long LDIFF_SYM1079
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde93_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:get_Radius"
	.asciz "Xamarin_Forms_Maps_MapSpan_get_Radius"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_get_Radius
	.quad Lme_5e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1080=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1080
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1081=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1081
	.byte 0,11
	.asciz "V_1"

LDIFF_SYM1082=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1082
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1083=Lfde94_end - Lfde94_start
	.long LDIFF_SYM1083
Lfde94_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_get_Radius

LDIFF_SYM1084=Lme_5e - Xamarin_Forms_Maps_MapSpan_get_Radius
	.long LDIFF_SYM1084
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,154,18
	.align 3
Lfde94_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:ClampLatitude"
	.asciz "Xamarin_Forms_Maps_MapSpan_ClampLatitude_double_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_ClampLatitude_double_double
	.quad Lme_5f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1085=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1085
	.byte 1,106,3
	.asciz "north"

LDIFF_SYM1086=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1086
	.byte 2,141,24,3
	.asciz "south"

LDIFF_SYM1087=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1087
	.byte 2,141,32,11
	.asciz "V_0"

LDIFF_SYM1088=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1088
	.byte 3,141,232,1,11
	.asciz "V_1"

LDIFF_SYM1089=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1089
	.byte 3,141,136,2,11
	.asciz "V_2"

LDIFF_SYM1090=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1090
	.byte 3,141,200,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1091=Lfde95_end - Lfde95_start
	.long LDIFF_SYM1091
Lfde95_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_ClampLatitude_double_double

LDIFF_SYM1092=Lme_5f - Xamarin_Forms_Maps_MapSpan_ClampLatitude_double_double
	.long LDIFF_SYM1092
	.long 0
	.byte 12,31,0,68,14,192,2,157,40,158,39,68,13,29,68,154,38
	.align 3
Lfde95_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:Equals"
	.asciz "Xamarin_Forms_Maps_MapSpan_Equals_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_Equals_object
	.quad Lme_60

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1093=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1093
	.byte 2,141,32,3
	.asciz "obj"

LDIFF_SYM1094=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1094
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1095=Lfde96_end - Lfde96_start
	.long LDIFF_SYM1095
Lfde96_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_Equals_object

LDIFF_SYM1096=Lme_60 - Xamarin_Forms_Maps_MapSpan_Equals_object
	.long LDIFF_SYM1096
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,68,154,3
	.align 3
Lfde96_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:FromCenterAndRadius"
	.asciz "Xamarin_Forms_Maps_MapSpan_FromCenterAndRadius_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_FromCenterAndRadius_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance
	.quad Lme_61

	.byte 2,118,16,3
	.asciz "center"

LDIFF_SYM1097=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1097
	.byte 2,141,16,3
	.asciz "radius"

LDIFF_SYM1098=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1098
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1099=Lfde97_end - Lfde97_start
	.long LDIFF_SYM1099
Lfde97_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_FromCenterAndRadius_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance

LDIFF_SYM1100=Lme_61 - Xamarin_Forms_Maps_MapSpan_FromCenterAndRadius_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance
	.long LDIFF_SYM1100
	.long 0
	.byte 12,31,0,68,14,192,1,157,24,158,23,68,13,29
	.align 3
Lfde97_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:GetHashCode"
	.asciz "Xamarin_Forms_Maps_MapSpan_GetHashCode"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_GetHashCode
	.quad Lme_62

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1101=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1101
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1102=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1102
	.byte 2,141,40,11
	.asciz "V_1"

LDIFF_SYM1103=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1103
	.byte 2,141,56,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1104=Lfde98_end - Lfde98_start
	.long LDIFF_SYM1104
Lfde98_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_GetHashCode

LDIFF_SYM1105=Lme_62 - Xamarin_Forms_Maps_MapSpan_GetHashCode
	.long LDIFF_SYM1105
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,152,8,153,7,68,154,6
	.align 3
Lfde98_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:op_Equality"
	.asciz "Xamarin_Forms_Maps_MapSpan_op_Equality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_op_Equality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan
	.quad Lme_63

	.byte 2,118,16,3
	.asciz "left"

LDIFF_SYM1106=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1106
	.byte 2,141,16,3
	.asciz "right"

LDIFF_SYM1107=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1107
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1108=Lfde99_end - Lfde99_start
	.long LDIFF_SYM1108
Lfde99_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_op_Equality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan

LDIFF_SYM1109=Lme_63 - Xamarin_Forms_Maps_MapSpan_op_Equality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan
	.long LDIFF_SYM1109
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde99_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:op_Inequality"
	.asciz "Xamarin_Forms_Maps_MapSpan_op_Inequality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_op_Inequality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan
	.quad Lme_64

	.byte 2,118,16,3
	.asciz "left"

LDIFF_SYM1110=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1110
	.byte 2,141,16,3
	.asciz "right"

LDIFF_SYM1111=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1111
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1112=Lfde100_end - Lfde100_start
	.long LDIFF_SYM1112
Lfde100_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_op_Inequality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan

LDIFF_SYM1113=Lme_64 - Xamarin_Forms_Maps_MapSpan_op_Inequality_Xamarin_Forms_Maps_MapSpan_Xamarin_Forms_Maps_MapSpan
	.long LDIFF_SYM1113
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde100_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:WithZoom"
	.asciz "Xamarin_Forms_Maps_MapSpan_WithZoom_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_WithZoom_double
	.quad Lme_65

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1114=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1114
	.byte 1,106,3
	.asciz "zoomFactor"

LDIFF_SYM1115=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1115
	.byte 2,141,24,11
	.asciz "V_0"

LDIFF_SYM1116=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1116
	.byte 3,141,216,0,11
	.asciz "V_1"

LDIFF_SYM1117=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1117
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1118=Lfde101_end - Lfde101_start
	.long LDIFF_SYM1118
Lfde101_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_WithZoom_double

LDIFF_SYM1119=Lme_65 - Xamarin_Forms_Maps_MapSpan_WithZoom_double
	.long LDIFF_SYM1119
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,154,16
	.align 3
Lfde101_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:DistanceToLatitudeDegrees"
	.asciz "Xamarin_Forms_Maps_MapSpan_DistanceToLatitudeDegrees_Xamarin_Forms_Maps_Distance"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_DistanceToLatitudeDegrees_Xamarin_Forms_Maps_Distance
	.quad Lme_66

	.byte 2,118,16,3
	.asciz "distance"

LDIFF_SYM1120=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1120
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1121=Lfde102_end - Lfde102_start
	.long LDIFF_SYM1121
Lfde102_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_DistanceToLatitudeDegrees_Xamarin_Forms_Maps_Distance

LDIFF_SYM1122=Lme_66 - Xamarin_Forms_Maps_MapSpan_DistanceToLatitudeDegrees_Xamarin_Forms_Maps_Distance
	.long LDIFF_SYM1122
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde102_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:DistanceToLongitudeDegrees"
	.asciz "Xamarin_Forms_Maps_MapSpan_DistanceToLongitudeDegrees_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_DistanceToLongitudeDegrees_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance
	.quad Lme_67

	.byte 2,118,16,3
	.asciz "position"

LDIFF_SYM1123=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1123
	.byte 2,141,16,3
	.asciz "distance"

LDIFF_SYM1124=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1124
	.byte 3,141,208,0,11
	.asciz "V_0"

LDIFF_SYM1125=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1125
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1126=Lfde103_end - Lfde103_start
	.long LDIFF_SYM1126
Lfde103_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_DistanceToLongitudeDegrees_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance

LDIFF_SYM1127=Lme_67 - Xamarin_Forms_Maps_MapSpan_DistanceToLongitudeDegrees_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Distance
	.long LDIFF_SYM1127
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29
	.align 3
Lfde103_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:Equals"
	.asciz "Xamarin_Forms_Maps_MapSpan_Equals_Xamarin_Forms_Maps_MapSpan"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_Equals_Xamarin_Forms_Maps_MapSpan
	.quad Lme_68

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1128=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1128
	.byte 1,105,3
	.asciz "other"

LDIFF_SYM1129=LTDIE_94_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1129
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1130=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1130
	.byte 2,141,48,11
	.asciz "V_1"

LDIFF_SYM1131=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1131
	.byte 3,141,192,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1132=Lfde104_end - Lfde104_start
	.long LDIFF_SYM1132
Lfde104_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_Equals_Xamarin_Forms_Maps_MapSpan

LDIFF_SYM1133=Lme_68 - Xamarin_Forms_Maps_MapSpan_Equals_Xamarin_Forms_Maps_MapSpan
	.long LDIFF_SYM1133
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,153,8,154,7
	.align 3
Lfde104_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:LatitudeCircumferenceKm"
	.asciz "Xamarin_Forms_Maps_MapSpan_LatitudeCircumferenceKm_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_LatitudeCircumferenceKm_Xamarin_Forms_Maps_Position
	.quad Lme_69

	.byte 2,118,16,3
	.asciz "position"

LDIFF_SYM1134=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1134
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1135=Lfde105_end - Lfde105_start
	.long LDIFF_SYM1135
Lfde105_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_LatitudeCircumferenceKm_Xamarin_Forms_Maps_Position

LDIFF_SYM1136=Lme_69 - Xamarin_Forms_Maps_MapSpan_LatitudeCircumferenceKm_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1136
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde105_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:LatitudeDegreesToKm"
	.asciz "Xamarin_Forms_Maps_MapSpan_LatitudeDegreesToKm_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_LatitudeDegreesToKm_double
	.quad Lme_6a

	.byte 2,118,16,3
	.asciz "latitudeDegrees"

LDIFF_SYM1137=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1137
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1138=Lfde106_end - Lfde106_start
	.long LDIFF_SYM1138
Lfde106_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_LatitudeDegreesToKm_double

LDIFF_SYM1139=Lme_6a - Xamarin_Forms_Maps_MapSpan_LatitudeDegreesToKm_double
	.long LDIFF_SYM1139
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde106_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.MapSpan:LongitudeDegreesToKm"
	.asciz "Xamarin_Forms_Maps_MapSpan_LongitudeDegreesToKm_Xamarin_Forms_Maps_Position_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_MapSpan_LongitudeDegreesToKm_Xamarin_Forms_Maps_Position_double
	.quad Lme_6b

	.byte 2,118,16,3
	.asciz "position"

LDIFF_SYM1140=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1140
	.byte 2,141,16,3
	.asciz "longitudeDegrees"

LDIFF_SYM1141=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1141
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1142=Lfde107_end - Lfde107_start
	.long LDIFF_SYM1142
Lfde107_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_MapSpan_LongitudeDegreesToKm_Xamarin_Forms_Maps_Position_double

LDIFF_SYM1143=Lme_6b - Xamarin_Forms_Maps_MapSpan_LongitudeDegreesToKm_Xamarin_Forms_Maps_Position_double
	.long LDIFF_SYM1143
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde107_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:get_Address"
	.asciz "Xamarin_Forms_Maps_Pin_get_Address"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_get_Address
	.quad Lme_6c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1144=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1144
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1145=Lfde108_end - Lfde108_start
	.long LDIFF_SYM1145
Lfde108_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_get_Address

LDIFF_SYM1146=Lme_6c - Xamarin_Forms_Maps_Pin_get_Address
	.long LDIFF_SYM1146
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde108_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:set_Address"
	.asciz "Xamarin_Forms_Maps_Pin_set_Address_string"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_set_Address_string
	.quad Lme_6d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1147=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1147
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1148=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1148
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1149=Lfde109_end - Lfde109_start
	.long LDIFF_SYM1149
Lfde109_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_set_Address_string

LDIFF_SYM1150=Lme_6d - Xamarin_Forms_Maps_Pin_set_Address_string
	.long LDIFF_SYM1150
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde109_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:get_Label"
	.asciz "Xamarin_Forms_Maps_Pin_get_Label"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_get_Label
	.quad Lme_6e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1151=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1151
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1152=Lfde110_end - Lfde110_start
	.long LDIFF_SYM1152
Lfde110_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_get_Label

LDIFF_SYM1153=Lme_6e - Xamarin_Forms_Maps_Pin_get_Label
	.long LDIFF_SYM1153
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde110_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:set_Label"
	.asciz "Xamarin_Forms_Maps_Pin_set_Label_string"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_set_Label_string
	.quad Lme_6f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1154=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1154
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1155=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1155
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1156=Lfde111_end - Lfde111_start
	.long LDIFF_SYM1156
Lfde111_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_set_Label_string

LDIFF_SYM1157=Lme_6f - Xamarin_Forms_Maps_Pin_set_Label_string
	.long LDIFF_SYM1157
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde111_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:get_Position"
	.asciz "Xamarin_Forms_Maps_Pin_get_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_get_Position
	.quad Lme_70

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1158=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1158
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1159=Lfde112_end - Lfde112_start
	.long LDIFF_SYM1159
Lfde112_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_get_Position

LDIFF_SYM1160=Lme_70 - Xamarin_Forms_Maps_Pin_get_Position
	.long LDIFF_SYM1160
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde112_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:set_Position"
	.asciz "Xamarin_Forms_Maps_Pin_set_Position_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_set_Position_Xamarin_Forms_Maps_Position
	.quad Lme_71

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1161=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1161
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1162=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1162
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1163=Lfde113_end - Lfde113_start
	.long LDIFF_SYM1163
Lfde113_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_set_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM1164=Lme_71 - Xamarin_Forms_Maps_Pin_set_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1164
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde113_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:get_Type"
	.asciz "Xamarin_Forms_Maps_Pin_get_Type"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_get_Type
	.quad Lme_72

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1165=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1165
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1166=Lfde114_end - Lfde114_start
	.long LDIFF_SYM1166
Lfde114_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_get_Type

LDIFF_SYM1167=Lme_72 - Xamarin_Forms_Maps_Pin_get_Type
	.long LDIFF_SYM1167
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde114_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_120:

	.byte 8
	.asciz "Xamarin_Forms_Maps_PinType"

	.byte 4
LDIFF_SYM1168=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1168
	.byte 9
	.asciz "Generic"

	.byte 0,9
	.asciz "Place"

	.byte 1,9
	.asciz "SavedPin"

	.byte 2,9
	.asciz "SearchResult"

	.byte 3,0,7
	.asciz "Xamarin_Forms_Maps_PinType"

LDIFF_SYM1169=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM1169
LTDIE_120_POINTER:

	.byte 13
LDIFF_SYM1170=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM1170
LTDIE_120_REFERENCE:

	.byte 14
LDIFF_SYM1171=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM1171
	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:set_Type"
	.asciz "Xamarin_Forms_Maps_Pin_set_Type_Xamarin_Forms_Maps_PinType"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_set_Type_Xamarin_Forms_Maps_PinType
	.quad Lme_73

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1172=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1172
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1173=LTDIE_120 - Ldebug_info_start
	.long LDIFF_SYM1173
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1174=Lfde115_end - Lfde115_start
	.long LDIFF_SYM1174
Lfde115_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_set_Type_Xamarin_Forms_Maps_PinType

LDIFF_SYM1175=Lme_73 - Xamarin_Forms_Maps_Pin_set_Type_Xamarin_Forms_Maps_PinType
	.long LDIFF_SYM1175
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde115_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:get_Id"
	.asciz "Xamarin_Forms_Maps_Pin_get_Id"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_get_Id
	.quad Lme_74

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1176=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1176
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1177=Lfde116_end - Lfde116_start
	.long LDIFF_SYM1177
Lfde116_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_get_Id

LDIFF_SYM1178=Lme_74 - Xamarin_Forms_Maps_Pin_get_Id
	.long LDIFF_SYM1178
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde116_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:set_Id"
	.asciz "Xamarin_Forms_Maps_Pin_set_Id_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_set_Id_object
	.quad Lme_75

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1179=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1179
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1180=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1180
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1181=Lfde117_end - Lfde117_start
	.long LDIFF_SYM1181
Lfde117_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_set_Id_object

LDIFF_SYM1182=Lme_75 - Xamarin_Forms_Maps_Pin_set_Id_object
	.long LDIFF_SYM1182
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,153,4,154,3
	.align 3
Lfde117_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:get_MarkerId"
	.asciz "Xamarin_Forms_Maps_Pin_get_MarkerId"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_get_MarkerId
	.quad Lme_76

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1183=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1183
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1184=Lfde118_end - Lfde118_start
	.long LDIFF_SYM1184
Lfde118_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_get_MarkerId

LDIFF_SYM1185=Lme_76 - Xamarin_Forms_Maps_Pin_get_MarkerId
	.long LDIFF_SYM1185
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde118_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:set_MarkerId"
	.asciz "Xamarin_Forms_Maps_Pin_set_MarkerId_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_set_MarkerId_object
	.quad Lme_77

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1186=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1186
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1187=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1187
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1188=Lfde119_end - Lfde119_start
	.long LDIFF_SYM1188
Lfde119_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_set_MarkerId_object

LDIFF_SYM1189=Lme_77 - Xamarin_Forms_Maps_Pin_set_MarkerId_object
	.long LDIFF_SYM1189
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,153,4,154,3
	.align 3
Lfde119_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:add_Clicked"
	.asciz "Xamarin_Forms_Maps_Pin_add_Clicked_System_EventHandler"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_add_Clicked_System_EventHandler
	.quad Lme_78

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1190=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1190
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1191=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1191
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1192=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1192
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1193=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1193
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1194=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1194
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1195=Lfde120_end - Lfde120_start
	.long LDIFF_SYM1195
Lfde120_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_add_Clicked_System_EventHandler

LDIFF_SYM1196=Lme_78 - Xamarin_Forms_Maps_Pin_add_Clicked_System_EventHandler
	.long LDIFF_SYM1196
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde120_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:remove_Clicked"
	.asciz "Xamarin_Forms_Maps_Pin_remove_Clicked_System_EventHandler"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_remove_Clicked_System_EventHandler
	.quad Lme_79

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1197=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1197
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1198=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1198
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1199=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1199
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1200=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1200
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1201=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1201
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1202=Lfde121_end - Lfde121_start
	.long LDIFF_SYM1202
Lfde121_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_remove_Clicked_System_EventHandler

LDIFF_SYM1203=Lme_79 - Xamarin_Forms_Maps_Pin_remove_Clicked_System_EventHandler
	.long LDIFF_SYM1203
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde121_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:add_MarkerClicked"
	.asciz "Xamarin_Forms_Maps_Pin_add_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_add_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
	.quad Lme_7a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1204=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1204
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1205=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1205
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1206=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1206
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1207=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1207
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1208=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1208
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1209=Lfde122_end - Lfde122_start
	.long LDIFF_SYM1209
Lfde122_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_add_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs

LDIFF_SYM1210=Lme_7a - Xamarin_Forms_Maps_Pin_add_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
	.long LDIFF_SYM1210
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde122_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:remove_MarkerClicked"
	.asciz "Xamarin_Forms_Maps_Pin_remove_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_remove_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
	.quad Lme_7b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1211=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1211
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1212=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1212
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1213=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1213
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1214=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1214
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1215=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1215
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1216=Lfde123_end - Lfde123_start
	.long LDIFF_SYM1216
Lfde123_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_remove_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs

LDIFF_SYM1217=Lme_7b - Xamarin_Forms_Maps_Pin_remove_MarkerClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
	.long LDIFF_SYM1217
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde123_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:add_InfoWindowClicked"
	.asciz "Xamarin_Forms_Maps_Pin_add_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_add_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
	.quad Lme_7c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1218=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1218
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1219=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1219
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1220=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1220
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1221=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1221
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1222=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1222
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1223=Lfde124_end - Lfde124_start
	.long LDIFF_SYM1223
Lfde124_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_add_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs

LDIFF_SYM1224=Lme_7c - Xamarin_Forms_Maps_Pin_add_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
	.long LDIFF_SYM1224
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde124_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:remove_InfoWindowClicked"
	.asciz "Xamarin_Forms_Maps_Pin_remove_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_remove_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
	.quad Lme_7d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1225=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1225
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1226=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1226
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1227=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1227
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1228=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1228
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1229=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1229
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1230=Lfde125_end - Lfde125_start
	.long LDIFF_SYM1230
Lfde125_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_remove_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs

LDIFF_SYM1231=Lme_7d - Xamarin_Forms_Maps_Pin_remove_InfoWindowClicked_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs
	.long LDIFF_SYM1231
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde125_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:Equals"
	.asciz "Xamarin_Forms_Maps_Pin_Equals_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_Equals_object
	.quad Lme_7e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1232=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1232
	.byte 1,105,3
	.asciz "obj"

LDIFF_SYM1233=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1233
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1234=Lfde126_end - Lfde126_start
	.long LDIFF_SYM1234
Lfde126_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_Equals_object

LDIFF_SYM1235=Lme_7e - Xamarin_Forms_Maps_Pin_Equals_object
	.long LDIFF_SYM1235
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2,154,1
	.align 3
Lfde126_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:GetHashCode"
	.asciz "Xamarin_Forms_Maps_Pin_GetHashCode"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_GetHashCode
	.quad Lme_7f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1236=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1236
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1237=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1237
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1238=Lfde127_end - Lfde127_start
	.long LDIFF_SYM1238
Lfde127_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_GetHashCode

LDIFF_SYM1239=Lme_7f - Xamarin_Forms_Maps_Pin_GetHashCode
	.long LDIFF_SYM1239
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10,154,9
	.align 3
Lfde127_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:op_Equality"
	.asciz "Xamarin_Forms_Maps_Pin_op_Equality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_op_Equality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin
	.quad Lme_80

	.byte 2,118,16,3
	.asciz "left"

LDIFF_SYM1240=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1240
	.byte 2,141,16,3
	.asciz "right"

LDIFF_SYM1241=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1241
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1242=Lfde128_end - Lfde128_start
	.long LDIFF_SYM1242
Lfde128_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_op_Equality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin

LDIFF_SYM1243=Lme_80 - Xamarin_Forms_Maps_Pin_op_Equality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin
	.long LDIFF_SYM1243
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde128_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:op_Inequality"
	.asciz "Xamarin_Forms_Maps_Pin_op_Inequality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_op_Inequality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin
	.quad Lme_81

	.byte 2,118,16,3
	.asciz "left"

LDIFF_SYM1244=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1244
	.byte 2,141,16,3
	.asciz "right"

LDIFF_SYM1245=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1245
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1246=Lfde129_end - Lfde129_start
	.long LDIFF_SYM1246
Lfde129_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_op_Inequality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin

LDIFF_SYM1247=Lme_81 - Xamarin_Forms_Maps_Pin_op_Inequality_Xamarin_Forms_Maps_Pin_Xamarin_Forms_Maps_Pin
	.long LDIFF_SYM1247
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde129_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:SendTap"
	.asciz "Xamarin_Forms_Maps_Pin_SendTap"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_SendTap
	.quad Lme_82

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1248=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1248
	.byte 2,141,24,11
	.asciz "V_0"

LDIFF_SYM1249=LTDIE_26_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1249
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1250=Lfde130_end - Lfde130_start
	.long LDIFF_SYM1250
Lfde130_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_SendTap

LDIFF_SYM1251=Lme_82 - Xamarin_Forms_Maps_Pin_SendTap
	.long LDIFF_SYM1251
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2
	.align 3
Lfde130_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_121:

	.byte 5
	.asciz "Xamarin_Forms_Maps_PinClickedEventArgs"

	.byte 17,16
LDIFF_SYM1252=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM1252
	.byte 2,35,0,6
	.asciz "<HideInfoWindow>k__BackingField"

LDIFF_SYM1253=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1253
	.byte 2,35,16,0,7
	.asciz "Xamarin_Forms_Maps_PinClickedEventArgs"

LDIFF_SYM1254=LTDIE_121 - Ldebug_info_start
	.long LDIFF_SYM1254
LTDIE_121_POINTER:

	.byte 13
LDIFF_SYM1255=LTDIE_121 - Ldebug_info_start
	.long LDIFF_SYM1255
LTDIE_121_REFERENCE:

	.byte 14
LDIFF_SYM1256=LTDIE_121 - Ldebug_info_start
	.long LDIFF_SYM1256
	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:SendMarkerClick"
	.asciz "Xamarin_Forms_Maps_Pin_SendMarkerClick"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_SendMarkerClick
	.quad Lme_83

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1257=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1257
	.byte 2,141,32,11
	.asciz "V_0"

LDIFF_SYM1258=LTDIE_121_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1258
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1259=Lfde131_end - Lfde131_start
	.long LDIFF_SYM1259
Lfde131_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_SendMarkerClick

LDIFF_SYM1260=Lme_83 - Xamarin_Forms_Maps_Pin_SendMarkerClick
	.long LDIFF_SYM1260
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,153,3
	.align 3
Lfde131_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:SendInfoWindowClick"
	.asciz "Xamarin_Forms_Maps_Pin_SendInfoWindowClick"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_SendInfoWindowClick
	.quad Lme_84

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1261=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1261
	.byte 2,141,32,11
	.asciz "V_0"

LDIFF_SYM1262=LTDIE_121_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1262
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1263=Lfde132_end - Lfde132_start
	.long LDIFF_SYM1263
Lfde132_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_SendInfoWindowClick

LDIFF_SYM1264=Lme_84 - Xamarin_Forms_Maps_Pin_SendInfoWindowClick
	.long LDIFF_SYM1264
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4,153,3
	.align 3
Lfde132_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:Equals"
	.asciz "Xamarin_Forms_Maps_Pin_Equals_Xamarin_Forms_Maps_Pin"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin_Equals_Xamarin_Forms_Maps_Pin
	.quad Lme_85

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1265=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1265
	.byte 1,105,3
	.asciz "other"

LDIFF_SYM1266=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1266
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1267=Lfde133_end - Lfde133_start
	.long LDIFF_SYM1267
Lfde133_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin_Equals_Xamarin_Forms_Maps_Pin

LDIFF_SYM1268=Lme_85 - Xamarin_Forms_Maps_Pin_Equals_Xamarin_Forms_Maps_Pin
	.long LDIFF_SYM1268
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10,154,9
	.align 3
Lfde133_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:.ctor"
	.asciz "Xamarin_Forms_Maps_Pin__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin__ctor
	.quad Lme_86

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1269=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1269
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1270=Lfde134_end - Lfde134_start
	.long LDIFF_SYM1270
Lfde134_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin__ctor

LDIFF_SYM1271=Lme_86 - Xamarin_Forms_Maps_Pin__ctor
	.long LDIFF_SYM1271
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde134_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Pin:.cctor"
	.asciz "Xamarin_Forms_Maps_Pin__cctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Pin__cctor
	.quad Lme_87

	.byte 2,118,16,11
	.asciz "V_0"

LDIFF_SYM1272=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1272
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1273=Lfde135_end - Lfde135_start
	.long LDIFF_SYM1273
Lfde135_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Pin__cctor

LDIFF_SYM1274=Lme_87 - Xamarin_Forms_Maps_Pin__cctor
	.long LDIFF_SYM1274
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde135_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.PinClickedEventArgs:get_HideInfoWindow"
	.asciz "Xamarin_Forms_Maps_PinClickedEventArgs_get_HideInfoWindow"

	.byte 0,0
	.quad Xamarin_Forms_Maps_PinClickedEventArgs_get_HideInfoWindow
	.quad Lme_88

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1275=LTDIE_121_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1275
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1276=Lfde136_end - Lfde136_start
	.long LDIFF_SYM1276
Lfde136_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_PinClickedEventArgs_get_HideInfoWindow

LDIFF_SYM1277=Lme_88 - Xamarin_Forms_Maps_PinClickedEventArgs_get_HideInfoWindow
	.long LDIFF_SYM1277
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde136_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.PinClickedEventArgs:set_HideInfoWindow"
	.asciz "Xamarin_Forms_Maps_PinClickedEventArgs_set_HideInfoWindow_bool"

	.byte 0,0
	.quad Xamarin_Forms_Maps_PinClickedEventArgs_set_HideInfoWindow_bool
	.quad Lme_89

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1278=LTDIE_121_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1278
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1279=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1279
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1280=Lfde137_end - Lfde137_start
	.long LDIFF_SYM1280
Lfde137_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_PinClickedEventArgs_set_HideInfoWindow_bool

LDIFF_SYM1281=Lme_89 - Xamarin_Forms_Maps_PinClickedEventArgs_set_HideInfoWindow_bool
	.long LDIFF_SYM1281
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde137_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.PinClickedEventArgs:.ctor"
	.asciz "Xamarin_Forms_Maps_PinClickedEventArgs__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_PinClickedEventArgs__ctor
	.quad Lme_8a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1282=LTDIE_121_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1282
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1283=Lfde138_end - Lfde138_start
	.long LDIFF_SYM1283
Lfde138_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_PinClickedEventArgs__ctor

LDIFF_SYM1284=Lme_8a - Xamarin_Forms_Maps_PinClickedEventArgs__ctor
	.long LDIFF_SYM1284
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde138_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_123:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM1285=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM1285
LTDIE_123_POINTER:

	.byte 13
LDIFF_SYM1286=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM1286
LTDIE_123_REFERENCE:

	.byte 14
LDIFF_SYM1287=LTDIE_123 - Ldebug_info_start
	.long LDIFF_SYM1287
LTDIE_122:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Polygon"

	.byte 248,1,16
LDIFF_SYM1288=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM1288
	.byte 2,35,0,6
	.asciz "<Geopath>k__BackingField"

LDIFF_SYM1289=LTDIE_123_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1289
	.byte 3,35,240,1,0,7
	.asciz "Xamarin_Forms_Maps_Polygon"

LDIFF_SYM1290=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM1290
LTDIE_122_POINTER:

	.byte 13
LDIFF_SYM1291=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM1291
LTDIE_122_REFERENCE:

	.byte 14
LDIFF_SYM1292=LTDIE_122 - Ldebug_info_start
	.long LDIFF_SYM1292
	.byte 2
	.asciz "Xamarin.Forms.Maps.Polygon:get_FillColor"
	.asciz "Xamarin_Forms_Maps_Polygon_get_FillColor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Polygon_get_FillColor
	.quad Lme_8b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1293=LTDIE_122_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1293
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1294=Lfde139_end - Lfde139_start
	.long LDIFF_SYM1294
Lfde139_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Polygon_get_FillColor

LDIFF_SYM1295=Lme_8b - Xamarin_Forms_Maps_Polygon_get_FillColor
	.long LDIFF_SYM1295
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde139_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Polygon:set_FillColor"
	.asciz "Xamarin_Forms_Maps_Polygon_set_FillColor_Xamarin_Forms_Color"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Polygon_set_FillColor_Xamarin_Forms_Color
	.quad Lme_8c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1296=LTDIE_122_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1296
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1297=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1297
	.byte 1,80,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1298=Lfde140_end - Lfde140_start
	.long LDIFF_SYM1298
Lfde140_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Polygon_set_FillColor_Xamarin_Forms_Color

LDIFF_SYM1299=Lme_8c - Xamarin_Forms_Maps_Polygon_set_FillColor_Xamarin_Forms_Color
	.long LDIFF_SYM1299
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde140_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Polygon:get_Geopath"
	.asciz "Xamarin_Forms_Maps_Polygon_get_Geopath"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Polygon_get_Geopath
	.quad Lme_8d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1300=LTDIE_122_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1300
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1301=Lfde141_end - Lfde141_start
	.long LDIFF_SYM1301
Lfde141_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Polygon_get_Geopath

LDIFF_SYM1302=Lme_8d - Xamarin_Forms_Maps_Polygon_get_Geopath
	.long LDIFF_SYM1302
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde141_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_125:

	.byte 5
	.asciz "System_Collections_ObjectModel_Collection`1"

	.byte 24,16
LDIFF_SYM1303=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1303
	.byte 2,35,0,6
	.asciz "items"

LDIFF_SYM1304=LTDIE_123_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1304
	.byte 2,35,16,0,7
	.asciz "System_Collections_ObjectModel_Collection`1"

LDIFF_SYM1305=LTDIE_125 - Ldebug_info_start
	.long LDIFF_SYM1305
LTDIE_125_POINTER:

	.byte 13
LDIFF_SYM1306=LTDIE_125 - Ldebug_info_start
	.long LDIFF_SYM1306
LTDIE_125_REFERENCE:

	.byte 14
LDIFF_SYM1307=LTDIE_125 - Ldebug_info_start
	.long LDIFF_SYM1307
LTDIE_126:

	.byte 5
	.asciz "_SimpleMonitor"

	.byte 32,16
LDIFF_SYM1308=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1308
	.byte 2,35,0,6
	.asciz "_busyCount"

LDIFF_SYM1309=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1309
	.byte 2,35,24,6
	.asciz "_collection"

LDIFF_SYM1310=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1310
	.byte 2,35,16,0,7
	.asciz "_SimpleMonitor"

LDIFF_SYM1311=LTDIE_126 - Ldebug_info_start
	.long LDIFF_SYM1311
LTDIE_126_POINTER:

	.byte 13
LDIFF_SYM1312=LTDIE_126 - Ldebug_info_start
	.long LDIFF_SYM1312
LTDIE_126_REFERENCE:

	.byte 14
LDIFF_SYM1313=LTDIE_126 - Ldebug_info_start
	.long LDIFF_SYM1313
LTDIE_124:

	.byte 5
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

	.byte 56,16
LDIFF_SYM1314=LTDIE_125 - Ldebug_info_start
	.long LDIFF_SYM1314
	.byte 2,35,0,6
	.asciz "_monitor"

LDIFF_SYM1315=LTDIE_126_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1315
	.byte 2,35,24,6
	.asciz "_blockReentrancyCount"

LDIFF_SYM1316=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1316
	.byte 2,35,48,6
	.asciz "CollectionChanged"

LDIFF_SYM1317=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1317
	.byte 2,35,32,6
	.asciz "PropertyChanged"

LDIFF_SYM1318=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1318
	.byte 2,35,40,0,7
	.asciz "System_Collections_ObjectModel_ObservableCollection`1"

LDIFF_SYM1319=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM1319
LTDIE_124_POINTER:

	.byte 13
LDIFF_SYM1320=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM1320
LTDIE_124_REFERENCE:

	.byte 14
LDIFF_SYM1321=LTDIE_124 - Ldebug_info_start
	.long LDIFF_SYM1321
	.byte 2
	.asciz "Xamarin.Forms.Maps.Polygon:.ctor"
	.asciz "Xamarin_Forms_Maps_Polygon__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Polygon__ctor
	.quad Lme_8e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1322=LTDIE_122_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1322
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1323=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1323
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1324=Lfde142_end - Lfde142_start
	.long LDIFF_SYM1324
Lfde142_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Polygon__ctor

LDIFF_SYM1325=Lme_8e - Xamarin_Forms_Maps_Polygon__ctor
	.long LDIFF_SYM1325
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,154,6
	.align 3
Lfde142_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Polygon:.cctor"
	.asciz "Xamarin_Forms_Maps_Polygon__cctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Polygon__cctor
	.quad Lme_8f

	.byte 2,118,16,11
	.asciz "V_0"

LDIFF_SYM1326=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1326
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1327=Lfde143_end - Lfde143_start
	.long LDIFF_SYM1327
Lfde143_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Polygon__cctor

LDIFF_SYM1328=Lme_8f - Xamarin_Forms_Maps_Polygon__cctor
	.long LDIFF_SYM1328
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde143_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Polygon:<.ctor>b__7_0"
	.asciz "Xamarin_Forms_Maps_Polygon___ctorb__7_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Polygon___ctorb__7_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.quad Lme_90

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1329=LTDIE_122_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1329
	.byte 2,141,16,3
	.asciz "sender"

LDIFF_SYM1330=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1330
	.byte 0,3
	.asciz "args"

LDIFF_SYM1331=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1331
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1332=Lfde144_end - Lfde144_start
	.long LDIFF_SYM1332
Lfde144_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Polygon___ctorb__7_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs

LDIFF_SYM1333=Lme_90 - Xamarin_Forms_Maps_Polygon___ctorb__7_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.long LDIFF_SYM1333
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde144_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_127:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Polyline"

	.byte 248,1,16
LDIFF_SYM1334=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM1334
	.byte 2,35,0,6
	.asciz "<Geopath>k__BackingField"

LDIFF_SYM1335=LTDIE_123_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1335
	.byte 3,35,240,1,0,7
	.asciz "Xamarin_Forms_Maps_Polyline"

LDIFF_SYM1336=LTDIE_127 - Ldebug_info_start
	.long LDIFF_SYM1336
LTDIE_127_POINTER:

	.byte 13
LDIFF_SYM1337=LTDIE_127 - Ldebug_info_start
	.long LDIFF_SYM1337
LTDIE_127_REFERENCE:

	.byte 14
LDIFF_SYM1338=LTDIE_127 - Ldebug_info_start
	.long LDIFF_SYM1338
	.byte 2
	.asciz "Xamarin.Forms.Maps.Polyline:get_Geopath"
	.asciz "Xamarin_Forms_Maps_Polyline_get_Geopath"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Polyline_get_Geopath
	.quad Lme_91

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1339=LTDIE_127_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1339
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1340=Lfde145_end - Lfde145_start
	.long LDIFF_SYM1340
Lfde145_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Polyline_get_Geopath

LDIFF_SYM1341=Lme_91 - Xamarin_Forms_Maps_Polyline_get_Geopath
	.long LDIFF_SYM1341
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde145_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Polyline:.ctor"
	.asciz "Xamarin_Forms_Maps_Polyline__ctor"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Polyline__ctor
	.quad Lme_92

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1342=LTDIE_127_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1342
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1343=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1343
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1344=Lfde146_end - Lfde146_start
	.long LDIFF_SYM1344
Lfde146_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Polyline__ctor

LDIFF_SYM1345=Lme_92 - Xamarin_Forms_Maps_Polyline__ctor
	.long LDIFF_SYM1345
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,154,6
	.align 3
Lfde146_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Polyline:<.ctor>b__3_0"
	.asciz "Xamarin_Forms_Maps_Polyline___ctorb__3_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Polyline___ctorb__3_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.quad Lme_93

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1346=LTDIE_127_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1346
	.byte 2,141,16,3
	.asciz "sender"

LDIFF_SYM1347=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1347
	.byte 0,3
	.asciz "args"

LDIFF_SYM1348=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1348
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1349=Lfde147_end - Lfde147_start
	.long LDIFF_SYM1349
Lfde147_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Polyline___ctorb__3_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs

LDIFF_SYM1350=Lme_93 - Xamarin_Forms_Maps_Polyline___ctorb__3_0_object_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.long LDIFF_SYM1350
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde147_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_128:

	.byte 5
	.asciz "Xamarin_Forms_Maps_Position"

	.byte 32,16
LDIFF_SYM1351=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM1351
	.byte 2,35,0,6
	.asciz "<Latitude>k__BackingField"

LDIFF_SYM1352=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1352
	.byte 2,35,0,6
	.asciz "<Longitude>k__BackingField"

LDIFF_SYM1353=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1353
	.byte 2,35,8,0,7
	.asciz "Xamarin_Forms_Maps_Position"

LDIFF_SYM1354=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1354
LTDIE_128_POINTER:

	.byte 13
LDIFF_SYM1355=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1355
LTDIE_128_REFERENCE:

	.byte 14
LDIFF_SYM1356=LTDIE_128 - Ldebug_info_start
	.long LDIFF_SYM1356
	.byte 2
	.asciz "Xamarin.Forms.Maps.Position:.ctor"
	.asciz "Xamarin_Forms_Maps_Position__ctor_double_double"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Position__ctor_double_double
	.quad Lme_94

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1357=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1357
	.byte 2,141,24,3
	.asciz "latitude"

LDIFF_SYM1358=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1358
	.byte 2,141,32,3
	.asciz "longitude"

LDIFF_SYM1359=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1359
	.byte 2,141,40,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1360=Lfde148_end - Lfde148_start
	.long LDIFF_SYM1360
Lfde148_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Position__ctor_double_double

LDIFF_SYM1361=Lme_94 - Xamarin_Forms_Maps_Position__ctor_double_double
	.long LDIFF_SYM1361
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,153,16
	.align 3
Lfde148_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Position:get_Latitude"
	.asciz "Xamarin_Forms_Maps_Position_get_Latitude"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Position_get_Latitude
	.quad Lme_95

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1362=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1362
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1363=Lfde149_end - Lfde149_start
	.long LDIFF_SYM1363
Lfde149_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Position_get_Latitude

LDIFF_SYM1364=Lme_95 - Xamarin_Forms_Maps_Position_get_Latitude
	.long LDIFF_SYM1364
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde149_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Position:get_Longitude"
	.asciz "Xamarin_Forms_Maps_Position_get_Longitude"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Position_get_Longitude
	.quad Lme_96

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1365=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1365
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1366=Lfde150_end - Lfde150_start
	.long LDIFF_SYM1366
Lfde150_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Position_get_Longitude

LDIFF_SYM1367=Lme_96 - Xamarin_Forms_Maps_Position_get_Longitude
	.long LDIFF_SYM1367
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde150_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Position:Equals"
	.asciz "Xamarin_Forms_Maps_Position_Equals_object"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Position_Equals_object
	.quad Lme_97

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1368=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1368
	.byte 1,105,3
	.asciz "obj"

LDIFF_SYM1369=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1369
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1370=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1370
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1371=Lfde151_end - Lfde151_start
	.long LDIFF_SYM1371
Lfde151_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Position_Equals_object

LDIFF_SYM1372=Lme_97 - Xamarin_Forms_Maps_Position_Equals_object
	.long LDIFF_SYM1372
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6,154,5
	.align 3
Lfde151_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Position:GetHashCode"
	.asciz "Xamarin_Forms_Maps_Position_GetHashCode"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Position_GetHashCode
	.quad Lme_98

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1373=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1373
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1374=LDIE_R8 - Ldebug_info_start
	.long LDIFF_SYM1374
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1375=Lfde152_end - Lfde152_start
	.long LDIFF_SYM1375
Lfde152_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Position_GetHashCode

LDIFF_SYM1376=Lme_98 - Xamarin_Forms_Maps_Position_GetHashCode
	.long LDIFF_SYM1376
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6,154,5
	.align 3
Lfde152_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Position:op_Equality"
	.asciz "Xamarin_Forms_Maps_Position_op_Equality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Position_op_Equality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_99

	.byte 2,118,16,3
	.asciz "left"

LDIFF_SYM1377=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1377
	.byte 2,141,16,3
	.asciz "right"

LDIFF_SYM1378=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1378
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1379=Lfde153_end - Lfde153_start
	.long LDIFF_SYM1379
Lfde153_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Position_op_Equality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM1380=Lme_99 - Xamarin_Forms_Maps_Position_op_Equality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1380
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29
	.align 3
Lfde153_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "Xamarin.Forms.Maps.Position:op_Inequality"
	.asciz "Xamarin_Forms_Maps_Position_op_Inequality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad Xamarin_Forms_Maps_Position_op_Inequality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_9a

	.byte 2,118,16,3
	.asciz "left"

LDIFF_SYM1381=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1381
	.byte 2,141,16,3
	.asciz "right"

LDIFF_SYM1382=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1382
	.byte 3,141,208,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1383=Lfde154_end - Lfde154_start
	.long LDIFF_SYM1383
Lfde154_start:

	.long 0
	.align 3
	.quad Xamarin_Forms_Maps_Position_op_Inequality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM1384=Lme_9a - Xamarin_Forms_Maps_Position_op_Inequality_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1384
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29
	.align 3
Lfde154_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_129:

	.byte 5
	.asciz "System_Func`2"

	.byte 128,1,16
LDIFF_SYM1385=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM1385
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1386=LTDIE_129 - Ldebug_info_start
	.long LDIFF_SYM1386
LTDIE_129_POINTER:

	.byte 13
LDIFF_SYM1387=LTDIE_129 - Ldebug_info_start
	.long LDIFF_SYM1387
LTDIE_129_REFERENCE:

	.byte 14
LDIFF_SYM1388=LTDIE_129 - Ldebug_info_start
	.long LDIFF_SYM1388
LTDIE_130:

	.byte 5
	.asciz "System_Array"

	.byte 16,16
LDIFF_SYM1389=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1389
	.byte 2,35,0,0,7
	.asciz "System_Array"

LDIFF_SYM1390=LTDIE_130 - Ldebug_info_start
	.long LDIFF_SYM1390
LTDIE_130_POINTER:

	.byte 13
LDIFF_SYM1391=LTDIE_130 - Ldebug_info_start
	.long LDIFF_SYM1391
LTDIE_130_REFERENCE:

	.byte 14
LDIFF_SYM1392=LTDIE_130 - Ldebug_info_start
	.long LDIFF_SYM1392
LTDIE_133:

	.byte 5
	.asciz "System_Threading_Tasks_TaskScheduler"

	.byte 20,16
LDIFF_SYM1393=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1393
	.byte 2,35,0,6
	.asciz "m_taskSchedulerId"

LDIFF_SYM1394=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1394
	.byte 2,35,16,0,7
	.asciz "System_Threading_Tasks_TaskScheduler"

LDIFF_SYM1395=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM1395
LTDIE_133_POINTER:

	.byte 13
LDIFF_SYM1396=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM1396
LTDIE_133_REFERENCE:

	.byte 14
LDIFF_SYM1397=LTDIE_133 - Ldebug_info_start
	.long LDIFF_SYM1397
LTDIE_137:

	.byte 8
	.asciz "System_Threading_SynchronizationContextProperties"

	.byte 4
LDIFF_SYM1398=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1398
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "RequireWaitNotification"

	.byte 1,0,7
	.asciz "System_Threading_SynchronizationContextProperties"

LDIFF_SYM1399=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM1399
LTDIE_137_POINTER:

	.byte 13
LDIFF_SYM1400=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM1400
LTDIE_137_REFERENCE:

	.byte 14
LDIFF_SYM1401=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM1401
LTDIE_136:

	.byte 5
	.asciz "System_Threading_SynchronizationContext"

	.byte 20,16
LDIFF_SYM1402=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1402
	.byte 2,35,0,6
	.asciz "_props"

LDIFF_SYM1403=LTDIE_137 - Ldebug_info_start
	.long LDIFF_SYM1403
	.byte 2,35,16,0,7
	.asciz "System_Threading_SynchronizationContext"

LDIFF_SYM1404=LTDIE_136 - Ldebug_info_start
	.long LDIFF_SYM1404
LTDIE_136_POINTER:

	.byte 13
LDIFF_SYM1405=LTDIE_136 - Ldebug_info_start
	.long LDIFF_SYM1405
LTDIE_136_REFERENCE:

	.byte 14
LDIFF_SYM1406=LTDIE_136 - Ldebug_info_start
	.long LDIFF_SYM1406
LTDIE_140:

	.byte 17
	.asciz "System_Collections_ICollection"

	.byte 16,7
	.asciz "System_Collections_ICollection"

LDIFF_SYM1407=LTDIE_140 - Ldebug_info_start
	.long LDIFF_SYM1407
LTDIE_140_POINTER:

	.byte 13
LDIFF_SYM1408=LTDIE_140 - Ldebug_info_start
	.long LDIFF_SYM1408
LTDIE_140_REFERENCE:

	.byte 14
LDIFF_SYM1409=LTDIE_140 - Ldebug_info_start
	.long LDIFF_SYM1409
LTDIE_141:

	.byte 17
	.asciz "System_Collections_IEqualityComparer"

	.byte 16,7
	.asciz "System_Collections_IEqualityComparer"

LDIFF_SYM1410=LTDIE_141 - Ldebug_info_start
	.long LDIFF_SYM1410
LTDIE_141_POINTER:

	.byte 13
LDIFF_SYM1411=LTDIE_141 - Ldebug_info_start
	.long LDIFF_SYM1411
LTDIE_141_REFERENCE:

	.byte 14
LDIFF_SYM1412=LTDIE_141 - Ldebug_info_start
	.long LDIFF_SYM1412
LTDIE_139:

	.byte 5
	.asciz "System_Collections_Hashtable"

	.byte 80,16
LDIFF_SYM1413=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1413
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM1414=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1414
	.byte 2,35,16,6
	.asciz "_count"

LDIFF_SYM1415=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1415
	.byte 2,35,56,6
	.asciz "_occupancy"

LDIFF_SYM1416=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1416
	.byte 2,35,60,6
	.asciz "_loadsize"

LDIFF_SYM1417=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1417
	.byte 2,35,64,6
	.asciz "_loadFactor"

LDIFF_SYM1418=LDIE_R4 - Ldebug_info_start
	.long LDIFF_SYM1418
	.byte 2,35,68,6
	.asciz "_version"

LDIFF_SYM1419=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1419
	.byte 2,35,72,6
	.asciz "_isWriterInProgress"

LDIFF_SYM1420=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1420
	.byte 2,35,76,6
	.asciz "_keys"

LDIFF_SYM1421=LTDIE_140_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1421
	.byte 2,35,24,6
	.asciz "_values"

LDIFF_SYM1422=LTDIE_140_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1422
	.byte 2,35,32,6
	.asciz "_keycomparer"

LDIFF_SYM1423=LTDIE_141_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1423
	.byte 2,35,40,6
	.asciz "_syncRoot"

LDIFF_SYM1424=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1424
	.byte 2,35,48,0,7
	.asciz "System_Collections_Hashtable"

LDIFF_SYM1425=LTDIE_139 - Ldebug_info_start
	.long LDIFF_SYM1425
LTDIE_139_POINTER:

	.byte 13
LDIFF_SYM1426=LTDIE_139 - Ldebug_info_start
	.long LDIFF_SYM1426
LTDIE_139_REFERENCE:

	.byte 14
LDIFF_SYM1427=LTDIE_139 - Ldebug_info_start
	.long LDIFF_SYM1427
LTDIE_142:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_CallContextRemotingData"

	.byte 16,16
LDIFF_SYM1428=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1428
	.byte 2,35,0,0,7
	.asciz "System_Runtime_Remoting_Messaging_CallContextRemotingData"

LDIFF_SYM1429=LTDIE_142 - Ldebug_info_start
	.long LDIFF_SYM1429
LTDIE_142_POINTER:

	.byte 13
LDIFF_SYM1430=LTDIE_142 - Ldebug_info_start
	.long LDIFF_SYM1430
LTDIE_142_REFERENCE:

	.byte 14
LDIFF_SYM1431=LTDIE_142 - Ldebug_info_start
	.long LDIFF_SYM1431
LTDIE_144:

	.byte 17
	.asciz "System_Security_Principal_IPrincipal"

	.byte 16,7
	.asciz "System_Security_Principal_IPrincipal"

LDIFF_SYM1432=LTDIE_144 - Ldebug_info_start
	.long LDIFF_SYM1432
LTDIE_144_POINTER:

	.byte 13
LDIFF_SYM1433=LTDIE_144 - Ldebug_info_start
	.long LDIFF_SYM1433
LTDIE_144_REFERENCE:

	.byte 14
LDIFF_SYM1434=LTDIE_144 - Ldebug_info_start
	.long LDIFF_SYM1434
LTDIE_143:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_CallContextSecurityData"

	.byte 24,16
LDIFF_SYM1435=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1435
	.byte 2,35,0,6
	.asciz "_principal"

LDIFF_SYM1436=LTDIE_144_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1436
	.byte 2,35,16,0,7
	.asciz "System_Runtime_Remoting_Messaging_CallContextSecurityData"

LDIFF_SYM1437=LTDIE_143 - Ldebug_info_start
	.long LDIFF_SYM1437
LTDIE_143_POINTER:

	.byte 13
LDIFF_SYM1438=LTDIE_143 - Ldebug_info_start
	.long LDIFF_SYM1438
LTDIE_143_REFERENCE:

	.byte 14
LDIFF_SYM1439=LTDIE_143 - Ldebug_info_start
	.long LDIFF_SYM1439
LTDIE_138:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_LogicalCallContext"

	.byte 56,16
LDIFF_SYM1440=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1440
	.byte 2,35,0,6
	.asciz "m_Datastore"

LDIFF_SYM1441=LTDIE_139_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1441
	.byte 2,35,16,6
	.asciz "m_RemotingData"

LDIFF_SYM1442=LTDIE_142_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1442
	.byte 2,35,24,6
	.asciz "m_SecurityData"

LDIFF_SYM1443=LTDIE_143_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1443
	.byte 2,35,32,6
	.asciz "m_HostContext"

LDIFF_SYM1444=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1444
	.byte 2,35,40,6
	.asciz "m_IsCorrelationMgr"

LDIFF_SYM1445=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1445
	.byte 2,35,48,0,7
	.asciz "System_Runtime_Remoting_Messaging_LogicalCallContext"

LDIFF_SYM1446=LTDIE_138 - Ldebug_info_start
	.long LDIFF_SYM1446
LTDIE_138_POINTER:

	.byte 13
LDIFF_SYM1447=LTDIE_138 - Ldebug_info_start
	.long LDIFF_SYM1447
LTDIE_138_REFERENCE:

	.byte 14
LDIFF_SYM1448=LTDIE_138 - Ldebug_info_start
	.long LDIFF_SYM1448
LTDIE_145:

	.byte 5
	.asciz "System_Runtime_Remoting_Messaging_IllogicalCallContext"

	.byte 16,16
LDIFF_SYM1449=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1449
	.byte 2,35,0,0,7
	.asciz "System_Runtime_Remoting_Messaging_IllogicalCallContext"

LDIFF_SYM1450=LTDIE_145 - Ldebug_info_start
	.long LDIFF_SYM1450
LTDIE_145_POINTER:

	.byte 13
LDIFF_SYM1451=LTDIE_145 - Ldebug_info_start
	.long LDIFF_SYM1451
LTDIE_145_REFERENCE:

	.byte 14
LDIFF_SYM1452=LTDIE_145 - Ldebug_info_start
	.long LDIFF_SYM1452
LTDIE_146:

	.byte 8
	.asciz "_Flags"

	.byte 4
LDIFF_SYM1453=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1453
	.byte 9
	.asciz "None"

	.byte 0,9
	.asciz "IsNewCapture"

	.byte 1,9
	.asciz "IsFlowSuppressed"

	.byte 2,9
	.asciz "IsPreAllocatedDefault"

	.byte 4,0,7
	.asciz "_Flags"

LDIFF_SYM1454=LTDIE_146 - Ldebug_info_start
	.long LDIFF_SYM1454
LTDIE_146_POINTER:

	.byte 13
LDIFF_SYM1455=LTDIE_146 - Ldebug_info_start
	.long LDIFF_SYM1455
LTDIE_146_REFERENCE:

	.byte 14
LDIFF_SYM1456=LTDIE_146 - Ldebug_info_start
	.long LDIFF_SYM1456
LTDIE_148:

	.byte 17
	.asciz "System_Collections_Generic_IEqualityComparer`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEqualityComparer`1"

LDIFF_SYM1457=LTDIE_148 - Ldebug_info_start
	.long LDIFF_SYM1457
LTDIE_148_POINTER:

	.byte 13
LDIFF_SYM1458=LTDIE_148 - Ldebug_info_start
	.long LDIFF_SYM1458
LTDIE_148_REFERENCE:

	.byte 14
LDIFF_SYM1459=LTDIE_148 - Ldebug_info_start
	.long LDIFF_SYM1459
LTDIE_149:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM1460=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1460
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM1461=LTDIE_147_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1461
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM1462=LTDIE_149 - Ldebug_info_start
	.long LDIFF_SYM1462
LTDIE_149_POINTER:

	.byte 13
LDIFF_SYM1463=LTDIE_149 - Ldebug_info_start
	.long LDIFF_SYM1463
LTDIE_149_REFERENCE:

	.byte 14
LDIFF_SYM1464=LTDIE_149 - Ldebug_info_start
	.long LDIFF_SYM1464
LTDIE_150:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM1465=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1465
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM1466=LTDIE_147_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1466
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM1467=LTDIE_150 - Ldebug_info_start
	.long LDIFF_SYM1467
LTDIE_150_POINTER:

	.byte 13
LDIFF_SYM1468=LTDIE_150 - Ldebug_info_start
	.long LDIFF_SYM1468
LTDIE_150_REFERENCE:

	.byte 14
LDIFF_SYM1469=LTDIE_150 - Ldebug_info_start
	.long LDIFF_SYM1469
LTDIE_147:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM1470=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1470
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM1471=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1471
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM1472=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1472
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM1473=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1473
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM1474=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1474
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM1475=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1475
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM1476=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1476
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM1477=LTDIE_148_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1477
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM1478=LTDIE_149_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1478
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM1479=LTDIE_150_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1479
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM1480=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1480
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM1481=LTDIE_147 - Ldebug_info_start
	.long LDIFF_SYM1481
LTDIE_147_POINTER:

	.byte 13
LDIFF_SYM1482=LTDIE_147 - Ldebug_info_start
	.long LDIFF_SYM1482
LTDIE_147_REFERENCE:

	.byte 14
LDIFF_SYM1483=LTDIE_147 - Ldebug_info_start
	.long LDIFF_SYM1483
LTDIE_151:

	.byte 5
	.asciz "System_Collections_Generic_List`1"

	.byte 40,16
LDIFF_SYM1484=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1484
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1485=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1485
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1486=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1486
	.byte 2,35,32,6
	.asciz "_version"

LDIFF_SYM1487=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1487
	.byte 2,35,36,6
	.asciz "_syncRoot"

LDIFF_SYM1488=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1488
	.byte 2,35,24,0,7
	.asciz "System_Collections_Generic_List`1"

LDIFF_SYM1489=LTDIE_151 - Ldebug_info_start
	.long LDIFF_SYM1489
LTDIE_151_POINTER:

	.byte 13
LDIFF_SYM1490=LTDIE_151 - Ldebug_info_start
	.long LDIFF_SYM1490
LTDIE_151_REFERENCE:

	.byte 14
LDIFF_SYM1491=LTDIE_151 - Ldebug_info_start
	.long LDIFF_SYM1491
LTDIE_135:

	.byte 5
	.asciz "System_Threading_ExecutionContext"

	.byte 72,16
LDIFF_SYM1492=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1492
	.byte 2,35,0,6
	.asciz "_syncContext"

LDIFF_SYM1493=LTDIE_136_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1493
	.byte 2,35,16,6
	.asciz "_syncContextNoFlow"

LDIFF_SYM1494=LTDIE_136_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1494
	.byte 2,35,24,6
	.asciz "_logicalCallContext"

LDIFF_SYM1495=LTDIE_138_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1495
	.byte 2,35,32,6
	.asciz "_illogicalCallContext"

LDIFF_SYM1496=LTDIE_145_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1496
	.byte 2,35,40,6
	.asciz "_flags"

LDIFF_SYM1497=LTDIE_146 - Ldebug_info_start
	.long LDIFF_SYM1497
	.byte 2,35,64,6
	.asciz "_localValues"

LDIFF_SYM1498=LTDIE_147_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1498
	.byte 2,35,48,6
	.asciz "_localChangeNotifications"

LDIFF_SYM1499=LTDIE_151_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1499
	.byte 2,35,56,0,7
	.asciz "System_Threading_ExecutionContext"

LDIFF_SYM1500=LTDIE_135 - Ldebug_info_start
	.long LDIFF_SYM1500
LTDIE_135_POINTER:

	.byte 13
LDIFF_SYM1501=LTDIE_135 - Ldebug_info_start
	.long LDIFF_SYM1501
LTDIE_135_REFERENCE:

	.byte 14
LDIFF_SYM1502=LTDIE_135 - Ldebug_info_start
	.long LDIFF_SYM1502
LTDIE_156:

	.byte 5
	.asciz "System_MarshalByRefObject"

	.byte 24,16
LDIFF_SYM1503=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1503
	.byte 2,35,0,6
	.asciz "_identity"

LDIFF_SYM1504=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1504
	.byte 2,35,16,0,7
	.asciz "System_MarshalByRefObject"

LDIFF_SYM1505=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1505
LTDIE_156_POINTER:

	.byte 13
LDIFF_SYM1506=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1506
LTDIE_156_REFERENCE:

	.byte 14
LDIFF_SYM1507=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1507
LTDIE_160:

	.byte 5
	.asciz "System_Runtime_ConstrainedExecution_CriticalFinalizerObject"

	.byte 16,16
LDIFF_SYM1508=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1508
	.byte 2,35,0,0,7
	.asciz "System_Runtime_ConstrainedExecution_CriticalFinalizerObject"

LDIFF_SYM1509=LTDIE_160 - Ldebug_info_start
	.long LDIFF_SYM1509
LTDIE_160_POINTER:

	.byte 13
LDIFF_SYM1510=LTDIE_160 - Ldebug_info_start
	.long LDIFF_SYM1510
LTDIE_160_REFERENCE:

	.byte 14
LDIFF_SYM1511=LTDIE_160 - Ldebug_info_start
	.long LDIFF_SYM1511
LTDIE_159:

	.byte 5
	.asciz "System_Runtime_InteropServices_SafeHandle"

	.byte 32,16
LDIFF_SYM1512=LTDIE_160 - Ldebug_info_start
	.long LDIFF_SYM1512
	.byte 2,35,0,6
	.asciz "handle"

LDIFF_SYM1513=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1513
	.byte 2,35,16,6
	.asciz "_state"

LDIFF_SYM1514=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1514
	.byte 2,35,24,6
	.asciz "_ownsHandle"

LDIFF_SYM1515=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1515
	.byte 2,35,28,6
	.asciz "_fullyInitialized"

LDIFF_SYM1516=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1516
	.byte 2,35,29,0,7
	.asciz "System_Runtime_InteropServices_SafeHandle"

LDIFF_SYM1517=LTDIE_159 - Ldebug_info_start
	.long LDIFF_SYM1517
LTDIE_159_POINTER:

	.byte 13
LDIFF_SYM1518=LTDIE_159 - Ldebug_info_start
	.long LDIFF_SYM1518
LTDIE_159_REFERENCE:

	.byte 14
LDIFF_SYM1519=LTDIE_159 - Ldebug_info_start
	.long LDIFF_SYM1519
LTDIE_158:

	.byte 5
	.asciz "Microsoft_Win32_SafeHandles_SafeHandleZeroOrMinusOneIsInvalid"

	.byte 32,16
LDIFF_SYM1520=LTDIE_159 - Ldebug_info_start
	.long LDIFF_SYM1520
	.byte 2,35,0,0,7
	.asciz "Microsoft_Win32_SafeHandles_SafeHandleZeroOrMinusOneIsInvalid"

LDIFF_SYM1521=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1521
LTDIE_158_POINTER:

	.byte 13
LDIFF_SYM1522=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1522
LTDIE_158_REFERENCE:

	.byte 14
LDIFF_SYM1523=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1523
LTDIE_157:

	.byte 5
	.asciz "Microsoft_Win32_SafeHandles_SafeWaitHandle"

	.byte 32,16
LDIFF_SYM1524=LTDIE_158 - Ldebug_info_start
	.long LDIFF_SYM1524
	.byte 2,35,0,0,7
	.asciz "Microsoft_Win32_SafeHandles_SafeWaitHandle"

LDIFF_SYM1525=LTDIE_157 - Ldebug_info_start
	.long LDIFF_SYM1525
LTDIE_157_POINTER:

	.byte 13
LDIFF_SYM1526=LTDIE_157 - Ldebug_info_start
	.long LDIFF_SYM1526
LTDIE_157_REFERENCE:

	.byte 14
LDIFF_SYM1527=LTDIE_157 - Ldebug_info_start
	.long LDIFF_SYM1527
LTDIE_155:

	.byte 5
	.asciz "System_Threading_WaitHandle"

	.byte 48,16
LDIFF_SYM1528=LTDIE_156 - Ldebug_info_start
	.long LDIFF_SYM1528
	.byte 2,35,0,6
	.asciz "waitHandle"

LDIFF_SYM1529=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1529
	.byte 2,35,24,6
	.asciz "safeWaitHandle"

LDIFF_SYM1530=LTDIE_157_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1530
	.byte 2,35,32,6
	.asciz "hasThreadAffinity"

LDIFF_SYM1531=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1531
	.byte 2,35,40,0,7
	.asciz "System_Threading_WaitHandle"

LDIFF_SYM1532=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1532
LTDIE_155_POINTER:

	.byte 13
LDIFF_SYM1533=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1533
LTDIE_155_REFERENCE:

	.byte 14
LDIFF_SYM1534=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1534
LTDIE_154:

	.byte 5
	.asciz "System_Threading_EventWaitHandle"

	.byte 48,16
LDIFF_SYM1535=LTDIE_155 - Ldebug_info_start
	.long LDIFF_SYM1535
	.byte 2,35,0,0,7
	.asciz "System_Threading_EventWaitHandle"

LDIFF_SYM1536=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1536
LTDIE_154_POINTER:

	.byte 13
LDIFF_SYM1537=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1537
LTDIE_154_REFERENCE:

	.byte 14
LDIFF_SYM1538=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1538
LTDIE_153:

	.byte 5
	.asciz "System_Threading_ManualResetEvent"

	.byte 48,16
LDIFF_SYM1539=LTDIE_154 - Ldebug_info_start
	.long LDIFF_SYM1539
	.byte 2,35,0,0,7
	.asciz "System_Threading_ManualResetEvent"

LDIFF_SYM1540=LTDIE_153 - Ldebug_info_start
	.long LDIFF_SYM1540
LTDIE_153_POINTER:

	.byte 13
LDIFF_SYM1541=LTDIE_153 - Ldebug_info_start
	.long LDIFF_SYM1541
LTDIE_153_REFERENCE:

	.byte 14
LDIFF_SYM1542=LTDIE_153 - Ldebug_info_start
	.long LDIFF_SYM1542
LTDIE_152:

	.byte 5
	.asciz "System_Threading_ManualResetEventSlim"

	.byte 40,16
LDIFF_SYM1543=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1543
	.byte 2,35,0,6
	.asciz "m_lock"

LDIFF_SYM1544=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1544
	.byte 2,35,16,6
	.asciz "m_eventObj"

LDIFF_SYM1545=LTDIE_153_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1545
	.byte 2,35,24,6
	.asciz "m_combinedState"

LDIFF_SYM1546=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1546
	.byte 2,35,32,0,7
	.asciz "System_Threading_ManualResetEventSlim"

LDIFF_SYM1547=LTDIE_152 - Ldebug_info_start
	.long LDIFF_SYM1547
LTDIE_152_POINTER:

	.byte 13
LDIFF_SYM1548=LTDIE_152 - Ldebug_info_start
	.long LDIFF_SYM1548
LTDIE_152_REFERENCE:

	.byte 14
LDIFF_SYM1549=LTDIE_152 - Ldebug_info_start
	.long LDIFF_SYM1549
LTDIE_163:

	.byte 5
	.asciz "System_Collections_Generic_LowLevelList`1"

	.byte 32,16
LDIFF_SYM1550=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1550
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1551=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1551
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1552=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1552
	.byte 2,35,24,6
	.asciz "_version"

LDIFF_SYM1553=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1553
	.byte 2,35,28,0,7
	.asciz "System_Collections_Generic_LowLevelList`1"

LDIFF_SYM1554=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1554
LTDIE_163_POINTER:

	.byte 13
LDIFF_SYM1555=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1555
LTDIE_163_REFERENCE:

	.byte 14
LDIFF_SYM1556=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1556
LTDIE_162:

	.byte 5
	.asciz "System_Collections_Generic_LowLevelListWithIList`1"

	.byte 32,16
LDIFF_SYM1557=LTDIE_163 - Ldebug_info_start
	.long LDIFF_SYM1557
	.byte 2,35,0,0,7
	.asciz "System_Collections_Generic_LowLevelListWithIList`1"

LDIFF_SYM1558=LTDIE_162 - Ldebug_info_start
	.long LDIFF_SYM1558
LTDIE_162_POINTER:

	.byte 13
LDIFF_SYM1559=LTDIE_162 - Ldebug_info_start
	.long LDIFF_SYM1559
LTDIE_162_REFERENCE:

	.byte 14
LDIFF_SYM1560=LTDIE_162 - Ldebug_info_start
	.long LDIFF_SYM1560
LTDIE_166:

	.byte 17
	.asciz "System_Collections_IDictionary"

	.byte 16,7
	.asciz "System_Collections_IDictionary"

LDIFF_SYM1561=LTDIE_166 - Ldebug_info_start
	.long LDIFF_SYM1561
LTDIE_166_POINTER:

	.byte 13
LDIFF_SYM1562=LTDIE_166 - Ldebug_info_start
	.long LDIFF_SYM1562
LTDIE_166_REFERENCE:

	.byte 14
LDIFF_SYM1563=LTDIE_166 - Ldebug_info_start
	.long LDIFF_SYM1563
LTDIE_168:

	.byte 17
	.asciz "System_Collections_Generic_IList`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IList`1"

LDIFF_SYM1564=LTDIE_168 - Ldebug_info_start
	.long LDIFF_SYM1564
LTDIE_168_POINTER:

	.byte 13
LDIFF_SYM1565=LTDIE_168 - Ldebug_info_start
	.long LDIFF_SYM1565
LTDIE_168_REFERENCE:

	.byte 14
LDIFF_SYM1566=LTDIE_168 - Ldebug_info_start
	.long LDIFF_SYM1566
LTDIE_171:

	.byte 5
	.asciz "_KeyCollection"

	.byte 24,16
LDIFF_SYM1567=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1567
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM1568=LTDIE_170_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1568
	.byte 2,35,16,0,7
	.asciz "_KeyCollection"

LDIFF_SYM1569=LTDIE_171 - Ldebug_info_start
	.long LDIFF_SYM1569
LTDIE_171_POINTER:

	.byte 13
LDIFF_SYM1570=LTDIE_171 - Ldebug_info_start
	.long LDIFF_SYM1570
LTDIE_171_REFERENCE:

	.byte 14
LDIFF_SYM1571=LTDIE_171 - Ldebug_info_start
	.long LDIFF_SYM1571
LTDIE_172:

	.byte 5
	.asciz "_ValueCollection"

	.byte 24,16
LDIFF_SYM1572=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1572
	.byte 2,35,0,6
	.asciz "_dictionary"

LDIFF_SYM1573=LTDIE_170_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1573
	.byte 2,35,16,0,7
	.asciz "_ValueCollection"

LDIFF_SYM1574=LTDIE_172 - Ldebug_info_start
	.long LDIFF_SYM1574
LTDIE_172_POINTER:

	.byte 13
LDIFF_SYM1575=LTDIE_172 - Ldebug_info_start
	.long LDIFF_SYM1575
LTDIE_172_REFERENCE:

	.byte 14
LDIFF_SYM1576=LTDIE_172 - Ldebug_info_start
	.long LDIFF_SYM1576
LTDIE_170:

	.byte 5
	.asciz "System_Collections_Generic_Dictionary`2"

	.byte 80,16
LDIFF_SYM1577=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1577
	.byte 2,35,0,6
	.asciz "_buckets"

LDIFF_SYM1578=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1578
	.byte 2,35,16,6
	.asciz "_entries"

LDIFF_SYM1579=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1579
	.byte 2,35,24,6
	.asciz "_count"

LDIFF_SYM1580=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1580
	.byte 2,35,64,6
	.asciz "_freeList"

LDIFF_SYM1581=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1581
	.byte 2,35,68,6
	.asciz "_freeCount"

LDIFF_SYM1582=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1582
	.byte 2,35,72,6
	.asciz "_version"

LDIFF_SYM1583=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1583
	.byte 2,35,76,6
	.asciz "_comparer"

LDIFF_SYM1584=LTDIE_64_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1584
	.byte 2,35,32,6
	.asciz "_keys"

LDIFF_SYM1585=LTDIE_171_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1585
	.byte 2,35,40,6
	.asciz "_values"

LDIFF_SYM1586=LTDIE_172_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1586
	.byte 2,35,48,6
	.asciz "_syncRoot"

LDIFF_SYM1587=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1587
	.byte 2,35,56,0,7
	.asciz "System_Collections_Generic_Dictionary`2"

LDIFF_SYM1588=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1588
LTDIE_170_POINTER:

	.byte 13
LDIFF_SYM1589=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1589
LTDIE_170_REFERENCE:

	.byte 14
LDIFF_SYM1590=LTDIE_170 - Ldebug_info_start
	.long LDIFF_SYM1590
LTDIE_173:

	.byte 17
	.asciz "System_Runtime_Serialization_IFormatterConverter"

	.byte 16,7
	.asciz "System_Runtime_Serialization_IFormatterConverter"

LDIFF_SYM1591=LTDIE_173 - Ldebug_info_start
	.long LDIFF_SYM1591
LTDIE_173_POINTER:

	.byte 13
LDIFF_SYM1592=LTDIE_173 - Ldebug_info_start
	.long LDIFF_SYM1592
LTDIE_173_REFERENCE:

	.byte 14
LDIFF_SYM1593=LTDIE_173 - Ldebug_info_start
	.long LDIFF_SYM1593
LTDIE_169:

	.byte 5
	.asciz "System_Runtime_Serialization_SerializationInfo"

	.byte 88,16
LDIFF_SYM1594=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1594
	.byte 2,35,0,6
	.asciz "m_members"

LDIFF_SYM1595=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1595
	.byte 2,35,16,6
	.asciz "m_data"

LDIFF_SYM1596=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1596
	.byte 2,35,24,6
	.asciz "m_types"

LDIFF_SYM1597=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1597
	.byte 2,35,32,6
	.asciz "m_nameToIndex"

LDIFF_SYM1598=LTDIE_170_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1598
	.byte 2,35,40,6
	.asciz "m_currMember"

LDIFF_SYM1599=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1599
	.byte 2,35,80,6
	.asciz "m_converter"

LDIFF_SYM1600=LTDIE_173_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1600
	.byte 2,35,48,6
	.asciz "m_fullTypeName"

LDIFF_SYM1601=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1601
	.byte 2,35,56,6
	.asciz "m_assemName"

LDIFF_SYM1602=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1602
	.byte 2,35,64,6
	.asciz "objectType"

LDIFF_SYM1603=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1603
	.byte 2,35,72,6
	.asciz "isFullTypeNameSetExplicit"

LDIFF_SYM1604=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1604
	.byte 2,35,84,6
	.asciz "isAssemblyNameSetExplicit"

LDIFF_SYM1605=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1605
	.byte 2,35,85,6
	.asciz "requireSameTokenInPartialTrust"

LDIFF_SYM1606=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1606
	.byte 2,35,86,0,7
	.asciz "System_Runtime_Serialization_SerializationInfo"

LDIFF_SYM1607=LTDIE_169 - Ldebug_info_start
	.long LDIFF_SYM1607
LTDIE_169_POINTER:

	.byte 13
LDIFF_SYM1608=LTDIE_169 - Ldebug_info_start
	.long LDIFF_SYM1608
LTDIE_169_REFERENCE:

	.byte 14
LDIFF_SYM1609=LTDIE_169 - Ldebug_info_start
	.long LDIFF_SYM1609
LTDIE_175:

	.byte 5
	.asciz "System_Reflection_TypeInfo"

	.byte 24,16
LDIFF_SYM1610=LTDIE_24 - Ldebug_info_start
	.long LDIFF_SYM1610
	.byte 2,35,0,0,7
	.asciz "System_Reflection_TypeInfo"

LDIFF_SYM1611=LTDIE_175 - Ldebug_info_start
	.long LDIFF_SYM1611
LTDIE_175_POINTER:

	.byte 13
LDIFF_SYM1612=LTDIE_175 - Ldebug_info_start
	.long LDIFF_SYM1612
LTDIE_175_REFERENCE:

	.byte 14
LDIFF_SYM1613=LTDIE_175 - Ldebug_info_start
	.long LDIFF_SYM1613
LTDIE_178:

	.byte 5
	.asciz "System_Reflection_ConstructorInfo"

	.byte 16,16
LDIFF_SYM1614=LTDIE_21 - Ldebug_info_start
	.long LDIFF_SYM1614
	.byte 2,35,0,0,7
	.asciz "System_Reflection_ConstructorInfo"

LDIFF_SYM1615=LTDIE_178 - Ldebug_info_start
	.long LDIFF_SYM1615
LTDIE_178_POINTER:

	.byte 13
LDIFF_SYM1616=LTDIE_178 - Ldebug_info_start
	.long LDIFF_SYM1616
LTDIE_178_REFERENCE:

	.byte 14
LDIFF_SYM1617=LTDIE_178 - Ldebug_info_start
	.long LDIFF_SYM1617
LTDIE_177:

	.byte 5
	.asciz "System_Reflection_RuntimeConstructorInfo"

	.byte 40,16
LDIFF_SYM1618=LTDIE_178 - Ldebug_info_start
	.long LDIFF_SYM1618
	.byte 2,35,0,6
	.asciz "mhandle"

LDIFF_SYM1619=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1619
	.byte 2,35,16,6
	.asciz "name"

LDIFF_SYM1620=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1620
	.byte 2,35,24,6
	.asciz "reftype"

LDIFF_SYM1621=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1621
	.byte 2,35,32,0,7
	.asciz "System_Reflection_RuntimeConstructorInfo"

LDIFF_SYM1622=LTDIE_177 - Ldebug_info_start
	.long LDIFF_SYM1622
LTDIE_177_POINTER:

	.byte 13
LDIFF_SYM1623=LTDIE_177 - Ldebug_info_start
	.long LDIFF_SYM1623
LTDIE_177_REFERENCE:

	.byte 14
LDIFF_SYM1624=LTDIE_177 - Ldebug_info_start
	.long LDIFF_SYM1624
LTDIE_176:

	.byte 5
	.asciz "System_MonoTypeInfo"

	.byte 32,16
LDIFF_SYM1625=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1625
	.byte 2,35,0,6
	.asciz "full_name"

LDIFF_SYM1626=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1626
	.byte 2,35,16,6
	.asciz "default_ctor"

LDIFF_SYM1627=LTDIE_177_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1627
	.byte 2,35,24,0,7
	.asciz "System_MonoTypeInfo"

LDIFF_SYM1628=LTDIE_176 - Ldebug_info_start
	.long LDIFF_SYM1628
LTDIE_176_POINTER:

	.byte 13
LDIFF_SYM1629=LTDIE_176 - Ldebug_info_start
	.long LDIFF_SYM1629
LTDIE_176_REFERENCE:

	.byte 14
LDIFF_SYM1630=LTDIE_176 - Ldebug_info_start
	.long LDIFF_SYM1630
LTDIE_174:

	.byte 5
	.asciz "System_RuntimeType"

	.byte 48,16
LDIFF_SYM1631=LTDIE_175 - Ldebug_info_start
	.long LDIFF_SYM1631
	.byte 2,35,0,6
	.asciz "type_info"

LDIFF_SYM1632=LTDIE_176_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1632
	.byte 2,35,24,6
	.asciz "GenericCache"

LDIFF_SYM1633=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1633
	.byte 2,35,32,6
	.asciz "m_serializationCtor"

LDIFF_SYM1634=LTDIE_177_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1634
	.byte 2,35,40,0,7
	.asciz "System_RuntimeType"

LDIFF_SYM1635=LTDIE_174 - Ldebug_info_start
	.long LDIFF_SYM1635
LTDIE_174_POINTER:

	.byte 13
LDIFF_SYM1636=LTDIE_174 - Ldebug_info_start
	.long LDIFF_SYM1636
LTDIE_174_REFERENCE:

	.byte 14
LDIFF_SYM1637=LTDIE_174 - Ldebug_info_start
	.long LDIFF_SYM1637
LTDIE_179:

	.byte 5
	.asciz "System_EventHandler`1"

	.byte 128,1,16
LDIFF_SYM1638=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM1638
	.byte 2,35,0,0,7
	.asciz "System_EventHandler`1"

LDIFF_SYM1639=LTDIE_179 - Ldebug_info_start
	.long LDIFF_SYM1639
LTDIE_179_POINTER:

	.byte 13
LDIFF_SYM1640=LTDIE_179 - Ldebug_info_start
	.long LDIFF_SYM1640
LTDIE_179_REFERENCE:

	.byte 14
LDIFF_SYM1641=LTDIE_179 - Ldebug_info_start
	.long LDIFF_SYM1641
LTDIE_167:

	.byte 5
	.asciz "System_Runtime_Serialization_SafeSerializationManager"

	.byte 56,16
LDIFF_SYM1642=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1642
	.byte 2,35,0,6
	.asciz "m_serializedStates"

LDIFF_SYM1643=LTDIE_168_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1643
	.byte 2,35,16,6
	.asciz "m_savedSerializationInfo"

LDIFF_SYM1644=LTDIE_169_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1644
	.byte 2,35,24,6
	.asciz "m_realObject"

LDIFF_SYM1645=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1645
	.byte 2,35,32,6
	.asciz "m_realType"

LDIFF_SYM1646=LTDIE_174_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1646
	.byte 2,35,40,6
	.asciz "SerializeObjectState"

LDIFF_SYM1647=LTDIE_179_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1647
	.byte 2,35,48,0,7
	.asciz "System_Runtime_Serialization_SafeSerializationManager"

LDIFF_SYM1648=LTDIE_167 - Ldebug_info_start
	.long LDIFF_SYM1648
LTDIE_167_POINTER:

	.byte 13
LDIFF_SYM1649=LTDIE_167 - Ldebug_info_start
	.long LDIFF_SYM1649
LTDIE_167_REFERENCE:

	.byte 14
LDIFF_SYM1650=LTDIE_167 - Ldebug_info_start
	.long LDIFF_SYM1650
LTDIE_165:

	.byte 5
	.asciz "System_Exception"

	.byte 144,1,16
LDIFF_SYM1651=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1651
	.byte 2,35,0,6
	.asciz "_className"

LDIFF_SYM1652=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1652
	.byte 2,35,16,6
	.asciz "_message"

LDIFF_SYM1653=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1653
	.byte 2,35,24,6
	.asciz "_data"

LDIFF_SYM1654=LTDIE_166_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1654
	.byte 2,35,32,6
	.asciz "_innerException"

LDIFF_SYM1655=LTDIE_165_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1655
	.byte 2,35,40,6
	.asciz "_helpURL"

LDIFF_SYM1656=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1656
	.byte 2,35,48,6
	.asciz "_stackTrace"

LDIFF_SYM1657=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1657
	.byte 2,35,56,6
	.asciz "_stackTraceString"

LDIFF_SYM1658=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1658
	.byte 2,35,64,6
	.asciz "_remoteStackTraceString"

LDIFF_SYM1659=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1659
	.byte 2,35,72,6
	.asciz "_remoteStackIndex"

LDIFF_SYM1660=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1660
	.byte 2,35,80,6
	.asciz "_dynamicMethods"

LDIFF_SYM1661=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1661
	.byte 2,35,88,6
	.asciz "_HResult"

LDIFF_SYM1662=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1662
	.byte 2,35,96,6
	.asciz "_source"

LDIFF_SYM1663=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1663
	.byte 2,35,104,6
	.asciz "_safeSerializationManager"

LDIFF_SYM1664=LTDIE_167_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1664
	.byte 2,35,112,6
	.asciz "captured_traces"

LDIFF_SYM1665=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1665
	.byte 2,35,120,6
	.asciz "native_trace_ips"

LDIFF_SYM1666=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1666
	.byte 3,35,128,1,6
	.asciz "caught_in_unmanaged"

LDIFF_SYM1667=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1667
	.byte 3,35,136,1,0,7
	.asciz "System_Exception"

LDIFF_SYM1668=LTDIE_165 - Ldebug_info_start
	.long LDIFF_SYM1668
LTDIE_165_POINTER:

	.byte 13
LDIFF_SYM1669=LTDIE_165 - Ldebug_info_start
	.long LDIFF_SYM1669
LTDIE_165_REFERENCE:

	.byte 14
LDIFF_SYM1670=LTDIE_165 - Ldebug_info_start
	.long LDIFF_SYM1670
LTDIE_164:

	.byte 5
	.asciz "System_Runtime_ExceptionServices_ExceptionDispatchInfo"

	.byte 32,16
LDIFF_SYM1671=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1671
	.byte 2,35,0,6
	.asciz "m_Exception"

LDIFF_SYM1672=LTDIE_165_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1672
	.byte 2,35,16,6
	.asciz "m_stackTrace"

LDIFF_SYM1673=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1673
	.byte 2,35,24,0,7
	.asciz "System_Runtime_ExceptionServices_ExceptionDispatchInfo"

LDIFF_SYM1674=LTDIE_164 - Ldebug_info_start
	.long LDIFF_SYM1674
LTDIE_164_POINTER:

	.byte 13
LDIFF_SYM1675=LTDIE_164 - Ldebug_info_start
	.long LDIFF_SYM1675
LTDIE_164_REFERENCE:

	.byte 14
LDIFF_SYM1676=LTDIE_164 - Ldebug_info_start
	.long LDIFF_SYM1676
LTDIE_161:

	.byte 5
	.asciz "System_Threading_Tasks_TaskExceptionHolder"

	.byte 48,16
LDIFF_SYM1677=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1677
	.byte 2,35,0,6
	.asciz "m_task"

LDIFF_SYM1678=LTDIE_132_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1678
	.byte 2,35,16,6
	.asciz "m_faultExceptions"

LDIFF_SYM1679=LTDIE_162_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1679
	.byte 2,35,24,6
	.asciz "m_cancellationException"

LDIFF_SYM1680=LTDIE_164_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1680
	.byte 2,35,32,6
	.asciz "m_isHandled"

LDIFF_SYM1681=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1681
	.byte 2,35,40,0,7
	.asciz "System_Threading_Tasks_TaskExceptionHolder"

LDIFF_SYM1682=LTDIE_161 - Ldebug_info_start
	.long LDIFF_SYM1682
LTDIE_161_POINTER:

	.byte 13
LDIFF_SYM1683=LTDIE_161 - Ldebug_info_start
	.long LDIFF_SYM1683
LTDIE_161_REFERENCE:

	.byte 14
LDIFF_SYM1684=LTDIE_161 - Ldebug_info_start
	.long LDIFF_SYM1684
LTDIE_181:

	.byte 5
	.asciz "System_Collections_Generic_LowLevelList`1"

	.byte 32,16
LDIFF_SYM1685=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1685
	.byte 2,35,0,6
	.asciz "_items"

LDIFF_SYM1686=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1686
	.byte 2,35,16,6
	.asciz "_size"

LDIFF_SYM1687=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1687
	.byte 2,35,24,6
	.asciz "_version"

LDIFF_SYM1688=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1688
	.byte 2,35,28,0,7
	.asciz "System_Collections_Generic_LowLevelList`1"

LDIFF_SYM1689=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1689
LTDIE_181_POINTER:

	.byte 13
LDIFF_SYM1690=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1690
LTDIE_181_REFERENCE:

	.byte 14
LDIFF_SYM1691=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1691
LTDIE_180:

	.byte 5
	.asciz "System_Collections_Generic_LowLevelListWithIList`1"

	.byte 32,16
LDIFF_SYM1692=LTDIE_181 - Ldebug_info_start
	.long LDIFF_SYM1692
	.byte 2,35,0,0,7
	.asciz "System_Collections_Generic_LowLevelListWithIList`1"

LDIFF_SYM1693=LTDIE_180 - Ldebug_info_start
	.long LDIFF_SYM1693
LTDIE_180_POINTER:

	.byte 13
LDIFF_SYM1694=LTDIE_180 - Ldebug_info_start
	.long LDIFF_SYM1694
LTDIE_180_REFERENCE:

	.byte 14
LDIFF_SYM1695=LTDIE_180 - Ldebug_info_start
	.long LDIFF_SYM1695
LTDIE_134:

	.byte 5
	.asciz "_ContingentProperties"

	.byte 72,16
LDIFF_SYM1696=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1696
	.byte 2,35,0,6
	.asciz "m_capturedContext"

LDIFF_SYM1697=LTDIE_135_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1697
	.byte 2,35,16,6
	.asciz "m_completionEvent"

LDIFF_SYM1698=LTDIE_152_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1698
	.byte 2,35,24,6
	.asciz "m_exceptionsHolder"

LDIFF_SYM1699=LTDIE_161_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1699
	.byte 2,35,32,6
	.asciz "m_cancellationToken"

LDIFF_SYM1700=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1700
	.byte 2,35,40,6
	.asciz "m_cancellationRegistration"

LDIFF_SYM1701=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1701
	.byte 2,35,48,6
	.asciz "m_internalCancellationRequested"

LDIFF_SYM1702=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1702
	.byte 2,35,64,6
	.asciz "m_completionCountdown"

LDIFF_SYM1703=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1703
	.byte 2,35,68,6
	.asciz "m_exceptionalChildren"

LDIFF_SYM1704=LTDIE_180_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1704
	.byte 2,35,56,0,7
	.asciz "_ContingentProperties"

LDIFF_SYM1705=LTDIE_134 - Ldebug_info_start
	.long LDIFF_SYM1705
LTDIE_134_POINTER:

	.byte 13
LDIFF_SYM1706=LTDIE_134 - Ldebug_info_start
	.long LDIFF_SYM1706
LTDIE_134_REFERENCE:

	.byte 14
LDIFF_SYM1707=LTDIE_134 - Ldebug_info_start
	.long LDIFF_SYM1707
LTDIE_132:

	.byte 5
	.asciz "System_Threading_Tasks_Task"

	.byte 72,16
LDIFF_SYM1708=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM1708
	.byte 2,35,0,6
	.asciz "m_taskId"

LDIFF_SYM1709=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1709
	.byte 2,35,64,6
	.asciz "m_action"

LDIFF_SYM1710=LTDIE_19_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1710
	.byte 2,35,16,6
	.asciz "m_stateObject"

LDIFF_SYM1711=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1711
	.byte 2,35,24,6
	.asciz "m_taskScheduler"

LDIFF_SYM1712=LTDIE_133_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1712
	.byte 2,35,32,6
	.asciz "m_parent"

LDIFF_SYM1713=LTDIE_132_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1713
	.byte 2,35,40,6
	.asciz "m_stateFlags"

LDIFF_SYM1714=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1714
	.byte 2,35,68,6
	.asciz "m_continuationObject"

LDIFF_SYM1715=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1715
	.byte 2,35,48,6
	.asciz "m_contingentProperties"

LDIFF_SYM1716=LTDIE_134_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1716
	.byte 2,35,56,0,7
	.asciz "System_Threading_Tasks_Task"

LDIFF_SYM1717=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM1717
LTDIE_132_POINTER:

	.byte 13
LDIFF_SYM1718=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM1718
LTDIE_132_REFERENCE:

	.byte 14
LDIFF_SYM1719=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM1719
LTDIE_182:

	.byte 17
	.asciz "System_Collections_Generic_IEnumerable`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEnumerable`1"

LDIFF_SYM1720=LTDIE_182 - Ldebug_info_start
	.long LDIFF_SYM1720
LTDIE_182_POINTER:

	.byte 13
LDIFF_SYM1721=LTDIE_182 - Ldebug_info_start
	.long LDIFF_SYM1721
LTDIE_182_REFERENCE:

	.byte 14
LDIFF_SYM1722=LTDIE_182 - Ldebug_info_start
	.long LDIFF_SYM1722
LTDIE_131:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM1723=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM1723
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM1724=LTDIE_182_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1724
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM1725=LTDIE_131 - Ldebug_info_start
	.long LDIFF_SYM1725
LTDIE_131_POINTER:

	.byte 13
LDIFF_SYM1726=LTDIE_131 - Ldebug_info_start
	.long LDIFF_SYM1726
LTDIE_131_REFERENCE:

	.byte 14
LDIFF_SYM1727=LTDIE_131 - Ldebug_info_start
	.long LDIFF_SYM1727
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<Xamarin.Forms.Maps.Position,_System.Threading.Tasks.Task`1<System.Collections.Generic.IEnumerable`1<string>>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position
	.quad Lme_a0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1728=LTDIE_129_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1728
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM1729=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1729
	.byte 2,141,48,11
	.asciz "V_0"

LDIFF_SYM1730=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1730
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1731=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1731
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM1732=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1732
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM1733=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1733
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM1734=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1734
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM1735=LTDIE_131_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1735
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1736=Lfde155_end - Lfde155_start
	.long LDIFF_SYM1736
Lfde155_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position

LDIFF_SYM1737=Lme_a0 - wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Position_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1737
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11
	.align 3
Lfde155_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_183:

	.byte 5
	.asciz "System_Func`2"

	.byte 128,1,16
LDIFF_SYM1738=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM1738
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1739=LTDIE_183 - Ldebug_info_start
	.long LDIFF_SYM1739
LTDIE_183_POINTER:

	.byte 13
LDIFF_SYM1740=LTDIE_183 - Ldebug_info_start
	.long LDIFF_SYM1740
LTDIE_183_REFERENCE:

	.byte 14
LDIFF_SYM1741=LTDIE_183 - Ldebug_info_start
	.long LDIFF_SYM1741
LTDIE_185:

	.byte 17
	.asciz "System_Collections_Generic_IEnumerable`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEnumerable`1"

LDIFF_SYM1742=LTDIE_185 - Ldebug_info_start
	.long LDIFF_SYM1742
LTDIE_185_POINTER:

	.byte 13
LDIFF_SYM1743=LTDIE_185 - Ldebug_info_start
	.long LDIFF_SYM1743
LTDIE_185_REFERENCE:

	.byte 14
LDIFF_SYM1744=LTDIE_185 - Ldebug_info_start
	.long LDIFF_SYM1744
LTDIE_184:

	.byte 5
	.asciz "System_Threading_Tasks_Task`1"

	.byte 80,16
LDIFF_SYM1745=LTDIE_132 - Ldebug_info_start
	.long LDIFF_SYM1745
	.byte 2,35,0,6
	.asciz "m_result"

LDIFF_SYM1746=LTDIE_185_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1746
	.byte 2,35,72,0,7
	.asciz "System_Threading_Tasks_Task`1"

LDIFF_SYM1747=LTDIE_184 - Ldebug_info_start
	.long LDIFF_SYM1747
LTDIE_184_POINTER:

	.byte 13
LDIFF_SYM1748=LTDIE_184 - Ldebug_info_start
	.long LDIFF_SYM1748
LTDIE_184_REFERENCE:

	.byte 14
LDIFF_SYM1749=LTDIE_184 - Ldebug_info_start
	.long LDIFF_SYM1749
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<string,_System.Threading.Tasks.Task`1<System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string
	.quad Lme_a1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1750=LTDIE_183_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1750
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1751=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1751
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1752=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1752
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1753=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1753
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1754=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1754
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1755=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1755
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1756=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1756
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1757=LTDIE_184_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1757
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1758=Lfde156_end - Lfde156_start
	.long LDIFF_SYM1758
Lfde156_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string

LDIFF_SYM1759=Lme_a1 - wrapper_delegate_invoke_System_Func_2_string_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_string
	.long LDIFF_SYM1759
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde156_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_186:

	.byte 5
	.asciz "_InternalEnumerator`1"

	.byte 32,16
LDIFF_SYM1760=LTDIE_12 - Ldebug_info_start
	.long LDIFF_SYM1760
	.byte 2,35,0,6
	.asciz "array"

LDIFF_SYM1761=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1761
	.byte 2,35,16,6
	.asciz "idx"

LDIFF_SYM1762=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1762
	.byte 2,35,24,0,7
	.asciz "_InternalEnumerator`1"

LDIFF_SYM1763=LTDIE_186 - Ldebug_info_start
	.long LDIFF_SYM1763
LTDIE_186_POINTER:

	.byte 13
LDIFF_SYM1764=LTDIE_186 - Ldebug_info_start
	.long LDIFF_SYM1764
LTDIE_186_REFERENCE:

	.byte 14
LDIFF_SYM1765=LTDIE_186 - Ldebug_info_start
	.long LDIFF_SYM1765
	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array"

	.byte 1,250,1
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
	.quad Lme_a3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1766=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1766
	.byte 1,105,3
	.asciz "array"

LDIFF_SYM1767=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1767
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1768=Lfde157_end - Lfde157_start
	.long LDIFF_SYM1768
Lfde157_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array

LDIFF_SYM1769=Lme_a3 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor_System_Array
	.long LDIFF_SYM1769
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2
	.align 3
Lfde157_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:Dispose"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose"

	.byte 1,128,2
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
	.quad Lme_a4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1770=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1770
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1771=Lfde158_end - Lfde158_start
	.long LDIFF_SYM1771
Lfde158_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose

LDIFF_SYM1772=Lme_a4 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
	.long LDIFF_SYM1772
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde158_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 1,132,2
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_a5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1773=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1773
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1774=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1774
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1775=Lfde159_end - Lfde159_start
	.long LDIFF_SYM1775
Lfde159_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM1776=Lme_a5 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM1776
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2,154,1
	.align 3
Lfde159_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:get_Current"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current"

	.byte 1,140,2
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
	.quad Lme_a6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1777=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1777
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1778=Lfde160_end - Lfde160_start
	.long LDIFF_SYM1778
Lfde160_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current

LDIFF_SYM1779=Lme_a6 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
	.long LDIFF_SYM1779
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,154,10
	.align 3
Lfde160_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.Reset"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset"

	.byte 1,151,2
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.quad Lme_a7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1780=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1780
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1781=Lfde161_end - Lfde161_start
	.long LDIFF_SYM1781
Lfde161_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset

LDIFF_SYM1782=Lme_a7 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.long LDIFF_SYM1782
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde161_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/InternalEnumerator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.get_Current"
	.asciz "System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current"

	.byte 1,156,2
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.quad Lme_a8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1783=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM1783
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1784=Lfde162_end - Lfde162_start
	.long LDIFF_SYM1784
Lfde162_start:

	.long 0
	.align 3
	.quad System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current

LDIFF_SYM1785=Lme_a8 - System_Array_InternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.long LDIFF_SYM1785
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde162_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__IEnumerable_GetEnumerator<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position"

	.byte 1,84
	.quad System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position
	.quad Lme_a9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1786=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1786
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1787=Lfde163_end - Lfde163_start
	.long LDIFF_SYM1787
Lfde163_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position

LDIFF_SYM1788=Lme_a9 - System_Array_InternalArray__IEnumerable_GetEnumerator_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1788
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde163_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Add<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 1,97
	.quad System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_b1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1789=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1789
	.byte 0,3
	.asciz "item"

LDIFF_SYM1790=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1790
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1791=Lfde164_end - Lfde164_start
	.long LDIFF_SYM1791
Lfde164_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM1792=Lme_b1 - System_Array_InternalArray__ICollection_Add_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1792
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde164_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Remove<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 1,102
	.quad System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_b2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1793=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1793
	.byte 0,3
	.asciz "item"

LDIFF_SYM1794=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1794
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1795=Lfde165_end - Lfde165_start
	.long LDIFF_SYM1795
Lfde165_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM1796=Lme_b2 - System_Array_InternalArray__ICollection_Remove_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1796
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde165_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_Contains<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 1,107
	.quad System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_b3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1797=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1797
	.byte 1,106,3
	.asciz "item"

LDIFF_SYM1798=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1798
	.byte 2,141,40,11
	.asciz "length"

LDIFF_SYM1799=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1799
	.byte 1,105,11
	.asciz "i"

LDIFF_SYM1800=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1800
	.byte 1,104,11
	.asciz "value"

LDIFF_SYM1801=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1801
	.byte 3,141,248,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1802=Lfde166_end - Lfde166_start
	.long LDIFF_SYM1802
Lfde166_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM1803=Lme_b3 - System_Array_InternalArray__ICollection_Contains_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1803
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,152,16,153,15,68,154,14
	.align 3
Lfde166_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__ICollection_CopyTo<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int"

	.byte 1,133,1
	.quad System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int
	.quad Lme_b4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1804=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1804
	.byte 1,104,3
	.asciz "array"

LDIFF_SYM1805=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM1805
	.byte 2,141,32,3
	.asciz "arrayIndex"

LDIFF_SYM1806=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1806
	.byte 2,141,40,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1807=Lfde167_end - Lfde167_start
	.long LDIFF_SYM1807
Lfde167_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int

LDIFF_SYM1808=Lme_b4 - System_Array_InternalArray__ICollection_CopyTo_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position___int
	.long LDIFF_SYM1808
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,150,6,68,152,5
	.align 3
Lfde167_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_187:

	.byte 5
	.asciz "System_Action`1"

	.byte 128,1,16
LDIFF_SYM1809=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM1809
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM1810=LTDIE_187 - Ldebug_info_start
	.long LDIFF_SYM1810
LTDIE_187_POINTER:

	.byte 13
LDIFF_SYM1811=LTDIE_187 - Ldebug_info_start
	.long LDIFF_SYM1811
LTDIE_187_REFERENCE:

	.byte 14
LDIFF_SYM1812=LTDIE_187 - Ldebug_info_start
	.long LDIFF_SYM1812
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<Xamarin.Forms.Maps.Position>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position
	.quad Lme_b9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1813=LTDIE_187_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1813
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM1814=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1814
	.byte 2,141,48,11
	.asciz "V_0"

LDIFF_SYM1815=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1815
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1816=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1816
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM1817=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1817
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM1818=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1818
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM1819=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1819
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1820=Lfde168_end - Lfde168_start
	.long LDIFF_SYM1820
Lfde168_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position

LDIFF_SYM1821=Lme_b9 - wrapper_delegate_invoke_System_Action_1_Xamarin_Forms_Maps_Position_invoke_void_T_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1821
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11
	.align 3
Lfde168_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_188:

	.byte 5
	.asciz "System_Predicate`1"

	.byte 128,1,16
LDIFF_SYM1822=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM1822
	.byte 2,35,0,0,7
	.asciz "System_Predicate`1"

LDIFF_SYM1823=LTDIE_188 - Ldebug_info_start
	.long LDIFF_SYM1823
LTDIE_188_POINTER:

	.byte 13
LDIFF_SYM1824=LTDIE_188 - Ldebug_info_start
	.long LDIFF_SYM1824
LTDIE_188_REFERENCE:

	.byte 14
LDIFF_SYM1825=LTDIE_188 - Ldebug_info_start
	.long LDIFF_SYM1825
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Predicate`1<Xamarin.Forms.Maps.Position>:invoke_bool_T"
	.asciz "wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position
	.quad Lme_bf

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1826=LTDIE_188_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1826
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM1827=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1827
	.byte 2,141,48,11
	.asciz "V_0"

LDIFF_SYM1828=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1828
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1829=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1829
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM1830=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1830
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM1831=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1831
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM1832=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1832
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM1833=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1833
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1834=Lfde169_end - Lfde169_start
	.long LDIFF_SYM1834
Lfde169_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position

LDIFF_SYM1835=Lme_bf - wrapper_delegate_invoke_System_Predicate_1_Xamarin_Forms_Maps_Position_invoke_bool_T_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1835
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,151,14,152,13,68,153,12,154,11
	.align 3
Lfde169_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_189:

	.byte 5
	.asciz "System_Comparison`1"

	.byte 128,1,16
LDIFF_SYM1836=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM1836
	.byte 2,35,0,0,7
	.asciz "System_Comparison`1"

LDIFF_SYM1837=LTDIE_189 - Ldebug_info_start
	.long LDIFF_SYM1837
LTDIE_189_POINTER:

	.byte 13
LDIFF_SYM1838=LTDIE_189 - Ldebug_info_start
	.long LDIFF_SYM1838
LTDIE_189_REFERENCE:

	.byte 14
LDIFF_SYM1839=LTDIE_189 - Ldebug_info_start
	.long LDIFF_SYM1839
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Comparison`1<Xamarin.Forms.Maps.Position>:invoke_int_T_T"
	.asciz "wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_c5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1840=LTDIE_189_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1840
	.byte 1,106,3
	.asciz "param0"

LDIFF_SYM1841=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1841
	.byte 2,141,48,3
	.asciz "param1"

LDIFF_SYM1842=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1842
	.byte 3,141,240,0,11
	.asciz "V_0"

LDIFF_SYM1843=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1843
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1844=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1844
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM1845=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1845
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM1846=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1846
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM1847=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1847
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM1848=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1848
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1849=Lfde170_end - Lfde170_start
	.long LDIFF_SYM1849
Lfde170_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM1850=Lme_c5 - wrapper_delegate_invoke_System_Comparison_1_Xamarin_Forms_Maps_Position_invoke_int_T_T_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1850
	.long 0
	.byte 12,31,0,68,14,192,1,157,24,158,23,68,13,29,68,151,22,152,21,68,153,20,154,19
	.align 3
Lfde170_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.EventHandler`1<Xamarin.Forms.Maps.MapClickedEventArgs>:invoke_void_object_TEventArgs"
	.asciz "wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_MapClickedEventArgs"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_MapClickedEventArgs
	.quad Lme_c6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1851=LTDIE_95_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1851
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1852=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1852
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1853=LTDIE_118_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1853
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1854=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1854
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1855=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1855
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1856=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1856
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1857=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1857
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1858=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1858
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1859=Lfde171_end - Lfde171_start
	.long LDIFF_SYM1859
Lfde171_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_MapClickedEventArgs

LDIFF_SYM1860=Lme_c6 - wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_MapClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_MapClickedEventArgs
	.long LDIFF_SYM1860
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde171_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_190:

	.byte 5
	.asciz "System_Func`2"

	.byte 128,1,16
LDIFF_SYM1861=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM1861
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM1862=LTDIE_190 - Ldebug_info_start
	.long LDIFF_SYM1862
LTDIE_190_POINTER:

	.byte 13
LDIFF_SYM1863=LTDIE_190 - Ldebug_info_start
	.long LDIFF_SYM1863
LTDIE_190_REFERENCE:

	.byte 14
LDIFF_SYM1864=LTDIE_190 - Ldebug_info_start
	.long LDIFF_SYM1864
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<Xamarin.Forms.Maps.Pin,_bool>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Pin_bool_invoke_TResult_T_Xamarin_Forms_Maps_Pin"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Pin_bool_invoke_TResult_T_Xamarin_Forms_Maps_Pin
	.quad Lme_cb

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1865=LTDIE_190_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1865
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM1866=LTDIE_115_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1866
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1867=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1867
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM1868=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1868
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM1869=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1869
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM1870=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1870
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM1871=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1871
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM1872=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1872
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1873=Lfde172_end - Lfde172_start
	.long LDIFF_SYM1873
Lfde172_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Pin_bool_invoke_TResult_T_Xamarin_Forms_Maps_Pin

LDIFF_SYM1874=Lme_cb - wrapper_delegate_invoke_System_Func_2_Xamarin_Forms_Maps_Pin_bool_invoke_TResult_T_Xamarin_Forms_Maps_Pin
	.long LDIFF_SYM1874
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde172_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_191:

	.byte 5
	.asciz "System_Action`3"

	.byte 128,1,16
LDIFF_SYM1875=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM1875
	.byte 2,35,0,0,7
	.asciz "System_Action`3"

LDIFF_SYM1876=LTDIE_191 - Ldebug_info_start
	.long LDIFF_SYM1876
LTDIE_191_POINTER:

	.byte 13
LDIFF_SYM1877=LTDIE_191 - Ldebug_info_start
	.long LDIFF_SYM1877
LTDIE_191_REFERENCE:

	.byte 14
LDIFF_SYM1878=LTDIE_191 - Ldebug_info_start
	.long LDIFF_SYM1878
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`3<object,_int,_bool>:invoke_void_T1_T2_T3"
	.asciz "wrapper_delegate_invoke_System_Action_3_object_int_bool_invoke_void_T1_T2_T3_object_int_bool"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_3_object_int_bool_invoke_void_T1_T2_T3_object_int_bool
	.quad Lme_d0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1879=LTDIE_191_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1879
	.byte 1,103,3
	.asciz "param0"

LDIFF_SYM1880=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1880
	.byte 1,104,3
	.asciz "param1"

LDIFF_SYM1881=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1881
	.byte 1,105,3
	.asciz "param2"

LDIFF_SYM1882=LDIE_BOOLEAN - Ldebug_info_start
	.long LDIFF_SYM1882
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1883=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1883
	.byte 1,101,11
	.asciz "V_1"

LDIFF_SYM1884=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1884
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1885=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1885
	.byte 1,102,11
	.asciz "V_3"

LDIFF_SYM1886=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1886
	.byte 1,100,11
	.asciz "V_4"

LDIFF_SYM1887=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1887
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1888=Lfde173_end - Lfde173_start
	.long LDIFF_SYM1888
Lfde173_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_3_object_int_bool_invoke_void_T1_T2_T3_object_int_bool

LDIFF_SYM1889=Lme_d0 - wrapper_delegate_invoke_System_Action_3_object_int_bool_invoke_void_T1_T2_T3_object_int_bool
	.long LDIFF_SYM1889
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,148,10,149,9,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde173_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_192:

	.byte 5
	.asciz "System_Action`2"

	.byte 128,1,16
LDIFF_SYM1890=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM1890
	.byte 2,35,0,0,7
	.asciz "System_Action`2"

LDIFF_SYM1891=LTDIE_192 - Ldebug_info_start
	.long LDIFF_SYM1891
LTDIE_192_POINTER:

	.byte 13
LDIFF_SYM1892=LTDIE_192 - Ldebug_info_start
	.long LDIFF_SYM1892
LTDIE_192_REFERENCE:

	.byte 14
LDIFF_SYM1893=LTDIE_192 - Ldebug_info_start
	.long LDIFF_SYM1893
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`2<object,_int>:invoke_void_T1_T2"
	.asciz "wrapper_delegate_invoke_System_Action_2_object_int_invoke_void_T1_T2_object_int"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_2_object_int_invoke_void_T1_T2_object_int
	.quad Lme_d5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1894=LTDIE_192_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1894
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1895=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1895
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1896=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1896
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1897=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1897
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1898=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1898
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1899=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1899
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1900=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1900
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1901=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1901
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1902=Lfde174_end - Lfde174_start
	.long LDIFF_SYM1902
Lfde174_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_2_object_int_invoke_void_T1_T2_object_int

LDIFF_SYM1903=Lme_d5 - wrapper_delegate_invoke_System_Action_2_object_int_invoke_void_T1_T2_object_int
	.long LDIFF_SYM1903
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde174_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.EventHandler`1<Xamarin.Forms.Maps.PinClickedEventArgs>:invoke_void_object_TEventArgs"
	.asciz "wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_PinClickedEventArgs"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_PinClickedEventArgs
	.quad Lme_d6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1904=LTDIE_116_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1904
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM1905=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1905
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM1906=LTDIE_121_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1906
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1907=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1907
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM1908=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1908
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM1909=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1909
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM1910=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1910
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM1911=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM1911
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1912=Lfde175_end - Lfde175_start
	.long LDIFF_SYM1912
Lfde175_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_PinClickedEventArgs

LDIFF_SYM1913=Lme_d6 - wrapper_delegate_invoke_System_EventHandler_1_Xamarin_Forms_Maps_PinClickedEventArgs_invoke_void_object_TEventArgs_object_Xamarin_Forms_Maps_PinClickedEventArgs
	.long LDIFF_SYM1913
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde175_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor"

	.byte 2,50
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor
	.quad Lme_d7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1914=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1914
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1915=Lfde176_end - Lfde176_start
	.long LDIFF_SYM1915
Lfde176_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor

LDIFF_SYM1916=Lme_d7 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor
	.long LDIFF_SYM1916
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde176_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position"

	.byte 2,63
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.quad Lme_d8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1917=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1917
	.byte 2,141,16,3
	.asciz "collection"

LDIFF_SYM1918=LTDIE_185_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1918
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1919=Lfde177_end - Lfde177_start
	.long LDIFF_SYM1919
Lfde177_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position

LDIFF_SYM1920=Lme_d8 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1920
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde177_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:CreateCopy"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CreateCopy_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_string"

	.byte 2,79
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CreateCopy_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_string
	.quad Lme_d9

	.byte 2,118,16,3
	.asciz "collection"

LDIFF_SYM1921=LTDIE_185_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1921
	.byte 2,141,16,3
	.asciz "paramName"

LDIFF_SYM1922=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1922
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1923=Lfde178_end - Lfde178_start
	.long LDIFF_SYM1923
Lfde178_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CreateCopy_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_string

LDIFF_SYM1924=Lme_d9 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CreateCopy_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_string
	.long LDIFF_SYM1924
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde178_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:Move"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_Move_int_int"

	.byte 2,101
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_Move_int_int
	.quad Lme_da

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1925=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1925
	.byte 2,141,16,3
	.asciz "oldIndex"

LDIFF_SYM1926=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1926
	.byte 2,141,24,3
	.asciz "newIndex"

LDIFF_SYM1927=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1927
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1928=Lfde179_end - Lfde179_start
	.long LDIFF_SYM1928
Lfde179_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_Move_int_int

LDIFF_SYM1929=Lme_da - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_Move_int_int
	.long LDIFF_SYM1929
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde179_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:System.ComponentModel.INotifyPropertyChanged.add_PropertyChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler"

	.byte 2,125
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
	.quad Lme_db

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1930=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1930
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1931=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1931
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1932=Lfde180_end - Lfde180_start
	.long LDIFF_SYM1932
Lfde180_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler

LDIFF_SYM1933=Lme_db - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
	.long LDIFF_SYM1933
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde180_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:System.ComponentModel.INotifyPropertyChanged.remove_PropertyChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler"

	.byte 2,129,1
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
	.quad Lme_dc

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1934=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1934
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM1935=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1935
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1936=Lfde181_end - Lfde181_start
	.long LDIFF_SYM1936
Lfde181_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler

LDIFF_SYM1937=Lme_dc - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_System_ComponentModel_INotifyPropertyChanged_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
	.long LDIFF_SYM1937
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde181_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:add_CollectionChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler"

	.byte 0,0
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
	.quad Lme_dd

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1938=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1938
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1939=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1939
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1940=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1940
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1941=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1941
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1942=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1942
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1943=Lfde182_end - Lfde182_start
	.long LDIFF_SYM1943
Lfde182_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler

LDIFF_SYM1944=Lme_dd - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
	.long LDIFF_SYM1944
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde182_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:remove_CollectionChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler"

	.byte 0,0
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
	.quad Lme_de

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1945=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1945
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1946=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1946
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1947=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1947
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1948=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1948
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1949=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1949
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1950=Lfde183_end - Lfde183_start
	.long LDIFF_SYM1950
Lfde183_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler

LDIFF_SYM1951=Lme_de - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_CollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventHandler
	.long LDIFF_SYM1951
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde183_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:ClearItems"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_ClearItems"

	.byte 2,162,1
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_ClearItems
	.quad Lme_df

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1952=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1952
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1953=Lfde184_end - Lfde184_start
	.long LDIFF_SYM1953
Lfde184_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_ClearItems

LDIFF_SYM1954=Lme_df - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_ClearItems
	.long LDIFF_SYM1954
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde184_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:RemoveItem"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_RemoveItem_int"

	.byte 2,175,1
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_RemoveItem_int
	.quad Lme_e0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1955=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1955
	.byte 1,105,3
	.asciz "index"

LDIFF_SYM1956=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1956
	.byte 2,141,24,11
	.asciz "removedItem"

LDIFF_SYM1957=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1957
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1958=Lfde185_end - Lfde185_start
	.long LDIFF_SYM1958
Lfde185_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_RemoveItem_int

LDIFF_SYM1959=Lme_e0 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_RemoveItem_int
	.long LDIFF_SYM1959
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6
	.align 3
Lfde185_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:InsertItem"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position"

	.byte 2,191,1
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position
	.quad Lme_e1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1960=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1960
	.byte 1,105,3
	.asciz "index"

LDIFF_SYM1961=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1961
	.byte 2,141,24,3
	.asciz "item"

LDIFF_SYM1962=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1962
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1963=Lfde186_end - Lfde186_start
	.long LDIFF_SYM1963
Lfde186_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position

LDIFF_SYM1964=Lme_e1 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1964
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10
	.align 3
Lfde186_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:SetItem"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position"

	.byte 2,205,1
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position
	.quad Lme_e2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1965=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1965
	.byte 1,105,3
	.asciz "index"

LDIFF_SYM1966=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1966
	.byte 2,141,24,3
	.asciz "item"

LDIFF_SYM1967=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1967
	.byte 2,141,32,11
	.asciz "originalItem"

LDIFF_SYM1968=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1968
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1969=Lfde187_end - Lfde187_start
	.long LDIFF_SYM1969
Lfde187_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position

LDIFF_SYM1970=Lme_e2 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM1970
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,153,16
	.align 3
Lfde187_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:MoveItem"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_MoveItem_int_int"

	.byte 2,219,1
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_MoveItem_int_int
	.quad Lme_e3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1971=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1971
	.byte 1,104,3
	.asciz "oldIndex"

LDIFF_SYM1972=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1972
	.byte 2,141,24,3
	.asciz "newIndex"

LDIFF_SYM1973=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1973
	.byte 2,141,32,11
	.asciz "removedItem"

LDIFF_SYM1974=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM1974
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1975=Lfde188_end - Lfde188_start
	.long LDIFF_SYM1975
Lfde188_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_MoveItem_int_int

LDIFF_SYM1976=Lme_e3 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_MoveItem_int_int
	.long LDIFF_SYM1976
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,152,6
	.align 3
Lfde188_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_193:

	.byte 5
	.asciz "System_ComponentModel_PropertyChangedEventArgs"

	.byte 24,16
LDIFF_SYM1977=LTDIE_109 - Ldebug_info_start
	.long LDIFF_SYM1977
	.byte 2,35,0,6
	.asciz "_propertyName"

LDIFF_SYM1978=LDIE_STRING - Ldebug_info_start
	.long LDIFF_SYM1978
	.byte 2,35,16,0,7
	.asciz "System_ComponentModel_PropertyChangedEventArgs"

LDIFF_SYM1979=LTDIE_193 - Ldebug_info_start
	.long LDIFF_SYM1979
LTDIE_193_POINTER:

	.byte 13
LDIFF_SYM1980=LTDIE_193 - Ldebug_info_start
	.long LDIFF_SYM1980
LTDIE_193_REFERENCE:

	.byte 14
LDIFF_SYM1981=LTDIE_193 - Ldebug_info_start
	.long LDIFF_SYM1981
	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:OnPropertyChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnPropertyChanged_System_ComponentModel_PropertyChangedEventArgs"

	.byte 2,236,1
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnPropertyChanged_System_ComponentModel_PropertyChangedEventArgs
	.quad Lme_e4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1982=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1982
	.byte 2,141,24,3
	.asciz "e"

LDIFF_SYM1983=LTDIE_193_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1983
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1984=Lfde189_end - Lfde189_start
	.long LDIFF_SYM1984
Lfde189_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnPropertyChanged_System_ComponentModel_PropertyChangedEventArgs

LDIFF_SYM1985=Lme_e4 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnPropertyChanged_System_ComponentModel_PropertyChangedEventArgs
	.long LDIFF_SYM1985
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,152,4
	.align 3
Lfde189_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:add_PropertyChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler"

	.byte 0,0
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
	.quad Lme_e5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1986=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1986
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1987=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1987
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1988=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1988
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1989=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1989
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1990=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1990
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1991=Lfde190_end - Lfde190_start
	.long LDIFF_SYM1991
Lfde190_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler

LDIFF_SYM1992=Lme_e5 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_add_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
	.long LDIFF_SYM1992
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde190_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:remove_PropertyChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler"

	.byte 0,0
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
	.quad Lme_e6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM1993=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1993
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM1994=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1994
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM1995=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1995
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM1996=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1996
	.byte 1,103,11
	.asciz "V_2"

LDIFF_SYM1997=LTDIE_17_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM1997
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM1998=Lfde191_end - Lfde191_start
	.long LDIFF_SYM1998
Lfde191_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler

LDIFF_SYM1999=Lme_e6 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_remove_PropertyChanged_System_ComponentModel_PropertyChangedEventHandler
	.long LDIFF_SYM1999
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,149,6,150,5,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde191_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:OnCollectionChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventArgs"

	.byte 2,128,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.quad Lme_e7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2000=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2000
	.byte 2,141,24,3
	.asciz "e"

LDIFF_SYM2001=LTDIE_108_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2001
	.byte 2,141,32,11
	.asciz "handler"

LDIFF_SYM2002=LTDIE_38_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2002
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2003=Lfde192_end - Lfde192_start
	.long LDIFF_SYM2003
Lfde192_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventArgs

LDIFF_SYM2004=Lme_e7 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedEventArgs
	.long LDIFF_SYM2004
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6
	.align 3
Lfde192_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:CheckReentrancy"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CheckReentrancy"

	.byte 2,168,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CheckReentrancy
	.quad Lme_e8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2005=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2005
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2006=Lfde193_end - Lfde193_start
	.long LDIFF_SYM2006
Lfde193_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CheckReentrancy

LDIFF_SYM2007=Lme_e8 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_CheckReentrancy
	.long LDIFF_SYM2007
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde193_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:OnCountPropertyChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCountPropertyChanged"

	.byte 2,194,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCountPropertyChanged
	.quad Lme_e9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2008=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2008
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2009=Lfde194_end - Lfde194_start
	.long LDIFF_SYM2009
Lfde194_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCountPropertyChanged

LDIFF_SYM2010=Lme_e9 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCountPropertyChanged
	.long LDIFF_SYM2010
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde194_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:OnIndexerPropertyChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnIndexerPropertyChanged"

	.byte 2,202,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnIndexerPropertyChanged
	.quad Lme_ea

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2011=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2011
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2012=Lfde195_end - Lfde195_start
	.long LDIFF_SYM2012
Lfde195_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnIndexerPropertyChanged

LDIFF_SYM2013=Lme_ea - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnIndexerPropertyChanged
	.long LDIFF_SYM2013
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde195_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:OnCollectionChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int"

	.byte 2,210,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int
	.quad Lme_eb

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2014=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2014
	.byte 2,141,16,3
	.asciz "action"

LDIFF_SYM2015=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM2015
	.byte 2,141,24,3
	.asciz "item"

LDIFF_SYM2016=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2016
	.byte 2,141,32,3
	.asciz "index"

LDIFF_SYM2017=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2017
	.byte 2,141,40,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2018=Lfde196_end - Lfde196_start
	.long LDIFF_SYM2018
Lfde196_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int

LDIFF_SYM2019=Lme_eb - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int
	.long LDIFF_SYM2019
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde196_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:OnCollectionChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int"

	.byte 2,218,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int
	.quad Lme_ec

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2020=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2020
	.byte 2,141,16,3
	.asciz "action"

LDIFF_SYM2021=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM2021
	.byte 2,141,24,3
	.asciz "item"

LDIFF_SYM2022=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2022
	.byte 2,141,32,3
	.asciz "index"

LDIFF_SYM2023=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2023
	.byte 2,141,40,3
	.asciz "oldIndex"

LDIFF_SYM2024=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2024
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2025=Lfde197_end - Lfde197_start
	.long LDIFF_SYM2025
Lfde197_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int

LDIFF_SYM2026=Lme_ec - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_int_int
	.long LDIFF_SYM2026
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde197_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:OnCollectionChanged"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int"

	.byte 2,226,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int
	.quad Lme_ed

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2027=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2027
	.byte 2,141,16,3
	.asciz "action"

LDIFF_SYM2028=LTDIE_110 - Ldebug_info_start
	.long LDIFF_SYM2028
	.byte 2,141,24,3
	.asciz "oldItem"

LDIFF_SYM2029=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2029
	.byte 2,141,32,3
	.asciz "newItem"

LDIFF_SYM2030=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2030
	.byte 2,141,40,3
	.asciz "index"

LDIFF_SYM2031=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2031
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2032=Lfde198_end - Lfde198_start
	.long LDIFF_SYM2032
Lfde198_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int

LDIFF_SYM2033=Lme_ed - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionChanged_System_Collections_Specialized_NotifyCollectionChangedAction_object_object_int
	.long LDIFF_SYM2033
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde198_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:OnCollectionReset"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionReset"

	.byte 2,234,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionReset
	.quad Lme_ee

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2034=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2034
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2035=Lfde199_end - Lfde199_start
	.long LDIFF_SYM2035
Lfde199_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionReset

LDIFF_SYM2036=Lme_ee - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnCollectionReset
	.long LDIFF_SYM2036
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde199_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:EnsureMonitorInitialized"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_EnsureMonitorInitialized"

	.byte 2,239,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_EnsureMonitorInitialized
	.quad Lme_ef

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2037=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2037
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2038=LTDIE_126_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2038
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2039=Lfde200_end - Lfde200_start
	.long LDIFF_SYM2039
Lfde200_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_EnsureMonitorInitialized

LDIFF_SYM2040=Lme_ef - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_EnsureMonitorInitialized
	.long LDIFF_SYM2040
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,153,4,154,3
	.align 3
Lfde200_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:OnSerializing"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnSerializing_System_Runtime_Serialization_StreamingContext"

	.byte 2,245,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnSerializing_System_Runtime_Serialization_StreamingContext
	.quad Lme_f0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2041=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2041
	.byte 1,106,3
	.asciz "context"

LDIFF_SYM2042=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2042
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2043=Lfde201_end - Lfde201_start
	.long LDIFF_SYM2043
Lfde201_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnSerializing_System_Runtime_Serialization_StreamingContext

LDIFF_SYM2044=Lme_f0 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnSerializing_System_Runtime_Serialization_StreamingContext
	.long LDIFF_SYM2044
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,154,4
	.align 3
Lfde201_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1<Xamarin.Forms.Maps.Position>:OnDeserialized"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnDeserialized_System_Runtime_Serialization_StreamingContext"

	.byte 2,252,2
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnDeserialized_System_Runtime_Serialization_StreamingContext
	.quad Lme_f1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2045=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2045
	.byte 1,106,3
	.asciz "context"

LDIFF_SYM2046=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2046
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2047=Lfde202_end - Lfde202_start
	.long LDIFF_SYM2047
Lfde202_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnDeserialized_System_Runtime_Serialization_StreamingContext

LDIFF_SYM2048=Lme_f1 - System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position_OnDeserialized_System_Runtime_Serialization_StreamingContext
	.long LDIFF_SYM2048
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,154,6
	.align 3
Lfde202_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1/SimpleMonitor<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position__ctor_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position"

	.byte 2,151,3
	.quad System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position__ctor_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position
	.quad Lme_f2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2049=LTDIE_126_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2049
	.byte 2,141,16,3
	.asciz "collection"

LDIFF_SYM2050=LTDIE_124_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2050
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2051=Lfde203_end - Lfde203_start
	.long LDIFF_SYM2051
Lfde203_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position__ctor_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position

LDIFF_SYM2052=Lme_f2 - System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position__ctor_System_Collections_ObjectModel_ObservableCollection_1_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2052
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde203_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.ObservableCollection`1/SimpleMonitor<Xamarin.Forms.Maps.Position>:Dispose"
	.asciz "System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position_Dispose"

	.byte 2,159,3
	.quad System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position_Dispose
	.quad Lme_f3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2053=LTDIE_126_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2053
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2054=Lfde204_end - Lfde204_start
	.long LDIFF_SYM2054
Lfde204_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position_Dispose

LDIFF_SYM2055=Lme_f3 - System_Collections_ObjectModel_ObservableCollection_1_SimpleMonitor_Xamarin_Forms_Maps_Position_Dispose
	.long LDIFF_SYM2055
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde204_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor"

	.byte 3,20
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor
	.quad Lme_f4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2056=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2056
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2057=Lfde205_end - Lfde205_start
	.long LDIFF_SYM2057
Lfde205_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor

LDIFF_SYM2058=Lme_f4 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor
	.long LDIFF_SYM2058
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde205_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_Xamarin_Forms_Maps_Position"

	.byte 3,25
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_Xamarin_Forms_Maps_Position
	.quad Lme_f5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2059=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2059
	.byte 2,141,16,3
	.asciz "list"

LDIFF_SYM2060=LTDIE_123_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2060
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2061=Lfde206_end - Lfde206_start
	.long LDIFF_SYM2061
Lfde206_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_Xamarin_Forms_Maps_Position

LDIFF_SYM2062=Lme_f5 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IList_1_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2062
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde206_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:get_Count"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Count"

	.byte 3,36
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Count
	.quad Lme_f6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2063=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2063
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2064=Lfde207_end - Lfde207_start
	.long LDIFF_SYM2064
Lfde207_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Count

LDIFF_SYM2065=Lme_f6 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Count
	.long LDIFF_SYM2065
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde207_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:get_Items"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Items"

	.byte 3,41
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Items
	.quad Lme_f7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2066=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2066
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2067=Lfde208_end - Lfde208_start
	.long LDIFF_SYM2067
Lfde208_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Items

LDIFF_SYM2068=Lme_f7 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Items
	.long LDIFF_SYM2068
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde208_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:get_Item"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Item_int"

	.byte 3,46
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Item_int
	.quad Lme_f8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2069=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2069
	.byte 3,141,208,0,3
	.asciz "index"

LDIFF_SYM2070=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2070
	.byte 3,141,216,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2071=Lfde209_end - Lfde209_start
	.long LDIFF_SYM2071
Lfde209_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Item_int

LDIFF_SYM2072=Lme_f8 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_get_Item_int
	.long LDIFF_SYM2072
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde209_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:set_Item"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_set_Item_int_Xamarin_Forms_Maps_Position"

	.byte 3,49
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_set_Item_int_Xamarin_Forms_Maps_Position
	.quad Lme_f9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2073=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2073
	.byte 1,105,3
	.asciz "index"

LDIFF_SYM2074=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2074
	.byte 2,141,24,3
	.asciz "value"

LDIFF_SYM2075=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2075
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2076=Lfde210_end - Lfde210_start
	.long LDIFF_SYM2076
Lfde210_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_set_Item_int_Xamarin_Forms_Maps_Position

LDIFF_SYM2077=Lme_f9 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_set_Item_int_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2077
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10
	.align 3
Lfde210_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:Add"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position"

	.byte 3,65
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position
	.quad Lme_fa

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2078=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2078
	.byte 1,106,3
	.asciz "item"

LDIFF_SYM2079=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2079
	.byte 2,141,24,11
	.asciz "index"

LDIFF_SYM2080=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2080
	.byte 3,141,216,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2081=Lfde211_end - Lfde211_start
	.long LDIFF_SYM2081
Lfde211_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position

LDIFF_SYM2082=Lme_fa - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Add_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2082
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,154,10
	.align 3
Lfde211_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:Clear"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Clear"

	.byte 3,76
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Clear
	.quad Lme_fb

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2083=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2083
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2084=Lfde212_end - Lfde212_start
	.long LDIFF_SYM2084
Lfde212_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Clear

LDIFF_SYM2085=Lme_fb - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Clear
	.long LDIFF_SYM2085
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,154,2
	.align 3
Lfde212_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:CopyTo"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int"

	.byte 3,86
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int
	.quad Lme_fc

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2086=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2086
	.byte 2,141,16,3
	.asciz "array"

LDIFF_SYM2087=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2087
	.byte 2,141,24,3
	.asciz "index"

LDIFF_SYM2088=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2088
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2089=Lfde213_end - Lfde213_start
	.long LDIFF_SYM2089
Lfde213_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int

LDIFF_SYM2090=Lme_fc - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_CopyTo_Xamarin_Forms_Maps_Position___int
	.long LDIFF_SYM2090
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde213_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:Contains"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Contains_Xamarin_Forms_Maps_Position"

	.byte 3,91
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Contains_Xamarin_Forms_Maps_Position
	.quad Lme_fd

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2091=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2091
	.byte 2,141,16,3
	.asciz "item"

LDIFF_SYM2092=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2092
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2093=Lfde214_end - Lfde214_start
	.long LDIFF_SYM2093
Lfde214_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Contains_Xamarin_Forms_Maps_Position

LDIFF_SYM2094=Lme_fd - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Contains_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2094
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde214_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:GetEnumerator"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_GetEnumerator"

	.byte 3,96
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_GetEnumerator
	.quad Lme_fe

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2095=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2095
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2096=Lfde215_end - Lfde215_start
	.long LDIFF_SYM2096
Lfde215_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_GetEnumerator

LDIFF_SYM2097=Lme_fe - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_GetEnumerator
	.long LDIFF_SYM2097
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde215_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:IndexOf"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IndexOf_Xamarin_Forms_Maps_Position"

	.byte 3,101
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IndexOf_Xamarin_Forms_Maps_Position
	.quad Lme_ff

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2098=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2098
	.byte 2,141,16,3
	.asciz "item"

LDIFF_SYM2099=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2099
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2100=Lfde216_end - Lfde216_start
	.long LDIFF_SYM2100
Lfde216_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IndexOf_Xamarin_Forms_Maps_Position

LDIFF_SYM2101=Lme_ff - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IndexOf_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2101
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde216_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:Insert"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Insert_int_Xamarin_Forms_Maps_Position"

	.byte 3,106
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Insert_int_Xamarin_Forms_Maps_Position
	.quad Lme_100

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2102=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2102
	.byte 1,105,3
	.asciz "index"

LDIFF_SYM2103=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2103
	.byte 2,141,24,3
	.asciz "item"

LDIFF_SYM2104=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2104
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2105=Lfde217_end - Lfde217_start
	.long LDIFF_SYM2105
Lfde217_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Insert_int_Xamarin_Forms_Maps_Position

LDIFF_SYM2106=Lme_100 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Insert_int_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2106
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10
	.align 3
Lfde217_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:Remove"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Remove_Xamarin_Forms_Maps_Position"

	.byte 3,121
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Remove_Xamarin_Forms_Maps_Position
	.quad Lme_101

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2107=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2107
	.byte 1,106,3
	.asciz "item"

LDIFF_SYM2108=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2108
	.byte 2,141,32,11
	.asciz "index"

LDIFF_SYM2109=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2109
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2110=Lfde218_end - Lfde218_start
	.long LDIFF_SYM2110
Lfde218_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Remove_Xamarin_Forms_Maps_Position

LDIFF_SYM2111=Lme_101 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_Remove_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2111
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10,154,9
	.align 3
Lfde218_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:RemoveAt"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveAt_int"

	.byte 3,134,1
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveAt_int
	.quad Lme_102

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2112=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2112
	.byte 1,105,3
	.asciz "index"

LDIFF_SYM2113=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2113
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2114=Lfde219_end - Lfde219_start
	.long LDIFF_SYM2114
Lfde219_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveAt_int

LDIFF_SYM2115=Lme_102 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveAt_int
	.long LDIFF_SYM2115
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29,68,153,2
	.align 3
Lfde219_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:ClearItems"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_ClearItems"

	.byte 3,149,1
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_ClearItems
	.quad Lme_103

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2116=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2116
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2117=Lfde220_end - Lfde220_start
	.long LDIFF_SYM2117
Lfde220_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_ClearItems

LDIFF_SYM2118=Lme_103 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_ClearItems
	.long LDIFF_SYM2118
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde220_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:InsertItem"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position"

	.byte 3,154,1
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position
	.quad Lme_104

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2119=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2119
	.byte 2,141,16,3
	.asciz "index"

LDIFF_SYM2120=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2120
	.byte 2,141,24,3
	.asciz "item"

LDIFF_SYM2121=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2121
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2122=Lfde221_end - Lfde221_start
	.long LDIFF_SYM2122
Lfde221_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position

LDIFF_SYM2123=Lme_104 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_InsertItem_int_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2123
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde221_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:RemoveItem"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveItem_int"

	.byte 3,159,1
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveItem_int
	.quad Lme_105

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2124=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2124
	.byte 2,141,16,3
	.asciz "index"

LDIFF_SYM2125=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2125
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2126=Lfde222_end - Lfde222_start
	.long LDIFF_SYM2126
Lfde222_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveItem_int

LDIFF_SYM2127=Lme_105 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_RemoveItem_int
	.long LDIFF_SYM2127
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde222_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:SetItem"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position"

	.byte 3,164,1
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position
	.quad Lme_106

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2128=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2128
	.byte 2,141,16,3
	.asciz "index"

LDIFF_SYM2129=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2129
	.byte 2,141,24,3
	.asciz "item"

LDIFF_SYM2130=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2130
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2131=Lfde223_end - Lfde223_start
	.long LDIFF_SYM2131
Lfde223_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position

LDIFF_SYM2132=Lme_106 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_SetItem_int_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2132
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde223_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.Generic.ICollection<T>.get_IsReadOnly"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_Generic_ICollection_T_get_IsReadOnly"

	.byte 3,171,1
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_Generic_ICollection_T_get_IsReadOnly
	.quad Lme_107

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2133=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2133
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2134=Lfde224_end - Lfde224_start
	.long LDIFF_SYM2134
Lfde224_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_Generic_ICollection_T_get_IsReadOnly

LDIFF_SYM2135=Lme_107 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_Generic_ICollection_T_get_IsReadOnly
	.long LDIFF_SYM2135
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde224_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerable.GetEnumerator"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator"

	.byte 3,177,1
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
	.quad Lme_108

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2136=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2136
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2137=Lfde225_end - Lfde225_start
	.long LDIFF_SYM2137
Lfde225_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator

LDIFF_SYM2138=Lme_108 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerable_GetEnumerator
	.long LDIFF_SYM2138
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde225_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.ICollection.get_IsSynchronized"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_IsSynchronized"

	.byte 3,182,1
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_IsSynchronized
	.quad Lme_109

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2139=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2139
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2140=Lfde226_end - Lfde226_start
	.long LDIFF_SYM2140
Lfde226_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_IsSynchronized

LDIFF_SYM2141=Lme_109 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_IsSynchronized
	.long LDIFF_SYM2141
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde226_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.ICollection.get_SyncRoot"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_SyncRoot"

	.byte 3,189,1
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_SyncRoot
	.quad Lme_10a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2142=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2142
	.byte 2,141,40,11
	.asciz "coll"

LDIFF_SYM2143=LTDIE_140_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2143
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2144=Lfde227_end - Lfde227_start
	.long LDIFF_SYM2144
Lfde227_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_SyncRoot

LDIFF_SYM2145=Lme_10a - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_get_SyncRoot
	.long LDIFF_SYM2145
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,151,4,152,3,68,153,2
	.align 3
Lfde227_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.ICollection.CopyTo"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_CopyTo_System_Array_int"

	.byte 3,195,1
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_CopyTo_System_Array_int
	.quad Lme_10b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2146=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2146
	.byte 1,104,3
	.asciz "array"

LDIFF_SYM2147=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2147
	.byte 1,105,3
	.asciz "index"

LDIFF_SYM2148=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2148
	.byte 1,106,11
	.asciz "tArray"

LDIFF_SYM2149=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2149
	.byte 1,102,11
	.asciz "targetType"

LDIFF_SYM2150=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2150
	.byte 1,103,11
	.asciz "sourceType"

LDIFF_SYM2151=LTDIE_24_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2151
	.byte 1,102,11
	.asciz "objects"

LDIFF_SYM2152=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2152
	.byte 1,105,11
	.asciz "count"

LDIFF_SYM2153=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2153
	.byte 1,103,11
	.asciz "i"

LDIFF_SYM2154=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2154
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2155=Lfde228_end - Lfde228_start
	.long LDIFF_SYM2155
Lfde228_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_CopyTo_System_Array_int

LDIFF_SYM2156=Lme_10b - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_ICollection_CopyTo_System_Array_int
	.long LDIFF_SYM2156
	.long 0
	.byte 12,31,0,68,14,144,1,157,18,158,17,68,13,29,68,150,16,151,15,68,152,14,153,13,68,154,12
	.align 3
Lfde228_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.IList.get_Item"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_Item_int"

	.byte 3,138,2
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_Item_int
	.quad Lme_10c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2157=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2157
	.byte 2,141,16,3
	.asciz "index"

LDIFF_SYM2158=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2158
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2159=Lfde229_end - Lfde229_start
	.long LDIFF_SYM2159
Lfde229_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_Item_int

LDIFF_SYM2160=Lme_10c - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_Item_int
	.long LDIFF_SYM2160
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29
	.align 3
Lfde229_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.IList.set_Item"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_set_Item_int_object"

	.byte 3,141,2
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_set_Item_int_object
	.quad Lme_10d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2161=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2161
	.byte 2,141,16,3
	.asciz "index"

LDIFF_SYM2162=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2162
	.byte 2,141,24,3
	.asciz "value"

LDIFF_SYM2163=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2163
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2164=Lfde230_end - Lfde230_start
	.long LDIFF_SYM2164
Lfde230_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_set_Item_int_object

LDIFF_SYM2165=Lme_10d - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_set_Item_int_object
	.long LDIFF_SYM2165
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde230_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.IList.get_IsReadOnly"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsReadOnly"

	.byte 3,158,2
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsReadOnly
	.quad Lme_10e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2166=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2166
	.byte 2,141,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2167=Lfde231_end - Lfde231_start
	.long LDIFF_SYM2167
Lfde231_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsReadOnly

LDIFF_SYM2168=Lme_10e - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsReadOnly
	.long LDIFF_SYM2168
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde231_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.IList.get_IsFixedSize"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsFixedSize"

	.byte 3,170,2
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsFixedSize
	.quad Lme_10f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2169=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2169
	.byte 1,106,11
	.asciz "list"

LDIFF_SYM2170=LTDIE_111_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2170
	.byte 1,105,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2171=Lfde232_end - Lfde232_start
	.long LDIFF_SYM2171
Lfde232_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsFixedSize

LDIFF_SYM2172=Lme_10f - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_get_IsFixedSize
	.long LDIFF_SYM2172
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,151,4,152,3,68,153,2,154,1
	.align 3
Lfde232_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.IList.Add"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Add_object"

	.byte 3,180,2
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Add_object
	.quad Lme_110

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2173=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2173
	.byte 2,141,16,3
	.asciz "value"

LDIFF_SYM2174=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2174
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2175=Lfde233_end - Lfde233_start
	.long LDIFF_SYM2175
Lfde233_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Add_object

LDIFF_SYM2176=Lme_110 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Add_object
	.long LDIFF_SYM2176
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29
	.align 3
Lfde233_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.IList.Contains"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Contains_object"

	.byte 3,200,2
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Contains_object
	.quad Lme_111

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2177=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2177
	.byte 2,141,24,3
	.asciz "value"

LDIFF_SYM2178=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2178
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2179=Lfde234_end - Lfde234_start
	.long LDIFF_SYM2179
Lfde234_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Contains_object

LDIFF_SYM2180=Lme_111 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Contains_object
	.long LDIFF_SYM2180
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,154,4
	.align 3
Lfde234_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.IList.IndexOf"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_IndexOf_object"

	.byte 3,209,2
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_IndexOf_object
	.quad Lme_112

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2181=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2181
	.byte 2,141,24,3
	.asciz "value"

LDIFF_SYM2182=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2182
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2183=Lfde235_end - Lfde235_start
	.long LDIFF_SYM2183
Lfde235_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_IndexOf_object

LDIFF_SYM2184=Lme_112 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_IndexOf_object
	.long LDIFF_SYM2184
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,154,4
	.align 3
Lfde235_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.IList.Insert"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Insert_int_object"

	.byte 3,218,2
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Insert_int_object
	.quad Lme_113

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2185=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2185
	.byte 2,141,16,3
	.asciz "index"

LDIFF_SYM2186=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2186
	.byte 2,141,24,3
	.asciz "value"

LDIFF_SYM2187=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2187
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2188=Lfde236_end - Lfde236_start
	.long LDIFF_SYM2188
Lfde236_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Insert_int_object

LDIFF_SYM2189=Lme_113 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Insert_int_object
	.long LDIFF_SYM2189
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde236_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:System.Collections.IList.Remove"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Remove_object"

	.byte 3,236,2
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Remove_object
	.quad Lme_114

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2190=LTDIE_125_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2190
	.byte 2,141,24,3
	.asciz "value"

LDIFF_SYM2191=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2191
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2192=Lfde237_end - Lfde237_start
	.long LDIFF_SYM2192
Lfde237_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Remove_object

LDIFF_SYM2193=Lme_114 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_System_Collections_IList_Remove_object
	.long LDIFF_SYM2193
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,154,4
	.align 3
Lfde237_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.ObjectModel.Collection`1<Xamarin.Forms.Maps.Position>:IsCompatibleObject"
	.asciz "System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IsCompatibleObject_object"

	.byte 3,251,2
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IsCompatibleObject_object
	.quad Lme_115

	.byte 2,118,16,3
	.asciz "value"

LDIFF_SYM2194=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2194
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2195=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2195
	.byte 2,141,48,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2196=Lfde238_end - Lfde238_start
	.long LDIFF_SYM2196
Lfde238_start:

	.long 0
	.align 3
	.quad System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IsCompatibleObject_object

LDIFF_SYM2197=Lme_115 - System_Collections_ObjectModel_Collection_1_Xamarin_Forms_Maps_Position_IsCompatibleObject_object
	.long LDIFF_SYM2197
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,153,6,154,5
	.align 3
Lfde238_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__Insert<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__Insert_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position"

	.byte 1,154,1
	.quad System_Array_InternalArray__Insert_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position
	.quad Lme_11b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2198=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2198
	.byte 0,3
	.asciz "index"

LDIFF_SYM2199=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2199
	.byte 0,3
	.asciz "item"

LDIFF_SYM2200=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2200
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2201=Lfde239_end - Lfde239_start
	.long LDIFF_SYM2201
Lfde239_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__Insert_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position

LDIFF_SYM2202=Lme_11b - System_Array_InternalArray__Insert_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2202
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde239_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__IndexOf<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__IndexOf_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position"

	.byte 1,164,1
	.quad System_Array_InternalArray__IndexOf_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.quad Lme_11c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2203=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2203
	.byte 1,106,3
	.asciz "item"

LDIFF_SYM2204=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2204
	.byte 2,141,40,11
	.asciz "length"

LDIFF_SYM2205=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2205
	.byte 1,105,11
	.asciz "i"

LDIFF_SYM2206=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2206
	.byte 1,104,11
	.asciz "value"

LDIFF_SYM2207=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2207
	.byte 3,141,232,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2208=Lfde240_end - Lfde240_start
	.long LDIFF_SYM2208
Lfde240_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__IndexOf_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position

LDIFF_SYM2209=Lme_11c - System_Array_InternalArray__IndexOf_Xamarin_Forms_Maps_Position_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2209
	.long 0
	.byte 12,31,0,68,14,128,1,157,16,158,15,68,13,29,68,152,14,153,13,68,154,12
	.align 3
Lfde240_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__get_Item<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int"

	.byte 1,192,1
	.quad System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int
	.quad Lme_11d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2210=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2210
	.byte 3,141,208,0,3
	.asciz "index"

LDIFF_SYM2211=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2211
	.byte 3,141,216,0,11
	.asciz "value"

LDIFF_SYM2212=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2212
	.byte 3,141,224,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2213=Lfde241_end - Lfde241_start
	.long LDIFF_SYM2213
Lfde241_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int

LDIFF_SYM2214=Lme_11d - System_Array_InternalArray__get_Item_Xamarin_Forms_Maps_Position_int
	.long LDIFF_SYM2214
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29
	.align 3
Lfde241_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array:InternalArray__set_Item<Xamarin.Forms.Maps.Position>"
	.asciz "System_Array_InternalArray__set_Item_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position"

	.byte 1,203,1
	.quad System_Array_InternalArray__set_Item_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position
	.quad Lme_11e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2215=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2215
	.byte 1,105,3
	.asciz "index"

LDIFF_SYM2216=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2216
	.byte 2,141,48,3
	.asciz "item"

LDIFF_SYM2217=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2217
	.byte 2,141,56,11
	.asciz "oarray"

LDIFF_SYM2218=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2218
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2219=Lfde242_end - Lfde242_start
	.long LDIFF_SYM2219
Lfde242_start:

	.long 0
	.align 3
	.quad System_Array_InternalArray__set_Item_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position

LDIFF_SYM2220=Lme_11e - System_Array_InternalArray__set_Item_Xamarin_Forms_Maps_Position_int_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2220
	.long 0
	.byte 12,31,0,68,14,160,1,157,20,158,19,68,13,29,68,150,18,151,17,68,152,16,153,15
	.align 3
Lfde242_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_194:

	.byte 5
	.asciz "System_Func`1"

	.byte 128,1,16
LDIFF_SYM2221=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2221
	.byte 2,35,0,0,7
	.asciz "System_Func`1"

LDIFF_SYM2222=LTDIE_194 - Ldebug_info_start
	.long LDIFF_SYM2222
LTDIE_194_POINTER:

	.byte 13
LDIFF_SYM2223=LTDIE_194 - Ldebug_info_start
	.long LDIFF_SYM2223
LTDIE_194_REFERENCE:

	.byte 14
LDIFF_SYM2224=LTDIE_194 - Ldebug_info_start
	.long LDIFF_SYM2224
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`1<System.Collections.Generic.IEnumerable`1<string>>:invoke_TResult"
	.asciz "wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult
	.quad Lme_11f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2225=LTDIE_194_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2225
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2226=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2226
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2227=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2227
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM2228=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2228
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM2229=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2229
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM2230=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2230
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM2231=LTDIE_182_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2231
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2232=Lfde243_end - Lfde243_start
	.long LDIFF_SYM2232
Lfde243_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult

LDIFF_SYM2233=Lme_11f - wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_string_invoke_TResult
	.long LDIFF_SYM2233
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde243_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_195:

	.byte 5
	.asciz "System_Func`2"

	.byte 128,1,16
LDIFF_SYM2234=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2234
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2235=LTDIE_195 - Ldebug_info_start
	.long LDIFF_SYM2235
LTDIE_195_POINTER:

	.byte 13
LDIFF_SYM2236=LTDIE_195 - Ldebug_info_start
	.long LDIFF_SYM2236
LTDIE_195_REFERENCE:

	.byte 14
LDIFF_SYM2237=LTDIE_195 - Ldebug_info_start
	.long LDIFF_SYM2237
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<object,_System.Collections.Generic.IEnumerable`1<string>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object
	.quad Lme_120

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2238=LTDIE_195_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2238
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2239=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2239
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2240=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2240
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM2241=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2241
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM2242=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2242
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM2243=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2243
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM2244=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2244
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM2245=LTDIE_182_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2245
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2246=Lfde244_end - Lfde244_start
	.long LDIFF_SYM2246
Lfde244_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object

LDIFF_SYM2247=Lme_120 - wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_object
	.long LDIFF_SYM2247
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde244_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_196:

	.byte 5
	.asciz "System_Action`1"

	.byte 128,1,16
LDIFF_SYM2248=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2248
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM2249=LTDIE_196 - Ldebug_info_start
	.long LDIFF_SYM2249
LTDIE_196_POINTER:

	.byte 13
LDIFF_SYM2250=LTDIE_196 - Ldebug_info_start
	.long LDIFF_SYM2250
LTDIE_196_REFERENCE:

	.byte 14
LDIFF_SYM2251=LTDIE_196 - Ldebug_info_start
	.long LDIFF_SYM2251
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<System.Threading.Tasks.Task`1<System.Collections.Generic.IEnumerable`1<string>>>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string
	.quad Lme_121

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2252=LTDIE_196_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2252
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2253=LTDIE_131_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2253
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2254=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2254
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM2255=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2255
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM2256=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2256
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM2257=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2257
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM2258=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2258
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2259=Lfde245_end - Lfde245_start
	.long LDIFF_SYM2259
Lfde245_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string

LDIFF_SYM2260=Lme_121 - wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string
	.long LDIFF_SYM2260
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde245_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_197:

	.byte 5
	.asciz "System_Action`2"

	.byte 128,1,16
LDIFF_SYM2261=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2261
	.byte 2,35,0,0,7
	.asciz "System_Action`2"

LDIFF_SYM2262=LTDIE_197 - Ldebug_info_start
	.long LDIFF_SYM2262
LTDIE_197_POINTER:

	.byte 13
LDIFF_SYM2263=LTDIE_197 - Ldebug_info_start
	.long LDIFF_SYM2263
LTDIE_197_REFERENCE:

	.byte 14
LDIFF_SYM2264=LTDIE_197 - Ldebug_info_start
	.long LDIFF_SYM2264
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`2<System.Threading.Tasks.Task`1<System.Collections.Generic.IEnumerable`1<string>>,_object>:invoke_void_T1_T2"
	.asciz "wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object
	.quad Lme_122

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2265=LTDIE_197_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2265
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM2266=LTDIE_131_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2266
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM2267=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2267
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2268=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2268
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM2269=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2269
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM2270=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2270
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM2271=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2271
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2272=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2272
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2273=Lfde246_end - Lfde246_start
	.long LDIFF_SYM2273
Lfde246_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object

LDIFF_SYM2274=Lme_122 - wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_string_object
	.long LDIFF_SYM2274
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde246_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_198:

	.byte 5
	.asciz "System_Func`2"

	.byte 128,1,16
LDIFF_SYM2275=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2275
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2276=LTDIE_198 - Ldebug_info_start
	.long LDIFF_SYM2276
LTDIE_198_POINTER:

	.byte 13
LDIFF_SYM2277=LTDIE_198 - Ldebug_info_start
	.long LDIFF_SYM2277
LTDIE_198_REFERENCE:

	.byte 14
LDIFF_SYM2278=LTDIE_198 - Ldebug_info_start
	.long LDIFF_SYM2278
LTDIE_199:

	.byte 17
	.asciz "System_IAsyncResult"

	.byte 16,7
	.asciz "System_IAsyncResult"

LDIFF_SYM2279=LTDIE_199 - Ldebug_info_start
	.long LDIFF_SYM2279
LTDIE_199_POINTER:

	.byte 13
LDIFF_SYM2280=LTDIE_199 - Ldebug_info_start
	.long LDIFF_SYM2280
LTDIE_199_REFERENCE:

	.byte 14
LDIFF_SYM2281=LTDIE_199 - Ldebug_info_start
	.long LDIFF_SYM2281
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.IAsyncResult,_System.Collections.Generic.IEnumerable`1<string>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult
	.quad Lme_123

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2282=LTDIE_198_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2282
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2283=LTDIE_199_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2283
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2284=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2284
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM2285=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2285
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM2286=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2286
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM2287=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2287
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM2288=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2288
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM2289=LTDIE_182_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2289
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2290=Lfde247_end - Lfde247_start
	.long LDIFF_SYM2290
Lfde247_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult

LDIFF_SYM2291=Lme_123 - wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_string_invoke_TResult_T_System_IAsyncResult
	.long LDIFF_SYM2291
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde247_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_200:

	.byte 5
	.asciz "System_Action`1"

	.byte 128,1,16
LDIFF_SYM2292=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2292
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM2293=LTDIE_200 - Ldebug_info_start
	.long LDIFF_SYM2293
LTDIE_200_POINTER:

	.byte 13
LDIFF_SYM2294=LTDIE_200 - Ldebug_info_start
	.long LDIFF_SYM2294
LTDIE_200_REFERENCE:

	.byte 14
LDIFF_SYM2295=LTDIE_200 - Ldebug_info_start
	.long LDIFF_SYM2295
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<System.IAsyncResult>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
	.quad Lme_124

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2296=LTDIE_200_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2296
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2297=LTDIE_199_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2297
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2298=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2298
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM2299=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2299
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM2300=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2300
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM2301=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2301
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM2302=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2302
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2303=Lfde248_end - Lfde248_start
	.long LDIFF_SYM2303
Lfde248_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult

LDIFF_SYM2304=Lme_124 - wrapper_delegate_invoke_System_Action_1_System_IAsyncResult_invoke_void_T_System_IAsyncResult
	.long LDIFF_SYM2304
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde248_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_201:

	.byte 5
	.asciz "System_Func`3"

	.byte 128,1,16
LDIFF_SYM2305=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2305
	.byte 2,35,0,0,7
	.asciz "System_Func`3"

LDIFF_SYM2306=LTDIE_201 - Ldebug_info_start
	.long LDIFF_SYM2306
LTDIE_201_POINTER:

	.byte 13
LDIFF_SYM2307=LTDIE_201 - Ldebug_info_start
	.long LDIFF_SYM2307
LTDIE_201_REFERENCE:

	.byte 14
LDIFF_SYM2308=LTDIE_201 - Ldebug_info_start
	.long LDIFF_SYM2308
LTDIE_202:

	.byte 5
	.asciz "System_AsyncCallback"

	.byte 128,1,16
LDIFF_SYM2309=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2309
	.byte 2,35,0,0,7
	.asciz "System_AsyncCallback"

LDIFF_SYM2310=LTDIE_202 - Ldebug_info_start
	.long LDIFF_SYM2310
LTDIE_202_POINTER:

	.byte 13
LDIFF_SYM2311=LTDIE_202 - Ldebug_info_start
	.long LDIFF_SYM2311
LTDIE_202_REFERENCE:

	.byte 14
LDIFF_SYM2312=LTDIE_202 - Ldebug_info_start
	.long LDIFF_SYM2312
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`3<System.AsyncCallback,_object,_System.IAsyncResult>:invoke_TResult_T1_T2"
	.asciz "wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
	.quad Lme_125

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2313=LTDIE_201_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2313
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM2314=LTDIE_202_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2314
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM2315=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2315
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2316=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2316
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM2317=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2317
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM2318=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2318
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM2319=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2319
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2320=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2320
	.byte 1,103,11
	.asciz "V_5"

LDIFF_SYM2321=LTDIE_199_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2321
	.byte 1,101,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2322=Lfde249_end - Lfde249_start
	.long LDIFF_SYM2322
Lfde249_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object

LDIFF_SYM2323=Lme_125 - wrapper_delegate_invoke_System_Func_3_System_AsyncCallback_object_System_IAsyncResult_invoke_TResult_T1_T2_System_AsyncCallback_object
	.long LDIFF_SYM2323
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde249_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_203:

	.byte 5
	.asciz "System_Func`1"

	.byte 128,1,16
LDIFF_SYM2324=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2324
	.byte 2,35,0,0,7
	.asciz "System_Func`1"

LDIFF_SYM2325=LTDIE_203 - Ldebug_info_start
	.long LDIFF_SYM2325
LTDIE_203_POINTER:

	.byte 13
LDIFF_SYM2326=LTDIE_203 - Ldebug_info_start
	.long LDIFF_SYM2326
LTDIE_203_REFERENCE:

	.byte 14
LDIFF_SYM2327=LTDIE_203 - Ldebug_info_start
	.long LDIFF_SYM2327
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`1<System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>:invoke_TResult"
	.asciz "wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult
	.quad Lme_126

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2328=LTDIE_203_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2328
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2329=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2329
	.byte 1,104,11
	.asciz "V_1"

LDIFF_SYM2330=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2330
	.byte 1,106,11
	.asciz "V_2"

LDIFF_SYM2331=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2331
	.byte 1,105,11
	.asciz "V_3"

LDIFF_SYM2332=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2332
	.byte 1,103,11
	.asciz "V_4"

LDIFF_SYM2333=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2333
	.byte 1,105,11
	.asciz "V_5"

LDIFF_SYM2334=LTDIE_185_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2334
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2335=Lfde250_end - Lfde250_start
	.long LDIFF_SYM2335
Lfde250_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult

LDIFF_SYM2336=Lme_126 - wrapper_delegate_invoke_System_Func_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult
	.long LDIFF_SYM2336
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde250_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_204:

	.byte 5
	.asciz "System_Func`2"

	.byte 128,1,16
LDIFF_SYM2337=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2337
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2338=LTDIE_204 - Ldebug_info_start
	.long LDIFF_SYM2338
LTDIE_204_POINTER:

	.byte 13
LDIFF_SYM2339=LTDIE_204 - Ldebug_info_start
	.long LDIFF_SYM2339
LTDIE_204_REFERENCE:

	.byte 14
LDIFF_SYM2340=LTDIE_204 - Ldebug_info_start
	.long LDIFF_SYM2340
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<object,_System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object
	.quad Lme_127

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2341=LTDIE_204_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2341
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2342=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2342
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2343=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2343
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM2344=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2344
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM2345=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2345
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM2346=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2346
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM2347=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2347
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM2348=LTDIE_185_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2348
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2349=Lfde251_end - Lfde251_start
	.long LDIFF_SYM2349
Lfde251_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object

LDIFF_SYM2350=Lme_127 - wrapper_delegate_invoke_System_Func_2_object_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_object
	.long LDIFF_SYM2350
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde251_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_205:

	.byte 5
	.asciz "System_Action`1"

	.byte 128,1,16
LDIFF_SYM2351=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2351
	.byte 2,35,0,0,7
	.asciz "System_Action`1"

LDIFF_SYM2352=LTDIE_205 - Ldebug_info_start
	.long LDIFF_SYM2352
LTDIE_205_POINTER:

	.byte 13
LDIFF_SYM2353=LTDIE_205 - Ldebug_info_start
	.long LDIFF_SYM2353
LTDIE_205_REFERENCE:

	.byte 14
LDIFF_SYM2354=LTDIE_205 - Ldebug_info_start
	.long LDIFF_SYM2354
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`1<System.Threading.Tasks.Task`1<System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>>:invoke_void_T"
	.asciz "wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.quad Lme_128

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2355=LTDIE_205_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2355
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2356=LTDIE_184_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2356
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2357=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2357
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM2358=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2358
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM2359=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2359
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM2360=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2360
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM2361=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2361
	.byte 1,104,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2362=Lfde252_end - Lfde252_start
	.long LDIFF_SYM2362
Lfde252_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position

LDIFF_SYM2363=Lme_128 - wrapper_delegate_invoke_System_Action_1_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_void_T_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2363
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde252_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_206:

	.byte 5
	.asciz "System_Action`2"

	.byte 128,1,16
LDIFF_SYM2364=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2364
	.byte 2,35,0,0,7
	.asciz "System_Action`2"

LDIFF_SYM2365=LTDIE_206 - Ldebug_info_start
	.long LDIFF_SYM2365
LTDIE_206_POINTER:

	.byte 13
LDIFF_SYM2366=LTDIE_206 - Ldebug_info_start
	.long LDIFF_SYM2366
LTDIE_206_REFERENCE:

	.byte 14
LDIFF_SYM2367=LTDIE_206 - Ldebug_info_start
	.long LDIFF_SYM2367
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Action`2<System.Threading.Tasks.Task`1<System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>,_object>:invoke_void_T1_T2"
	.asciz "wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object
	.quad Lme_129

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2368=LTDIE_206_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2368
	.byte 1,104,3
	.asciz "param0"

LDIFF_SYM2369=LTDIE_184_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2369
	.byte 1,105,3
	.asciz "param1"

LDIFF_SYM2370=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2370
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2371=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2371
	.byte 1,102,11
	.asciz "V_1"

LDIFF_SYM2372=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2372
	.byte 1,104,11
	.asciz "V_2"

LDIFF_SYM2373=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2373
	.byte 1,103,11
	.asciz "V_3"

LDIFF_SYM2374=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2374
	.byte 1,101,11
	.asciz "V_4"

LDIFF_SYM2375=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2375
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2376=Lfde253_end - Lfde253_start
	.long LDIFF_SYM2376
Lfde253_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object

LDIFF_SYM2377=Lme_129 - wrapper_delegate_invoke_System_Action_2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object_invoke_void_T1_T2_System_Threading_Tasks_Task_1_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_object
	.long LDIFF_SYM2377
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,149,8,150,7,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde253_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_207:

	.byte 5
	.asciz "System_Func`2"

	.byte 128,1,16
LDIFF_SYM2378=LTDIE_18 - Ldebug_info_start
	.long LDIFF_SYM2378
	.byte 2,35,0,0,7
	.asciz "System_Func`2"

LDIFF_SYM2379=LTDIE_207 - Ldebug_info_start
	.long LDIFF_SYM2379
LTDIE_207_POINTER:

	.byte 13
LDIFF_SYM2380=LTDIE_207 - Ldebug_info_start
	.long LDIFF_SYM2380
LTDIE_207_REFERENCE:

	.byte 14
LDIFF_SYM2381=LTDIE_207 - Ldebug_info_start
	.long LDIFF_SYM2381
	.byte 2
	.asciz "(wrapper_delegate-invoke)_System.Func`2<System.IAsyncResult,_System.Collections.Generic.IEnumerable`1<Xamarin.Forms.Maps.Position>>:invoke_TResult_T"
	.asciz "wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult"

	.byte 0,0
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult
	.quad Lme_12a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2382=LTDIE_207_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2382
	.byte 1,105,3
	.asciz "param0"

LDIFF_SYM2383=LTDIE_199_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2383
	.byte 1,106,11
	.asciz "V_0"

LDIFF_SYM2384=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2384
	.byte 1,103,11
	.asciz "V_1"

LDIFF_SYM2385=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2385
	.byte 1,105,11
	.asciz "V_2"

LDIFF_SYM2386=LTDIE_130_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2386
	.byte 1,104,11
	.asciz "V_3"

LDIFF_SYM2387=LTDIE_18_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2387
	.byte 1,102,11
	.asciz "V_4"

LDIFF_SYM2388=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2388
	.byte 1,104,11
	.asciz "V_5"

LDIFF_SYM2389=LTDIE_185_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2389
	.byte 1,102,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2390=Lfde254_end - Lfde254_start
	.long LDIFF_SYM2390
Lfde254_start:

	.long 0
	.align 3
	.quad wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult

LDIFF_SYM2391=Lme_12a - wrapper_delegate_invoke_System_Func_2_System_IAsyncResult_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position_invoke_TResult_T_System_IAsyncResult
	.long LDIFF_SYM2391
	.long 0
	.byte 12,31,0,68,14,80,157,10,158,9,68,13,29,68,150,8,151,7,68,152,6,153,5,68,154,4
	.align 3
Lfde254_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_other)_Xamarin.Forms.Maps.Distance:StructureToPtr"
	.asciz "wrapper_other_Xamarin_Forms_Maps_Distance_StructureToPtr_object_intptr_bool"

	.byte 0,0
	.quad wrapper_other_Xamarin_Forms_Maps_Distance_StructureToPtr_object_intptr_bool
	.quad Lme_12b

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM2392=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2392
	.byte 2,141,16,3
	.asciz "param1"

LDIFF_SYM2393=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2393
	.byte 2,141,24,3
	.asciz "param2"

LDIFF_SYM2394=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2394
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2395=Lfde255_end - Lfde255_start
	.long LDIFF_SYM2395
Lfde255_start:

	.long 0
	.align 3
	.quad wrapper_other_Xamarin_Forms_Maps_Distance_StructureToPtr_object_intptr_bool

LDIFF_SYM2396=Lme_12b - wrapper_other_Xamarin_Forms_Maps_Distance_StructureToPtr_object_intptr_bool
	.long LDIFF_SYM2396
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde255_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_other)_Xamarin.Forms.Maps.Distance:PtrToStructure"
	.asciz "wrapper_other_Xamarin_Forms_Maps_Distance_PtrToStructure_intptr_object"

	.byte 0,0
	.quad wrapper_other_Xamarin_Forms_Maps_Distance_PtrToStructure_intptr_object
	.quad Lme_12c

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM2397=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2397
	.byte 2,141,16,3
	.asciz "param1"

LDIFF_SYM2398=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2398
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2399=Lfde256_end - Lfde256_start
	.long LDIFF_SYM2399
Lfde256_start:

	.long 0
	.align 3
	.quad wrapper_other_Xamarin_Forms_Maps_Distance_PtrToStructure_intptr_object

LDIFF_SYM2400=Lme_12c - wrapper_other_Xamarin_Forms_Maps_Distance_PtrToStructure_intptr_object
	.long LDIFF_SYM2400
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde256_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_other)_Xamarin.Forms.Maps.Position:StructureToPtr"
	.asciz "wrapper_other_Xamarin_Forms_Maps_Position_StructureToPtr_object_intptr_bool"

	.byte 0,0
	.quad wrapper_other_Xamarin_Forms_Maps_Position_StructureToPtr_object_intptr_bool
	.quad Lme_12d

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM2401=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2401
	.byte 2,141,16,3
	.asciz "param1"

LDIFF_SYM2402=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2402
	.byte 2,141,24,3
	.asciz "param2"

LDIFF_SYM2403=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2403
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2404=Lfde257_end - Lfde257_start
	.long LDIFF_SYM2404
Lfde257_start:

	.long 0
	.align 3
	.quad wrapper_other_Xamarin_Forms_Maps_Position_StructureToPtr_object_intptr_bool

LDIFF_SYM2405=Lme_12d - wrapper_other_Xamarin_Forms_Maps_Position_StructureToPtr_object_intptr_bool
	.long LDIFF_SYM2405
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde257_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "(wrapper_other)_Xamarin.Forms.Maps.Position:PtrToStructure"
	.asciz "wrapper_other_Xamarin_Forms_Maps_Position_PtrToStructure_intptr_object"

	.byte 0,0
	.quad wrapper_other_Xamarin_Forms_Maps_Position_PtrToStructure_intptr_object
	.quad Lme_12e

	.byte 2,118,16,3
	.asciz "param0"

LDIFF_SYM2406=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM2406
	.byte 2,141,16,3
	.asciz "param1"

LDIFF_SYM2407=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2407
	.byte 2,141,24,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2408=Lfde258_end - Lfde258_start
	.long LDIFF_SYM2408
Lfde258_start:

	.long 0
	.align 3
	.quad wrapper_other_Xamarin_Forms_Maps_Position_PtrToStructure_intptr_object

LDIFF_SYM2409=Lme_12e - wrapper_other_Xamarin_Forms_Maps_Position_PtrToStructure_intptr_object
	.long LDIFF_SYM2409
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde258_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:AddWithResize"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position"

	.byte 4,230,1
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position
	.quad Lme_12f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2410=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2410
	.byte 1,106,3
	.asciz "item"

LDIFF_SYM2411=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2411
	.byte 2,141,24,11
	.asciz "size"

LDIFF_SYM2412=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2412
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2413=Lfde259_end - Lfde259_start
	.long LDIFF_SYM2413
Lfde259_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position

LDIFF_SYM2414=Lme_12f - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddWithResize_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2414
	.long 0
	.byte 12,31,0,68,14,112,157,14,158,13,68,13,29,68,154,12
	.align 3
Lfde259_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:.cctor"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor"

	.byte 4,34
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor
	.quad Lme_130

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2415=Lfde260_end - Lfde260_start
	.long LDIFF_SYM2415
Lfde260_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor

LDIFF_SYM2416=Lme_130 - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__cctor
	.long LDIFF_SYM2416
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde260_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:.cctor"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor"

	.byte 1,183,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor
	.quad Lme_131

	.byte 2,118,16,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2417=Lfde261_end - Lfde261_start
	.long LDIFF_SYM2417
Lfde261_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor

LDIFF_SYM2418=Lme_131 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__cctor
	.long LDIFF_SYM2418
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde261_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_208:

	.byte 17
	.asciz "System_Collections_Generic_ICollection`1"

	.byte 16,7
	.asciz "System_Collections_Generic_ICollection`1"

LDIFF_SYM2419=LTDIE_208 - Ldebug_info_start
	.long LDIFF_SYM2419
LTDIE_208_POINTER:

	.byte 13
LDIFF_SYM2420=LTDIE_208 - Ldebug_info_start
	.long LDIFF_SYM2420
LTDIE_208_REFERENCE:

	.byte 14
LDIFF_SYM2421=LTDIE_208 - Ldebug_info_start
	.long LDIFF_SYM2421
	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position"

	.byte 4,64
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.quad Lme_132

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2422=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2422
	.byte 1,105,3
	.asciz "collection"

LDIFF_SYM2423=LTDIE_185_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2423
	.byte 1,106,11
	.asciz "c"

LDIFF_SYM2424=LTDIE_208_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2424
	.byte 1,103,11
	.asciz "count"

LDIFF_SYM2425=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2425
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2426=Lfde262_end - Lfde262_start
	.long LDIFF_SYM2426
Lfde262_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position

LDIFF_SYM2427=Lme_132 - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position__ctor_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2427
	.long 0
	.byte 12,31,0,68,14,64,157,8,158,7,68,13,29,68,151,6,152,5,68,153,4,154,3
	.align 3
Lfde262_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_209:

	.byte 8
	.asciz "System_ExceptionArgument"

	.byte 4
LDIFF_SYM2428=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2428
	.byte 9
	.asciz "obj"

	.byte 0,9
	.asciz "dictionary"

	.byte 1,9
	.asciz "dictionaryCreationThreshold"

	.byte 2,9
	.asciz "array"

	.byte 3,9
	.asciz "info"

	.byte 4,9
	.asciz "key"

	.byte 5,9
	.asciz "collection"

	.byte 6,9
	.asciz "list"

	.byte 7,9
	.asciz "match"

	.byte 8,9
	.asciz "converter"

	.byte 9,9
	.asciz "queue"

	.byte 10,9
	.asciz "stack"

	.byte 11,9
	.asciz "capacity"

	.byte 12,9
	.asciz "index"

	.byte 13,9
	.asciz "startIndex"

	.byte 14,9
	.asciz "value"

	.byte 15,9
	.asciz "count"

	.byte 16,9
	.asciz "arrayIndex"

	.byte 17,9
	.asciz "name"

	.byte 18,9
	.asciz "mode"

	.byte 19,9
	.asciz "item"

	.byte 20,9
	.asciz "options"

	.byte 21,9
	.asciz "view"

	.byte 22,9
	.asciz "sourceBytesToCopy"

	.byte 23,9
	.asciz "start"

	.byte 24,9
	.asciz "pointer"

	.byte 25,9
	.asciz "ownedMemory"

	.byte 26,9
	.asciz "text"

	.byte 27,9
	.asciz "length"

	.byte 28,9
	.asciz "comparer"

	.byte 29,9
	.asciz "comparable"

	.byte 30,9
	.asciz "exceptions"

	.byte 31,9
	.asciz "exception"

	.byte 32,9
	.asciz "action"

	.byte 33,9
	.asciz "comparison"

	.byte 34,9
	.asciz "startSegment"

	.byte 35,9
	.asciz "endSegment"

	.byte 36,9
	.asciz "endIndex"

	.byte 37,9
	.asciz "task"

	.byte 38,9
	.asciz "source"

	.byte 39,9
	.asciz "state"

	.byte 40,9
	.asciz "culture"

	.byte 41,9
	.asciz "destination"

	.byte 42,9
	.asciz "byteOffset"

	.byte 43,9
	.asciz "minimumBufferSize"

	.byte 44,9
	.asciz "offset"

	.byte 45,9
	.asciz "values"

	.byte 46,9
	.asciz "comparisonType"

	.byte 47,9
	.asciz "s"

	.byte 48,9
	.asciz "input"

	.byte 49,9
	.asciz "format"

	.byte 50,0,7
	.asciz "System_ExceptionArgument"

LDIFF_SYM2429=LTDIE_209 - Ldebug_info_start
	.long LDIFF_SYM2429
LTDIE_209_POINTER:

	.byte 13
LDIFF_SYM2430=LTDIE_209 - Ldebug_info_start
	.long LDIFF_SYM2430
LTDIE_209_REFERENCE:

	.byte 14
LDIFF_SYM2431=LTDIE_209 - Ldebug_info_start
	.long LDIFF_SYM2431
	.byte 2
	.asciz "System.ThrowHelper:IfNullAndNullsAreIllegalThenThrow<Xamarin.Forms.Maps.Position>"
	.asciz "System_ThrowHelper_IfNullAndNullsAreIllegalThenThrow_Xamarin_Forms_Maps_Position_object_System_ExceptionArgument"

	.byte 5,242,1
	.quad System_ThrowHelper_IfNullAndNullsAreIllegalThenThrow_Xamarin_Forms_Maps_Position_object_System_ExceptionArgument
	.quad Lme_133

	.byte 2,118,16,3
	.asciz "value"

LDIFF_SYM2432=LDIE_OBJECT - Ldebug_info_start
	.long LDIFF_SYM2432
	.byte 2,141,16,3
	.asciz "argName"

LDIFF_SYM2433=LTDIE_209 - Ldebug_info_start
	.long LDIFF_SYM2433
	.byte 2,141,24,11
	.asciz "V_0"

LDIFF_SYM2434=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2434
	.byte 2,141,32,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2435=Lfde263_end - Lfde263_start
	.long LDIFF_SYM2435
Lfde263_start:

	.long 0
	.align 3
	.quad System_ThrowHelper_IfNullAndNullsAreIllegalThenThrow_Xamarin_Forms_Maps_Position_object_System_ExceptionArgument

LDIFF_SYM2436=Lme_133 - System_ThrowHelper_IfNullAndNullsAreIllegalThenThrow_Xamarin_Forms_Maps_Position_object_System_ExceptionArgument
	.long LDIFF_SYM2436
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde263_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:EnsureCapacity"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int"

	.byte 4,159,3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int
	.quad Lme_134

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2437=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2437
	.byte 1,105,3
	.asciz "min"

LDIFF_SYM2438=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2438
	.byte 2,141,40,11
	.asciz "newCapacity"

LDIFF_SYM2439=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2439
	.byte 1,103,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2440=Lfde264_end - Lfde264_start
	.long LDIFF_SYM2440
Lfde264_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int

LDIFF_SYM2441=Lme_134 - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_EnsureCapacity_int
	.long LDIFF_SYM2441
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,151,4,152,3,68,153,2
	.align 3
Lfde264_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_210:

	.byte 5
	.asciz "_EmptyInternalEnumerator`1"

	.byte 16,16
LDIFF_SYM2442=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM2442
	.byte 2,35,0,0,7
	.asciz "_EmptyInternalEnumerator`1"

LDIFF_SYM2443=LTDIE_210 - Ldebug_info_start
	.long LDIFF_SYM2443
LTDIE_210_POINTER:

	.byte 13
LDIFF_SYM2444=LTDIE_210 - Ldebug_info_start
	.long LDIFF_SYM2444
LTDIE_210_REFERENCE:

	.byte 14
LDIFF_SYM2445=LTDIE_210 - Ldebug_info_start
	.long LDIFF_SYM2445
	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:Dispose"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose"

	.byte 1,187,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
	.quad Lme_135

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2446=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2446
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2447=Lfde265_end - Lfde265_start
	.long LDIFF_SYM2447
Lfde265_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose

LDIFF_SYM2448=Lme_135 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_Dispose
	.long LDIFF_SYM2448
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde265_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:MoveNext"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext"

	.byte 1,192,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
	.quad Lme_136

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2449=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2449
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2450=Lfde266_end - Lfde266_start
	.long LDIFF_SYM2450
Lfde266_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext

LDIFF_SYM2451=Lme_136 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_MoveNext
	.long LDIFF_SYM2451
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde266_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:get_Current"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current"

	.byte 1,197,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
	.quad Lme_137

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2452=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2452
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2453=Lfde267_end - Lfde267_start
	.long LDIFF_SYM2453
Lfde267_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current

LDIFF_SYM2454=Lme_137 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_get_Current
	.long LDIFF_SYM2454
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29
	.align 3
Lfde267_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.get_Current"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current"

	.byte 1,203,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.quad Lme_138

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2455=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2455
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2456=Lfde268_end - Lfde268_start
	.long LDIFF_SYM2456
Lfde268_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current

LDIFF_SYM2457=Lme_138 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_get_Current
	.long LDIFF_SYM2457
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29
	.align 3
Lfde268_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:System.Collections.IEnumerator.Reset"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset"

	.byte 1,209,2
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.quad Lme_139

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2458=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2458
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2459=Lfde269_end - Lfde269_start
	.long LDIFF_SYM2459
Lfde269_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset

LDIFF_SYM2460=Lme_139 - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position_System_Collections_IEnumerator_Reset
	.long LDIFF_SYM2460
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde269_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Array/EmptyInternalEnumerator`1<Xamarin.Forms.Maps.Position>:.ctor"
	.asciz "System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor"

	.byte 0,0
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor
	.quad Lme_13a

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2461=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2461
	.byte 0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2462=Lfde270_end - Lfde270_start
	.long LDIFF_SYM2462
Lfde270_start:

	.long 0
	.align 3
	.quad System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor

LDIFF_SYM2463=Lme_13a - System_Array_EmptyInternalEnumerator_1_Xamarin_Forms_Maps_Position__ctor
	.long LDIFF_SYM2463
	.long 0
	.byte 12,31,0,68,14,32,157,4,158,3,68,13,29
	.align 3
Lfde270_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_211:

	.byte 17
	.asciz "System_Collections_Generic_IEnumerator`1"

	.byte 16,7
	.asciz "System_Collections_Generic_IEnumerator`1"

LDIFF_SYM2464=LTDIE_211 - Ldebug_info_start
	.long LDIFF_SYM2464
LTDIE_211_POINTER:

	.byte 13
LDIFF_SYM2465=LTDIE_211 - Ldebug_info_start
	.long LDIFF_SYM2465
LTDIE_211_REFERENCE:

	.byte 14
LDIFF_SYM2466=LTDIE_211 - Ldebug_info_start
	.long LDIFF_SYM2466
	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:AddEnumerable"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddEnumerable_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position"

	.byte 4,208,8
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddEnumerable_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.quad Lme_13b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2467=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2467
	.byte 1,105,3
	.asciz "enumerable"

LDIFF_SYM2468=LTDIE_185_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2468
	.byte 1,106,11
	.asciz "en"

LDIFF_SYM2469=LTDIE_211_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2469
	.byte 2,141,48,11
	.asciz "current"

LDIFF_SYM2470=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2470
	.byte 2,141,32,11
	.asciz "V_2"

LDIFF_SYM2471=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2471
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2472=Lfde271_end - Lfde271_start
	.long LDIFF_SYM2472
Lfde271_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddEnumerable_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position

LDIFF_SYM2473=Lme_13b - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_AddEnumerable_System_Collections_Generic_IEnumerable_1_Xamarin_Forms_Maps_Position
	.long LDIFF_SYM2473
	.long 0
	.byte 12,31,0,68,14,96,157,12,158,11,68,13,29,68,153,10,154,9
	.align 3
Lfde271_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.List`1<Xamarin.Forms.Maps.Position>:set_Capacity"
	.asciz "System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int"

	.byte 4,103
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int
	.quad Lme_13c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM2474=LTDIE_44_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM2474
	.byte 1,105,3
	.asciz "value"

LDIFF_SYM2475=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM2475
	.byte 1,106,11
	.asciz "newItems"

LDIFF_SYM2476=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM2476
	.byte 1,106,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM2477=Lfde272_end - Lfde272_start
	.long LDIFF_SYM2477
Lfde272_start:

	.long 0
	.align 3
	.quad System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int

LDIFF_SYM2478=Lme_13c - System_Collections_Generic_List_1_Xamarin_Forms_Maps_Position_set_Capacity_int
	.long LDIFF_SYM2478
	.long 0
	.byte 12,31,0,68,14,48,157,6,158,5,68,13,29,68,153,4,154,3
	.align 3
Lfde272_end:

.section __DWARF, __debug_info,regular,debug

	.byte 0
Ldebug_info_end:
.text
	.align 3
mem_end:
