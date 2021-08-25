  /* File for Lexing Futhark Header files */
%%
  /* Skip comments */
\/\/.*\n ;

  /* Skip new lines */

^\n ;

  /* Skip includes */

#include.*\n ;

  /* Skip pragmas */

#pragma.*\n ;

  /* Skip define */

 #define.*\n ;

  /* Skip ifdefs */

 #ifdef[^#]*#endif ;

  /* Delete new line characters that don't seperate function definitions */

 

 [^;]\n  { putchar(yytext[0]); } ;

  /* Make all white space single space */

 [ \t]+ { printf(" "); }


 ^[^(int futhark\_entry)].* ;

%%
//
 //^[^(int futhark\_entry)].*;
// int futhark_entry_(*);        {
//
//}

//char* class_start = "class FutharkContext\n";
//                       "{\n";
//                       "  struct futhark_context_config *config;\n";
//                       "  struct futhark_context *context;\n";
//                       "\n";
//                       "  public:\n";
//                       "\n";
//                       "    // constructor\n";
//                       "    FutharkContext() {\n";
//                       "      config = futhark_context_config_new();\n";
//                       "      context = futhark_context_new(config);\n";
//                       "    }\n";
//
//char* class_end = "};\n";
//
//int yywrap(void) {
//return 1;
//}

int main(int argc, char *argv[]) {
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);
}
