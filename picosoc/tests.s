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
	.string	"\r\nHits:      "
	.align	2
.LC7:
	.string	"\r\nMisses:    "
	.align	2
.LC8:
	.string	"\r\nTotal:     "
	.align	2
.LC9:
	.string	"\r\nMiss rate: "
	.align	2
.LC10:
	.string	"%\r\n\r\n"
	.text
	.align	2
	.globl	print_stats
	.type	print_stats, @function
print_stats:
	addi	sp,sp,-96
	sw	ra,92(sp)
	sw	s0,88(sp)
	addi	s0,sp,96
	sw	a0,-68(s0)
	sw	a1,-72(s0)
	sw	a2,-76(s0)
	sw	a3,-80(s0)
	sw	a4,-84(s0)
	lw	a4,-76(s0)
	lw	a5,-80(s0)
	add	a5,a4,a5
	sw	a5,-60(s0)
	lw	a5,-60(s0)
	bnez	a5,.L27
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	print_str
	j	.L44
.L27:
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L29
.L30:
	lw	a4,-20(s0)
	lw	a5,-80(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L29:
	lw	a4,-24(s0)
	li	a5,99
	bleu	a4,a5,.L30
	sw	zero,-28(s0)
	j	.L31
.L32:
	lw	a4,-20(s0)
	lw	a5,-60(s0)
	sub	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L31:
	lw	a4,-20(s0)
	lw	a5,-60(s0)
	bgeu	a4,a5,.L32
	sw	zero,-32(s0)
	sw	zero,-36(s0)
	j	.L33
.L34:
	lw	a4,-32(s0)
	lw	a5,-20(s0)
	add	a5,a4,a5
	sw	a5,-32(s0)
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
.L33:
	lw	a4,-36(s0)
	li	a5,99
	bleu	a4,a5,.L34
	sw	zero,-40(s0)
	j	.L35
.L36:
	lw	a4,-32(s0)
	lw	a5,-60(s0)
	sub	a5,a4,a5
	sw	a5,-32(s0)
	lw	a5,-40(s0)
	addi	a5,a5,1
	sw	a5,-40(s0)
.L35:
	lw	a4,-32(s0)
	lw	a5,-60(s0)
	bgeu	a4,a5,.L36
	sw	zero,-44(s0)
	sw	zero,-48(s0)
	sw	zero,-52(s0)
	j	.L37
.L38:
	lw	a4,-48(s0)
	lw	a5,-68(s0)
	add	a5,a4,a5
	sw	a5,-48(s0)
	lw	a5,-52(s0)
	addi	a5,a5,1
	sw	a5,-52(s0)
.L37:
	lw	a4,-52(s0)
	li	a5,9
	bleu	a4,a5,.L38
	j	.L39
.L40:
	lw	a4,-48(s0)
	lw	a5,-72(s0)
	sub	a5,a4,a5
	sw	a5,-48(s0)
	lw	a5,-44(s0)
	addi	a5,a5,1
	sw	a5,-44(s0)
.L39:
	lw	a4,-48(s0)
	lw	a5,-72(s0)
	bgeu	a4,a5,.L40
	sw	zero,-56(s0)
	sw	zero,-64(s0)
	j	.L41
.L42:
	lw	a5,-44(s0)
	addi	a5,a5,-10
	sw	a5,-44(s0)
	lw	a5,-56(s0)
	addi	a5,a5,1
	sw	a5,-56(s0)
.L41:
	lw	a4,-44(s0)
	li	a5,9
	bgtu	a4,a5,.L42
	lw	a5,-44(s0)
	sw	a5,-64(s0)
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	print_str
	lw	a0,-84(s0)
	call	print_str
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	print_str
	lw	a0,-68(s0)
	call	print_dec
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	print_str
	lw	a0,-72(s0)
	call	print_dec
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	print_str
	lw	a0,-56(s0)
	call	print_dec
	li	a5,33554432
	addi	a5,a5,8
	li	a4,46
	sw	a4,0(a5)
	lw	a0,-64(s0)
	call	print_dec
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	print_str
	lw	a0,-76(s0)
	call	print_dec
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	print_str
	lw	a0,-80(s0)
	call	print_dec
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	print_str
	lw	a0,-60(s0)
	call	print_dec
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	print_str
	lw	a0,-28(s0)
	call	print_dec
	li	a5,33554432
	addi	a5,a5,8
	li	a4,46
	sw	a4,0(a5)
	lw	a4,-40(s0)
	li	a5,9
	bgtu	a4,a5,.L43
	li	a5,33554432
	addi	a5,a5,8
	li	a4,48
	sw	a4,0(a5)
.L43:
	lw	a0,-40(s0)
	call	print_dec
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	print_str
.L44:
	nop
	lw	ra,92(sp)
	lw	s0,88(sp)
	addi	sp,sp,96
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
	j	.L46
.L50:
	sw	zero,-24(s0)
	j	.L47
.L49:
	lw	a5,-24(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a4,-112(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	addi	a3,s0,-16
	add	a5,a3,a5
	lbu	a5,-112(a5)
	bleu	a4,a5,.L48
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
.L48:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L47:
	li	a4,99
	lw	a5,-20(s0)
	sub	a5,a4,a5
	lw	a4,-24(s0)
	blt	a4,a5,.L49
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L46:
	lw	a4,-20(s0)
	li	a5,98
	ble	a4,a5,.L50
	lbu	a5,-29(s0)
	mv	a0,a5
	lw	ra,124(sp)
	lw	s0,120(sp)
	addi	sp,sp,128
	jr	ra
	.size	run_workload, .-run_workload
	.section	.rodata
	.align	2
.LC11:
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
# 211 "tests.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-28(s0)
 #APP
# 212 "tests.c" 1
	rdinstret a5
# 0 "" 2
 #NO_APP
	sw	a5,-32(s0)
	call	run_workload
	mv	a5,a0
	sb	a5,-33(s0)
 #APP
# 216 "tests.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-40(s0)
 #APP
# 217 "tests.c" 1
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
	lui	a5,%hi(.LC11)
	addi	a4,a5,%lo(.LC11)
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
	call	cache_counters_reset
 #APP
# 238 "tests.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-28(s0)
 #APP
# 239 "tests.c" 1
	rdinstret a5
# 0 "" 2
 #NO_APP
	sw	a5,-32(s0)
	lw	a5,-52(s0)
	jalr	a5
 #APP
# 243 "tests.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-36(s0)
 #APP
# 244 "tests.c" 1
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
	.globl	test_empty_loop
	.type	test_empty_loop, @function
test_empty_loop:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	j	.L56
.L57:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L56:
	lw	a4,-20(s0)
	li	a5,8192
	addi	a5,a5,1807
	ble	a4,a5,.L57
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_empty_loop, .-test_empty_loop
	.align	2
	.globl	test_single_loop
	.type	test_single_loop, @function
test_single_loop:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L59
.L60:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L59:
	lw	a4,-24(s0)
	li	a5,8192
	addi	a5,a5,1807
	ble	a4,a5,.L60
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_single_loop, .-test_single_loop
	.align	2
	.globl	test_transpose_nested
	.type	test_transpose_nested, @function
test_transpose_nested:
	addi	sp,sp,-2032
	sw	s0,2028(sp)
	addi	s0,sp,2032
	li	t1,-77824
	addi	t1,t1,-176
	add	sp,sp,t1
	sw	zero,-28(s0)
	sw	zero,-20(s0)
	j	.L62
.L65:
	sw	zero,-24(s0)
	j	.L63
.L64:
	li	a5,-40960
	addi	a4,s0,-16
	add	a4,a4,a5
	lw	a3,-24(s0)
	li	a5,100
	mul	a3,a3,a5
	lw	a5,-20(s0)
	add	a5,a3,a5
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,948(a5)
	li	a5,-81920
	addi	a3,s0,-16
	add	a3,a3,a5
	lw	a2,-20(s0)
	li	a5,100
	mul	a2,a2,a5
	lw	a5,-24(s0)
	add	a5,a2,a5
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,1908(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L63:
	lw	a4,-24(s0)
	li	a5,99
	ble	a4,a5,.L64
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L62:
	lw	a4,-20(s0)
	li	a5,99
	ble	a4,a5,.L65
	nop
	li	t1,77824
	addi	t1,t1,176
	add	sp,sp,t1
	lw	s0,2028(sp)
	addi	sp,sp,2032
	jr	ra
	.size	test_transpose_nested, .-test_transpose_nested
	.align	2
	.globl	fib
	.type	fib, @function
fib:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	li	a5,1
	bgt	a4,a5,.L67
	lw	a5,-20(s0)
	j	.L68
.L67:
	lw	a5,-20(s0)
	addi	a5,a5,-1
	mv	a0,a5
	call	fib
	mv	s1,a0
	lw	a5,-20(s0)
	addi	a5,a5,-2
	mv	a0,a5
	call	fib
	mv	a5,a0
	add	a5,s1,a5
.L68:
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
	.size	fib, .-fib
	.align	2
	.globl	test_recursive
	.type	test_recursive, @function
test_recursive:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a0,18
	call	fib
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_recursive, .-test_recursive
	.align	2
	.globl	test_large_switch
	.type	test_large_switch, @function
test_large_switch:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L71
.L175:
	lw	a4,-20(s0)
	li	a5,99
	bgtu	a4,a5,.L72
	lw	a5,-20(s0)
	slli	a4,a5,2
	lui	a5,%hi(.L74)
	addi	a5,a5,%lo(.L74)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L74:
	.word	.L176
	.word	.L172
	.word	.L171
	.word	.L170
	.word	.L169
	.word	.L168
	.word	.L167
	.word	.L166
	.word	.L165
	.word	.L164
	.word	.L163
	.word	.L162
	.word	.L161
	.word	.L160
	.word	.L159
	.word	.L158
	.word	.L157
	.word	.L156
	.word	.L155
	.word	.L154
	.word	.L153
	.word	.L152
	.word	.L151
	.word	.L150
	.word	.L149
	.word	.L148
	.word	.L147
	.word	.L146
	.word	.L145
	.word	.L144
	.word	.L143
	.word	.L142
	.word	.L141
	.word	.L140
	.word	.L139
	.word	.L138
	.word	.L137
	.word	.L136
	.word	.L135
	.word	.L134
	.word	.L133
	.word	.L132
	.word	.L131
	.word	.L130
	.word	.L129
	.word	.L128
	.word	.L127
	.word	.L126
	.word	.L125
	.word	.L124
	.word	.L123
	.word	.L122
	.word	.L121
	.word	.L120
	.word	.L119
	.word	.L118
	.word	.L117
	.word	.L116
	.word	.L115
	.word	.L114
	.word	.L113
	.word	.L112
	.word	.L111
	.word	.L110
	.word	.L109
	.word	.L108
	.word	.L107
	.word	.L106
	.word	.L105
	.word	.L104
	.word	.L103
	.word	.L102
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L96
	.word	.L95
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L85
	.word	.L84
	.word	.L83
	.word	.L82
	.word	.L81
	.word	.L80
	.word	.L79
	.word	.L78
	.word	.L77
	.word	.L76
	.word	.L75
	.word	.L73
	.text
.L172:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	j	.L72
.L171:
	lw	a5,-20(s0)
	addi	a5,a5,2
	sw	a5,-20(s0)
	j	.L72
.L170:
	lw	a5,-20(s0)
	addi	a5,a5,3
	sw	a5,-20(s0)
	j	.L72
.L169:
	lw	a5,-20(s0)
	addi	a5,a5,4
	sw	a5,-20(s0)
	j	.L72
.L168:
	lw	a5,-20(s0)
	addi	a5,a5,5
	sw	a5,-20(s0)
	j	.L72
.L167:
	lw	a5,-20(s0)
	addi	a5,a5,6
	sw	a5,-20(s0)
	j	.L72
.L166:
	lw	a5,-20(s0)
	addi	a5,a5,7
	sw	a5,-20(s0)
	j	.L72
.L165:
	lw	a5,-20(s0)
	addi	a5,a5,8
	sw	a5,-20(s0)
	j	.L72
.L164:
	lw	a5,-20(s0)
	addi	a5,a5,9
	sw	a5,-20(s0)
	j	.L72
.L163:
	lw	a5,-20(s0)
	addi	a5,a5,10
	sw	a5,-20(s0)
	j	.L72
.L162:
	lw	a5,-20(s0)
	addi	a5,a5,11
	sw	a5,-20(s0)
	j	.L72
.L161:
	lw	a5,-20(s0)
	addi	a5,a5,12
	sw	a5,-20(s0)
	j	.L72
.L160:
	lw	a5,-20(s0)
	addi	a5,a5,13
	sw	a5,-20(s0)
	j	.L72
.L159:
	lw	a5,-20(s0)
	addi	a5,a5,14
	sw	a5,-20(s0)
	j	.L72
.L158:
	lw	a5,-20(s0)
	addi	a5,a5,15
	sw	a5,-20(s0)
	j	.L72
.L157:
	lw	a5,-20(s0)
	addi	a5,a5,16
	sw	a5,-20(s0)
	j	.L72
.L156:
	lw	a5,-20(s0)
	addi	a5,a5,17
	sw	a5,-20(s0)
	j	.L72
.L155:
	lw	a5,-20(s0)
	addi	a5,a5,18
	sw	a5,-20(s0)
	j	.L72
.L154:
	lw	a5,-20(s0)
	addi	a5,a5,19
	sw	a5,-20(s0)
	j	.L72
.L153:
	lw	a5,-20(s0)
	addi	a5,a5,20
	sw	a5,-20(s0)
	j	.L72
.L152:
	lw	a5,-20(s0)
	addi	a5,a5,21
	sw	a5,-20(s0)
	j	.L72
.L151:
	lw	a5,-20(s0)
	addi	a5,a5,22
	sw	a5,-20(s0)
	j	.L72
.L150:
	lw	a5,-20(s0)
	addi	a5,a5,23
	sw	a5,-20(s0)
	j	.L72
.L149:
	lw	a5,-20(s0)
	addi	a5,a5,24
	sw	a5,-20(s0)
	j	.L72
.L148:
	lw	a5,-20(s0)
	addi	a5,a5,25
	sw	a5,-20(s0)
	j	.L72
.L147:
	lw	a5,-20(s0)
	addi	a5,a5,26
	sw	a5,-20(s0)
	j	.L72
.L146:
	lw	a5,-20(s0)
	addi	a5,a5,27
	sw	a5,-20(s0)
	j	.L72
.L145:
	lw	a5,-20(s0)
	addi	a5,a5,28
	sw	a5,-20(s0)
	j	.L72
.L144:
	lw	a5,-20(s0)
	addi	a5,a5,29
	sw	a5,-20(s0)
	j	.L72
.L143:
	lw	a5,-20(s0)
	addi	a5,a5,30
	sw	a5,-20(s0)
	j	.L72
.L142:
	lw	a5,-20(s0)
	addi	a5,a5,31
	sw	a5,-20(s0)
	j	.L72
.L141:
	lw	a5,-20(s0)
	addi	a5,a5,32
	sw	a5,-20(s0)
	j	.L72
.L140:
	lw	a5,-20(s0)
	addi	a5,a5,33
	sw	a5,-20(s0)
	j	.L72
.L139:
	lw	a5,-20(s0)
	addi	a5,a5,34
	sw	a5,-20(s0)
	j	.L72
.L138:
	lw	a5,-20(s0)
	addi	a5,a5,35
	sw	a5,-20(s0)
	j	.L72
.L137:
	lw	a5,-20(s0)
	addi	a5,a5,36
	sw	a5,-20(s0)
	j	.L72
.L136:
	lw	a5,-20(s0)
	addi	a5,a5,37
	sw	a5,-20(s0)
	j	.L72
.L135:
	lw	a5,-20(s0)
	addi	a5,a5,38
	sw	a5,-20(s0)
	j	.L72
.L134:
	lw	a5,-20(s0)
	addi	a5,a5,39
	sw	a5,-20(s0)
	j	.L72
.L133:
	lw	a5,-20(s0)
	addi	a5,a5,40
	sw	a5,-20(s0)
	j	.L72
.L132:
	lw	a5,-20(s0)
	addi	a5,a5,41
	sw	a5,-20(s0)
	j	.L72
.L131:
	lw	a5,-20(s0)
	addi	a5,a5,42
	sw	a5,-20(s0)
	j	.L72
.L130:
	lw	a5,-20(s0)
	addi	a5,a5,43
	sw	a5,-20(s0)
	j	.L72
.L129:
	lw	a5,-20(s0)
	addi	a5,a5,44
	sw	a5,-20(s0)
	j	.L72
.L128:
	lw	a5,-20(s0)
	addi	a5,a5,45
	sw	a5,-20(s0)
	j	.L72
.L127:
	lw	a5,-20(s0)
	addi	a5,a5,46
	sw	a5,-20(s0)
	j	.L72
.L126:
	lw	a5,-20(s0)
	addi	a5,a5,47
	sw	a5,-20(s0)
	j	.L72
.L125:
	lw	a5,-20(s0)
	addi	a5,a5,48
	sw	a5,-20(s0)
	j	.L72
.L124:
	lw	a5,-20(s0)
	addi	a5,a5,49
	sw	a5,-20(s0)
	j	.L72
.L123:
	lw	a5,-20(s0)
	addi	a5,a5,50
	sw	a5,-20(s0)
	j	.L72
.L122:
	lw	a5,-20(s0)
	addi	a5,a5,51
	sw	a5,-20(s0)
	j	.L72
.L121:
	lw	a5,-20(s0)
	addi	a5,a5,52
	sw	a5,-20(s0)
	j	.L72
.L120:
	lw	a5,-20(s0)
	addi	a5,a5,53
	sw	a5,-20(s0)
	j	.L72
.L119:
	lw	a5,-20(s0)
	addi	a5,a5,54
	sw	a5,-20(s0)
	j	.L72
.L118:
	lw	a5,-20(s0)
	addi	a5,a5,55
	sw	a5,-20(s0)
	j	.L72
.L117:
	lw	a5,-20(s0)
	addi	a5,a5,56
	sw	a5,-20(s0)
	j	.L72
.L116:
	lw	a5,-20(s0)
	addi	a5,a5,57
	sw	a5,-20(s0)
	j	.L72
.L115:
	lw	a5,-20(s0)
	addi	a5,a5,58
	sw	a5,-20(s0)
	j	.L72
.L114:
	lw	a5,-20(s0)
	addi	a5,a5,59
	sw	a5,-20(s0)
	j	.L72
.L113:
	lw	a5,-20(s0)
	addi	a5,a5,60
	sw	a5,-20(s0)
	j	.L72
.L112:
	lw	a5,-20(s0)
	addi	a5,a5,61
	sw	a5,-20(s0)
	j	.L72
.L111:
	lw	a5,-20(s0)
	addi	a5,a5,62
	sw	a5,-20(s0)
	j	.L72
.L110:
	lw	a5,-20(s0)
	addi	a5,a5,63
	sw	a5,-20(s0)
	j	.L72
.L109:
	lw	a5,-20(s0)
	addi	a5,a5,64
	sw	a5,-20(s0)
	j	.L72
.L108:
	lw	a5,-20(s0)
	addi	a5,a5,65
	sw	a5,-20(s0)
	j	.L72
.L107:
	lw	a5,-20(s0)
	addi	a5,a5,66
	sw	a5,-20(s0)
	j	.L72
.L106:
	lw	a5,-20(s0)
	addi	a5,a5,67
	sw	a5,-20(s0)
	j	.L72
.L105:
	lw	a5,-20(s0)
	addi	a5,a5,68
	sw	a5,-20(s0)
	j	.L72
.L104:
	lw	a5,-20(s0)
	addi	a5,a5,69
	sw	a5,-20(s0)
	j	.L72
.L103:
	lw	a5,-20(s0)
	addi	a5,a5,70
	sw	a5,-20(s0)
	j	.L72
.L102:
	lw	a5,-20(s0)
	addi	a5,a5,71
	sw	a5,-20(s0)
	j	.L72
.L101:
	lw	a5,-20(s0)
	addi	a5,a5,72
	sw	a5,-20(s0)
	j	.L72
.L100:
	lw	a5,-20(s0)
	addi	a5,a5,73
	sw	a5,-20(s0)
	j	.L72
.L99:
	lw	a5,-20(s0)
	addi	a5,a5,74
	sw	a5,-20(s0)
	j	.L72
.L98:
	lw	a5,-20(s0)
	addi	a5,a5,75
	sw	a5,-20(s0)
	j	.L72
.L97:
	lw	a5,-20(s0)
	addi	a5,a5,76
	sw	a5,-20(s0)
	j	.L72
.L96:
	lw	a5,-20(s0)
	addi	a5,a5,77
	sw	a5,-20(s0)
	j	.L72
.L95:
	lw	a5,-20(s0)
	addi	a5,a5,78
	sw	a5,-20(s0)
	j	.L72
.L94:
	lw	a5,-20(s0)
	addi	a5,a5,79
	sw	a5,-20(s0)
	j	.L72
.L93:
	lw	a5,-20(s0)
	addi	a5,a5,80
	sw	a5,-20(s0)
	j	.L72
.L92:
	lw	a5,-20(s0)
	addi	a5,a5,81
	sw	a5,-20(s0)
	j	.L72
.L91:
	lw	a5,-20(s0)
	addi	a5,a5,82
	sw	a5,-20(s0)
	j	.L72
.L90:
	lw	a5,-20(s0)
	addi	a5,a5,83
	sw	a5,-20(s0)
	j	.L72
.L89:
	lw	a5,-20(s0)
	addi	a5,a5,84
	sw	a5,-20(s0)
	j	.L72
.L88:
	lw	a5,-20(s0)
	addi	a5,a5,85
	sw	a5,-20(s0)
	j	.L72
.L87:
	lw	a5,-20(s0)
	addi	a5,a5,86
	sw	a5,-20(s0)
	j	.L72
.L86:
	lw	a5,-20(s0)
	addi	a5,a5,87
	sw	a5,-20(s0)
	j	.L72
.L85:
	lw	a5,-20(s0)
	addi	a5,a5,88
	sw	a5,-20(s0)
	j	.L72
.L84:
	lw	a5,-20(s0)
	addi	a5,a5,89
	sw	a5,-20(s0)
	j	.L72
.L83:
	lw	a5,-20(s0)
	addi	a5,a5,90
	sw	a5,-20(s0)
	j	.L72
.L82:
	lw	a5,-20(s0)
	addi	a5,a5,91
	sw	a5,-20(s0)
	j	.L72
.L81:
	lw	a5,-20(s0)
	addi	a5,a5,92
	sw	a5,-20(s0)
	j	.L72
.L80:
	lw	a5,-20(s0)
	addi	a5,a5,93
	sw	a5,-20(s0)
	j	.L72
.L79:
	lw	a5,-20(s0)
	addi	a5,a5,94
	sw	a5,-20(s0)
	j	.L72
.L78:
	lw	a5,-20(s0)
	addi	a5,a5,95
	sw	a5,-20(s0)
	j	.L72
.L77:
	lw	a5,-20(s0)
	addi	a5,a5,96
	sw	a5,-20(s0)
	j	.L72
.L76:
	lw	a5,-20(s0)
	addi	a5,a5,97
	sw	a5,-20(s0)
	j	.L72
.L75:
	lw	a5,-20(s0)
	addi	a5,a5,98
	sw	a5,-20(s0)
	j	.L72
.L73:
	lw	a5,-20(s0)
	addi	a5,a5,99
	sw	a5,-20(s0)
	j	.L72
.L176:
	nop
.L72:
	lw	a4,-20(s0)
	li	a5,99
	bleu	a4,a5,.L174
	lw	a5,-20(s0)
	addi	a5,a5,-100
	sw	a5,-20(s0)
.L174:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L71:
	lw	a4,-24(s0)
	li	a5,8192
	addi	a5,a5,1807
	bleu	a4,a5,.L175
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_large_switch, .-test_large_switch
	.align	2
	.globl	test_bubble_sort
	.type	test_bubble_sort, @function
test_bubble_sort:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	call	run_workload
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	test_bubble_sort, .-test_bubble_sort
	.section	.rodata
	.align	2
.LC12:
	.string	"Start of benchmarks\r\n\r\n"
	.align	2
.LC13:
	.string	"test_empty_loop"
	.align	2
.LC14:
	.string	"test_single_loop"
	.align	2
.LC15:
	.string	"test_bubble_sort"
	.align	2
.LC16:
	.string	"test_transpose_nested"
	.align	2
.LC17:
	.string	"test_recursive"
	.align	2
.LC18:
	.string	"test_large_switch"
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
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	print_str
	lui	a5,%hi(.LC13)
	addi	a1,a5,%lo(.LC13)
	lui	a5,%hi(test_empty_loop)
	addi	a0,a5,%lo(test_empty_loop)
	call	run_test
	lui	a5,%hi(.LC14)
	addi	a1,a5,%lo(.LC14)
	lui	a5,%hi(test_single_loop)
	addi	a0,a5,%lo(test_single_loop)
	call	run_test
	lui	a5,%hi(.LC15)
	addi	a1,a5,%lo(.LC15)
	lui	a5,%hi(test_bubble_sort)
	addi	a0,a5,%lo(test_bubble_sort)
	call	run_test
	lui	a5,%hi(.LC16)
	addi	a1,a5,%lo(.LC16)
	lui	a5,%hi(test_transpose_nested)
	addi	a0,a5,%lo(test_transpose_nested)
	call	run_test
	lui	a5,%hi(.LC17)
	addi	a1,a5,%lo(.LC17)
	lui	a5,%hi(test_recursive)
	addi	a0,a5,%lo(test_recursive)
	call	run_test
	lui	a5,%hi(.LC18)
	addi	a1,a5,%lo(.LC18)
	lui	a5,%hi(test_large_switch)
	addi	a0,a5,%lo(test_large_switch)
	call	run_test
	li	a5,2
	sb	a5,-17(s0)
.L179:
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
	j	.L179
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
