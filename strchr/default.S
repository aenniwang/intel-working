
elf.default:     file format elf64-x86-64


Disassembly of section .interp:

0000000000400238 <.interp>:
  400238:	2f                   	(bad)  
  400239:	6c                   	insb   (%dx),%es:(%rdi)
  40023a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
  400241:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
  400246:	78 2d                	js     400275 <_init-0x16b>
  400248:	78 38                	js     400282 <_init-0x15e>
  40024a:	36                   	ss
  40024b:	2d 36 34 2e 73       	sub    $0x732e3436,%eax
  400250:	6f                   	outsl  %ds:(%rsi),(%dx)
  400251:	2e 32 00             	xor    %cs:(%rax),%al

Disassembly of section .note.ABI-tag:

0000000000400254 <.note.ABI-tag>:
  400254:	04 00                	add    $0x0,%al
  400256:	00 00                	add    %al,(%rax)
  400258:	10 00                	adc    %al,(%rax)
  40025a:	00 00                	add    %al,(%rax)
  40025c:	01 00                	add    %eax,(%rax)
  40025e:	00 00                	add    %al,(%rax)
  400260:	47                   	rex.RXB
  400261:	4e 55                	rex.WRX push %rbp
  400263:	00 00                	add    %al,(%rax)
  400265:	00 00                	add    %al,(%rax)
  400267:	00 02                	add    %al,(%rdx)
  400269:	00 00                	add    %al,(%rax)
  40026b:	00 06                	add    %al,(%rsi)
  40026d:	00 00                	add    %al,(%rax)
  40026f:	00 20                	add    %ah,(%rax)
  400271:	00 00                	add    %al,(%rax)
	...

Disassembly of section .note.gnu.build-id:

0000000000400274 <.note.gnu.build-id>:
  400274:	04 00                	add    $0x0,%al
  400276:	00 00                	add    %al,(%rax)
  400278:	14 00                	adc    $0x0,%al
  40027a:	00 00                	add    %al,(%rax)
  40027c:	03 00                	add    (%rax),%eax
  40027e:	00 00                	add    %al,(%rax)
  400280:	47                   	rex.RXB
  400281:	4e 55                	rex.WRX push %rbp
  400283:	00 2d ba ca 62 6e    	add    %ch,0x6e62caba(%rip)        # 6ea2cd43 <_end+0x6e42bd03>
  400289:	29 71 19             	sub    %esi,0x19(%rcx)
  40028c:	6b 76 69 af          	imul   $0xffffffaf,0x69(%rsi),%esi
  400290:	48 a7                	cmpsq  %es:(%rdi),%ds:(%rsi)
  400292:	eb f9                	jmp    40028d <_init-0x153>
  400294:	0e                   	(bad)  
  400295:	dc dc                	(bad)  
  400297:	e7                   	.byte 0xe7

Disassembly of section .gnu.hash:

0000000000400298 <.gnu.hash>:
  400298:	01 00                	add    %eax,(%rax)
  40029a:	00 00                	add    %al,(%rax)
  40029c:	01 00                	add    %eax,(%rax)
  40029e:	00 00                	add    %al,(%rax)
  4002a0:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .dynsym:

00000000004002b8 <.dynsym>:
	...
  4002d0:	0b 00                	or     (%rax),%eax
  4002d2:	00 00                	add    %al,(%rax)
  4002d4:	12 00                	adc    (%rax),%al
	...
  4002e6:	00 00                	add    %al,(%rax)
  4002e8:	12 00                	adc    (%rax),%al
  4002ea:	00 00                	add    %al,(%rax)
  4002ec:	12 00                	adc    (%rax),%al
	...
  4002fe:	00 00                	add    %al,(%rax)
  400300:	24 00                	and    $0x0,%al
  400302:	00 00                	add    %al,(%rax)
  400304:	20 00                	and    %al,(%rax)
	...

Disassembly of section .dynstr:

0000000000400318 <.dynstr>:
  400318:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
  40031c:	63 2e                	movslq (%rsi),%ebp
  40031e:	73 6f                	jae    40038f <_init-0x51>
  400320:	2e 36 00 70 72       	cs add %dh,%cs:%ss:0x72(%rax)
  400325:	69 6e 74 66 00 5f 5f 	imul   $0x5f5f0066,0x74(%rsi),%ebp
  40032c:	6c                   	insb   (%dx),%es:(%rdi)
  40032d:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
  400334:	72 74                	jb     4003aa <_init-0x36>
  400336:	5f                   	pop    %rdi
  400337:	6d                   	insl   (%dx),%es:(%rdi)
  400338:	61                   	(bad)  
  400339:	69 6e 00 5f 5f 67 6d 	imul   $0x6d675f5f,0x0(%rsi),%ebp
  400340:	6f                   	outsl  %ds:(%rsi),(%dx)
  400341:	6e                   	outsb  %ds:(%rsi),(%dx)
  400342:	5f                   	pop    %rdi
  400343:	73 74                	jae    4003b9 <_init-0x27>
  400345:	61                   	(bad)  
  400346:	72 74                	jb     4003bc <_init-0x24>
  400348:	5f                   	pop    %rdi
  400349:	5f                   	pop    %rdi
  40034a:	00 47 4c             	add    %al,0x4c(%rdi)
  40034d:	49                   	rex.WB
  40034e:	42                   	rex.X
  40034f:	43 5f                	rex.XB pop %r15
  400351:	32 2e                	xor    (%rsi),%ch
  400353:	32 2e                	xor    (%rsi),%ch
  400355:	35                   	.byte 0x35
	...

Disassembly of section .gnu.version:

0000000000400358 <.gnu.version>:
  400358:	00 00                	add    %al,(%rax)
  40035a:	02 00                	add    (%rax),%al
  40035c:	02 00                	add    (%rax),%al
	...

Disassembly of section .gnu.version_r:

