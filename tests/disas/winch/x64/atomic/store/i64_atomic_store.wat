;;! target = "x86_64"
;;! test = "winch"

(module 
  (import "env" "memory" (memory 1 1 shared))
  (func (i64.atomic.store (i32.const 0) (i64.const 42))))
;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    8(%rdi), %r11
;;       movq    0x10(%r11), %r11
;;       addq    $0x10, %r11
;;       cmpq    %rsp, %r11
;;       ja      0x68
;;   1c: movq    %rdi, %r14
;;       subq    $0x10, %rsp
;;       movq    %rdi, 8(%rsp)
;;       movq    %rsi, (%rsp)
;;       movl    $0x2a, %eax
;;       movl    $0, %ecx
;;       andq    $7, %rcx
;;       cmpq    $0, %rcx
;;       jne     0x6a
;;   4a: movl    $0, %ecx
;;       movq    0x30(%r14), %r11
;;       movq    (%r11), %rdx
;;       addq    %rcx, %rdx
;;       movq    %rax, (%rdx)
;;       mfence
;;       addq    $0x10, %rsp
;;       popq    %rbp
;;       retq
;;   68: ud2
;;   6a: ud2
