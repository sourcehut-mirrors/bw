	.arch armv7-a
	.fpu vfpv4-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"fmad.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC4:
	.ascii	"d32   = %-+24.18e\012\000"
	.align	2
.LC5:
	.ascii	"\012dotme_fp32 is at %p\012\000"
	.align	2
.LC6:
	.ascii	"0x%02x \000"
	.align	2
.LC7:
	.ascii	"d64   = %-+24.18e\012\000"
	.align	2
.LC8:
	.ascii	"\012dotme_fp64 is at %p\012\000"
	.align	2
.LC9:
	.ascii	"d128  = %-+24.18Le\012\000"
	.align	2
.LC10:
	.ascii	"\012dotme_fp128 is at %p\012\000"
	.align	2
.LC11:
	.ascii	"      = +5.595788259858e-02 is correct\000"
	.align	2
.LC12:
	.ascii	"trust this 0x3faca682f76db9b9 from ARMv8\000"
	.align	2
.LC13:
	.ascii	"or maybe   0x3faca682f76db9c0 on Fujitsu SPARC VII+"
	.ascii	"\012\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	sub	sp, sp, #24
	movw	r1, #13296
	movt	r1, 15717
	mov	r2, #0
	movw	r3, #42622
	movt	r3, 16300
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	add	r4, sp, #4
	str	r1, [sp, #4]	@ float
	bl	printf
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	mov	r1, r4
	movw	r5, #:lower16:.LC6
	movt	r5, #:upper16:.LC6
	add	r6, sp, #8
	bl	printf
.L2:
	ldrb	r1, [r4], #1	@ zero_extendqisi2
	mov	r0, r5
	bl	printf
	cmp	r4, r6
	bne	.L2
	mov	r0, #10
	movw	r5, #:lower16:.LC6
	movt	r5, #:upper16:.LC6
	bl	putchar
	movw	r0, #47552
	movt	r0, 63341
	movw	r1, #42626
	movt	r1, 16300
	strd	r0, [sp, #8]
	mov	r2, r0
	mov	r3, r1
	movw	r0, #:lower16:.LC7
	movt	r0, #:upper16:.LC7
	add	r6, sp, #15
	bl	printf
	mov	r1, r4
	movw	r0, #:lower16:.LC8
	movt	r0, #:upper16:.LC8
	add	r4, sp, #7
	bl	printf
.L3:
	ldrb	r1, [r4, #1]!	@ zero_extendqisi2
	mov	r0, r5
	bl	printf
	cmp	r4, r6
	bne	.L3
	mov	r0, #10
	movw	r5, #:lower16:.LC6
	movt	r5, #:upper16:.LC6
	bl	putchar
	movw	r0, #47552
	movt	r0, 63341
	movw	r1, #42626
	movt	r1, 16300
	strd	r0, [sp, #16]
	mov	r2, r0
	mov	r3, r1
	movw	r0, #:lower16:.LC9
	movt	r0, #:upper16:.LC9
	add	r6, sp, #23
	bl	printf
	movw	r0, #:lower16:.LC10
	movt	r0, #:upper16:.LC10
	add	r1, sp, #16
	bl	printf
.L4:
	ldrb	r1, [r4, #1]!	@ zero_extendqisi2
	mov	r0, r5
	bl	printf
	cmp	r6, r4
	bne	.L4
	mov	r0, #10
	bl	putchar
	movw	r0, #:lower16:.LC11
	movt	r0, #:upper16:.LC11
	bl	puts
	movw	r0, #:lower16:.LC12
	movt	r0, #:upper16:.LC12
	bl	puts
	movw	r0, #:lower16:.LC13
	movt	r0, #:upper16:.LC13
	bl	puts
	mov	r0, #42
	add	sp, sp, #24
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	@ sp needed
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.size	main, .-main
	.ident	"GCC: (genunix Tue 10 May 2022 04:11:21 UTC 2022) 12.1.0"
	.section	.note.GNU-stack,"",%progbits
