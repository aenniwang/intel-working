__strzhchr_sse42:
   	pxor   xmm2,xmm2
                                    mov  ecx,0x80
                                    pshufb xmm3,xmm2 
   	movd   xmm1,esi
   	mov    ecx,edi
// Fill byte 0 of parameter 2 to xmm2
   	pshufb xmm1,xmm2
                                    xor    r9,r9
   	and    ecx,0xf
   	mov    r8,rdi
// if and result is 0, ecx is 16 byte aligned
// if address is 16 bytes aligned ,jump to +0x68
// JE if ZF=1 then Jump
   	je     process_align
// !!!! ERROR: I don't think it is necessory, whenever code goes here, r8 should be 16 bytes algined.
// ---> if code goes here, rdi is not 16 bytes,aligned
   	and    r8,0xfffffffffffffff0
   	movdqa xmm0,XMMWORD PTR [r8]
                                    // Mask all ZH words
                                    movdqa xmm4,xmm3
                                    pcmpeqb xmm4,xmm0 // 0x80 --> 0xff
                                    movdqa xmm5,xmm4 
                                    pextrb r9,xmm4,15
                                    pslldq xmm5,1 // -->080 --> 00 0xff(MSB)
                                    movdqa xmm6,xmm5
                                    pcmpeqb xmm6,xmm4 //--> find the second 0x80
                                    pslldq xmm6,1 
                                    por     xmm4, xmm5
                                    pxor xmm4,xmm6 // ->OK
                                    pand    xmm0,xmm4
// check if '\0' exists
   	pcmpeqb xmm2,xmm0
// check if target character exists
   	pcmpeqb xmm0,xmm1
// extract MSB bit of terminal character
   	pmovmskb edx,xmm2
// extract MSB bit of target character
   	pmovmskb esi,xmm0
   	sar    edx,cl
   	sar    esi,cl
// find target?
   	test   esi,esi
// Not found goto next
   	je     process_notarget
// get target position
   	bsf    eax,esi
   	test   edx,edx
   	je     process_noterminal
// get terminal char position
   	bsf    esi,edx
   	cmp    eax,esi
// eax>esi ? --> target pos > terminal pos? ->yes, not found ,exist
   	ja     exit_nofound
// Found! 
  process_noterminal:          	add    rax,rdi
   	ret    

   	nop    DWORD PTR [rax]
   	nop    WORD PTR cs:[rax+rax*1+0x0]
  40d82d:	00 00 00 
  process_notarget:                	test   edx,edx
   	jne    exit_nofound
  process_align_next16byte:        	add    r8,0x10
// operation: signed byte&equal any
//          : JBE => CF=1 ZF=1. 
//          : ZF=1 -> find a '\0'
//          : CF=1 -> find a match
// 
// TODO: strlen(r8) is less than 16, what happen? nothing? memory 
                                    // Mask all ZH words
                                    
                                    movdqa xmm0,XMMWORD PTR [r8]
                                    and r9,0xff
                                    cmovne r9,0
                                    movd xmm4,r9
                                    por  xmm0,xmm4
                                    mov r9,0
                                    movdqa xmm4,xmm3
                                    pcmpeqb xmm4,xmm0 // 0x80 --> 0xff
                                    movdqa xmm5,xmm4 
                                    pextrb r9,xmm4,15
                                    pslldq xmm5,1 // -->080 --> 00 0xff(MSB)
                                    movdqa xmm6,xmm5
                                    pcmpeqb xmm6,xmm4 //--> find the second 0x80
                                    pslldq xmm6,1 
                                    por     xmm4, xmm5
                                    pxor xmm4,xmm6 // ->OK
                                    pand    xmm0,xmm4
  process_align: 	pcmpistri xmm1,xmm0,0x2
   	jbe    exit_f
   	add    r8,0x10

                                    movdqa xmm0,XMMWORD PTR [r8]
                                    and r9,0xff
                                    cmovne r9,0
                                    movd xmm4,r9
                                    por  xmm0,xmm4
                                    mov r9,0
                                    movdqa xmm4,xmm3
                                    pcmpeqb xmm4,xmm0 // 0x80 --> 0xff
                                    movdqa xmm5,xmm4 
                                    pextrb r9,xmm4,15
                                    pslldq xmm5,1 // -->080 --> 00 0xff(MSB)
                                    movdqa xmm6,xmm5
                                    pcmpeqb xmm6,xmm4 //--> find the second 0x80
                                    pslldq xmm6,1 
                                    por     xmm4, xmm5
                                    pxor xmm4,xmm6 // ->OK
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
                                    pcmpeqb xmm4,xmm0 // 0x80 --> 0xff
                                    movdqa xmm5,xmm4 
                                    pextrb r9,xmm4,15
                                    pslldq xmm5,1 // -->080 --> 00 0xff(MSB)
                                    movdqa xmm6,xmm5
                                    pcmpeqb xmm6,xmm4 //--> find the second 0x80
                                    pslldq xmm6,1 
                                    por     xmm4, xmm5
                                    pxor xmm4,xmm6 // ->OK
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
                                    pcmpeqb xmm4,xmm0 // 0x80 --> 0xff
                                    movdqa xmm5,xmm4 
                                    pextrb r9,xmm4,15
                                    pslldq xmm5,1 // -->080 --> 00 0xff(MSB)
                                    movdqa xmm6,xmm5
                                    pcmpeqb xmm6,xmm4 //--> find the second 0x80
                                    pslldq xmm6,1 
                                    por     xmm4, xmm5
                                    pxor xmm4,xmm6 // ->OK
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
   	nop    WORD PTR cs:[rax+rax*1+0x0]
  40d87c:	00 00 00 
   	nop


