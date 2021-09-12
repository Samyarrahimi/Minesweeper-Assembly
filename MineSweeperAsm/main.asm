.586
.model flat,C
.stack 4096

putBomb PROTO , x:DWORD, y:DWORD, n:DWORD, arr:DWORD
calculateBomb PROTO , i:DWORD, n:DWORD , mn:DWORD, arr:DWORD

.data
count DWORD 0

.code
putBomb PROC ,
	x:DWORD, y:DWORD, n:DWORD, arr:DWORD

	
	mov eax, x
	mov edx, n
	mul edx
	add eax, y				;eax = x*n+y
	mov edx,4				;4 byte
	mul edx					;4 byte
	mov ebx,arr
	add ebx,eax
	mov edx,13
	mov [ebx],edx
	ret
putBomb ENDP

calculateBomb PROC ,
	i:DWORD, n:DWORD, mn:DWORD, arr:DWORD 

	mov eax, i
	mov ebx, arr
	mov ecx,4
	mul ecx
	add ebx, eax
	mov ebx, [ebx]
	.IF ebx != 13
		mov eax, i
		mov ecx, n
		xor edx, edx
		div ecx
		mov ecx, n

		; eax/ecx | quotient in eax | remainder in edx

		sub ecx, 1
		mov count, 0
		.IF edx == 0

			mov edx, 0


			;;;;;;;;;;;up
			mov eax, i
			mov ecx, n
			sub eax, ecx
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ebx, [ebx]
			mov eax, i
			mov ecx, n
			sub eax, ecx
			.IF (eax>=0) && (ebx==13)
				inc count
			.ENDIF

			;;;;;;;;;;;up right
			mov eax, i
			mov ecx, n
			sub eax, ecx
			add eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ebx, [ebx]
			mov eax, i
			mov ecx, n
			sub eax, ecx
			add eax, 1
			.IF (eax>=0) && (ebx==13)
				inc count
			.ENDIF

			;;;;;;;;;;;right
			mov ecx, n
			mov eax, i
			add eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ebx, [ebx]
			mov eax, i
			add eax, 1
			.IF (eax < mn) && (ebx==13)
				inc count
			.ENDIF

			;;;;;;;;;;;down
			mov ecx, n
			mov eax, i
			add eax, ecx
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov eax, i
			mov ecx, n
			add eax, ecx
			mov ebx, [ebx]
			.IF (eax < mn) && (ebx==13)
				inc count
			.ENDIF

			;;;;;;;;;;;down right
			mov ecx, n
			mov eax, i
			add eax, ecx
			add eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ecx, n
			mov eax, i
			add eax, ecx
			add eax, 1
			mov ebx, [ebx]
			.IF (eax < mn) && (ebx==13)
				inc count
			.ENDIF

		.ELSEIF edx == ecx
			
			mov edx, 0

			;;;;;;;;;;;up left
			mov ecx, n
			mov eax, i
			sub eax, ecx
			sub eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ecx, n
			mov eax, i
			sub eax, ecx
			mov ebx, [ebx]
			.IF (eax >= 1) && (ebx == 13)
				inc count
			.ENDIF

			;;;;;;;;;;;up
			mov ecx, n
			mov eax, i
			sub eax, ecx
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ecx, n
			mov eax, i
			sub eax, ecx
			mov ebx, [ebx]
			.IF (eax >= 0) && (ebx == 13)
				inc count
			.ENDIF

			;;;;;;;;;;;left
			mov ecx, n
			mov eax, i
			sub eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov eax, 1
			mov ebx, [ebx]
			.IF (eax >= 1) && (ebx == 13)
				inc count
			.ENDIF

			;;;;;;;;;;;down left
			mov ecx, n
			mov eax, i
			add eax, ecx
			sub eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ecx, n
			mov eax, i
			add eax, ecx
			sub eax, 1
			mov ebx, [ebx]
			.IF (eax < mn) && (ebx == 13)
				inc count
			.ENDIF

			;;;;;;;;;;;down
			mov ecx, n
			mov eax, i
			add eax, ecx
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ecx, n
			mov eax, i
			add eax, ecx
			mov ebx, [ebx]
			.IF (eax < mn) && (ebx == 13)
				inc count
			.ENDIF
		
		.ELSE

			mov edx, 0

			;;;;;;;;;;;up left
			mov ecx, n
			mov eax, i
			sub eax, ecx
			sub eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ecx, n
			mov eax, i
			sub eax, ecx
			mov ebx, [ebx]
			.IF (eax >= 1) && (ebx == 13)
				inc count
			.ENDIF

			;;;;;;;;;;;up
			mov ecx, n
			mov eax, i
			sub eax, ecx
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ecx, n
			mov eax, i
			sub eax, ecx
			mov ebx, [ebx]
			.IF (eax >= 0) && (ebx == 13)
				inc count
			.ENDIF

			;;;;;;;;;;;up right
			mov eax, i
			mov ecx, n
			sub eax, ecx
			add eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ebx, [ebx]
			mov eax, i
			mov ecx, n
			sub eax, ecx
			add eax, 1
			.IF (eax>=0) && (ebx==13)
				inc count
			.ENDIF

			;;;;;;;;;;;left
			mov ecx, n
			mov eax, i
			sub eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov eax, 1
			mov ebx, [ebx]
			.IF (eax >= 1) && (ebx == 13)
				inc count
			.ENDIF

			;;;;;;;;;;;right
			mov ecx, n
			mov eax, i
			add eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ebx, [ebx]
			mov eax, i
			add eax, 1
			.IF (eax < mn) && (ebx==13)
				inc count
			.ENDIF

			;;;;;;;;;;;down left
			mov ecx, n
			mov eax, i
			add eax, ecx
			sub eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ecx, n
			mov eax, i
			add eax, ecx
			sub eax, 1
			mov ebx, [ebx]
			.IF (eax < mn) && (ebx == 13)
				inc count
			.ENDIF

			;;;;;;;;;;;down
			mov ecx, n
			mov eax, i
			add eax, ecx
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov eax, i
			mov ecx, n
			add eax, ecx
			mov ebx, [ebx]
			.IF (eax < mn) && (ebx==13)
				inc count
			.ENDIF

			;;;;;;;;;;;down right
			mov ecx, n
			mov eax, i
			add eax, ecx
			add eax, 1
			mov ebx, arr
			mov ecx,4
			mul ecx
			add ebx, eax
			mov ecx, n
			mov eax, i
			add eax, ecx
			add eax, 1
			mov ebx, [ebx]
			.IF (eax < mn) && (ebx==13)
				inc count
			.ENDIF
		.ENDIF

	mov eax, i
	mov ebx, arr
	mov ecx, 4
	mul ecx
	add ebx, eax
	mov eax, count
	mov [ebx], eax
	.ENDIF
	ret

calculateBOMB ENDP

END
