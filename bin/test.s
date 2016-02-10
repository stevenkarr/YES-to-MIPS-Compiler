	.text
_fibonacciRecursion:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 12
	subu  $sp, $sp, 0
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 0($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#seq T0=1 if both equal
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 1, .L0
	li    $t0, 2
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 0($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#seq T0=1 if both equal
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	b     .L1
.L0:
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
.L1:
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L2
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $v0, $t0
	j     _fibonacciRecursion_Exit
.L2:
	li    $t0, 2
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 0($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sub   $t0, $t0, $t1		#sub T0=T0-T1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   _fibonacciRecursion
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 0($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sub   $t0, $t0, $t1		#sub T0=T0-T1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   _fibonacciRecursion
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	add   $t0, $t0, $t1		#add T0=T0+T1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $v0, $t0
	j     _fibonacciRecursion_Exit
_fibonacciRecursion_Exit:
	lw    $ra, -4($fp)
	move  $t0, $fp
	lw    $fp, -8($fp)
	move  $sp, $t0
	jr    $ra
	.text
_fibonacciLoop:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 12
	subu  $sp, $sp, 16
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -12($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put RHS into LHS (assignment)
	li    $t0, 2
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -16($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put RHS into LHS (assignment)
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -20($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put RHS into LHS (assignment)
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 0($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#seq T0=1 if both equal
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 1, .L3
	li    $t0, 2
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 0($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#seq T0=1 if both equal
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	b     .L4
.L3:
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
.L4:
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L5
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $v0, $t0
	j     _fibonacciLoop_Exit
.L5:
	li    $t0, 3
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -24($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put RHS into LHS (assignment)
.L6:
	lw    $t0, 0($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -24($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sle   $t0, $t0, $t1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L7
	lw    $t0, -16($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -12($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	add   $t0, $t0, $t1		#add T0=T0+T1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -20($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put RHS into LHS (assignment)
	lw    $t0, -16($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -12($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put RHS into LHS (assignment)
	lw    $t0, -20($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -16($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put RHS into LHS (assignment)
	lw    $t0, -24($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	addi  $t0, $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -24($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put post dec increment save
	b     .L6
.L7:
	lw    $t0, -20($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $v0, $t0
	j     _fibonacciLoop_Exit
_fibonacciLoop_Exit:
	lw    $ra, -4($fp)
	move  $t0, $fp
	lw    $fp, -8($fp)
	move  $sp, $t0
	jr    $ra
	.text
_A:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 12
	subu  $sp, $sp, 0
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $v0, $t0
	j     _A_Exit
_A_Exit:
	lw    $ra, -4($fp)
	move  $t0, $fp
	lw    $fp, -8($fp)
	move  $sp, $t0
	jr    $ra
	.text
_B:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8
	subu  $sp, $sp, 0
	li    $t0, 5
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $v0, $t0
	j     _B_Exit
_B_Exit:
	lw    $ra, 0($fp)
	move  $t0, $fp
	lw    $fp, -4($fp)
	move  $sp, $t0
	jr    $ra
	.data
	.align 2
_broken:	.space 4
	.text
	.globl main
main:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8
	subu  $sp, $sp, 8
	.data
.L8:	.asciiz "Enter number up to which Fibonacci series to print: "
	.text
	la    $t0, .L8
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4
	syscall
	li    $v0, 5
	syscall
	la    $t0, -8($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $v0, 0($t0)	#store cin value
	.data
.L9:	.asciiz "\n"
	.text
	la    $t0, .L9
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4
	syscall
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -12($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put RHS into LHS (assignment)
.L10:
	lw    $t0, -8($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -12($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sle   $t0, $t0, $t1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L11
	lw    $t0, -12($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   _fibonacciRecursion
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1
	syscall
	.data
.L12:	.asciiz " "
	.text
	la    $t0, .L12
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4
	syscall
	lw    $t0, -12($fp)	#load ADDRESS CONTENTS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	addi  $t0, $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -12($fp)	#load ADDRESS of LHS to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put post dec increment save
	b     .L10
.L11:
	jal   _B
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   _A
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1
	syscall
	lw    $t0, _broken		#load ADDRESS CONTENTS of global to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	addi  $t0, $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, _broken		#load ADDRESS of global
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put post dec increment save
	lw    $t0, _broken		#load ADDRESS CONTENTS of global to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	addi  $t0, $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, _broken		#load ADDRESS of global
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#put post dec increment save
	lw    $t0, _broken		#load ADDRESS CONTENTS of global to T0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1
	syscall
_main_Exit:
	lw    $ra, 0($fp)
	move  $t0, $fp
	lw    $fp, -4($fp)
	move  $sp, $t0
	li    $v0, 10
	syscall
