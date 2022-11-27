.LC0:
        .string "r"
.LC1:
        .string "Error: there is no such file in directory"
.LC2:
        .string "%lu %lu"
open:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, OFFSET FLAT:.LC0
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-8], rax
        cmp     QWORD PTR [rbp-8], 0
        jne     .L2
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    printf
        mov     eax, -1
        jmp     .L3
.L2:
        mov     rcx, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rbp-8]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
.L3:
        leave
        ret
generate:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     QWORD PTR [rbp-8], rdi
        mov     QWORD PTR [rbp-16], rsi
        mov     edi, 0
        call    time
        mov     edi, eax
        call    srand
        call    rand
        mov     edi, eax
        call    srand
        call    rand
        add     eax, 1000
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax], rdx
        call    rand
        mov     ecx, eax
        movsx   rax, ecx
        imul    rax, rax, 2021161081
        shr     rax, 32
        sar     eax, 3
        mov     edx, ecx
        sar     edx, 31
        sub     eax, edx
        mov     edx, eax
        sal     edx, 4
        add     edx, eax
        mov     eax, ecx
        sub     eax, edx
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax], rdx
        nop
        leave
        ret
factorial:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-8], 1
        mov     QWORD PTR [rbp-16], 2
        jmp     .L6
.L7:
        mov     rax, QWORD PTR [rbp-8]
        imul    rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-8], rax
        add     QWORD PTR [rbp-16], 1
.L6:
        mov     rax, QWORD PTR [rbp-16]
        cmp     QWORD PTR [rbp-24], rax
        jnb     .L7
        mov     rax, QWORD PTR [rbp-8]
        pop     rbp
        ret
.LC4:
        .string "w"
.LC5:
        .string "Ranom_output.txt"
.LC6:
        .string "File_output.txt"
.LC7:
        .string "Error: too many args"
.LC10:
        .string "%.*f"
.LC12:
        .string "Operating time of the program: %f\n"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 80
        mov     DWORD PTR [rbp-68], edi
        mov     QWORD PTR [rbp-80], rsi
        call    clock
        mov     QWORD PTR [rbp-32], rax
        movsd   xmm0, QWORD PTR .LC3[rip]
        movsd   QWORD PTR [rbp-40], xmm0
        cmp     DWORD PTR [rbp-68], 1
        jne     .L10
        lea     rdx, [rbp-64]
        lea     rax, [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    generate
        mov     esi, OFFSET FLAT:.LC4
        mov     edi, OFFSET FLAT:.LC5
        call    fopen
        mov     QWORD PTR [rbp-8], rax
        jmp     .L11
.L10:
        cmp     DWORD PTR [rbp-68], 2
        jne     .L12
        mov     rax, QWORD PTR [rbp-80]
        add     rax, 8
        mov     rax, QWORD PTR [rax]
        lea     rdx, [rbp-64]
        lea     rcx, [rbp-56]
        mov     rsi, rcx
        mov     rdi, rax
        call    open
        cmp     eax, -1
        jne     .L13
        mov     eax, 0
        jmp     .L23
.L13:
        mov     esi, OFFSET FLAT:.LC4
        mov     edi, OFFSET FLAT:.LC6
        call    fopen
        mov     QWORD PTR [rbp-8], rax
        jmp     .L11
.L12:
        mov     edi, OFFSET FLAT:.LC7
        mov     eax, 0
        call    printf
        mov     eax, 0
        jmp     .L23
.L11:
        pxor    xmm0, xmm0
        movsd   QWORD PTR [rbp-16], xmm0
        mov     QWORD PTR [rbp-24], 0
        jmp     .L15
.L22:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    factorial
        test    rax, rax
        js      .L16
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rax
        jmp     .L17
.L16:
        mov     rdx, rax
        shr     rdx
        and     eax, 1
        or      rdx, rax
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rdx
        addsd   xmm0, xmm0
.L17:
        movsd   xmm1, QWORD PTR .LC9[rip]
        divsd   xmm1, xmm0
        movsd   xmm0, QWORD PTR [rbp-16]
        addsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-16], xmm0
        add     QWORD PTR [rbp-24], 1
.L15:
        movsd   xmm0, QWORD PTR [rbp-16]
        movapd  xmm1, xmm0
        subsd   xmm1, QWORD PTR [rbp-40]
        movsd   xmm0, QWORD PTR [rbp-16]
        subsd   xmm0, QWORD PTR [rbp-40]
        mulsd   xmm1, xmm0
        mov     rax, QWORD PTR [rbp-56]
        test    rax, rax
        js      .L18
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rax
        jmp     .L19
.L18:
        mov     rdx, rax
        shr     rdx
        and     eax, 1
        or      rdx, rax
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rdx
        addsd   xmm0, xmm0
.L19:
        movsd   xmm2, QWORD PTR [rbp-40]
        movapd  xmm3, xmm2
        divsd   xmm3, xmm0
        mov     rax, QWORD PTR [rbp-56]
        test    rax, rax
        js      .L20
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rax
        jmp     .L21
.L20:
        mov     rdx, rax
        shr     rdx
        and     eax, 1
        or      rdx, rax
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rdx
        addsd   xmm0, xmm0
.L21:
        movsd   xmm2, QWORD PTR [rbp-40]
        divsd   xmm2, xmm0
        mulsd   xmm3, xmm2
        movapd  xmm0, xmm3
        comisd  xmm1, xmm0
        ja      .L22
        mov     rax, QWORD PTR [rbp-64]
        mov     ecx, eax
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        movq    xmm0, rdx
        mov     edx, ecx
        mov     esi, OFFSET FLAT:.LC10
        mov     rdi, rax
        mov     eax, 1
        call    fprintf
        call    clock
        mov     QWORD PTR [rbp-48], rax
        mov     rax, QWORD PTR [rbp-48]
        sub     rax, QWORD PTR [rbp-32]
        pxor    xmm0, xmm0
        cvtsi2sd        xmm0, rax
        movsd   xmm1, QWORD PTR .LC11[rip]
        divsd   xmm0, xmm1
        movq    rax, xmm0
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC12
        mov     eax, 1
        call    printf
        mov     eax, 0
.L23:
        leave
        ret
.LC3:
        .long   -1961601175
        .long   1074118410
.LC9:
        .long   0
        .long   1072693248
.LC11:
        .long   0
        .long   1093567616