0000000000400360 <.gnu.version_r>:
  400360:	01 00                	add    %eax,(%rax)
  400362:	01 00                	add    %eax,(%rax)
  400364:	01 00                	add    %eax,(%rax)
  400366:	00 00                	add    %al,(%rax)
  400368:	10 00                	adc    %al,(%rax)
  40036a:	00 00                	add    %al,(%rax)
  40036c:	00 00                	add    %al,(%rax)
  40036e:	00 00                	add    %al,(%rax)
  400370:	75 1a                	jne    40038c <_init-0x54>
  400372:	69 09 00 00 02 00    	imul   $0x20000,(%rcx),%ecx
  400378:	33 00                	xor    (%rax),%eax
  40037a:	00 00                	add    %al,(%rax)
  40037c:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

0000000000400380 <.rela.dyn>:
  400380:	f8                   	clc    
  400381:	0f 60 00             	punpcklbw (%rax),%mm0
  400384:	00 00                	add    %al,(%rax)
  400386:	00 00                	add    %al,(%rax)
  400388:	06                   	(bad)  
  400389:	00 00                	add    %al,(%rax)
  40038b:	00 03                	add    %al,(%rbx)
	...

Disassembly of section .rela.plt:

0000000000400398 <.rela.plt>:
  400398:	18 10                	sbb    %dl,(%rax)
  40039a:	60                   	(bad)  
  40039b:	00 00                	add    %al,(%rax)
  40039d:	00 00                	add    %al,(%rax)
  40039f:	00 07                	add    %al,(%rdi)
  4003a1:	00 00                	add    %al,(%rax)
  4003a3:	00 01                	add    %al,(%rcx)
	...
  4003ad:	00 00                	add    %al,(%rax)
  4003af:	00 20                	add    %ah,(%rax)
  4003b1:	10 60 00             	adc    %ah,0x0(%rax)
  4003b4:	00 00                	add    %al,(%rax)
  4003b6:	00 00                	add    %al,(%rax)
  4003b8:	07                   	(bad)  
  4003b9:	00 00                	add    %al,(%rax)
  4003bb:	00 02                	add    %al,(%rdx)
	...
  4003c5:	00 00                	add    %al,(%rax)
  4003c7:	00 28                	add    %ch,(%rax)
  4003c9:	10 60 00             	adc    %ah,0x0(%rax)
  4003cc:	00 00                	add    %al,(%rax)
  4003ce:	00 00                	add    %al,(%rax)
  4003d0:	07                   	(bad)  
  4003d1:	00 00                	add    %al,(%rax)
  4003d3:	00 03                	add    %al,(%rbx)
	...

Disassembly of section .init:

00000000004003e0 <_init>:
  4003e0:	48 83 ec 08          	sub    $0x8,%rsp
  4003e4:	48 8b 05 0d 0c 20 00 	mov    0x200c0d(%rip),%rax        # 600ff8 <_DYNAMIC+0x1d0>
  4003eb:	48 85 c0             	test   %rax,%rax
  4003ee:	74 05                	je     4003f5 <_init+0x15>
  4003f0:	e8 3b 00 00 00       	callq  400430 <__gmon_start__@plt>
  4003f5:	48 83 c4 08          	add    $0x8,%rsp
  4003f9:	c3                   	retq   

Disassembly of section .plt:

