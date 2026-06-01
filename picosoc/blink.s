	.file	"blink.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	cache_counters_reset, @function
cache_counters_reset:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a5,33554432
	addi	a5,a5,12
	sw	zero,0(a5)
	li	a5,33554432
	addi	a5,a5,16
	sw	zero,0(a5)
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
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
	mv	a3,a2
	sb	a3,-41(s0)
	mv	a3,sp
	mv	s1,a3
	lui	a3,%hi(flashio_worker_end)
	addi	a2,a3,%lo(flashio_worker_end)
	lui	a3,%hi(flashio_worker_begin)
	addi	a3,a3,%lo(flashio_worker_begin)
	sub	a3,a2,a3
	srai	a3,a3,2
	addi	a3,a3,-1
	sw	a3,-28(s0)
	lui	a3,%hi(flashio_worker_end)
	addi	a2,a3,%lo(flashio_worker_end)
	lui	a3,%hi(flashio_worker_begin)
	addi	a3,a3,%lo(flashio_worker_begin)
	sub	a3,a2,a3
	srai	a3,a3,2
	mv	t3,a3
	li	t4,0
	srli	a3,t3,27
	slli	a7,t4,5
	add	a7,a3,a7
	slli	a6,t3,5
	lui	a3,%hi(flashio_worker_end)
	addi	a2,a3,%lo(flashio_worker_end)
	lui	a3,%hi(flashio_worker_begin)
	addi	a3,a3,%lo(flashio_worker_begin)
	sub	a3,a2,a3
	srai	a3,a3,2
	mv	t1,a3
	li	t2,0
	srli	a3,t1,27
	slli	a5,t2,5
	add	a5,a3,a5
	slli	a4,t1,5
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
	sw	a5,-20(s0)
	lw	a5,-32(s0)
	sw	a5,-24(s0)
	j	.L3
.L4:
	lw	a4,-20(s0)
	addi	a5,a4,4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a3,a5,4
	sw	a3,-24(s0)
	lw	a4,0(a4)
	sw	a4,0(a5)
.L3:
	lw	a4,-20(s0)
	lui	a5,%hi(flashio_worker_end)
	addi	a5,a5,%lo(flashio_worker_end)
	bne	a4,a5,.L4
	lw	a5,-32(s0)
	lw	a4,-40(s0)
	lbu	a3,-41(s0)
	mv	a2,a3
	mv	a1,a4
	lw	a0,-36(s0)
	jalr	a5
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
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a5,33554432
	lw	a3,0(a5)
	li	a5,33554432
	li	a4,-8323072
	addi	a4,a4,-1
	and	a4,a3,a4
	sw	a4,0(a5)
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	set_flash_mode_spi, .-set_flash_mode_spi
	.align	2
	.globl	set_flash_mode_dual
	.type	set_flash_mode_dual, @function
set_flash_mode_dual:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
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
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	set_flash_mode_dual, .-set_flash_mode_dual
	.align	2
	.globl	set_flash_mode_quad
	.type	set_flash_mode_quad, @function
set_flash_mode_quad:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
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
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	set_flash_mode_quad, .-set_flash_mode_quad
	.align	2
	.globl	set_flash_mode_qddr
	.type	set_flash_mode_qddr, @function
set_flash_mode_qddr:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
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
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	set_flash_mode_qddr, .-set_flash_mode_qddr
	.align	2
	.globl	enable_flash_crm
	.type	enable_flash_crm, @function
enable_flash_crm:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a5,33554432
	lw	a3,0(a5)
	li	a5,33554432
	li	a4,1048576
	or	a4,a3,a4
	sw	a4,0(a5)
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	enable_flash_crm, .-enable_flash_crm
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
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
	bne	a5,zero,.L13
	lw	a5,-36(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
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
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L17
.L22:
	lui	a5,%hi(powers.0)
	addi	a4,a5,%lo(powers.0)
	lw	a5,-24(s0)
	slli	a5,a5,2
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
	bne	a5,zero,.L20
	lw	a5,-20(s0)
	bne	a5,zero,.L20
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
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	print_dec, .-print_dec
	.align	2
	.globl	print_str
	.type	print_str, @function
print_str:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
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
	bne	a5,zero,.L25
	nop
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
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
	.base64	"JQ0KDQoA"
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
	bne	a5,zero,.L27
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
	.base64	"jlfVKncIsDbnYwylSskhllj1E2+2P4lf3gSeUdEvfkfCHJP8WxBzqjrvU4QCzUOV4iZovDOhXvILe0/Zhi2tWfoXmz3HbB+M1EwHuTWn6lx5DstFmCnkVXK/GrM892GIBd1Jog=="
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
	addi	a4,a5,%lo(.LC0)
	addi	a5,s0,-128
	mv	a3,a4
	li	a4,100
	mv	a2,a4
	mv	a1,a3
	mv	a0,a5
	call	memcpy
	sw	zero,-20(s0)
	j	.L46
.L50:
	sw	zero,-24(s0)
	j	.L47
.L49:
	lw	a5,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a4,-112(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a5,-112(a5)
	bleu	a4,a5,.L48
	lw	a5,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a5,-112(a5)
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a4,-112(a5)
	lw	a5,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-112(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	lw	a4,-28(s0)
	andi	a4,a4,0xff
	addi	a5,a5,-16
	add	a5,a5,s0
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
# 211 "blink.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-28(s0)
 #APP
# 212 "blink.c" 1
	rdinstret a5
# 0 "" 2
 #NO_APP
	sw	a5,-32(s0)
	call	run_workload
	mv	a5,a0
	sb	a5,-33(s0)
 #APP
# 216 "blink.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-40(s0)
 #APP
# 217 "blink.c" 1
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
# 238 "blink.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-28(s0)
 #APP
# 239 "blink.c" 1
	rdinstret a5
# 0 "" 2
 #NO_APP
	sw	a5,-32(s0)
	lw	a5,-52(s0)
	jalr	a5
 #APP
# 243 "blink.c" 1
	rdcycle a5
# 0 "" 2
 #NO_APP
	sw	a5,-36(s0)
 #APP
# 244 "blink.c" 1
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
	sw	ra,28(sp)
	sw	s0,24(sp)
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
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_empty_loop, .-test_empty_loop
	.align	2
	.globl	test_single_loop
	.type	test_single_loop, @function
test_single_loop:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	j	.L59
.L60:
 #APP
# 262 "blink.c" 1
	nop;
# 0 "" 2
 #NO_APP
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L59:
	lw	a4,-20(s0)
	li	a5,8192
	addi	a5,a5,1807
	ble	a4,a5,.L60
	nop
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	test_single_loop, .-test_single_loop
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
	li	a5,2
	sb	a5,-17(s0)
.L63:
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
	j	.L63
	.size	main, .-main
	.section	.rodata
	.align	2
	.type	powers.0, @object
	.size	powers.0, 40
powers.0:
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
	.ident	"GCC: (g5115c7e44) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
