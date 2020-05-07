
		DEVICE	ZXSPECTRUMNEXT

ROM_PRINT_A	EQU	16
ROM_CLS		EQU	$0D6B
ROM_CHAN_OPEN	EQU	$1601

SYS_BORDCR	EQU	23624
SYS_ATTR_P	EQU	23693

		ORG	0x8000

start:		ld	a, %00000111		; border black, paper black, ink white
		ld	(SYS_BORDCR), a
		ld	(SYS_ATTR_P), a
		call	ROM_CLS

		ld	a, 2			; use channel 2 for printing
		call	ROM_CHAN_OPEN

		ld	hl, message		; print the famous message
		call	prtmes

		jr	$			; endless loop

prtmes:		ld	a, (hl)			; load a character
		cp	255			; terminator?
		ret	z			;    yes: return
		rst	ROM_PRINT_A		; print the character
		inc	hl			; and fetch the next one
		jr	prtmes

message		byte	"Hello World!", 255

	; --- Create the main .nex file ---
		SAVENEX OPEN "../dist/{{project}}.nex", start, $FF40
		SAVENEX CORE 3, 0, 0
		SAVENEX CFG 7, 0, 1, 0
		SAVENEX AUTO
		SAVENEX CLOSE

	; -- Create a map file for debugging ---
		CSPECTMAP "../dist/{{project}}.map"
