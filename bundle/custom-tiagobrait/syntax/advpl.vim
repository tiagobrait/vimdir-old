" Vim syntax file
" Filename: advpl.vim
" Language: ADVPL - Advanced Protheus Language
" Maintainers:  Fabricio Beltram <fbeltram@gmail.com>
" Some things based on clipper.vim by C R Zamana <zamana@zip.net>
" Last Change: Wed May 23 2007
" Version: 1.0

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" ADVPL is case insensitive *** Famous Default Microsiga of not following
" defaults *** ;)
syn case ignore

" Reserved words
syn keyword advplStatement		aadd dtos inkey replicate val abs int rlock
syn keyword advplStatement		valtype asc lastrec round at empty len row define
syn keyword advplStatement		word bof lock rtrim alltrim year break log
syn keyword advplStatement		seconds cdow lower select chr eof ltrim str
syn keyword advplStatement		setpos cmonth exp max space col fcount sqrt
syn keyword advplStatement		min ctod dtoc dtos stod fieldname month date
syn keyword advplStatement		file pcol substr day flock pcount time deleted
syn keyword advplStatement		found procedure transform devpos function trim
syn keyword advplStatement		prow dow reccount type recno upper key strzero

" Functions and must used words
syn keyword advplFunction		local private user static rptStatus printer
syn keyword advplFunction 		pergunte return setprint setDefault setRegua file
syn keyword advplFunction 		dbGoTop say pSay dbSkip incRegua set device screen
syn keyword advplFunction 		dbselectarea dbclosearea dbsetorder nil mBrowse
syn keyword advplFunction 		dbsetindex dbclearindex dbclosearea dbcloseall
syn keyword advplFunction 		dbcommitall oemtoansi existblock execblock getmv
syn keyword advplFunction 		procregua lastrec replace with dbseek filter
syn keyword advplFunction		commit ourspool

" Conditionals
syn keyword advplConditional	if iif ifdef ifndef elseif else endif loop
syn keyword advplConditional	case otherwise endcase

" Repeat
syn keyword advplRepeat			for to next step while enddo

" Operators
syn match 	advplOperator 		"+\|-\|*\|/\|**\|->\|\^\|\$"
syn match 	advplOperator 		"\.t\.\|\.f.\|\.And\.\|\.Not\.\|\.Or\."
syn match	advplOperator		"!\|;\|@\|&\|#\|%"
syn match 	advplOperator 		"<\|>\|=\|==\|<=\|>=\|<>"
syn match 	advplOperator 		"!=\|:=\|+=\|-=\|*=\|/="

" Delimiters
syn match  	advplDelimiters		"[()]\|[\[\]]\|[{}]\|[||]"

syn region	advplDefine		start="^\s*\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@advplComment
" Includes
syn region 	advplIncluded 		contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match  	advplIncluded 		contained "<[^>]*>"
syn match  	advplInclude 		"^\s*#\s*include\>\s*["<]" contains=advplIncluded

" String and Character constants
syn region 	advplString 		start=+"+ end=+"+
syn region 	advplString			start=+'+ end=+'+
" This is from Bram Moolenaar:
if exists("c_comment_strings")
  " A comment can contain cString, cCharacter and cNumber.
  " But a "*/" inside a cString in a advplComment DOES end the comment!
  " So we need to use a special type of cString: advplCommentString, which
  " also ends on "*/", and sees a "*" at the start of the line as comment
  " again. Unfortunately this doesn't very well work for // type of comments :-(
  syntax match	advplCommentSkip	contained "^\s*\*\($\|\s\+\)"
  syntax region	advplCommentString	contained start=+"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=advplCommentSkip
  syntax region	advplComment2String	contained start=+"+ skip=+\\\\\|\\"+ end=+"+ end="$"
  syntax region	advplComment		start="/\*" end="\*/" contains=advplCommentString,advplCharacter,advplNumber,advplString
  syntax match	advplComment		"//.*" contains=advplComment2String,advplCharacter,advplNumber
else
  syn region	advplComment	start="/\*" end="\*/"
  syn match	advplComment	"//.*"
endif

syntax match advplCommentError 	"\*/"
syntax match advplComment 		"^\*.*"

let b:current_syntax = "advpl"

hi link advplConditional  Statement
hi link advplRepeat			  Repeat
hi link	advplOperator		  Operator
hi link advplDelimiters	  Delimiter
hi link	advplString			  String
hi link advplInclude		  Include
hi link	advplStatement	  Statement
hi link advplFunction		  Function
hi link advplComment		  Comment
hi link advplCommentError Error
hi link advplDefine 			Define

" vim: ts=4
