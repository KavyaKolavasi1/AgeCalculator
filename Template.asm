TITLE Program Template     (template.asm)

; Author: Kavya Kolavasi


INCLUDE Irvine32.inc

current_year = 2023

.data

	intro_1			BYTE	"Welcome to AGE CALCULATOR! Here you will enter the year of birth and I will tell you how old the person is!",0
	prompt_1		BYTE	"Please enter the year of birth! ",0
	goodbye			BYTE	"Thanks for using the program, goodbye!",0
	error_year		BYTE	"It is not possible to be born in this year!",0
	end_user		BYTE	"If you wish to continue please enter 1! Else choose 0 to quit!!! ",0
	quit_result		DWORD	?
	age_result		DWORD	?
	birth_year		DWORD	?


.code
main PROC

	; Introduce programmer
	mov		EDX, OFFSET intro_1
	call	WriteString
	call	CrLf
	call	CrLf

_continue_loop:

	; Prompt the user to enter the year of birth
	mov		EDX, OFFSET prompt_1
	call	WriteString
	call	ReadDec																		
	mov		birth_year, EAX	
	
	; Check if the birth year is smaller than current year
	mov		EAX,	birth_year
	cmp		EAX,	current_year																
	jg		_age_Error	

	; continue loop or not
	mov		EDX, OFFSET end_user
	call	WriteString
	call	CrLf
	call	ReadDec
	mov		quit_result, EAX															
	cmp		EAX, 1																		
	je		_continue_loop																
	jmp		_end_Program
	
_age_Error:
	mov		EDX,OFFSET	error_year														
	call	WriteString
	call	CrLf
	jmp		_continue_loop

_end_Program:

	; Display a closing message
	mov		EDX,OFFSET goodbye
	call	WriteString
	call	CrLf		


	Invoke ExitProcess,0	; exit to operating system
main ENDP

END main
