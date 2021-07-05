/**
 OSasm.s: low-level OS commands, written in assembly
*/
/*
  AREA |.text|,CODE,READONLY
  THUMB
  REQUIRE8
  PRESERVE8
*/
	.file "osasm.s"
  	.syntax unified
	.cpu cortex-m4
	.fpu softvfp
	.thumb
	.align  2

.extern RunPt	@ currently running thread
.extern Scheduler

.global SysTick_Handler
.section	.text.SysTick_Handler
.type	SysTick_Handler, %function

SysTick_Handler: @ Saves R0-R3,R12,LR,PC,PSR
  cpsid   i	@ Prevent interrupt during switch
  push    {r4-r11}	@ Save remaining regs r4-11
  ldr     r0, =RunPt	@ R0=pointer to RunPt, old thread
  LDR     R1, [R0]		@ R1 = RunPt
  STR     SP, [R1]		@ Save SP into TCB
  @LDR     R1, [R1,#4]	@ R1 = RunPt->next
  @STR     R1, [R0]	@ RunPt = R1
  PUSH	  {R0,LR}
  BL	  Scheduler
  POP	  {R0,LR}
  LDR	  R1, [R0]		@ R1 = RunPt, new thread
  LDR     SP, [R1]		@ new thread SP; SP = RunPt->sp;
  POP     {R4-R11}		@ restore regs r4-11
  CPSIE   I				@ tasks run with interrupts enabled
  BX      LR			@ restore R0-R3,R12,LR,PC,PSR

.global StartOS
.section	.text.StartOS
.type	StartOS, %function

StartOS:
  LDR     R0, =RunPt
  /* currently running thread */
  LDR     R1, [R0]
  /* R2 = value of RunPt */
  LDR     SP, [R1]
  /* new thread SP; SP = RunPt->stackPointer; */
  POP     {R4-R11}
  /* restore regs r4-11 */
  POP     {R0-R3}
  /* restore regs r0-3 */
  POP     {R12}
  /*  */
  ADD     SP,SP,#4
  /* discard LR from initial stack */
  POP     {LR}
  /* start location */
  ADD     SP,SP,#4
  /* discard PSR */
  CPSIE   I
  /* Enable interrupts at processor level */
  BX      LR
  /* start first thread */

/******************************************************************************
;
; Useful functions.
;
******************************************************************************/
.global StartCritical
.global EndCritical
/************ StartCritical ************************
; make a copy of previous I bit, disable interrupts
; inputs:  none
; outputs: previous I bit
*/
StartCritical:
  MRS R0, PRIMASK
  /* save old status */
  CPSID I
  /* mask all (except faults) */
  BX LR

/************ EndCritical ************************
; using the copy of previous I bit, restore I bit to previous value
; inputs:  previous I bit
; outputs: none
*/
EndCritical:
  MSR PRIMASK, R0
  BX LR
 /*   ALIGN
    END*/
