#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define COL 9
#define ROW 3193
#define SIZER 3193
#define dates 0
#define LAVGT 1
#define LAVGTU 2
#define LMAXT 3
#define LMAXTU 4
#define LMINT 5
#define LMINTU 6
#define LAOAT 7
#define LAOATU 8
#define MAX_LINE_LENGTH 500

// STORING VARIABLES 
char line[SIZER];
char*token;
char*cells[ROW];
char* firstsection[ROW];
double store[ROW][COL];
const char ignore[2]=",";
int yearsextract[ROW];
int monthextract[ROW];
int rowcounter=0;
int row=0;
char *tokeny;
char *tokenm;
char* monthNames[] = {"January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"};
FILE* avgMinMax;

