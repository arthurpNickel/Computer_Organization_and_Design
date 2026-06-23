v3.0 hex words addressed

00: 61ffffff
01: 78ffffff
02: a8ffffff
03: 60ffffff
04: 70ffffff
05: a4ffffff
06: 60ffffff
07: 7cffffff
08: acffffff
09: 56ff3fff
0A: ffff3935
0B: 61ffffff
0C: 71ffffff
0D: ff0cffff
0E: 60ffffff
0F: 79ffffff
10: ff20ffff

11: 60ffffff    ; movh R0,0
12: 70ffffff    ; movl R0,0
13: a8ffffff    ; mov R2,R0
14: a4ffffff    ; mov R1,R0
15: 60ffffff    ; movh R0,0
16: 7cffffff    ; movl R0,12
17: acffffff    ; mov R3,R0
18: 56ff3fff    ; st R1,R2 | addi R3,-1
19: ffff39ff    ; addi R2,1
1A: ffff35ff    ; addi R1,1
1B: 62ffffff    ; movh R0,2
1C: 71ffffff    ; movl R0,1
1D: ff0cffff    ; brzr R3,R0
1E: 61ffffff    ; movh R0,1
1F: 78ffffff    ; movl R0,8
20: ff20ffff    ; jr R0

21: 60ffffff    ; movh R0,0
22: 7cffffff    ; movl R0,12
23: a8ffffff    ; mov R2,R0
24: 61ffffff    ; movh R0,1
25: 74ffffff    ; movl R0,4
26: a4ffffff    ; mov R1,R0
27: 60ffffff    ; movh R0,0
28: 7cffffff    ; movl R0,12
29: acffffff    ; mov R3,R0
2A: 56ff3fff    ; st R1,R2 | addi R3,-1
2B: ffff39ff    ; addi R2,1
2C: ffff35ff    ; addi R1,1
2D: 63ffffff    ; movh R0,3
2E: 73ffffff    ; movl R0,3
2F: ff0cffff    ; brzr R3,R0
30: 62ffffff    ; movh R0,2
31: 7affffff    ; movl R0,10
32: ff20ffff    ; jr R0

33: 60ffffff
34: 7cffffff
35: a4ffffff
36: 61ffffff
37: 78ffffff
38: a8ffffff
39: 60ffffff
3A: 7cffffff
3B: acffffff
3C: 60ffffff
3D: 7cffffff
3E: ffff93ff
3F: 44ffffff
40: 61ffffff
41: 78ffffff
42: ffff93ff
43: 40ffffff
44: ffff84ff
45: 56ffffff
46: ffff39ff
47: ffff3fff
48: 64ffffff      ; movh R0,4
49: 7effffff      ; movl R0,14   => 0x4E
4A: ff0cffff      ; brzr R3,R0
4B: 63ffffff      ; movh R0,3
4C: 7cffffff      ; movl R0,12   => 0x3C
4D: ff20ffff      ; jr R0
4E: ffffffff      ; nop/fim