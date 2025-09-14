int main()
{
FILE *excel;
excel=fopen("GlobalTemperatures.csv", "r");
if(excel==NULL)
{
	return 1;
}
fgets(line,sizeof(line),excel);

while(fgets(line,sizeof(line),excel)!=NULL)
{
// Tokenize the array and ignore the commas (deliminter)
token=strtok(line,ignore);
int i=0;

//If there is something inside the token function and i is less than all the rows
while(token!=NULL && i<ROW)
{
	//Whatever is in the cell at that row is now a token
	cells[i++]=token;
	//Takes the string length to whatever size in the cell and ignores the comma
	token=strtok(NULL,ignore);
}
        
//In the row that is cycling (2d ARRAY) assign it to a charcter array at a certain cell
firstsection[row]=cells[0];
store[row][LAVGT]=atof(cells[1]); // Makes the charcter into a integer using the atof function
store[row][LAVGTU]=atof(cells[2]);
store[row][LMAXT]=atof(cells[3]);
store[row][LMAXTU]=atof(cells[4]);
store[row][LMINT]=atof(cells[5]);
store[row][LMINTU]=atof(cells[6]);
store[row][LAOAT]=atof(cells[7]);
store[row][LAOATU]=atof(cells[8]);




// Ignore the dashes in the string (year-month-day);
tokeny=strtok(firstsection[row],"-");
// Keep going where you left off from reading
tokenm=strtok(NULL,"-");
//If there is something in the token
if(tokeny!=NULL)
{
	//Take out only the years and make that into an integer
	yearsextract[rowcounter]=atoi(tokeny);
	monthextract[rowcounter]=atoi(tokenm);
}

// increase the counters to go on to the next row of the cell
 rowcounter++;
 row++;
}
FILE *Newtxt; // Making a file pointer for the txt that the csv will be converted to.
FILE *Oldcsv; // Making a new csv file pointer, specifically for this conversion to txt.

// First, check if the csv can be opened and read.
Oldcsv = fopen("GlobalTemperatures.csv", "r");
if (Oldcsv == NULL) {
	printf("Error: Unable to open the CSV file.\n");
	return 1;
	}

// See if the new txt file can be opened, and open it for writing.
Newtxt = fopen("GlobalTemperatures.txt", "w");
if (Newtxt == NULL) {
  printf("Error: Unable to create/open the text file.\n");
  fclose(Oldcsv);
  return 1;
}

// Read through each line of the csv file and write it into the txt file
while (fgets(line, MAX_LINE_LENGTH, Oldcsv) != NULL) {
/* Replace each comma in the csv with a space to make it suitable for reading in GNUplot
 Also suitable for reading in general code */
  for (int i = 0; line[i] != '\0'; i++) {
      if (line[i] == ',')
          line[i] = ' ';
	  }
// Write all of this into the new txt file, which will be used for GNUplot and C code.
fputs(line, Newtxt);
    }

// Close out of the csv and txt file after this process is done.
fclose(Oldcsv);
fclose(Newtxt);
fclose(excel);