0000000000400400 <printf@plt-0x10>:
  400400:	ff 35 02 0c 20 00    	pushq  0x200c02(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400406:	ff 25 04 0c 20 00    	jmpq   *0x200c04(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40040c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400410 <printf@plt>:
  400410:	ff 25 02 0c 20 00    	jmpq   *0x200c02(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400416:	68 00 00 00 00       	pushq  $0x0
  40041b:	e9 e0 ff ff ff       	jmpq   400400 <_init+0x20>

0000000000400420 <__libc_start_main@plt>:
  400420:	ff 25 fa 0b 20 00    	jmpq   *0x200bfa(%rip)        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400426:	68 01 00 00 00       	pushq  $0x1
  40042b:	e9 d0 ff ff ff       	jmpq   400400 <_init+0x20>

0000000000400430 <__gmon_start__@plt>:
  400430:	ff 25 f2 0b 20 00    	jmpq   *0x200bf2(%rip)        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400436:	68 02 00 00 00       	pushq  $0x2
  40043b:	e9 c0 ff ff ff       	jmpq   400400 <_init+0x20>

Disassembly of section .text:

0000000000400440 <_start>:
  400440:	31 ed                	xor    %ebp,%ebp
  400442:	49 89 d1             	mov    %rdx,%r9
  400445:	5e                   	pop    %rsi
  400446:	48 89 e2             	mov    %rsp,%rdx
  400449:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40044d:	50                   	push   %rax
  40044e:	54                   	push   %rsp
  40044f:	49 c7 c0 30 07 40 00 	mov    $0x400730,%r8
  400456:	48 c7 c1 c0 06 40 00 	mov    $0x4006c0,%rcx
  40045d:	48 c7 c7 37 06 40 00 	mov    $0x400637,%rdi
  400464:	e8 b7 ff ff ff       	callq  400420 <__libc_start_main@plt>
  400469:	f4                   	hlt    
  40046a:	66 90                	xchg   %ax,%ax
  40046c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400470 <deregister_tm_clones>:
  400470:	b8 3f 10 60 00       	mov    $0x60103f,%eax
  400475:	55                   	push   %rbp
  400476:	48 2d 38 10 60 00    	sub    $0x601038,%rax
  40047c:	48 83 f8 0e          	cmp    $0xe,%rax
  400480:	48 89 e5             	mov    %rsp,%rbp
  400483:	77 02                	ja     400487 <deregister_tm_clones+0x17>
  400485:	5d                   	pop    %rbp
  400486:	c3                   	retq   
  400487:	b8 00 00 00 00       	mov    $0x0,%eax
  40048c:	48 85 c0             	test   %rax,%rax
  40048f:	74 f4                	je     400485 <deregister_tm_clones+0x15>
  400491:	5d                   	pop    %rbp
  400492:	bf 38 10 60 00       	mov    $0x601038,%edi
  400497:	ff e0                	jmpq   *%rax
  400499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004004a0 <register_tm_clones>:
  4004a0:	b8 38 10 60 00       	mov    $0x601038,%eax
  4004a5:	55                   	push   %rbp
  4004a6:	48 2d 38 10 60 00    	sub    $0x601038,%rax
  4004ac:	48 c1 f8 03          	sar    $0x3,%rax
  4004b0:	48 89 e5             	mov    %rsp,%rbp
  4004b3:	48 89 c2             	mov    %rax,%rdx
  4004b6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  4004ba:	48 01 d0             	add    %rdx,%rax
  4004bd:	48 d1 f8             	sar    %rax
  4004c0:	75 02                	jne    4004c4 <register_tm_clones+0x24>
  4004c2:	5d                   	pop    %rbp
  4004c3:	c3                   	retq   
  4004c4:	ba 00 00 00 00       	mov    $0x0,%edx
  4004c9:	48 85 d2             	test   %rdx,%rdx
  4004cc:	74 f4                	je     4004c2 <register_tm_clones+0x22>
  4004ce:	5d                   	pop    %rbp
  4004cf:	48 89 c6             	mov    %rax,%rsi
  4004d2:	bf 38 10 60 00       	mov    $0x601038,%edi
  4004d7:	ff e2                	jmpq   *%rdx
  4004d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004004e0 <__do_global_dtors_aux>:
  4004e0:	80 3d 4d 0b 20 00 00 	cmpb   $0x0,0x200b4d(%rip)        # 601034 <_edata>
  4004e7:	75 11                	jne    4004fa <__do_global_dtors_aux+0x1a>
  4004e9:	55                   	push   %rbp
  4004ea:	48 89 e5             	mov    %rsp,%rbp
  4004ed:	e8 7e ff ff ff       	callq  400470 <deregister_tm_clones>
  4004f2:	5d                   	pop    %rbp
  4004f3:	c6 05 3a 0b 20 00 01 	movb   $0x1,0x200b3a(%rip)        # 601034 <_edata>
  4004fa:	f3 c3                	repz retq 
  4004fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400500 <frame_dummy>:
  400500:	48 83 3d 18 09 20 00 	cmpq   $0x0,0x200918(%rip)        # 600e20 <__JCR_END__>
  400507:	00 
  400508:	74 1e                	je     400528 <frame_dummy+0x28>
  40050a:	b8 00 00 00 00       	mov    $0x0,%eax
  40050f:	48 85 c0             	test   %rax,%rax
  400512:	74 14                	je     400528 <frame_dummy+0x28>
  400514:	55                   	push   %rbp
  400515:	bf 20 0e 60 00       	mov    $0x600e20,%edi
  40051a:	48 89 e5             	mov    %rsp,%rbp
  40051d:	ff d0                	callq  *%rax
  40051f:	5d                   	pop    %rbp
  400520:	e9 7b ff ff ff       	jmpq   4004a0 <register_tm_clones>
  400525:	0f 1f 00             	nopl   (%rax)
  400528:	e9 73 ff ff ff       	jmpq   4004a0 <register_tm_clones>
  40052d:	0f 1f 00             	nopl   (%rax)

0000000000400530 <strzhchr>:
  400530:	55                   	push   %rbp
  400531:	48 89 e5             	mov    %rsp,%rbp
  400534:	41 54                	push   %r12
  400536:	53                   	push   %rbx
  400537:	48 83 ec 10          	sub    $0x10,%rsp
  40053b:	48 89 fb             	mov    %rdi,%rbx
  40053e:	89 75 ec             	mov    %esi,-0x14(%rbp)
  400541:	48 85 db             	test   %rbx,%rbx
  400544:	75 0a                	jne    400550 <strzhchr+0x20>
  400546:	b8 00 00 00 00       	mov    $0x0,%eax
  40054b:	e9 de 00 00 00       	jmpq   40062e <strzhchr+0xfe>
  400550:	41 bc 00 00 00 00    	mov    $0x0,%r12d
  400556:	e9 c3 00 00 00       	jmpq   40061e <strzhchr+0xee>
  40055b:	0f b6 03             	movzbl (%rbx),%eax
  40055e:	0f be c0             	movsbl %al,%eax
  400561:	89 c6                	mov    %eax,%esi
  400563:	bf 50 07 40 00       	mov    $0x400750,%edi
  400568:	b8 00 00 00 00       	mov    $0x0,%eax
  40056d:	e8 9e fe ff ff       	callq  400410 <printf@plt>
  400572:	0f b6 03             	movzbl (%rbx),%eax
  400575:	0f be c0             	movsbl %al,%eax
  400578:	25 80 00 00 00       	and    $0x80,%eax
  40057d:	89 c6                	mov    %eax,%esi
  40057f:	bf 58 07 40 00       	mov    $0x400758,%edi
  400584:	b8 00 00 00 00       	mov    $0x0,%eax
  400589:	e8 82 fe ff ff       	callq  400410 <printf@plt>
  40058e:	44 89 e0             	mov    %r12d,%eax
  400591:	34 80                	xor    $0x80,%al
  400593:	89 c6                	mov    %eax,%esi
  400595:	bf 68 07 40 00       	mov    $0x400768,%edi
  40059a:	b8 00 00 00 00       	mov    $0x0,%eax
  40059f:	e8 6c fe ff ff       	callq  400410 <printf@plt>
  4005a4:	44 89 e0             	mov    %r12d,%eax
  4005a7:	25 80 00 00 00       	and    $0x80,%eax
  4005ac:	d1 e8                	shr    %eax
  4005ae:	89 c6                	mov    %eax,%esi
  4005b0:	bf 7a 07 40 00       	mov    $0x40077a,%edi
  4005b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4005ba:	e8 51 fe ff ff       	callq  400410 <printf@plt>
  4005bf:	0f b6 03             	movzbl (%rbx),%eax
  4005c2:	0f be c0             	movsbl %al,%eax
  4005c5:	44 89 e2             	mov    %r12d,%edx
  4005c8:	80 f2 80             	xor    $0x80,%dl
  4005cb:	21 d0                	and    %edx,%eax
  4005cd:	25 80 00 00 00       	and    $0x80,%eax
  4005d2:	89 c2                	mov    %eax,%edx
  4005d4:	44 89 e0             	mov    %r12d,%eax
  4005d7:	25 80 00 00 00       	and    $0x80,%eax
  4005dc:	d1 e8                	shr    %eax
  4005de:	44 8d 24 02          	lea    (%rdx,%rax,1),%r12d
  4005e2:	8b 05 50 0a 20 00    	mov    0x200a50(%rip),%eax        # 601038 <__TMC_END__>
  4005e8:	8d 50 01             	lea    0x1(%rax),%edx
  4005eb:	89 15 47 0a 20 00    	mov    %edx,0x200a47(%rip)        # 601038 <__TMC_END__>
  4005f1:	44 89 e2             	mov    %r12d,%edx
  4005f4:	89 c6                	mov    %eax,%esi
  4005f6:	bf 94 07 40 00       	mov    $0x400794,%edi
  4005fb:	b8 00 00 00 00       	mov    $0x0,%eax
  400600:	e8 0b fe ff ff       	callq  400410 <printf@plt>
  400605:	45 85 e4             	test   %r12d,%r12d
  400608:	75 10                	jne    40061a <strzhchr+0xea>
  40060a:	0f b6 03             	movzbl (%rbx),%eax
  40060d:	0f be c0             	movsbl %al,%eax
  400610:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  400613:	75 05                	jne    40061a <strzhchr+0xea>
  400615:	48 89 d8             	mov    %rbx,%rax
  400618:	eb 14                	jmp    40062e <strzhchr+0xfe>
  40061a:	48 83 c3 01          	add    $0x1,%rbx
  40061e:	0f b6 03             	movzbl (%rbx),%eax
  400621:	84 c0                	test   %al,%al
  400623:	0f 85 32 ff ff ff    	jne    40055b <strzhchr+0x2b>
  400629:	b8 00 00 00 00       	mov    $0x0,%eax
  40062e:	48 83 c4 10          	add    $0x10,%rsp
  400632:	5b                   	pop    %rbx
  400633:	41 5c                	pop    %r12
  400635:	5d                   	pop    %rbp
  400636:	c3                   	retq   

0000000000400637 <main>:
  400637:	55                   	push   %rbp
  400638:	48 89 e5             	mov    %rsp,%rbp
  40063b:	48 83 ec 20          	sub    $0x20,%rsp
  40063f:	c6 45 e0 01          	movb   $0x1,-0x20(%rbp)
  400643:	c6 45 e1 32          	movb   $0x32,-0x1f(%rbp)
  400647:	c6 45 e2 80          	movb   $0x80,-0x1e(%rbp)
  40064b:	c6 45 e3 76          	movb   $0x76,-0x1d(%rbp)
  40064f:	c6 45 e4 80          	movb   $0x80,-0x1c(%rbp)
  400653:	c6 45 e5 56          	movb   $0x56,-0x1b(%rbp)
  400657:	c6 45 e6 56          	movb   $0x56,-0x1a(%rbp)
  40065b:	c6 45 e7 80          	movb   $0x80,-0x19(%rbp)
  40065f:	c6 45 e8 33          	movb   $0x33,-0x18(%rbp)
  400663:	c6 45 e9 37          	movb   $0x37,-0x17(%rbp)
  400667:	c6 45 ea 18          	movb   $0x18,-0x16(%rbp)
  40066b:	c7 45 fc 33 00 00 00 	movl   $0x33,-0x4(%rbp)
  400672:	8b 55 fc             	mov    -0x4(%rbp),%edx
  400675:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  400679:	89 d6                	mov    %edx,%esi
  40067b:	48 89 c7             	mov    %rax,%rdi
  40067e:	e8 ad fe ff ff       	callq  400530 <strzhchr>
  400683:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  400687:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  40068b:	48 89 c6             	mov    %rax,%rsi
  40068e:	bf a4 07 40 00       	mov    $0x4007a4,%edi
  400693:	b8 00 00 00 00       	mov    $0x0,%eax
  400698:	e8 73 fd ff ff       	callq  400410 <printf@plt>
  40069d:	c7 45 ec 80 00 00 00 	movl   $0x80,-0x14(%rbp)
  4006a4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  4006a7:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4006ab:	89 d6                	mov    %edx,%esi
  4006ad:	48 89 c7             	mov    %rax,%rdi
  4006b0:	e8 7b fe ff ff       	callq  400530 <strzhchr>
  4006b5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  4006b9:	c9                   	leaveq 
  4006ba:	c3                   	retq   
  4006bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004006c0 <__libc_csu_init>:
  4006c0:	41 57                	push   %r15
  4006c2:	41 89 ff             	mov    %edi,%r15d
  4006c5:	41 56                	push   %r14
  4006c7:	49 89 f6             	mov    %rsi,%r14
  4006ca:	41 55                	push   %r13
  4006cc:	49 89 d5             	mov    %rdx,%r13
  4006cf:	41 54                	push   %r12
  4006d1:	4c 8d 25 38 07 20 00 	lea    0x200738(%rip),%r12        # 600e10 <__frame_dummy_init_array_entry>
  4006d8:	55                   	push   %rbp
  4006d9:	48 8d 2d 38 07 20 00 	lea    0x200738(%rip),%rbp        # 600e18 <__init_array_end>
  4006e0:	53                   	push   %rbx
  4006e1:	4c 29 e5             	sub    %r12,%rbp
  4006e4:	31 db                	xor    %ebx,%ebx
  4006e6:	48 c1 fd 03          	sar    $0x3,%rbp
  4006ea:	48 83 ec 08          	sub    $0x8,%rsp
  4006ee:	e8 ed fc ff ff       	callq  4003e0 <_init>
  4006f3:	48 85 ed             	test   %rbp,%rbp
  4006f6:	74 1e                	je     400716 <__libc_csu_init+0x56>
  4006f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4006ff:	00 
  400700:	4c 89 ea             	mov    %r13,%rdx
  400703:	4c 89 f6             	mov    %r14,%rsi
  400706:	44 89 ff             	mov    %r15d,%edi
  400709:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40070d:	48 83 c3 01          	add    $0x1,%rbx
  400711:	48 39 eb             	cmp    %rbp,%rbx
  400714:	75 ea                	jne    400700 <__libc_csu_init+0x40>
  400716:	48 83 c4 08          	add    $0x8,%rsp
  40071a:	5b                   	pop    %rbx
  40071b:	5d                   	pop    %rbp
  40071c:	41 5c                	pop    %r12
  40071e:	41 5d                	pop    %r13
  400720:	41 5e                	pop    %r14
  400722:	41 5f                	pop    %r15
  400724:	c3                   	retq   
  400725:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  40072c:	00 00 00 00 

0000000000400730 <__libc_csu_fini>:
  400730:	f3 c3                	repz retq 
  400732:	66 90                	xchg   %ax,%ax

Disassembly of section .fini:

0000000000400734 <_fini>:
  400734:	48 83 ec 08          	sub    $0x8,%rsp
  400738:	48 83 c4 08          	add    $0x8,%rsp
  40073c:	c3                   	retq   

Disassembly of section .rodata:

0000000000400740 <_IO_stdin_used>:
  400740:	01 00                	add    %eax,(%rax)
  400742:	02 00                	add    (%rax),%al
  400744:	00 00                	add    %al,(%rax)
	...

0000000000400748 <__dso_handle>:
	...
  400750:	53                   	push   %rbx
  400751:	74 72                	je     4007c5 <__dso_handle+0x7d>
  400753:	3d 25 64 20 00       	cmp    $0x206425,%eax
  400758:	2a 73 74             	sub    0x74(%rbx),%dh
  40075b:	72 26                	jb     400783 <__dso_handle+0x3b>
  40075d:	30 78 38             	xor    %bh,0x38(%rax)
  400760:	30 55 29             	xor    %dl,0x29(%rbp)
  400763:	3d 25 64 20 00       	cmp    $0x206425,%eax
  400768:	28 74 61 67          	sub    %dh,0x67(%rcx,%riz,2)
  40076c:	20 5e 20             	and    %bl,0x20(%rsi)
  40076f:	30 78 38             	xor    %bh,0x38(%rax)
  400772:	30 55 29             	xor    %dl,0x29(%rbp)
  400775:	3d 25 64 20 00       	cmp    $0x206425,%eax
  40077a:	28 28                	sub    %ch,(%rax)
  40077c:	74 61                	je     4007df <__dso_handle+0x97>
  40077e:	67 20 26             	and    %ah,(%esi)
  400781:	20 30                	and    %dh,(%rax)
  400783:	78 38                	js     4007bd <__dso_handle+0x75>
  400785:	30 55 29             	xor    %dl,0x29(%rbp)
  400788:	20 3e                	and    %bh,(%rsi)
  40078a:	3e 20 31             	and    %dh,%ds:(%rcx)
  40078d:	55                   	push   %rbp
  40078e:	29 3d 25 64 20 00    	sub    %edi,0x206425(%rip)        # 606bb9 <_end+0x5b79>
  400794:	3d 3d 3e 20 5b       	cmp    $0x5b203e3d,%eax
  400799:	54                   	push   %rsp
  40079a:	61                   	(bad)  
  40079b:	67 25 64 5d 3a 25    	addr32 and $0x253a5d64,%eax
  4007a1:	64 0a 00             	or     %fs:(%rax),%al
  4007a4:	72 3d                	jb     4007e3 <__dso_handle+0x9b>
  4007a6:	25                   	.byte 0x25
  4007a7:	64 0a 00             	or     %fs:(%rax),%al

Disassembly of section .eh_frame_hdr:

00000000004007ac <.eh_frame_hdr>:
  4007ac:	01 1b                	add    %ebx,(%rbx)
  4007ae:	03 3b                	add    (%rbx),%edi
  4007b0:	38 00                	cmp    %al,(%rax)
  4007b2:	00 00                	add    %al,(%rax)
  4007b4:	06                   	(bad)  
  4007b5:	00 00                	add    %al,(%rax)
  4007b7:	00 54 fc ff          	add    %dl,-0x1(%rsp,%rdi,8)
  4007bb:	ff 84 00 00 00 94 fc 	incl   -0x36c0000(%rax,%rax,1)
  4007c2:	ff                   	(bad)  
  4007c3:	ff 54 00 00          	callq  *0x0(%rax,%rax,1)
  4007c7:	00 84 fd ff ff ac 00 	add    %al,0xacffff(%rbp,%rdi,8)
  4007ce:	00 00                	add    %al,(%rax)
  4007d0:	8b fe                	mov    %esi,%edi
  4007d2:	ff                   	(bad)  
  4007d3:	ff d4                	callq  *%rsp
  4007d5:	00 00                	add    %al,(%rax)
  4007d7:	00 14 ff             	add    %dl,(%rdi,%rdi,8)
  4007da:	ff                   	(bad)  
  4007db:	ff f4                	push   %rsp
  4007dd:	00 00                	add    %al,(%rax)
  4007df:	00 84 ff ff ff 3c 01 	add    %al,0x13cffff(%rdi,%rdi,8)
	...

Disassembly of section .eh_frame:

00000000004007e8 <__FRAME_END__-0x118>:
  4007e8:	14 00                	adc    $0x0,%al
  4007ea:	00 00                	add    %al,(%rax)
  4007ec:	00 00                	add    %al,(%rax)
  4007ee:	00 00                	add    %al,(%rax)
  4007f0:	01 7a 52             	add    %edi,0x52(%rdx)
  4007f3:	00 01                	add    %al,(%rcx)
  4007f5:	78 10                	js     400807 <__dso_handle+0xbf>
  4007f7:	01 1b                	add    %ebx,(%rbx)
  4007f9:	0c 07                	or     $0x7,%al
  4007fb:	08 90 01 07 10 14    	or     %dl,0x14100701(%rax)
  400801:	00 00                	add    %al,(%rax)
  400803:	00 1c 00             	add    %bl,(%rax,%rax,1)
  400806:	00 00                	add    %al,(%rax)
  400808:	38 fc                	cmp    %bh,%ah
  40080a:	ff                   	(bad)  
  40080b:	ff 2a                	ljmpq  *(%rdx)
	...
  400815:	00 00                	add    %al,(%rax)
  400817:	00 14 00             	add    %dl,(%rax,%rax,1)
  40081a:	00 00                	add    %al,(%rax)
  40081c:	00 00                	add    %al,(%rax)
  40081e:	00 00                	add    %al,(%rax)
  400820:	01 7a 52             	add    %edi,0x52(%rdx)
  400823:	00 01                	add    %al,(%rcx)
  400825:	78 10                	js     400837 <__dso_handle+0xef>
  400827:	01 1b                	add    %ebx,(%rbx)
  400829:	0c 07                	or     $0x7,%al
  40082b:	08 90 01 00 00 24    	or     %dl,0x24000001(%rax)
  400831:	00 00                	add    %al,(%rax)
  400833:	00 1c 00             	add    %bl,(%rax,%rax,1)
  400836:	00 00                	add    %al,(%rax)
  400838:	c8 fb ff ff          	enterq $0xfffb,$0xff
  40083c:	40 00 00             	add    %al,(%rax)
  40083f:	00 00                	add    %al,(%rax)
  400841:	0e                   	(bad)  
  400842:	10 46 0e             	adc    %al,0xe(%rsi)
  400845:	18 4a 0f             	sbb    %cl,0xf(%rdx)
  400848:	0b 77 08             	or     0x8(%rdi),%esi
  40084b:	80 00 3f             	addb   $0x3f,(%rax)
  40084e:	1a 3b                	sbb    (%rbx),%bh
  400850:	2a 33                	sub    (%rbx),%dh
  400852:	24 22                	and    $0x22,%al
  400854:	00 00                	add    %al,(%rax)
  400856:	00 00                	add    %al,(%rax)
  400858:	24 00                	and    $0x0,%al
  40085a:	00 00                	add    %al,(%rax)
  40085c:	44 00 00             	add    %r8b,(%rax)
  40085f:	00 d0                	add    %dl,%al
  400861:	fc                   	cld    
  400862:	ff                   	(bad)  
  400863:	ff 07                	incl   (%rdi)
  400865:	01 00                	add    %eax,(%rax)
  400867:	00 00                	add    %al,(%rax)
  400869:	41 0e                	rex.B (bad) 
  40086b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400871:	47 8c 03             	rex.RXB mov %es,(%r11)
  400874:	83 04 02 fb          	addl   $0xfffffffb,(%rdx,%rax,1)
  400878:	0c 07                	or     $0x7,%al
  40087a:	08 00                	or     %al,(%rax)
  40087c:	00 00                	add    %al,(%rax)
  40087e:	00 00                	add    %al,(%rax)
  400880:	1c 00                	sbb    $0x0,%al
  400882:	00 00                	add    %al,(%rax)
  400884:	6c                   	insb   (%dx),%es:(%rdi)
  400885:	00 00                	add    %al,(%rax)
  400887:	00 af fd ff ff 84    	add    %ch,-0x7b000003(%rdi)
  40088d:	00 00                	add    %al,(%rax)
  40088f:	00 00                	add    %al,(%rax)
  400891:	41 0e                	rex.B (bad) 
  400893:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  400899:	02 7f 0c             	add    0xc(%rdi),%bh
  40089c:	07                   	(bad)  
  40089d:	08 00                	or     %al,(%rax)
  40089f:	00 44 00 00          	add    %al,0x0(%rax,%rax,1)
  4008a3:	00 8c 00 00 00 18 fe 	add    %cl,-0x1e80000(%rax,%rax,1)
  4008aa:	ff                   	(bad)  
  4008ab:	ff 65 00             	jmpq   *0x0(%rbp)
  4008ae:	00 00                	add    %al,(%rax)
  4008b0:	00 42 0e             	add    %al,0xe(%rdx)
  4008b3:	10 8f 02 45 0e 18    	adc    %cl,0x180e4502(%rdi)
  4008b9:	8e 03                	mov    (%rbx),%es
  4008bb:	45 0e                	rex.RB (bad) 
  4008bd:	20 8d 04 45 0e 28    	and    %cl,0x280e4504(%rbp)
  4008c3:	8c 05 48 0e 30 86    	mov    %es,-0x79cff1b8(%rip)        # ffffffff86701711 <_end+0xffffffff861006d1>
  4008c9:	06                   	(bad)  
  4008ca:	48 0e                	rex.W (bad) 
  4008cc:	38 83 07 4d 0e 40    	cmp    %al,0x400e4d07(%rbx)
  4008d2:	6c                   	insb   (%dx),%es:(%rdi)
  4008d3:	0e                   	(bad)  
  4008d4:	38 41 0e             	cmp    %al,0xe(%rcx)
  4008d7:	30 41 0e             	xor    %al,0xe(%rcx)
  4008da:	28 42 0e             	sub    %al,0xe(%rdx)
  4008dd:	20 42 0e             	and    %al,0xe(%rdx)
  4008e0:	18 42 0e             	sbb    %al,0xe(%rdx)
  4008e3:	10 42 0e             	adc    %al,0xe(%rdx)
  4008e6:	08 00                	or     %al,(%rax)
  4008e8:	14 00                	adc    $0x0,%al
  4008ea:	00 00                	add    %al,(%rax)
  4008ec:	d4                   	(bad)  
  4008ed:	00 00                	add    %al,(%rax)
  4008ef:	00 40 fe             	add    %al,-0x2(%rax)
  4008f2:	ff                   	(bad)  
  4008f3:	ff 02                	incl   (%rdx)
	...

0000000000400900 <__FRAME_END__>:
  400900:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000600e10 <__frame_dummy_init_array_entry>:
  600e10:	00 05 40 00 00 00    	add    %al,0x40(%rip)        # 600e56 <_DYNAMIC+0x2e>
	...

Disassembly of section .fini_array:

0000000000600e18 <__do_global_dtors_aux_fini_array_entry>:
  600e18:	e0 04                	loopne 600e1e <__do_global_dtors_aux_fini_array_entry+0x6>
  600e1a:	40 00 00             	add    %al,(%rax)
  600e1d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .jcr:

0000000000600e20 <__JCR_END__>:
	...

Disassembly of section .dynamic:

0000000000600e28 <_DYNAMIC>:
  600e28:	01 00                	add    %eax,(%rax)
  600e2a:	00 00                	add    %al,(%rax)
  600e2c:	00 00                	add    %al,(%rax)
  600e2e:	00 00                	add    %al,(%rax)
  600e30:	01 00                	add    %eax,(%rax)
  600e32:	00 00                	add    %al,(%rax)
  600e34:	00 00                	add    %al,(%rax)
  600e36:	00 00                	add    %al,(%rax)
  600e38:	0c 00                	or     $0x0,%al
  600e3a:	00 00                	add    %al,(%rax)
  600e3c:	00 00                	add    %al,(%rax)
  600e3e:	00 00                	add    %al,(%rax)
  600e40:	e0 03                	loopne 600e45 <_DYNAMIC+0x1d>
  600e42:	40 00 00             	add    %al,(%rax)
  600e45:	00 00                	add    %al,(%rax)
  600e47:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # 600e4d <_DYNAMIC+0x25>
  600e4d:	00 00                	add    %al,(%rax)
  600e4f:	00 34 07             	add    %dh,(%rdi,%rax,1)
  600e52:	40 00 00             	add    %al,(%rax)
  600e55:	00 00                	add    %al,(%rax)
  600e57:	00 19                	add    %bl,(%rcx)
  600e59:	00 00                	add    %al,(%rax)
  600e5b:	00 00                	add    %al,(%rax)
  600e5d:	00 00                	add    %al,(%rax)
  600e5f:	00 10                	add    %dl,(%rax)
  600e61:	0e                   	(bad)  
  600e62:	60                   	(bad)  
  600e63:	00 00                	add    %al,(%rax)
  600e65:	00 00                	add    %al,(%rax)
  600e67:	00 1b                	add    %bl,(%rbx)
  600e69:	00 00                	add    %al,(%rax)
  600e6b:	00 00                	add    %al,(%rax)
  600e6d:	00 00                	add    %al,(%rax)
  600e6f:	00 08                	add    %cl,(%rax)
  600e71:	00 00                	add    %al,(%rax)
  600e73:	00 00                	add    %al,(%rax)
  600e75:	00 00                	add    %al,(%rax)
  600e77:	00 1a                	add    %bl,(%rdx)
  600e79:	00 00                	add    %al,(%rax)
  600e7b:	00 00                	add    %al,(%rax)
  600e7d:	00 00                	add    %al,(%rax)
  600e7f:	00 18                	add    %bl,(%rax)
  600e81:	0e                   	(bad)  
  600e82:	60                   	(bad)  
  600e83:	00 00                	add    %al,(%rax)
  600e85:	00 00                	add    %al,(%rax)
  600e87:	00 1c 00             	add    %bl,(%rax,%rax,1)
  600e8a:	00 00                	add    %al,(%rax)
  600e8c:	00 00                	add    %al,(%rax)
  600e8e:	00 00                	add    %al,(%rax)
  600e90:	08 00                	or     %al,(%rax)
  600e92:	00 00                	add    %al,(%rax)
  600e94:	00 00                	add    %al,(%rax)
  600e96:	00 00                	add    %al,(%rax)
  600e98:	f5                   	cmc    
  600e99:	fe                   	(bad)  
  600e9a:	ff 6f 00             	ljmpq  *0x0(%rdi)
  600e9d:	00 00                	add    %al,(%rax)
  600e9f:	00 98 02 40 00 00    	add    %bl,0x4002(%rax)
  600ea5:	00 00                	add    %al,(%rax)
  600ea7:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 600ead <_DYNAMIC+0x85>
  600ead:	00 00                	add    %al,(%rax)
  600eaf:	00 18                	add    %bl,(%rax)
  600eb1:	03 40 00             	add    0x0(%rax),%eax
  600eb4:	00 00                	add    %al,(%rax)
  600eb6:	00 00                	add    %al,(%rax)
  600eb8:	06                   	(bad)  
  600eb9:	00 00                	add    %al,(%rax)
  600ebb:	00 00                	add    %al,(%rax)
  600ebd:	00 00                	add    %al,(%rax)
  600ebf:	00 b8 02 40 00 00    	add    %bh,0x4002(%rax)
  600ec5:	00 00                	add    %al,(%rax)
  600ec7:	00 0a                	add    %cl,(%rdx)
  600ec9:	00 00                	add    %al,(%rax)
  600ecb:	00 00                	add    %al,(%rax)
  600ecd:	00 00                	add    %al,(%rax)
  600ecf:	00 3f                	add    %bh,(%rdi)
  600ed1:	00 00                	add    %al,(%rax)
  600ed3:	00 00                	add    %al,(%rax)
  600ed5:	00 00                	add    %al,(%rax)
  600ed7:	00 0b                	add    %cl,(%rbx)
  600ed9:	00 00                	add    %al,(%rax)
  600edb:	00 00                	add    %al,(%rax)
  600edd:	00 00                	add    %al,(%rax)
  600edf:	00 18                	add    %bl,(%rax)
  600ee1:	00 00                	add    %al,(%rax)
  600ee3:	00 00                	add    %al,(%rax)
  600ee5:	00 00                	add    %al,(%rax)
  600ee7:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 600eed <_DYNAMIC+0xc5>
	...
  600ef5:	00 00                	add    %al,(%rax)
  600ef7:	00 03                	add    %al,(%rbx)
	...
  600f01:	10 60 00             	adc    %ah,0x0(%rax)
  600f04:	00 00                	add    %al,(%rax)
  600f06:	00 00                	add    %al,(%rax)
  600f08:	02 00                	add    (%rax),%al
  600f0a:	00 00                	add    %al,(%rax)
  600f0c:	00 00                	add    %al,(%rax)
  600f0e:	00 00                	add    %al,(%rax)
  600f10:	48 00 00             	rex.W add %al,(%rax)
  600f13:	00 00                	add    %al,(%rax)
  600f15:	00 00                	add    %al,(%rax)
  600f17:	00 14 00             	add    %dl,(%rax,%rax,1)
  600f1a:	00 00                	add    %al,(%rax)
  600f1c:	00 00                	add    %al,(%rax)
  600f1e:	00 00                	add    %al,(%rax)
  600f20:	07                   	(bad)  
  600f21:	00 00                	add    %al,(%rax)
  600f23:	00 00                	add    %al,(%rax)
  600f25:	00 00                	add    %al,(%rax)
  600f27:	00 17                	add    %dl,(%rdi)
  600f29:	00 00                	add    %al,(%rax)
  600f2b:	00 00                	add    %al,(%rax)
  600f2d:	00 00                	add    %al,(%rax)
  600f2f:	00 98 03 40 00 00    	add    %bl,0x4003(%rax)
  600f35:	00 00                	add    %al,(%rax)
  600f37:	00 07                	add    %al,(%rdi)
  600f39:	00 00                	add    %al,(%rax)
  600f3b:	00 00                	add    %al,(%rax)
  600f3d:	00 00                	add    %al,(%rax)
  600f3f:	00 80 03 40 00 00    	add    %al,0x4003(%rax)
  600f45:	00 00                	add    %al,(%rax)
  600f47:	00 08                	add    %cl,(%rax)
  600f49:	00 00                	add    %al,(%rax)
  600f4b:	00 00                	add    %al,(%rax)
  600f4d:	00 00                	add    %al,(%rax)
  600f4f:	00 18                	add    %bl,(%rax)
  600f51:	00 00                	add    %al,(%rax)
  600f53:	00 00                	add    %al,(%rax)
  600f55:	00 00                	add    %al,(%rax)
  600f57:	00 09                	add    %cl,(%rcx)
  600f59:	00 00                	add    %al,(%rax)
  600f5b:	00 00                	add    %al,(%rax)
  600f5d:	00 00                	add    %al,(%rax)
  600f5f:	00 18                	add    %bl,(%rax)
  600f61:	00 00                	add    %al,(%rax)
  600f63:	00 00                	add    %al,(%rax)
  600f65:	00 00                	add    %al,(%rax)
  600f67:	00 fe                	add    %bh,%dh
  600f69:	ff                   	(bad)  
  600f6a:	ff 6f 00             	ljmpq  *0x0(%rdi)
  600f6d:	00 00                	add    %al,(%rax)
  600f6f:	00 60 03             	add    %ah,0x3(%rax)
  600f72:	40 00 00             	add    %al,(%rax)
  600f75:	00 00                	add    %al,(%rax)
  600f77:	00 ff                	add    %bh,%bh
  600f79:	ff                   	(bad)  
  600f7a:	ff 6f 00             	ljmpq  *0x0(%rdi)
  600f7d:	00 00                	add    %al,(%rax)
  600f7f:	00 01                	add    %al,(%rcx)
  600f81:	00 00                	add    %al,(%rax)
  600f83:	00 00                	add    %al,(%rax)
  600f85:	00 00                	add    %al,(%rax)
  600f87:	00 f0                	add    %dh,%al
  600f89:	ff                   	(bad)  
  600f8a:	ff 6f 00             	ljmpq  *0x0(%rdi)
  600f8d:	00 00                	add    %al,(%rax)
  600f8f:	00 58 03             	add    %bl,0x3(%rax)
  600f92:	40 00 00             	add    %al,(%rax)
	...

Disassembly of section .got:

0000000000600ff8 <.got>:
	...

Disassembly of section .got.plt:

0000000000601000 <_GLOBAL_OFFSET_TABLE_>:
  601000:	28 0e                	sub    %cl,(%rsi)
  601002:	60                   	(bad)  
	...
  601017:	00 16                	add    %dl,(%rsi)
  601019:	04 40                	add    $0x40,%al
  60101b:	00 00                	add    %al,(%rax)
  60101d:	00 00                	add    %al,(%rax)
  60101f:	00 26                	add    %ah,(%rsi)
  601021:	04 40                	add    $0x40,%al
  601023:	00 00                	add    %al,(%rax)
  601025:	00 00                	add    %al,(%rax)
  601027:	00 36                	add    %dh,(%rsi)
  601029:	04 40                	add    $0x40,%al
  60102b:	00 00                	add    %al,(%rax)
  60102d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .data:

0000000000601030 <__data_start>:
  601030:	00 00                	add    %al,(%rax)
	...

Disassembly of section .bss:

0000000000601034 <__bss_start>:
  601034:	00 00                	add    %al,(%rax)
	...

0000000000601038 <i.2180>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 47 4e             	sub    %al,0x4e(%rdi)
   8:	55                   	push   %rbp
   9:	29 20                	sub    %esp,(%rax)
   b:	34 2e                	xor    $0x2e,%al
   d:	38 2e                	cmp    %ch,(%rsi)
   f:	35 20 32 30 31       	xor    $0x31303220,%eax
  14:	35 30 36 32 33       	xor    $0x33323630,%eax
  19:	20 28                	and    %ch,(%rax)
  1b:	52                   	push   %rdx
  1c:	65 64 20 48 61       	gs and %cl,%fs:%gs:0x61(%rax)
  21:	74 20                	je     43 <_init-0x40039d>
  23:	34 2e                	xor    $0x2e,%al
  25:	38 2e                	cmp    %ch,(%rsi)
  27:	35 2d 34 29 00       	xor    $0x29342d,%eax
