	.file	"tests.c"
	.option nopic
	.text
	.align	2
	.type	cache_counters_reset, @function
cache_counters_reset:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,33554432
	addi	a5,a5,12
	sw	zero,0(a5)
	li	a5,33554432
	addi	a5,a5,16
	sw	zero,0(a5)
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	cache_counters_reset, .-cache_counters_reset
	.align	2
	.globl	flashio
	.type	flashio, @function
flashio:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sb	a2,-41(s0)
	mv	a2,sp
	mv	s1,a2
	lui	a2,%hi(flashio_worker_end)
	addi	a1,a2,%lo(flashio_worker_end)
	lui	a2,%hi(flashio_worker_begin)
	addi	a2,a2,%lo(flashio_worker_begin)
	sub	a2,a1,a2
	srai	a2,a2,2
	addi	a2,a2,-1
	sw	a2,-28(s0)
	lui	a2,%hi(flashio_worker_end)
	addi	a1,a2,%lo(flashio_worker_end)
	lui	a2,%hi(flashio_worker_begin)
	addi	a2,a2,%lo(flashio_worker_begin)
	sub	a2,a1,a2
	srai	a2,a2,2
	mv	t3,a2
	li	t4,0
	srli	a2,t3,27
	slli	a4,t4,5
	or	a4,a2,a4
	slli	a3,t3,5
	lui	a4,%hi(flashio_worker_end)
	addi	a3,a4,%lo(flashio_worker_end)
	lui	a4,%hi(flashio_worker_begin)
	addi	a4,a4,%lo(flashio_worker_begin)
	sub	a4,a3,a4
	srai	a4,a4,2
	mv	t1,a4
	li	t2,0
	srli	a4,t1,27
	slli	a6,t2,5
	or	a6,a4,a6
	slli	a5,t1,5
	lui	a5,%hi(flashio_worker_end)
	addi	a4,a5,%lo(flashio_worker_end)
	lui	a5,%hi(flashio_worker_begin)
	addi	a5,a5,%lo(flashio_worker_begin)
	sub	a5,a4,a5
	addi	a5,a5,3
	andi	a5,a5,-4
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	sub	sp,sp,a5
	mv	a5,sp
	addi	a5,a5,3
	srli	a5,a5,2
	slli	a5,a5,2
	sw	a5,-32(s0)
	lui	a5,%hi(flashio_worker_begin)
	addi	a5,a5,%lo(flashio_worker_begin)
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	sw	a5,-20(s0)
	j	.L3
.L4:
	lw	a4,-24(s0)
	addi	a5,a4,4
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	addi	a3,a5,4
	sw	a3,-20(s0)
	lw	a4,0(a4)
	sw	a4,0(a5)
.L3:
	lw	a4,-24(s0)
	lui	a5,%hi(flashio_worker_end)
	addi	a5,a5,%lo(flashio_worker_end)
	bne	a4,a5,.L4
	lw	a5,-32(s0)
	mv	a3,a5
	lw	a5,-40(s0)
	lbu	a4,-41(s0)
	mv	a2,a4
	mv	a1,a5
	lw	a0,-36(s0)
	jalr	a3
	mv	sp,s1
	nop
	addi	sp,s0,-48
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	addi	sp,sp,48
	jr	ra
	.size	flashio, .-flashio
	.align	2
	.globl	set_flash_qspi_flag
	.type	set_flash_qspi_flag, @function
set_flash_qspi_flag:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a5,53
	sb	a5,-28(s0)
	sb	zero,-27(s0)
	addi	a5,s0,-28
	li	a2,0
	li	a1,2
	mv	a0,a5
	call	flashio
	lbu	a5,-27(s0)
	sb	a5,-17(s0)
	li	a5,49
	sb	a5,-28(s0)
	lbu	a5,-17(s0)
	ori	a5,a5,2
	andi	a5,a5,0xff
	sb	a5,-27(s0)
	addi	a5,s0,-28
	li	a2,80
	li	a1,2
	mv	a0,a5
	call	flashio
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	set_flash_qspi_flag, .-set_flash_qspi_flag
	.align	2
	.globl	set_flash_mode_spi
	.type	set_flash_mode_spi, @function
set_flash_mode_spi:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,33554432
	lw	a3,0(a5)
	li	a5,33554432
	li	a4,-8323072
	addi	a4,a4,-1
	and	a4,a3,a4
	sw	a4,0(a5)
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	set_flash_mode_spi, .-set_flash_mode_spi
	.align	2
	.globl	set_flash_mode_dual
	.type	set_flash_mode_dual, @function
set_flash_mode_dual:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,33554432
	lw	a4,0(a5)
	li	a5,-8323072
	addi	a5,a5,-1
	and	a3,a4,a5
	li	a5,33554432
	li	a4,4194304
	or	a4,a3,a4
	sw	a4,0(a5)
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	set_flash_mode_dual, .-set_flash_mode_dual
	.align	2
	.globl	set_flash_mode_quad
	.type	set_flash_mode_quad, @function
