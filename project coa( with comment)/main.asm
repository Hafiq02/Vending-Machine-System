TITLE Project Vending Machine Group Stabak

INCLUDE Irvine32.inc

.data

	frm1  BYTE "*************Welcome to Stabak Vending Machine*************",0
	frm2  BYTE "*			     MENU		          *",0
	frm3  BYTE "*	1. Tea				    60 cents      *",0
	frm4  BYTE "*	2. Choco			    70 cents      *",0
	frm5  BYTE "*	3. Coffee			    100 cents     *",0
	frm6  BYTE "*	4. Mocha			    120 cents     *",0
	frm7  BYTE "***********************************************************",0

	drk1  BYTE "Here is your			: Tea",0
	drk2  BYTE "Here is your			: Choco",0
	drk3  BYTE "Here is your			: Coffee",0
	drk4  BYTE "Here is your			: Mocha",0

	str1  BYTE "Please input money		: ",0
	str2  BYTE "10 cents			: ",0
	str3  BYTE "20 cents			: ",0
	str4  BYTE "50 cents			: ",0
	str5  BYTE "Total money inserted		: ",0
	str6  BYTE " cents",0
	str7  BYTE "Please choose drink		: ",0
	str8  BYTE "This is your change		: ",0
	str9  BYTE "Thank you!				 ",0
	str10 BYTE "Do you want to buy more drinks? (Yes:0 / No:1) : ",0
	str11 BYTE "[NOT ENOUGH BALANCE] 							 ",0
	str12 BYTE "SORRY, THERE IS NO SUCH DRINKS                    ",0
	str13 BYTE "DO WISH TO CONTINUE? (Yes:0 / No:1) :",0
	str14 BYTE "DO YOU WANT TO ADD MONEY OR NOT?   (Yes:0 / No:1) :",0
	str15 BYTE "TOTAL AVAILABLE			:",0

	drktype DWORD 0
	temp1	DWORD 0
	temp2	DWORD 0
	temp3	DWORD 0    

	total	DWORD 0
	balance	DWORD 0

	choice	DWORD 0
	choice2	DWORD 0
	choice3 DWORD 0
	
	coin10	DWORD 10
	coin20	DWORD 20
	coin50	DWORD 50

	price1	DWORD 60
	price2	DWORD 70
	price3	DWORD 100
	price4	DWORD 120

