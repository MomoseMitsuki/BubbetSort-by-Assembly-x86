.386
.model	flat,c
option	casemap:none

include msvcrt.inc
includelib msvcrt.lib

	.const
szTheme		db	"Bubbet sort by assembly x86",0Ah,0
szInput		db	"%d",0
szQsk1		db	"Please input the array's length: ",0
szQsk2		db	"Please input the array's value one by one:",0Ah,0
szBubbet	db	"After the Bubbet sort,now we can get the array: ",0Ah,0
szOutput	db	"%d ",0

	.code
BubbetSort:
			push ebp
			mov ebp,esp
			sub esp,0C0h
			mov dword ptr[ebp-4],0
			jmp forCheck2
forAgain2:	add dword ptr[ebp-4],1
forCheck2:	mov eax,dword ptr[ebp-4]
			add eax,1
			cmp eax,dword ptr[ebp+0Ch]
			jge forOver2
			mov dword ptr[ebp-8],0
			jmp forCheck3
forAgain3:	add dword ptr[ebp-8],1
forCheck3:	mov eax,dword ptr[ebp-8]
			add eax,1
			add eax,dword ptr[ebp-4]
			cmp eax,dword ptr[ebp+0Ch]
			jge forOver3
			mov ecx,dword ptr[ebp-8]
			mov eax,dword ptr[ebx+ecx*4]
			mov edx,dword ptr[ebx+ecx*4+4]
			cmp eax,edx
			jle NoExchange
			mov dword ptr[ebx+ecx*4],edx
			mov dword ptr[ebx+ecx*4+4],eax
NoExchange: jmp forAgain3
forOver3:	jmp forAgain2
forOver2:	push offset szBubbet
			call crt_printf
			add esp,4
			mov dword ptr[ebp-10h],0
			mov ebx,dword ptr[ebp+8]
			jmp forCheck4
forAgain4:	add dword ptr[ebp-10h],1
forCheck4:	mov eax,dword ptr[ebp-10h]
			cmp eax,dword ptr[ebp+0Ch]
			jge forOver4
			mov ecx,dword ptr[ebp-10h]
			push dword ptr[ebx+ecx*4]
			push offset szOutput
			call crt_printf
			add esp,8
			jmp forAgain4
forOver4:	add esp,0C0h
			mov esp,ebp
			pop ebp
			ret

main:
			push ebp	
			mov ebp,esp
			sub esp,0CCh				
			push offset szTheme
			call crt_printf
			add esp,4
			push offset szQsk1
			call crt_printf
			add esp,4
			lea eax,dword ptr[ebp-4]
			push eax
			push offset szInput
			call crt_scanf
			add esp,8
			push offset szQsk2
			call crt_printf
			add esp,4
			mov dword ptr[ebp-8],0
			mov ebx,ebp
			sub ebx,8
			mov ecx,dword ptr[ebp-4]
			imul ecx,4
			sub ebx,ecx
			jmp forCheck1
forAgain1:	add dword ptr[ebp-8],1
forCheck1:	mov eax,dword ptr[ebp-8]
			cmp eax,dword ptr[ebp-4]
			jge forOver1
			mov ecx,dword ptr[ebp-8]
			lea eax,dword ptr[ebx+ecx*4]
			push eax
			push offset szInput
			call crt_scanf
			add esp,8
			jmp forAgain1
forOver1:	push dword ptr[ebp-4]
			push ebx
			call BubbetSort
			add esp,8
			xor eax,eax
			add esp,0CCh
			mov esp,ebp
			pop ebp
			ret
end main