set_flash_mode_quad:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,33554432
	lw	a4,0(a5)
	li	a5,-8323072
	addi	a5,a5,-1
	and	a3,a4,a5
	li	a5,33554432
	li	a4,2359296
	or	a4,a3,a4
	sw	a4,0(a5)
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	set_flash_mode_quad, .-set_flash_mode_quad
	.align	2
	.globl	set_flash_mode_qddr
	.type	set_flash_mode_qddr, @function
set_flash_mode_qddr:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,33554432
	lw	a4,0(a5)
	li	a5,-8323072
	addi	a5,a5,-1
	and	a3,a4,a5
	li	a5,33554432
	li	a4,6750208
	or	a4,a3,a4
	sw	a4,0(a5)
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	set_flash_mode_qddr, .-set_flash_mode_qddr
	.align	2
	.globl	enable_flash_crm
	.type	enable_flash_crm, @function
enable_flash_crm:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,33554432
	lw	a3,0(a5)
	li	a5,33554432
	li	a4,1048576
	or	a4,a3,a4
	sw	a4,0(a5)
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	enable_flash_crm, .-enable_flash_crm
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	sw	a5,-24(s0)
	j	.L12
.L13:
	lw	a4,-24(s0)
	addi	a5,a4,1
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	addi	a3,a5,1
	sw	a3,-20(s0)
	lbu	a4,0(a4)
	sb	a4,0(a5)
