Revision 3
; Created by bitgen P.20131013 at Tue Mar 20 19:47:17 2018
; Bit lines have the following form:
; <offset> <frame address> <frame offset> <information>
; <information> may be zero or more <kw>=<value> pairs
; Block=<blockname     specifies the block associated with this
;                      memory cell.
;
; Latch=<name>         specifies the latch associated with this memory cell.
;
; Net=<netname>        specifies the user net associated with this
;                      memory cell.
;
; COMPARE=[YES | NO]   specifies whether or not it is appropriate
;                      to compare this bit position between a
;                      "program" and a "readback" bitstream.
;                      If not present the default is NO.
;
; Ram=<ram id>:<bit>   This is used in cases where a CLB function
; Rom=<ram id>:<bit>   generator is used as RAM (or ROM).  <Ram id>
;                      will be either 'F', 'G', or 'M', indicating
;                      that it is part of a single F or G function
;                      generator used as RAM, or as a single RAM
;                      (or ROM) built from both F and G.  <Bit> is
;                      a decimal number.
;
; Info lines have the following form:
; Info <name>=<value>  specifies a bit associated with the LCA
;                      configuration options, and the value of
;                      that bit.  The names of these bits may have
;                      special meaning to software reading the .ll file.
;
Info STARTSEL0=1
Bit  1050664 0x0111001c    264 Block=ILOGIC_X12Y21 Type=DRP
Bit  1050697 0x0111001c    297 Block=OLOGIC_X12Y20 Type=DRP
Bit  1050705 0x0111001c    305 Block=OLOGIC_X12Y20 Type=DRP
Bit  1050889 0x0111001c    489 Block=OLOGIC_X12Y22 Type=DRP
Bit  1050897 0x0111001c    497 Block=OLOGIC_X12Y22 Type=DRP
Bit  1051097 0x0111001c    697 Block=OLOGIC_X12Y24 Type=DRP
Bit  1051105 0x0111001c    705 Block=OLOGIC_X12Y24 Type=DRP
Bit  1051326 0x0111001c    926 Block=OLOGIC_X12Y29 Type=DRP
Bit  1051334 0x0111001c    934 Block=OLOGIC_X12Y29 Type=DRP
Bit  1051390 0x0111001c    990 Block=OLOGIC_X12Y31 Type=DRP
Bit  1051398 0x0111001c    998 Block=OLOGIC_X12Y31 Type=DRP
Bit  1577822 0x0211001c    142 Block=OLOGIC_X12Y33 Type=DRP
Bit  1577830 0x0211001c    150 Block=OLOGIC_X12Y33 Type=DRP
Bit  1577886 0x0211001c    206 Block=OLOGIC_X12Y35 Type=DRP
Bit  1577894 0x0211001c    214 Block=OLOGIC_X12Y35 Type=DRP
Bit  1577913 0x0211001c    233 Block=OLOGIC_X12Y34 Type=DRP
Bit  1577921 0x0211001c    241 Block=OLOGIC_X12Y34 Type=DRP
Bit  2105294 0x0311001c    334 Block=OLOGIC_X12Y47 Type=DRP
Bit  2105302 0x0311001c    342 Block=OLOGIC_X12Y47 Type=DRP
Bit  2105385 0x0311001c    425 Block=OLOGIC_X12Y48 Type=DRP
Bit  2105393 0x0311001c    433 Block=OLOGIC_X12Y48 Type=DRP
Bit  2105449 0x0311001c    489 Block=OLOGIC_X12Y50 Type=DRP
Bit  2105457 0x0311001c    497 Block=OLOGIC_X12Y50 Type=DRP
