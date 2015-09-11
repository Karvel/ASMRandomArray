; Elanna Grossman
; Random letter array program

INCLUDE Irvine32.inc

.data
numRows DWORD ?
numCols DWORD ?
count DWORD ?
randVal DWORD ?
rowSize BYTE "Enter the number of rows: ",0
colSize BYTE "Enter the number of columns: ",0
vowelArray  DWORD 'A', 'E', 'I', 'O', 'U'
consArray   DWORD 'B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z'

.code

main PROC
		call Randomize

		; PROCs
		call arraySize
		call startArray
        exit
main ENDP

;---------------------------------
arraySize PROC
		mov edx,OFFSET rowSize
		call WriteString
		call ReadInt
		mov numRows,eax
		call Crlf
		mov edx,OFFSET colSize
		call WriteString
		call ReadInt
		mov numCols,eax
		call Crlf
ret
arraySize ENDP

;---------------------------------
startArray PROC
		mov ecx,numRows

	L1:
		mov count,ecx
		mov ecx,numCols
	
	L2:								;inner loop
		mov eax,2
		call RandomRange
		mov randVal, eax
		cmp randVal,0
		je Vowel
		jne Consonant
	
	Vowel:
		mov eax,5
		call RandomRange
		mov randVal, eax
		mov esi, randVal
		mov eax,vowelArray[esi*4]
		;mov al, BYTE PTR [eax]
		call WriteChar
		jmp loop2					;prevents program from continuing to consonant condition
	
	Consonant:
		mov eax, 21
		call RandomRange
		mov randVal, eax
		mov esi, randVal
		mov eax,consArray[esi*4]
		;mov al, BYTE PTR [eax]
		call WriteChar

	loop2:							;outer loop
		loop L2
		mov ecx,count
		call Crlf
		loop L1
ret
startArray ENDP

END main