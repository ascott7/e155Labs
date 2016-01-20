// lab4_as.s
// 4 October 2015 ascott@hmc.edu
// sort twelve numbers for E155 lab 4 using an insertion sort approach

.text
.global main
main:
    LDR r2, =array              // load base address of array into R2
    MOV r0, #1                  // int i = 1
loopi:
    CMP r0, #12                 // loop comparison, checking that i < 12
    BGE endi                    // loop comparison, checking that i < 12
    MOV r1, r0                  // int j = i
loopj:
    CMP r1, #0                  // loop comparison, checking that j > 0
    BLE endj                    // loop comparison, checking that j > 0
    LDRSB r3, [r2, r1]          // r3 = array[j]
    SUB r5, r1, #1              // r5 = j - 1
    LDRSB r4, [r2, r5]          // r4 = array[r5] (aka array[j - 1])
    CMP r3, r4                  // loop comparison, checking if array[j - 1] > array[j]
    BLE endj                    // loop comparison, checking if array[j - 1] > array[j]
    STRB r3, [r2, r5]           // array[j - 1] = r3
    STRB r4, [r2, r1]           // array[j] = r4 (swapped array[j], array[j - 1])
    SUB r1, r1, #1              // j--
    B loopj                     // continue the inner loop
endj:
    ADD r0, r0, #1              // i++
    B loopi                     // continue the outer loop
endi:   
    BX LR                       // return from main
.data


array:                          // array of unsorted bytes
    .byte 0x08
    .byte 0x10
    .byte 0xFF
    .byte 0x11
    .byte 0X02
    .byte 0x09
    .byte 0x08
    .byte 0x14
    .byte 0x52
    .byte 0xF6
    .byte 0X44
    .byte 0x73
.end
