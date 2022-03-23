;MAIN PROGRAME
;
;LOADER_BASEW_ADDR equ 0xA000
;LOADER_START_SECTOR equ 0x2
;--------------------------------------------------------
SECTION MBR vstart=0x7c00
	mov ax, cs
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov fs, ax
	mov sp, 0x7c00
	mov ax, 0xb800
	mov gs, ax

;CLEAR SCREEN
;function number 0x06 can clear screen
;--------------------------------------------------------
;INT 0x10   FUNCTION NUMBER:0x06    DESCRIBE:PAGEDOWN
;--------------------------------------------------------
;INPUT:
;AH FN NUM= 0x06
;AL
;BH
;(CL,CH)
;(DL,DH)
;NONE RET
	mov	ax, 0x600
	mov	bx, 0x700
	mov	cx, 0
	mov	dx, 0x184f


	int	10h
	
;;;;;;;;	sout background green & font color red, jumping "1 MBR"	;;;;;;;;
	mov byte [gs:0x00], '1'
	mov byte [gs:0x01], 0xA4	; A refers to green background & jumping, 4  means font color red  

	mov byte [gs:0x02], ' '
	mov byte [gs:0x03], 0xA4
	
	mov byte [gs:0x04], 'M'
	mov byte [gs:0x05], 0xA4
	
	mov byte [gs:0x06], 'B'
	mov byte [gs:0x07], 0xA4
	
	mov byte [gs:0x08], 'R'
	mov byte [gs:0x09], 0xA4

	jmp $

	times 510-($-$$) db 0
	db 0x55, 0xaa

