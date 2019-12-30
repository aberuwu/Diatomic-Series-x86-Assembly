TITLE Cesar I. Mendoza (aberuwu) / Diatomic Series - This Program Uses the Irvine Library

INCLUDE Irvine32.inc

.data
	array DWORD 100 dup (0)
	index DWORD OFFSET array
.code

main PROC	
	mov edi, 0							;Index counter

	mov eax, 0							;Move first value into index 0, display and increment
	mov esi, [index]
	mov [esi], eax
	add index, TYPE array
	inc edi

	mov eax, 1							;Move second value into index 1, display and increment
	mov esi, [index]
	mov [esi], eax
	add index, TYPE array
	inc edi

	mov ecx, 99							;Move value to loop counter
	mov ebx, index						;Move index offset to ebx register

again:
	push edi							;Push registers
		
	mov ebx, edi						;Move index value into ebx register, preforme a mod operation,						
	test ebx, 1							;jump if remainder present
	jnz notZero

	mov eax, [index]					;Dereference value at index offset, move to eax register

	mov edx, edi						;Move edi counter to edx register
	sar edx, 1							;Performe bitwise shift operation for division by 2
	sub edi, edx						;Subtract registers to calculate jump distance
	sal edi, 2				            ;Multiply edi value by size value of array
	
	mov edx, index						;Move value into array index
	sub edx, edi
	mov esi, [edx]
	mov ebx, [index]
	mov [ebx], esi 
	
	pop edi								;Pop registers, increment edi, decrement counter, etc. 
	inc edi
	add index, TYPE array
	dec ecx
	jnz again
	jmp counter
	
notZero:
	push edx							;Push Registers
	push edi

	mov eax, edi						;Calculate array index offset
	dec edi
	sar edi, 1
	sub eax, edi
	sal eax, 2
	mov ebx, index
	sub ebx, eax

	pop edi								;Calculate array index offset
	mov eax, edi
	inc edi
	sar edi, 1
	sub eax, edi
	sal eax, 2
	mov edx, index
	sub edx, eax

	mov eax, [ebx]						;Dereference array index, move values into regiesters
	mov ebx, [edx]

	add eax, ebx						;Add register values, set current array index to eax value
	mov ebx, [index]
	mov [ebx], eax 

	pop edx								;Pop registers
	pop edi
	inc edi								;Increment index, decrement counter, jump accordingly
	add index, TYPE array
	dec ecx
	jnz again

counter:
	mov ecx, 100
	mov ebx, [OFFSET array]	

printArray:				
	mov eax, [ebx]						;Print array	
	call writeDec
	add ebx, TYPE array
	cmp ecx, 1
	jz continue
	mov al, ','
	call writeChar
continue:
	loop printArray

done:									;Print wait message, exit
	call CrLf
	call WaitMsg
	exit
main ENDP
END main