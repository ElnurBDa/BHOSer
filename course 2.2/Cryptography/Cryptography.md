# Intro
### Resources
Week 2.pptx
### Explanation
Crypt(ography|ology|analysis)
Cryptography is methods, techniques of secret communication
Cryptoanalysis is the way of analysing of secret communication and other secret systems
Cryptology is study of terms above

# The Reverse Cipher
### Resources
Week 2.pptx
### Explanation
it is just reversing the text. Weak. Look at it and crack. 
### Example
Elnur -> runlE

# The Caesar Cipher
### Resources
Week 3_part1_The Caesar Cipher.pptx
https://youtu.be/sMOZf4GN3oc
### Explanation 
it is cipher based oh shifting letters in alphabet. Normally, latin alphabet is used for this, and depending on alphabet shifting is limited to the size of the alphabet. While encripting using caesar cipher, every letter is changed by predetermined number of shifts to right. So, for example, if shift would be 3, letter A would change to D, B to E and so on. And it is  easy to crack this cipher, and there are two ways. To decipher it just shift to left.
Brute force - checking all possible numbers of shift, then determining which shift gives inteligible text. k analysis - it is precalculated frequence of each letter in alphabet, frequences are based on how many times particular letter occurs in huge text. So, frequences of encrypted text can be calculated and compared with the frequences of english alphabet, it will give most possible shift.
### Example
Alice and Bob in main roles. Bob and Alice determine which shift(3) would they use beforehand. Bob has text(hello), Bob shifts each letter by determined shift(3), he encrypts it, he sends encrypted text(#####) publicly(it means anyone can read encrypted text, but cannot detecrypt), Alice receives it, she uses the shift(3) to decryot secret text(#####), she get plain text(hello). 
### Notes
rot13 is Caesar cipher with shift of 13


# Transposition Cipher
### Resources
Week3_part2_Transposition Cipher.pptx
https://youtu.be/sHsnH1u03e4
### Explanation
In this cipher order of letters in text are changed to produce cipher text. 
In more detail, key is determined, it is some number that is less than length of text itself and it denotes the length of the row. Plain text is then put into a row letter by letter, after first row is filled, we go to the next row and fill it. There would be (\[length of text/key]+1) number of rows, if last row is not fully filled, empth boxes of row is shaded. Then letters are taken from each column one by one and put into one line. It will produce encrypted text. 
Decryption is similar but reverse process. Using the key we determine number of rows = key. Then we fill row column letter by letter. After this, we take letter from columns one by one. And in result, we get deciphered text.
Can be cracked with brute force or frequence analysis.
### Example
Alice and Bob in main roles. Bob and Alice determines key:4. Bob has message: "hello Alice". He puts it into table of row size of key:
|h|e|l|l|
|-|-|-|-|
|o| |A|l|
|i|c|e| |
it produces this cipher text: "hoie clAell". It is sent to Alice.
Alice get cipher text, Alice knows key:4, she decrypts it having key(4) number of rows.
|h|o|i|
|-|-|-|
|e| |c|
|l|A|e|
|l|l| |
she deciphers it by reaading column by column and gets: "hello Alice"

# Affine Cipher
### Resources
Week 4 _ Affine cipher.pptx
### Explanation
In this cipher indexes of letters(indexes of letters in alphabet) in text are changed into another letter with index that is got by some mathematical operations. 
In more detail, indexes of letters in text are determined. Key is chosen: key is pair of two numbers - k1 and k2. Each of the index is multiplied by k1 then k2 is added. After this we take a mod of length of alphabet. Then we replace indexes with corresponding letters in alphabet. For example letter C which has index 2 with key pair of 2 and 3 will be encrypted to (2\*2+3) mod 26 = 7 which is H. To decipher affine cipher we just need to do these mathematical operations in reverse order: subtract k2 and then divide by k1(if it is needed add length of alphabet several times till you get a number divisible by k1).
### Example
Alice and Bob in main roles. Bob's message: "HELLOALICE". They determine preshared key: (4, 5). 
|plain text|H|E|L|L|O|A|L|I|C|E|
|-|-|-|-|-|-|-|-|-|-|-|
|indexes|7|4|11|11|14|0|11|8|2|4|
|i\*4+5|33|21|49|49|61|5|49|37|13|21|
|mod 26|7|21|23|23|9|5|23|11|13|21|
|cipher|H|V|X|X|J|F|X|L|N|V|
he gets HVXXJFXLNV, he sends it to Alice.
Alice again constructs similar table:
|secret text|H|V|X|X|J|F|X|L|N|V|
|-|-|-|-|-|-|-|-|-|-|-|
|indexes|7|21|23|23|9|5|23|11|13|21|
|(i-5)/4 mod 26|7|4|11|11|14|0|11|8|2|4|
|decipher|H|E|L|L|O|A|L|I|C|E|
she gets: "HELLOALICE"

# Simple Substitution Cipher
### Resources
[Substitution cipher - Wikipedia](https://en.wikipedia.org/wiki/Substitution_cipher)
### Explanation
rot13
reference to caesar cipher with shift of 13

# Vigenere Cipher
### Resources
week6_1_Vigenere_Cipher.pptx
[Vigenère cipher - Wikipedia](https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher)
### Explanation
It is cipher that uses Caesar cipher multiple times. It is more reliable than caesar cipher. Key is a combination of letters. To encrypt: alphabetical indexes of letters in key is determined. Then, for each letter in message text letter is shifted according to corresponding letter in key. For examle, key is FB and message text is BCDE:
|F|B|F|B|=>|5|1|5|1|
|-|-|-|-|- |-|-|-|-|
|B|C|D|E|=>|1|2|3|4|
| | | | |  |6|3|8|5|
| | | | |  |G|D|I|F|
and we get cipher text GDIF using key FB. If resulting index is more than 25 then we do mod 26
Decryption is similar, but in reverse.
### Example
It is quite similar to proceses that are described in sections above.

# One Time Pad Cipher (OTP)
### Resources
week6_OneTimePad.pptx
### Explanation
It is an encryption method that is hard to crack. It uses preshared key. The key is as long as message text itself. XOR is used in encryption and decryption. Firstly, what is XOR. It is a biwise function that is involtion, which means that its reverse function is the function itself. Table for XOR:
|A|B|A XOR B|
|-|-|-      |
|0|0|0|
|0|1|1|
|1|0|1|
|1|1|0|
To encrypt the message, message is converted to its bit representation(for example ab => 65-66 => 01000001-01000010), random key of the same length is chosen(16 bits => 10101010-01010101), then bit by bit message and key is XORed:
|message|01000001|01000010|
|-|-|----------------|
|key|10101010|01010101|
|cipher text|10101011|00010111|
To decrypt, just XORing cipher text with key.
It is symmetric encryption method. 

# Symmetric and Asymmetric Cryptography
### Resources
Week m7.pptx
### Explanation
#### Symmetric
text is encrypted and decrypted using the same key. DES, 3DES, AES, number of keys = n(n-1)/2
![[Pasted image 20230506181930.png]]
![[Pasted image 20230506181940.png]]
#### Asymmetric
text is encrypted with receiver's public key and decrypted with receiver's private key. RSA
![[Pasted image 20230506181950.png]]
![[Pasted image 20230506181954.png]]

# Data Encryption Standard (DES)
### Resources
week_7_DES.pptx
Week m7.pptx
https://youtu.be/3BZRBfhpIb0
https://youtu.be/FGhj3CGxl8I
[Data Encryption Standard - Wikipedia](https://en.wikipedia.org/wiki/Data_Encryption_Standard)
[Feistel cipher - Wikipedia](https://en.wikipedia.org/wiki/Feistel_cipher)
### Explanation
it is symmetric encryption algorithm. It divides message text into 64bit blocks and encrypts them with 56bit key. 
In more detail, it uses Feistel cipher with 16 rounds. Feistel cipher is a block cipher and as in picture below it consists of different keys (K0, K1... K16), some cryptographic function F and XOR function. Firstly, 64bit plaintext is divided into 32-32 left and right parts: L0 and R0. Then, R0 gets into F and with the help of K0, R0 is encrypted to F(R0,K0), then it is passed to XOR where it is XORed with L0 into F(R0,K0)(+)L0. Then it is passed to the next round but with switching their places. And so on till 16 round.
![[Pasted image 20230506202432.png]]
Decryption is reverse process. Again 64bit block is divide into 32-32 blocks, and starting from key K15 it follows the same steps. SubKeys are 48bit keys that are produced from initial 56 bit key. A lot of things happen in The Feistel (F) function: permutations that expands 32bit to 48bit, substitutions, key mixing. 


# Advanced Encrypted Standard (AES)
### Resources
Week -8-9-10.pptx
Week m7.pptx
aes.pptx
https://youtu.be/O4xNJsjtN6E
### Explanation
AES is a symmetric block cipher that came to replace DES, because it is much stronger. It encrypts block by block, and each block is 128 bits, and it is encrpyted with key of 128 bits(or 192 or 256). In AES, confusion and diffusion are implemented, confusion destroys the pattern, diffusion makes sure that changing one small thing in input totally changes output. Firstly, 128bits are arranged into table of 4x4:
![[Pasted image 20230507091129.png]]
Then, encryption will follow these steps:
![[Pasted image 20230507091929.png]]
Usually there are 10 rounds(if key 128 - 10 rounds, 192-12, 256 - 14). At each round subkey is added, except last one, cause it does not make sense. We get subkeys from key that is somehow expanded through the key schedule function. 
Substitution bytes is replacing bytes in block according to some lookup table. Shifting rows is just moving each row by 0, 1, 2 and 3 cells to left:
![[Pasted image 20230507094411.png]]
Mixing columns is taking a cloumn, multiplying it bu some matrix, and getting new mixed column:
![[Pasted image 20230507095019.png]]
Then, in new round it is XORed with new subkey and process repeated.
To decrypt, repeating all staages just in reverse with reverse subfunctions in each round. 

# Deffie-Helman Key Exchange
### Resources
Week -8-9-10.pptx
Week m7.pptx
https://youtu.be/NmM9HA2MQGI
[Diffie–Hellman key exchange - Wikipedia](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange)
### Explanation
DH key exchange is a method of generating a cryptographic key for two sides in insecure public channel. Modular arithmetic is used, firstly there is `n` and `g` in publick and both parties start with two private numbers `a` and `b` that are between `1` and `n`. Then `a` and `g` are mathematically mixed into `ag`, at the same time `b` and `g` into `bg`. Finally, `ag` and `bg` are sent to each other through public channel, and both sides then mix their private numbers with these and get `abg`. Note: it is mathemcatically almost impossible to get `a` or `b` from public `ag` and `bg`. 
These numbers are too big, 1024bit long numbers and more.
Also, DH is cracable with MITM attack. To prevent it, use authentication, use some hash.
### Example
In more detail and with more mathematics: 
![[Pasted image 20230507102858.png]]

# RSA (Rivest-Shamir-Adleman) Cryptosystem
### Resources
Week -8-9-10.pptx
Week m7.pptx
https://youtu.be/-ShwJqAalOk
[RSA (cryptosystem) - Wikipedia](https://en.wikipedia.org/wiki/RSA_(cryptosystem))
### Explanation
RSA is key generating algorithm that is used for secure data transmission. It generates a public key for encryption and private key for decryption. So, it is asymmetric algorithm. 
In more detail, initially, generate very large prime numbers `p` and `q`, then calculate `n = p * q`, then `Ф(n) = (p - 1)(q - 1)`, then public key parametr `e` such that `gcd(e, Ф(n)) = 1`, usually `e = 2^16 + 1 = 64537`, then we calculate `d = e^-1 mod Ф(n)`. As a result, we get public key `(e, n)` and private key `(d, n)`. 
After these calculations, how to use it?
To encrypt, we divide plaintext into blocks that are less than `n`, also convert plaintext to numbers with ascii table. Then, block of plaintext, let's say `M` is converted to block of cipher text, `C`. Convertion is like that: `C = M^e mod n` using public key `(e, n)`. To decrypt, `M = C^d mod n` using private key `(d, n)`.  
It is hard to crack it, as an attacker needs to guess factors of `n` and find `p` and `q`.  
### Example
reference to Asymmetric.

# Digital Signature Algorithm
### Resources
Digital Signatures.pptx
https://youtu.be/s22eJ1eVLTU
https://youtu.be/JR4_RBb8A9Q
### Explanation
Digital signature is used to prove that sender of data is an actual sender of data, in one word, for authenticity. It also provides integrity and non-repudation. Digital signature is hash of document that is encrypted with sender's private key. 
This process in more detail, message `M` is goes hash function that outputs `h`, then `M` and `h` are encrypted together with sender's private key. After this, receiver decrypts it with public key and gets `M` and `h`. Finally, `M` again passes hash function, and result is compared with sent `h`. If they match, then integrity is verified. 
![[Pasted image 20230507141202.png]]
