	org 	0h
	ljmp	utama
	ljmp	cacah_naik
	org	13h
	ljmp	cacah_turun
	org	30h
utama:
	mov	dptr, #numerik
	clr	a
	movc	a, @a+dptr
	mov	p0, a
	mov	r0, #0
;
	;mov	ie, #85h	; <- bisa juga aktivasi INT pake yang singkat begini
	setb	ex0
	setb	ex1
	setb	ea
	setb	it0
	setb	it1
	sjmp	$
;
cacah_naik:
	inc	r0
	cjne	r0, #10, tampil
	mov	r0, #9
	reti
;
cacah_turun:
	dec	r0
	cjne	r0, #255, tampil
	mov	r0, #0
	reti
;
tampil:
	mov	a, r0
	movc	a, @a+dptr
	mov	p0, a
	reti
;
numerik:
	DB	0C0h,0F9h,0A4h,0B0h,99h,92h,82h,0F8h,80h,90h
	end