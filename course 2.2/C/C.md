Some notes.

Swirch expression
```c
int someValue;
scanf("%i",&someValue);
switch (someValue) {
	case value1:
	printf("1");
	break;
	case value2:
	printf("2");
	break;
	default:
	printf("idk");
	break;
}
```

Some operations with chars and strings
```c
char ch;
scanf("%c", &ch);
toupper(ch); // from <ctype.h>
tolower(ch); // from <ctype.h>

char s1[6] = "Hello";
char s2[6] = { 'H','e','l','l','o','\0' };

char s[100];
scanf("%s", &str); // it would read only first string till whitespace
gets(s); // this gets everyting
puts(s); // prints it

strlen(s); // from <string.h>

char res[100];
strcpy(res, s); // copies s into res
int res = strcmp(s1, s2); // compare strings
int res = strncmp(s1, s2, 3); // compares till third element
strcat(s1, s2); // overwrites s2 with s1
```

Some functions
```c
void swap(int x , int y) { // calling by reference
	int temp;
	temp = *x ;// save the value of x
	*x = *y ; // put y into x
	*y = temp ;// put temp into y
	return;
}
```

# Pointers
```c
sizeof(data_type);
sizeof(variable); // in bytes

int *p; // address
int q; // integer
```

To understand pointers
```c
#include <stdio.h>

int main() {
    int *p;
    int q=2;
    p=&q; // p has q's address

    printf("\n address of q: %p",p);
    printf("\n value of q: %i",*p);
    printf("\n address of p: %p",&p);

    int **w;
    w = &p; // w has p's address

    printf("\n address of p: %p",w);
    printf("\n value of p: %p",*w);
    printf("\n address of w: %p",&w);

    printf("\n value of q: %i",q);
    printf("\n address of q: %p",&q);

    return 0;
}
/* Output:
 address of q: 0x7ffffcbd4
 value of q: 2
 address of p: 0x7ffffcbd8
 address of p: 0x7ffffcbd8
 value of p: 0x7ffffcbd4
 address of w: 0x7ffffcbc8
 value of q: 2
 address of q: 0x7ffffcbd4
*/
```
![[Pasted image 20230509095610.png]]
```c
int m[10];
// m = &m[0]
// m + i = &m[i]
// m[0] = *m
// m[i] = *(m + i)

```

# Structures
```c
struct structure_name {
field_type field_name; /* comment */
field_type field_name; /* comment */
. . . .
} variable_name = {
	"value1",
	2,
	3.3,
. . . .
};

// or
struct structure_name {
field_type field_name; /* comment */
field_type field_name; /* comment */
. . . .
};
struct structure_name variable_name = {
	"value1",
	2,
	3.3,
. . . .
};

```

typedef
```c
typedef type_declaration;

typedef int group [10];
group totals; // then use it as array of 10


struct complex_struct{
	double real;
	double imag;
};
typedef struct complex_struct complex;
complex voltag1 = { 3.5 , 1.2};
```

# Memory Allocation

```c
ptr = (float*) malloc(100 * sizeof(float)); // alllocates but do not intiliaze
// do smth with this memory
free(ptr); // free

ptr = (float*) calloc (25, sizeof(float)); // allocates and gives 0 to every bit
free(ptr);
```

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    
    int *a = calloc(20,sizeof(int));
    int *b = a;
    for (int i = 0; i < 20; i++)
    {
        *b = i; b++;
        printf("%i ", *(a+i));
    }
    free(a);
    return 0;
}
```
# Files
```c
FILE* inputfile;
inputfile = fopen("hello.txt", "r"); // can be "w" or "a"

char c = getc(stdin);
putc(c, stdout);
fprintf (stderr, "\nCan't open data for reading.\n");

fprintf(outputfile,"%s ",words[i]);
fgets (text, MAX_LENGTH, inputfile);

ret = rename(oldname, newname);

fp = fopen(filename, "w"); 
fclose(fp);
ret = remove(filename); // returns 0 or 1


char str[60];
fgets(str, 60, fp)
fputs("Some text", fp);

while ( (c = getc (in)) != EOF ) putc (c, fp);


c = fgetc(fp); 
if( feof(fp) ) break;
printf("%c", c);

```

```c
#include <stdio.h>
#include <stdlib.h>
#define N 100

int main() {
    FILE* inputfile;
    inputfile = fopen("t.txt", "r");
    char text[N];
    for (int i = 0; text[i] != EOF; i++){
        text[i] = fgetc(inputfile);
    }    
    fclose(inputfile);
    FILE* outputfile;
    outputfile = fopen("t2.txt", "w");
    for (int i = 0; text[i] != EOF; i++){
        fputc(text[i], outputfile);
    }
    fclose(outputfile);
    return 0;
}

int main() {
    FILE* inputfile;
    inputfile = fopen("t.txt", "r");
    FILE* outputfile;
    outputfile = fopen("t2.txt", "w");
    char text[N];
    while (fgets(text, 50, inputfile) != NULL) {
        fprintf(outputfile,"%s", text);
    }
    fclose(inputfile);
    fclose(outputfile);
    return 0;
}

/* 123.txt
qwe 123 ewq
asd 456 dsa
zxc 789 cxz
*/

int main() {
    FILE* f = fopen("123.txt", "r");
    FILE* f2 = fopen("qwe.txt", "w");
    int b;
    char a[100], c[100];

    while(!feof(f)){
        fscanf(f,"%s %i %s",&a,&b,&c);
        printf("%s %i %s\n",a,b,c);
        fprintf(f2, "%s %i %s\n",a,b,c);
    }

    return 0;
}


/* 123.txt
1
2
5
3
2
*/

int main() {
    FILE* f = fopen("123.txt", "r");
    FILE* f2 = fopen("qwe.txt", "w");
    int b[100], r = 0;

    while(!feof(f)){
        fscanf(f,"%i",b+r);r++;
    }
    
    for (int i = 0; i < r; i++){
        for (int j = i; j < r; j++){
            if(b[i]<b[j]){
                int tmp = b[i];
                b[i] = b[j];
                b[j] = tmp;
            }
        }
    }
    
    while (r--){
        fprintf(f2,"%i\n",*(b+r));
    }
    
    return 0;
}
```



srand
```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main () {
   int i, n;
   time_t t;
   
   n = 5;
   
   /* Intializes random number generator */
   srand((unsigned) time(&t));

   /* Print 5 random numbers from 0 to 50 */
   for( i = 0 ; i < n ; i++ ) {
      printf("%d\n", rand() % 50);
   }

   return(0);
}
```


