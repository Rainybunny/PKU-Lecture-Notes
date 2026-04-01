```
0000000000001d11 <strings_not_equal>:
    1d11:	f3 0f 1e fa          	endbr64 
    1d15:	41 54                	push   %r12
    1d17:	55                   	push   %rbp
    1d18:	53                   	push   %rbx
    1d19:	48 89 fb             	mov    %rdi,%rbx
    1d1c:	48 89 f5             	mov    %rsi,%rbp
    1d1f:	e8 d5 ff ff ff       	call   1cf9 <string_length>
    1d24:	41 89 c4             	mov    %eax,%r12d
    1d27:	48 89 ef             	mov    %rbp,%rdi
    1d2a:	e8 ca ff ff ff       	call   1cf9 <string_length>
    1d2f:	41 39 c4             	cmp    %eax,%r12d
    1d32:	74 12                	je     1d46 <strings_not_equal+0x35>        # 若字符串等长
    1d34:	b8 01 00 00 00       	mov    $0x1,%eax                            # 否则 GG
    1d39:	5b                   	pop    %rbx
    1d3a:	5d                   	pop    %rbp
    1d3b:	41 5c                	pop    %r12
    1d3d:	c3                   	ret    
    1d3e:	48 83 c3 01          	add    $0x1,%rbx                            # 两个字符串指针移动
    1d42:	48 83 c5 01          	add    $0x1,%rbp
    1d46:	0f b6 03             	movzbl (%rbx),%eax
    1d49:	84 c0                	test   %al,%al                              # 是 '\0' 了
    1d4b:	74 0c                	je     1d59 <strings_not_equal+0x48>
    1d4d:	38 45 00             	cmp    %al,0x0(%rbp)                        # 当前字符相等
    1d50:	74 ec                	je     1d3e <strings_not_equal+0x2d>        # 循环移动
    1d52:	b8 01 00 00 00       	mov    $0x1,%eax                            # 否则赤石
    1d57:	eb e0                	jmp    1d39 <strings_not_equal+0x28>
    1d59:	b8 00 00 00 00       	mov    $0x0,%eax                            # 相等, 赢
    1d5e:	eb d9                	jmp    1d39 <strings_not_equal+0x28>
```

`bool strings_not_equal(char*, char*)`, 判断两个字符串是否相同, 相同为 `false`.