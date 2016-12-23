__strzhchr_sse42:
   	pxor   xmm2,xmm2
    mov  ecx,0x80
    pshufb xmm3,xmm2 
   	movd   xmm1,esi
   	mov    ecx,edi
   	pshufb xmm1,xmm2
    xor    r9,r9
   	and    ecx,0xf
    mov    r8,rdi
   	je     process_align
   	and    r8,0xfffffffffffffff0
   	movdqa xmm0,XMMWORD PTR [r8]

    movdqa xmm4,xmm3
    pcmpeqb xmm4,xmm0 
    movdqa xmm5,xmm4 
    pextrb r9,xmm4,15
    pslldq xmm5,1 
    movdqa xmm6,xmm5
    pcmpeqb xmm6,xmm4 
    pslldq xmm6,1 
    por     xmm4, xmm5
    pxor xmm4,xmm6
    pand    xmm0,xmm4

    pcmpeqb xmm2,xmm0
   	pcmpeqb xmm0,xmm1
   	pmovmskb edx,xmm2
   	pmovmskb esi,xmm0
   	sar    edx,cl
   	sar    esi,cl
   	test   esi,esi
   	je     process_notarget
   	bsf    eax,esi
   	test   edx,edx
   	je     process_noterminal
   	bsf    esi,edx
   	cmp    eax,esi
   	ja     exit_nofound
process_noterminal:          	
    add    rax,rdi
   	ret    

   	nop   
   	nop  
process_notarget:                	test   edx,edx
   	jne    exit_nofound
process_align_next16byte:        	
    add    r8,0x10

    movdqa xmm0,XMMWORD PTR [r8]
    and r9,0xff
    cmovne r9,0
    movd xmm4,r9
    por  xmm0,xmm4
    mov r9,0
    movdqa xmm4,xmm3
    pcmpeqb xmm4,xmm0 
    movdqa xmm5,xmm4 
    pextrb r9,xmm4,15
    pslldq xmm5,1 
    movdqa xmm6,xmm5
    pcmpeqb xmm6,xmm4 
    pslldq xmm6,1 
    por     xmm4, xmm5
    pxor xmm4,xmm6 
    pand    xmm0,xmm4

process_align: 	
    pcmpistri xmm1,xmm0,0x2
   	jbe    exit_f
    add    r8,0x10

    movdqa xmm0,XMMWORD PTR [r8]
    and r9,0xff
    cmovne r9,0
    movd xmm4,r9
    por  xmm0,xmm4
    mov r9,0
    movdqa xmm4,xmm3
    pcmpeqb xmm4,xmm0 
    movdqa xmm5,xmm4 
    pextrb r9,xmm4,15
    pslldq xmm5,1 
    movdqa xmm6,xmm5
    pcmpeqb xmm6,xmm4 
    pslldq xmm6,1 
    por     xmm4, xmm5
    pxor xmm4,xmm6 
    pand    xmm0,xmm4
    pcmpistri xmm1,xmm0,0x2

    jbe    exit_f
    add    r8,0x10
    movdqa xmm0,XMMWORD PTR [r8]
    and r9,0xff
    cmovne r9,0
    movd xmm4,r9
    por  xmm0,xmm4
    mov r9,0
    movdqa xmm4,xmm3
    pcmpeqb xmm4,xmm0 
    movdqa xmm5,xmm4 
    pextrb r9,xmm4,15
    pslldq xmm5,1 
    movdqa xmm6,xmm5
    pcmpeqb xmm6,xmm4 
    pslldq xmm6,1 
    por     xmm4, xmm5
    pxor xmm4,xmm6 
    pand    xmm0,xmm4
    pcmpistri xmm1,xmm0,0x2


    jbe    exit_f
    add    r8,0x10
    movdqa xmm0,XMMWORD PTR [r8]
    and r9,0xff
    cmovne r9,0
    movd xmm4,r9
    por  xmm0,xmm4
    mov r9,0
    movdqa xmm4,xmm3
    pcmpeqb xmm4,xmm0 
    movdqa xmm5,xmm4 
    pextrb r9,xmm4,15
    pslldq xmm5,1 
    movdqa xmm6,xmm5
    pcmpeqb xmm6,xmm4 
    pslldq xmm6,1 
    por     xmm4, xmm5
    pxor xmm4,xmm6 
    pand    xmm0,xmm4
    pcmpistri xmm1,xmm0,0x2

    jbe    exit_f;
    jmp    process_align_next16byte
    exit_f:               	jb     exit_found
    exit_nofound:                	xor    eax,eax
    ret    
    nop
    exit_found:       	lea    rax,[r8+rcx*1]
    ret    


