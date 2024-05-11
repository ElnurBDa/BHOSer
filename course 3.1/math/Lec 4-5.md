Each logic circuit may be viewed as a machine L which contains one or more input devices (i1, i2, …, in) and exactly one output device (O)
# OR
![[Pasted image 20231102171648.png]]
# AND
![[Pasted image 20231102171703.png]]
# NOT
![[Pasted image 20231102171735.png]]
# NAND NOR
![[Pasted image 20231102171944.png]]
# Other things
## Bn
Bn has 2n elements
# Isomorphic
Two Boolean algebras B and B are said to be isomorphic if there is a one-to-one correspondence f:B→B which preserves the three operations, i.e., such that, for any elements, a, b in B,
f(a+b)=f(a)+f(b), f(a∗b)=f(a)∗f(b) and f(a')=f(a)''
# E and some other notations
E is any boolean expression
### SoP is sum of products `E=xy+x'z+z'y'` is example
SoP of `E1=xz′+y′z+xyz′` is `xz′+y′z`
![[Pasted image 20231102203423.png]]

### Complete Sum-of-Products Forms is CSoP
it is a sum of variations of 2^n boolean expressions of E(x1,x2,x3,..xn):
![[Pasted image 20231102203829.png]]
### Minimal Sum-of-Products (MSoP).
Consider a Boolean SoP expression E. Let EL denote the number of literals in E (counted according to multiplicity), and let ES denote the number of summands in E. For instance, if E=xyz+x′y′t+xy′z′t+x′yzt then EL=3+3+4+4=14 and ES=4.

Suppose E and F are equivalent Boolean SoP expressions. We say E is simpler than F if:
(i) EL<FL and ES≤FS, or (ii) EL≤FL and ES\<FS

We say E is minimal if there is no equivalent SoP, say F, which is simpler than E.
Note. There can be more than one equivalent minimal SoP expressions

A fundamental product P is called a prime implicant of a Boolean expression E if P+E=E but no other fundamental product contained in P has this property.
For instance, suppose E=xy′+xyz′+x′yz′. It is easy to check that: xz′+E=E but x+EE and z′+EE. Thus xz′ is a prime implicant of E.
# KARNAUGH
a minterm is a fundamental product which involves all the variables, and that a CSoP expression is a sum of minterms.
Two fundamental products P1 and P2 are said to be adjacent if P1 and P2 have the same variables and if they differ in exactly one literal.
Note that two such squares are adjacent, as defined above, if and only if the squares are geometrically adjacent (have a side in common).
A prime implicant of E(x,y) is either a pair of checked adjacent squares in E or an isolated checked square (i.e., a checked square which is not adjacent to any other checked square of E(x, y)).
A minimal SoP form for E(x, y) is a sum of minimal number of prime implicants such that the sum covers all the checked squares in Karnaugh map (that is, covers E(x, y)).
[Introduction of K-Map (Karnaugh Map) - GeeksforGeeks](https://www.geeksforgeeks.org/introduction-of-k-map-karnaugh-map/)
`(POS of F)=(SOP of F’)`

My understanding of this shit:
1) make a table for E
   - if consists only of x and y then on side is `x x'` another `y y'`
   - if x y z then one side is `x x'` another `xy xy' x'y' x'y`
   - if x y z t then one `xy xy' x'y' x'y` `zt zt' z't' z't`
2) Now that leftmost part of table is connected with right and up with down
3) cover it with + on places where summands of E are met. (for example if `E=xy+xy'` then put + on intersection of x and y **and** x and y')
4) make as least rectangular connections as possible (through connected sizes). Sizes of them can be 1-2-4-8 by 1-2-4-8
5) then get prime implicants: those are literals that do not change in a circle. (for example intersection of x and yz **and** x and yz' will give this prime implicant => xy)
6) find all prime implicants
7) sum them and get minimal SoP

# Truth Tables
### Special sequences
![[Pasted image 20231102223910.png]]
![[Pasted image 20231102224051.png]]
### Converting boolean to logic thing
after getting minimal SoP place circuits OR AND NOT
### Truth for minterms
![[Pasted image 20231102234657.png]]