.code
main PROC
	L1:
			call clrscr                       ;clear screen
			mov edx, OFFSET frm1              ;print frame1
			call WriteString
			call crlf

			mov edx, OFFSET frm2              ;print frame2
			call WriteString
			call crlf

			mov edx, OFFSET frm3              ;print frame3
			call WriteString
			call crlf

			mov edx, OFFSET frm4              ;print frame4
			call WriteString
			call crlf

			mov edx, OFFSET frm5              ;print frame5
			call WriteString
			call crlf

			mov edx, OFFSET frm6              ;print frame6
			call WriteString
			call crlf

			mov edx, OFFSET frm7              ;print frame7
			call WriteString
			call crlf
			jmp L2


	L2:
			call crlf
			mov edx, OFFSET str15             ;print str15(total available)
			call WriteString
			mov eax, balance                  
			call WriteDec                     ;print balance
			call crlf

			call crlf
			mov edx, OFFSET str1              ;print str1(please input money)
			call WriteString
			call crlf

			mov edx, OFFSET str2              ;print str2(10cents)
			call WriteString
			call ReadDec
			mov temp1, eax
			mov eax, temp1
			mul coin10
			mov total, eax                    ;add to total
			call crlf

			mov edx, OFFSET str3              ;print str3(20cents)
			call WriteString
			call ReadDec
			mov temp2, eax
			mov eax,temp2
			mul coin20
			add total, eax                    ;add to total
			call crlf

			mov edx, OFFSET str4              ;print str4(50cents)
			call WriteString
			call ReadDec
			mov temp3, eax
			mov eax,temp3
			mul coin50
			add total, eax                    ;add to total
			call crlf

			mov edx, OFFSET str5              ;print total money inserted
			call WriteString

			mov eax, total                    ;to put value from total to balance
			add eax, balance
			call WriteDec
			mov balance, eax

			mov edx, OFFSET str6              ;print str6(cents)
			call WriteString
			call crlf
			jmp L3

	L3:
			mov edx, OFFSET str7              ;print str7(please choos drink)
			call WriteString
			call ReadDec

			mov drktype, eax                  ;user choose drink
			cmp drktype,1
			jz SET1
			cmp drktype,2
			jz SET2
			cmp drktype,3
			jz SET3
			cmp drktype,4
			jz SET4
			jmp ERROR2                        ;jump to drink type error if user do
			                                  ;not choose either one of the drinks

	SET1:
			cmp balance, 60                   ;compare balance with price
			jge CALC1                         ;if greater or equal jump to CALC1
			jl ERROR1                         ;if lower jump to ERROR1

	CALC1:
			mov edx, OFFSET drk1
			call WriteString
			call crlf

			mov eax, balance
			sub eax, price1                   ;balance - price
			mov balance, eax

			mov edx, OFFSET str8
			call WriteString
			mov eax, balance
			call WriteDec

			mov edx, OFFSET str6
			call WriteString
			call crlf
			jmp Q2                            ;jump to ask user to buy more or not

			
	SET2:
			cmp balance, 70                   ;compare balance with price
			jge CALC2                         ;if greater or equal jump to CALC2
			jl ERROR1                         ;if lower jump to ERROR1

	CALC2:
			mov edx, OFFSET drk2
			call WriteString
			call crlf

			mov eax, balance
			sub eax, price2                   ;balance - price
			mov balance, eax

			mov edx, OFFSET str8
			call WriteString
			mov eax, balance
			call WriteDec

			mov edx, OFFSET str6
			call WriteString
			call crlf
			jmp Q2                            ;jump to ask user to buy more or not

	SET3:
			cmp balance, 100                  ;compare balance with price
			jge CALC3                         ;if greater or equal jump to CALC3
			jl ERROR1                         ;if lower jump to ERROR1

	CALC3:
			mov edx, OFFSET drk3
			call WriteString
			call crlf

			mov eax, balance
			sub eax, price3                   ;balance - price
			mov balance, eax

			mov edx, OFFSET str8
			call WriteString
			mov eax, balance
			call WriteDec

			mov edx, OFFSET str6
			call WriteString
			call crlf
			jmp Q2                              ;jump to ask user to buy more or not

	SET4:
			cmp balance, 120                  ;compare balance with price
			jge CALC4                         ;if greater or equal jump to CALC4
			jl ERROR1                         ;if lower jump to ERROR1

	CALC4:
			mov edx, OFFSET drk4
			call WriteString
			call crlf

			mov eax, balance
			sub eax, price4                   ;balance - price
			mov balance, eax

			mov edx, OFFSET str8
			call WriteString
			mov eax, balance
			call WriteDec

			mov edx, OFFSET str6
			call WriteString
			call crlf
			jmp Q2                            ;jump to ask user to buy more or not

		Q1:                                   ;ask user whether to continue or not 
			call crlf
			mov edx, OFFSET str13   ;str10    do you wish to
			call WriteString
			call ReadDec
			mov choice, eax
			call crlf
			call crlf
			cmp choice,0
			jz Continue2    ;continue1
			jmp giveBal

		Q2:                                   ;ask user to buy more or not
			call crlf
			mov edx, OFFSET str10             ;str13         do you want to buy more
			call WriteString
			call ReadDec
			mov choice2, eax
			call crlf
			call crlf
			cmp choice2,0
			jz Continue2
			jmp stop

	ERROR1:                                    ;balance error
			call crlf
			mov edx, OFFSET str11
			call WriteString
			call crlf

			call crlf
			mov edx, OFFSET str14
			call WriteString
			call crlf
			call crlf
			
			call ReadDec
			mov choice3, eax
			call crlf
			call crlf
			cmp choice3,0
			jz Continue
			jmp giveBal

	ERROR2:                                  ;drink type error
			mov edx, OFFSET str12
			call WriteString
			call crlf
			call crlf
			jmp Q1                           ;jump to  Q1 (ask user whether to continue or not)

	Continue:
			jmp L1

	Continue2:
			jmp L3
		

	giveBal:
			mov edx, OFFSET str8
			call WriteString
			mov eax, balance
			call WriteDec
			call crlf
			
	Stop:
			mov edx, OFFSET str9
			call WriteString
			call crlf
exit
main ENDP

END main