.L12:
	lw	a5,-44(s0)
	addi	a4,a5,-1
	sw	a4,-44(s0)
	bnez	a5,.L13
	lw	a5,-36(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	memcpy, .-memcpy
	.align	2
	.globl	setup_picosoc
	.type	setup_picosoc, @function
setup_picosoc:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a5,33554432
	addi	a5,a5,4
	li	a4,104
	sw	a4,0(a5)
	li	a5,50331648
	sb	zero,0(a5)
	call	set_flash_qspi_flag
	call	set_flash_mode_quad
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	setup_picosoc, .-setup_picosoc
	.align	2
	.globl	print_dec
	.type	print_dec, @function
print_dec:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L17
.L22:
	lui	a5,%hi(powers.1036)
	lw	a4,-24(s0)
	slli	a4,a4,2
	addi	a5,a5,%lo(powers.1036)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-32(s0)
	sw	zero,-28(s0)
	j	.L18
.L19:
	lw	a4,-36(s0)
	lw	a5,-32(s0)
	sub	a5,a4,a5
	sw	a5,-36(s0)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L18:
	lw	a4,-36(s0)
	lw	a5,-32(s0)
	bgeu	a4,a5,.L19
	lw	a5,-28(s0)
	bnez	a5,.L20
	lw	a5,-20(s0)
	bnez	a5,.L20
	lw	a4,-24(s0)
	li	a5,9
	bne	a4,a5,.L21
.L20:
	lw	a5,-28(s0)
	addi	a4,a5,48
	li	a5,33554432
	addi	a5,a5,8
	sw	a4,0(a5)
	li	a5,1
	sw	a5,-20(s0)
.L21:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L17:
	lw	a4,-24(s0)
	li	a5,9
	ble	a4,a5,.L22
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	print_dec, .-print_dec
	.align	2
	.globl	print_str
	.type	print_str, @function
print_str:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	j	.L24
.L25:
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	lbu	a4,0(a5)
	li	a5,33554432
	addi	a5,a5,8
	sw	a4,0(a5)
.L24:
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bnez	a5,.L25
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	print_str, .-print_str
	.align	2
	.globl	div
	.type	div, @function
div:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	j	.L27
.L28:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	sub	a5,a4,a5
	sw	a5,-36(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L27:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	bgeu	a4,a5,.L28
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	div, .-div
	.align	2
	.globl	mod
	.type	mod, @function
mod:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	j	.L31
.L32:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	sub	a5,a4,a5
	sw	a5,-20(s0)
.L31:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	bgeu	a4,a5,.L32
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	mod, .-mod
	.section	.rodata
	.align	2
.LC1:
	.string	"N/A\r\n"
	.align	2
.LC2:
	.string	"Results for "
	.align	2
.LC3:
	.string	"\r\nrdcycle:   "
	.align	2
.LC4:
	.string	"\r\nrdinstret: "
	.align	2
.LC5:
	.string	"\r\nCPI:       "
	.align	2
.LC6:
	.string	"."
	.align	2
.LC7:
	.string	"\r\nHits:      "
	.align	2
.LC8:
	.string	"\r\nMisses:    "
	.align	2
.LC9:
	.string	"\r\nTotal:     "
	.align	2
.LC10:
	.string	"\r\nMiss rate: "
	.align	2
.LC11:
	.string	"%\r\n\r\n"
	.text
	.align	2
	.globl	print_stats
	.type	print_stats, @function
print_stats:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	sw	a4,-52(s0)
	lw	a4,-44(s0)
	lw	a5,-48(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	bnez	a5,.L35
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	print_str
	j	.L37
.L35:
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	print_str
	lw	a0,-52(s0)
	call	print_str
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	print_str
	lw	a0,-36(s0)
	call	print_dec
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	print_str
	lw	a0,-40(s0)
	call	print_dec
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	print_str
	lw	a1,-40(s0)
	lw	a0,-36(s0)
	call	div
	mv	a5,a0
	mv	a0,a5
	call	print_dec
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	print_str
	lw	a4,-36(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	lw	a1,-40(s0)
	mv	a0,a5
	call	div
	mv	a5,a0
	li	a1,10
	mv	a0,a5
	call	mod
	mv	a5,a0
	mv	a0,a5
	call	print_dec
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	print_str
	lw	a0,-44(s0)
	call	print_dec
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	print_str
	lw	a0,-48(s0)
	call	print_dec
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	print_str
	lw	a0,-20(s0)
	call	print_dec
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	print_str
	lw	a4,-48(s0)
	li	a5,100
	mul	a5,a4,a5
	lw	a1,-20(s0)
	mv	a0,a5
	call	div
	mv	a5,a0
	mv	a0,a5
	call	print_dec
	li	a5,33554432
	addi	a5,a5,8
	li	a4,46
	sw	a4,0(a5)
	lw	a4,-48(s0)
	li	a5,1000
	mul	a5,a4,a5
	lw	a1,-20(s0)
	mv	a0,a5
	call	div
	mv	a5,a0
	li	a1,10
	mv	a0,a5
	call	mod
	sw	a0,-24(s0)
	lw	a0,-24(s0)
	call	print_dec
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	print_str
.L37:
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	print_stats, .-print_stats
	.section	.rodata
	.align	2
.LC0:
	.byte	-114
	.byte	87
	.byte	-43
	.byte	42
	.byte	119
	.byte	8
	.byte	-80
	.byte	54
	.byte	-25
	.byte	99
	.byte	12
	.byte	-91
	.byte	74
	.byte	-55
	.byte	33
	.byte	-106
	.byte	88
	.byte	-11
	.byte	19
	.byte	111
	.byte	-74
	.byte	63
	.byte	-119
	.byte	95
	.byte	-34
	.byte	4
	.byte	-98
	.byte	81
	.byte	-47
	.byte	47
	.byte	126
	.byte	71
	.byte	-62
	.byte	28
	.byte	-109
	.byte	-4
	.byte	91
	.byte	16
	.byte	115
	.byte	-86
	.byte	58
	.byte	-17
	.byte	83
	.byte	-124
	.byte	2
	.byte	-51
	.byte	67
	.byte	-107
	.byte	-30
	.byte	38
	.byte	104
	.byte	-68
	.byte	51
	.byte	-95
	.byte	94
	.byte	-14
	.byte	11
	.byte	123
	.byte	79
	.byte	-39
	.byte	-122
	.byte	45
	.byte	-83
	.byte	89
	.byte	-6
	.byte	23
	.byte	-101
	.byte	61
	.byte	-57
	.byte	108
	.byte	31
	.byte	-116
	.byte	-44
	.byte	76
	.byte	7
	.byte	-71
	.byte	53
	.byte	-89
	.byte	-22
	.byte	92
	.byte	121
	.byte	14
	.byte	-53
	.byte	69
	.byte	-104
	.byte	41
	.byte	-28
	.byte	85
	.byte	114
	.byte	-65
	.byte	26
	.byte	-77
	.byte	60
	.byte	-9
	.byte	97
	.byte	-120
	.byte	5
	.byte	-35
	.byte	73
	.byte	-94
	.text
	.align	2
	.globl	run_workload
	.type	run_workload, @function
run_workload:
	addi	sp,sp,-128
	sw	ra,124(sp)
	sw	s0,120(sp)
	addi	s0,sp,128
	lui	a5,%hi(.LC0)
	addi	a4,s0,-128
	addi	a5,a5,%lo(.LC0)
	li	a3,100
	mv	a2,a3
	mv	a1,a5
	mv	a0,a4
	call	memcpy
	sw	zero,-20(s0)
	j	.L39
.L43:
	sw	zero,-24(s0)
	j	.L40
.L42:
	lw	a5,-24(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a4,-112(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	addi	a3,s0,-16
	add	a5,a3,a5
	lbu	a5,-112(a5)
	bleu	a4,a5,.L41
	lw	a5,-24(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a5,-112(a5)
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a4,-112(a5)
	lw	a5,-24(s0)
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-112(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	lw	a4,-28(s0)
	andi	a4,a4,0xff
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-112(a5)
.L41:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L40:
	li	a4,99
	lw	a5,-20(s0)
	sub	a5,a4,a5
	lw	a4,-24(s0)
	blt	a4,a5,.L42
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L39:
	lw	a4,-20(s0)
	li	a5,98
	ble	a4,a5,.L43
	lbu	a5,-29(s0)
	mv	a0,a5
	lw	ra,124(sp)
	lw	s0,120(sp)
	addi	sp,sp,128
	jr	ra
	.size	run_workload, .-run_workload
	.section	.rodata
	.align	2
.LC12:
	.string	"run_workload"
	.text
	.align	2
	.globl	run_workload_timed
	.type	run_workload_timed, @function
run_workload_timed:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	call	cache_counters_reset
 #APP
# 202 "tests.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-28(s0)
 #APP
# 203 "tests.c" 1
	rdinstret a5
# 0 "" 2
 #NO_APP
	sw	a5,-32(s0)
	call	run_workload
	mv	a5,a0
	sb	a5,-33(s0)
 #APP
# 207 "tests.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-40(s0)
 #APP
# 208 "tests.c" 1
	rdinstret a5
# 0 "" 2
 #NO_APP
	sw	a5,-44(s0)
	li	a5,33554432
	addi	a5,a5,12
	lw	a5,0(a5)
	sw	a5,-20(s0)
	li	a5,33554432
	addi	a5,a5,16
	lw	a5,0(a5)
	sw	a5,-24(s0)
	lw	a4,-40(s0)
	lw	a5,-28(s0)
	sub	a0,a4,a5
	lw	a4,-44(s0)
	lw	a5,-32(s0)
	sub	a1,a4,a5
	lui	a5,%hi(.LC12)
	addi	a4,a5,%lo(.LC12)
	lw	a3,-24(s0)
	lw	a2,-20(s0)
	call	print_stats
	lbu	a5,-33(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	run_workload_timed, .-run_workload_timed
	.align	2
	.globl	run_test
	.type	run_test, @function
run_test:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	lw	a5,-52(s0)
	jalr	a5
	call	cache_counters_reset
 #APP
# 230 "tests.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-28(s0)
 #APP
# 231 "tests.c" 1
	rdinstret a5
# 0 "" 2
 #NO_APP
	sw	a5,-32(s0)
	lw	a5,-52(s0)
	jalr	a5
 #APP
# 235 "tests.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-36(s0)
 #APP
# 236 "tests.c" 1
	rdinstret a5
# 0 "" 2
 #NO_APP
	sw	a5,-40(s0)
	li	a5,33554432
	addi	a5,a5,12
	lw	a5,0(a5)
	sw	a5,-20(s0)
	li	a5,33554432
	addi	a5,a5,16
	lw	a5,0(a5)
	sw	a5,-24(s0)
	lw	a4,-36(s0)
	lw	a5,-28(s0)
	sub	a0,a4,a5
	lw	a4,-40(s0)
	lw	a5,-32(s0)
	sub	a5,a4,a5
	lw	a4,-56(s0)
	lw	a3,-24(s0)
	lw	a2,-20(s0)
	mv	a1,a5
	call	print_stats
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	run_test, .-run_test
	.align	2
	.type	test_tiny_loop, @function
test_tiny_loop:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L49
.L50:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L49:
	lw	a4,-24(s0)
	li	a5,98304
	addi	a5,a5,1695
	bleu	a4,a5,.L50
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_tiny_loop, .-test_tiny_loop
	.align	2
	.type	medium_body, @function
medium_body:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a5,-36(s0)
	lw	a5,0(a5)
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,1
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	srli	a5,a5,1
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-40(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,2
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	srli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-40(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,3
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	srli	a5,a5,3
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-40(s0)
	mv	a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	srli	a5,a5,4
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-40(s0)
	mv	a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,5
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	srli	a5,a5,5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-40(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,6
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	srli	a5,a5,6
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-40(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,7
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	srli	a5,a5,7
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-40(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	slli	a5,a5,8
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	srli	a5,a5,8
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-40(s0)
	mv	a5,a4
	slli	a5,a5,4
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	lw	a4,-20(s0)
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	medium_body, .-medium_body
	.align	2
	.type	test_medium_loop, @function
test_medium_loop:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a5,1
	sw	a5,-24(s0)
	sw	zero,-20(s0)
	j	.L53
.L54:
	addi	a5,s0,-24
	lw	a1,-20(s0)
	mv	a0,a5
	call	medium_body
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L53:
	lw	a4,-20(s0)
	li	a5,1999
	bleu	a4,a5,.L54
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_medium_loop, .-test_medium_loop
	.align	2
	.type	block_0, @function
block_0:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,1
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,3
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_0, .-block_0
	.align	2
	.type	block_1, @function
block_1:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-24(s0)
	slli	a5,a5,1
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,1
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,3
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	slli	a5,a5,3
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,4
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_1, .-block_1
	.align	2
	.type	block_2, @function
block_2:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,3
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,4
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_2, .-block_2
	.align	2
	.type	block_3, @function
block_3:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,3
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,4
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	slli	a5,a5,3
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,6
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_3, .-block_3
	.align	2
	.type	block_4, @function
block_4:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,4
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,6
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,7
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_4, .-block_4
	.align	2
	.type	block_5, @function
block_5:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	slli	a5,a5,3
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,6
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,7
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_5, .-block_5
	.align	2
	.type	block_6, @function
block_6:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,6
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,7
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,1
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_6, .-block_6
	.align	2
	.type	block_7, @function
block_7:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-24(s0)
	slli	a5,a5,3
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,7
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,1
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_7, .-block_7
	.align	2
	.type	block_8, @function
block_8:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,1
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,3
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_8, .-block_8
	.align	2
	.type	block_9, @function
block_9:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,1
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,3
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	slli	a5,a5,4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,4
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_9, .-block_9
	.align	2
	.type	block_10, @function
block_10:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,3
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,4
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,4
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_10, .-block_10
	.align	2
	.type	block_11, @function
block_11:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,3
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,4
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	slli	a5,a5,4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,6
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_11, .-block_11
	.align	2
	.type	block_12, @function
block_12:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,4
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,4
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,6
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,7
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_12, .-block_12
	.align	2
	.type	block_13, @function
block_13:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	slli	a5,a5,4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,6
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,7
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_13, .-block_13
	.align	2
	.type	block_14, @function
block_14:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,6
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,4
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,7
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	sub	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,1
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_14, .-block_14
	.align	2
	.type	block_15, @function
block_15:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-24(s0)
	slli	a5,a5,4
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,7
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,3
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	mv	a4,a5
	lw	a5,-20(s0)
	xor	a5,a5,a4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,1
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a4,-24(s0)
	li	a5,22
	mul	a5,a4,a5
	lw	a4,-20(s0)
	xor	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	srli	a5,a5,2
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	block_15, .-block_15
	.align	2
	.type	test_large_loop, @function
test_large_loop:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a5,-559038464
	addi	a5,a5,-273
	sw	a5,-20(s0)
	sw	zero,-24(s0)
	j	.L88
.L89:
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_0
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_1
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_2
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_3
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_4
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_5
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_6
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_7
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_8
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_9
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_10
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_11
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_12
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_13
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_14
	sw	a0,-20(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	block_15
	sw	a0,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L88:
	lw	a4,-24(s0)
	li	a5,499
	bleu	a4,a5,.L89
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_large_loop, .-test_large_loop
	.align	2
	.type	branch_tree, @function
branch_tree:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-24(s0)
	bnez	a5,.L91
	lw	a5,-20(s0)
	j	.L92
.L91:
	lw	a5,-20(s0)
	andi	a5,a5,1
	beqz	a5,.L93
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	.L94
.L93:
	lw	a5,-20(s0)
	srli	a5,a5,1
	sw	a5,-20(s0)
.L94:
	lw	a5,-20(s0)
	andi	a5,a5,2
	bnez	a5,.L103
	lw	a4,-20(s0)
	li	a5,57344
	addi	a5,a5,-339
	xor	a5,a4,a5
	sw	a5,-20(s0)
	j	.L97
.L103:
	nop
.L96:
	lw	a4,-20(s0)
	li	a5,49152
	addi	a5,a5,-273
	add	a5,a4,a5
	sw	a5,-20(s0)
.L97:
	lw	a5,-20(s0)
	andi	a5,a5,4
	beqz	a5,.L98
	lw	a5,-20(s0)
	slli	a4,a5,5
	srli	a5,a5,27
	or	a5,a4,a5
	sw	a5,-20(s0)
.L98:
	lw	a5,-20(s0)
	andi	a5,a5,8
	beqz	a5,.L99
	lw	a4,-20(s0)
	li	a5,-4096
	addi	a5,a5,-564
	add	a5,a4,a5
	sw	a5,-20(s0)
.L99:
	lw	a5,-20(s0)
	andi	a5,a5,16
	beqz	a5,.L100
	lw	a4,-20(s0)
	li	a5,45056
	addi	a5,a5,-1075
	xor	a5,a4,a5
	sw	a5,-20(s0)
.L100:
	lw	a5,-20(s0)
	andi	a5,a5,32
	beqz	a5,.L101
	lw	a4,-20(s0)
	li	a5,20480
	addi	a5,a5,1656
	add	a5,a4,a5
	sw	a5,-20(s0)
.L101:
	lw	a5,-24(s0)
	addi	a5,a5,-1
	mv	a1,a5
	lw	a0,-20(s0)
	call	branch_tree
	mv	a5,a0
.L92:
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	branch_tree, .-branch_tree
	.align	2
	.type	test_irregular_branch, @function
test_irregular_branch:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a5,-19087360
	addi	a5,a5,-1384
	sw	a5,-20(s0)
	sw	zero,-24(s0)
	j	.L105
.L106:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	li	a1,8
	mv	a0,a5
	call	branch_tree
	sw	a0,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L105:
	lw	a4,-24(s0)
	li	a5,4096
	addi	a5,a5,903
	bleu	a4,a5,.L106
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_irregular_branch, .-test_irregular_branch
	.align	2
	.type	callee_a, @function
callee_a:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	li	a5,-1582120960
	addi	a5,a5,980
	xor	a5,a4,a5
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	callee_a, .-callee_a
	.align	2
	.type	callee_b, @function
callee_b:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	li	a5,287453184
	addi	a5,a5,836
	add	a5,a4,a5
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	callee_b, .-callee_b
	.align	2
	.type	callee_c, @function
callee_c:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	srli	a4,a5,7
	slli	a5,a5,25
	or	a5,a5,a4
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	callee_c, .-callee_c
	.align	2
	.type	callee_d, @function
callee_d:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,9
	add	a5,a5,a4
	slli	a4,a5,18
	add	a5,a5,a4
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	callee_d, .-callee_d
	.align	2
	.type	caller, @function
caller:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	j	.L116
.L117:
	lw	a0,-36(s0)
	call	callee_a
	sw	a0,-36(s0)
	lw	a0,-36(s0)
	call	callee_b
	sw	a0,-36(s0)
	lw	a0,-36(s0)
	call	callee_c
	sw	a0,-36(s0)
	lw	a0,-36(s0)
	call	callee_d
	sw	a0,-36(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L116:
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	bltu	a4,a5,.L117
	lw	a5,-36(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	caller, .-caller
	.align	2
	.type	test_nested_call, @function
test_nested_call:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	li	a5,-1698897920
	addi	a5,a5,-272
	sw	a5,-20(s0)
	sw	zero,-24(s0)
	j	.L120
.L121:
	li	a1,40
	lw	a0,-20(s0)
	call	caller
	sw	a0,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L120:
	lw	a4,-24(s0)
	li	a5,499
	bleu	a4,a5,.L121
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_nested_call, .-test_nested_call
	.align	2
	.type	test_cold_sweep_16, @function
test_cold_sweep_16:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 375 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_cold_sweep_16, .-test_cold_sweep_16
	.align	2
	.type	test_cold_sweep_128, @function
test_cold_sweep_128:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 380 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_cold_sweep_128, .-test_cold_sweep_128
	.align	2
	.type	test_cold_sweep_512, @function
test_cold_sweep_512:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 385 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_cold_sweep_512, .-test_cold_sweep_512
	.align	2
	.type	test_cold_sweep_1024, @function
test_cold_sweep_1024:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 389 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_cold_sweep_1024, .-test_cold_sweep_1024
	.align	2
	.type	test_cold_sweep_2048, @function
test_cold_sweep_2048:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
# 393 "tests.c" 1
	j 1f
	.rept 0
	nop
	.endr
	1:
	
# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_cold_sweep_2048, .-test_cold_sweep_2048
	.align	2
	.type	test_cold_sweep_16_padding, @function
test_cold_sweep_16_padding:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 398 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_cold_sweep_16_padding, .-test_cold_sweep_16_padding
	.align	2
	.type	test_cold_sweep_64_padding, @function
test_cold_sweep_64_padding:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 403 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_cold_sweep_64_padding, .-test_cold_sweep_64_padding
	.align	2
	.type	test_cold_sweep_128_padding, @function
test_cold_sweep_128_padding:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 408 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_cold_sweep_128_padding, .-test_cold_sweep_128_padding
	.align	2
	.type	test_cold_sweep_256_padding, @function
test_cold_sweep_256_padding:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
 #APP
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
# 414 "tests.c" 1
	j 1f
	.rept 15
	nop
	.endr
	1:
	
# 0 "" 2
 #NO_APP
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_cold_sweep_256_padding, .-test_cold_sweep_256_padding
	.align	2
	.type	test_bubble_sort, @function
test_bubble_sort:
	addi	sp,sp,-128
	sw	ra,124(sp)
	sw	s0,120(sp)
	addi	s0,sp,128
	lui	a5,%hi(.LC0)
	addi	a4,s0,-128
	addi	a5,a5,%lo(.LC0)
	li	a3,100
	mv	a2,a3
	mv	a1,a5
	mv	a0,a4
	call	memcpy
	sw	zero,-20(s0)
	j	.L132
.L136:
	sw	zero,-24(s0)
	j	.L133
.L135:
	lw	a5,-24(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a4,-112(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	addi	a3,s0,-16
	add	a5,a3,a5
	lbu	a5,-112(a5)
	bleu	a4,a5,.L134
	lw	a5,-24(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a5,-112(a5)
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a4,-112(a5)
	lw	a5,-24(s0)
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-112(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	lw	a4,-28(s0)
	andi	a4,a4,0xff
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-112(a5)
.L134:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L133:
	li	a4,99
	lw	a5,-20(s0)
	sub	a5,a4,a5
	lw	a4,-24(s0)
	blt	a4,a5,.L135
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L132:
	lw	a4,-20(s0)
	li	a5,98
	ble	a4,a5,.L136
	nop
	lw	ra,124(sp)
	lw	s0,120(sp)
	addi	sp,sp,128
	jr	ra
	.size	test_bubble_sort, .-test_bubble_sort
	.align	2
	.type	quick_sort.1289, @function
quick_sort.1289:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	mv	s1,t2
	sw	t2,-60(s0)
	lw	a4,-52(s0)
	lw	a5,-56(s0)
	bge	a4,a5,.L142
	lw	a5,-56(s0)
	add	a5,s1,a5
	lbu	a5,0(a5)
	sw	a5,-28(s0)
	lw	a5,-52(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
	lw	a5,-52(s0)
	sw	a5,-24(s0)
	j	.L139
.L141:
	lw	a5,-24(s0)
	add	a5,s1,a5
	lbu	a5,0(a5)
	mv	a4,a5
	lw	a5,-28(s0)
	ble	a5,a4,.L140
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	add	a5,s1,a5
	lbu	a5,0(a5)
	sb	a5,-29(s0)
	lw	a5,-24(s0)
	add	a5,s1,a5
	lbu	a4,0(a5)
	lw	a5,-20(s0)
	add	a5,s1,a5
	sb	a4,0(a5)
	lw	a5,-24(s0)
	add	a5,s1,a5
	lbu	a4,-29(s0)
	sb	a4,0(a5)
.L140:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L139:
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	blt	a4,a5,.L141
	lw	a5,-20(s0)
	addi	a5,a5,1
	add	a5,s1,a5
	lbu	a5,0(a5)
	sb	a5,-30(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a4,-56(s0)
	add	a4,s1,a4
	lbu	a4,0(a4)
	add	a5,s1,a5
	sb	a4,0(a5)
	lw	a5,-56(s0)
	add	a5,s1,a5
	lbu	a4,-30(s0)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	addi	a5,a5,-1
	mv	t2,s1
	mv	a1,a5
	lw	a0,-52(s0)
	call	quick_sort.1289
	lw	a5,-36(s0)
	addi	a5,a5,1
	mv	t2,s1
	lw	a1,-56(s0)
	mv	a0,a5
	call	quick_sort.1289
.L142:
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
	.size	quick_sort.1289, .-quick_sort.1289
	.align	2
	.globl	test_quick_sort
	.type	test_quick_sort, @function
test_quick_sort:
	addi	sp,sp,-224
	sw	ra,220(sp)
	sw	s0,216(sp)
	addi	s0,sp,224
	mv	a5,s0
	sw	a5,-120(s0)
	lui	a5,%hi(.LC0)
	addi	a4,s0,-220
	addi	a5,a5,%lo(.LC0)
	li	a3,100
	mv	a2,a3
	mv	a1,a5
	mv	a0,a4
	call	memcpy
	addi	a5,s0,-220
	mv	t2,a5
	li	a1,99
	li	a0,0
	call	quick_sort.1289
	nop
	lw	ra,220(sp)
	lw	s0,216(sp)
	addi	sp,sp,224
	jr	ra
	.size	test_quick_sort, .-test_quick_sort
	.section	.rodata
	.align	2
.LC13:
	.string	"Start of benchmarks\r\n\r\n"
	.align	2
.LC14:
	.string	"test_bubble_sort"
	.align	2
.LC15:
	.string	"test_quick_sort"
	.align	2
.LC16:
	.string	"test_tiny_loop"
	.align	2
.LC17:
	.string	"test_medium_loop"
	.align	2
.LC18:
	.string	"test_large_loop"
	.align	2
.LC19:
	.string	"test_nested_call"
	.align	2
.LC20:
	.string	"test_irregular_branch"
	.align	2
.LC21:
	.string	"test_cold_sweep_16"
	.align	2
.LC22:
	.string	"test_cold_sweep_128"
	.align	2
.LC23:
	.string	"test_cold_sweep_512"
	.align	2
.LC24:
	.string	"test_cold_sweep_1024"
	.align	2
.LC25:
	.string	"test_cold_sweep_2048"
	.align	2
.LC26:
	.string	"test_cold_sweep_16_padding"
	.align	2
.LC27:
	.string	"test_cold_sweep_64_padding"
	.align	2
.LC28:
	.string	"test_cold_sweep_128_padding"
	.align	2
.LC29:
	.string	"test_cold_sweep_256_padding"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	addi	s0,sp,32
	call	setup_picosoc
	lui	a5,%hi(.LC13)
	addi	a0,a5,%lo(.LC13)
	call	print_str
	lui	a5,%hi(.LC14)
	addi	a1,a5,%lo(.LC14)
	lui	a5,%hi(test_bubble_sort)
	addi	a0,a5,%lo(test_bubble_sort)
	call	run_test
	lui	a5,%hi(.LC15)
	addi	a1,a5,%lo(.LC15)
	lui	a5,%hi(test_quick_sort)
	addi	a0,a5,%lo(test_quick_sort)
	call	run_test
	lui	a5,%hi(.LC16)
	addi	a1,a5,%lo(.LC16)
	lui	a5,%hi(test_tiny_loop)
	addi	a0,a5,%lo(test_tiny_loop)
	call	run_test
	lui	a5,%hi(.LC17)
	addi	a1,a5,%lo(.LC17)
	lui	a5,%hi(test_medium_loop)
	addi	a0,a5,%lo(test_medium_loop)
	call	run_test
	lui	a5,%hi(.LC18)
	addi	a1,a5,%lo(.LC18)
	lui	a5,%hi(test_large_loop)
	addi	a0,a5,%lo(test_large_loop)
	call	run_test
	lui	a5,%hi(.LC19)
	addi	a1,a5,%lo(.LC19)
	lui	a5,%hi(test_nested_call)
	addi	a0,a5,%lo(test_nested_call)
	call	run_test
	lui	a5,%hi(.LC20)
	addi	a1,a5,%lo(.LC20)
	lui	a5,%hi(test_irregular_branch)
	addi	a0,a5,%lo(test_irregular_branch)
	call	run_test
	lui	a5,%hi(.LC21)
	addi	a1,a5,%lo(.LC21)
	lui	a5,%hi(test_cold_sweep_16)
	addi	a0,a5,%lo(test_cold_sweep_16)
	call	run_test
	lui	a5,%hi(.LC22)
	addi	a1,a5,%lo(.LC22)
	lui	a5,%hi(test_cold_sweep_128)
	addi	a0,a5,%lo(test_cold_sweep_128)
	call	run_test
	lui	a5,%hi(.LC23)
	addi	a1,a5,%lo(.LC23)
	lui	a5,%hi(test_cold_sweep_512)
	addi	a0,a5,%lo(test_cold_sweep_512)
	call	run_test
	lui	a5,%hi(.LC24)
	addi	a1,a5,%lo(.LC24)
	lui	a5,%hi(test_cold_sweep_1024)
	addi	a0,a5,%lo(test_cold_sweep_1024)
	call	run_test
	lui	a5,%hi(.LC25)
	addi	a1,a5,%lo(.LC25)
	lui	a5,%hi(test_cold_sweep_2048)
	addi	a0,a5,%lo(test_cold_sweep_2048)
	call	run_test
	lui	a5,%hi(.LC26)
	addi	a1,a5,%lo(.LC26)
	lui	a5,%hi(test_cold_sweep_16_padding)
	addi	a0,a5,%lo(test_cold_sweep_16_padding)
	call	run_test
	lui	a5,%hi(.LC27)
	addi	a1,a5,%lo(.LC27)
	lui	a5,%hi(test_cold_sweep_64_padding)
	addi	a0,a5,%lo(test_cold_sweep_64_padding)
	call	run_test
	lui	a5,%hi(.LC28)
	addi	a1,a5,%lo(.LC28)
	lui	a5,%hi(test_cold_sweep_128_padding)
	addi	a0,a5,%lo(test_cold_sweep_128_padding)
	call	run_test
	lui	a5,%hi(.LC29)
	addi	a1,a5,%lo(.LC29)
	lui	a5,%hi(test_cold_sweep_256_padding)
	addi	a0,a5,%lo(test_cold_sweep_256_padding)
	call	run_test
	li	a5,2
	sb	a5,-17(s0)
.L145:
	li	a5,50331648
	addi	s1,a5,1
	call	run_workload
	mv	a5,a0
	sb	a5,0(s1)
	li	a5,50331648
	lbu	a4,-17(s0)
	sb	a4,0(a5)
	lbu	a5,-17(s0)
	xori	a5,a5,2
	sb	a5,-17(s0)
	j	.L145
	.size	main, .-main
	.section	.rodata
	.align	2
	.type	powers.1036, @object
	.size	powers.1036, 40
powers.1036:
	.word	1000000000
	.word	100000000
	.word	10000000
	.word	1000000
	.word	100000
	.word	10000
	.word	1000
	.word	100
	.word	10
	.word	1
	.ident	"GCC: (GNU) 8.2.0"
