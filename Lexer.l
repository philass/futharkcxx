  /* File for Lexing Futhark Header files */
%{
  #ifndef YYSTYPE
  #define YYSTYPE char*
  #endif
  #include "y.tab.h"

  intnums (8|(16)|(32)(64))
  intprefix u?int_t

%}

%%
  /* Skip comments */
\/\/.*\n ;

  /* Skip empty lines */

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


 const       { return CONST }
 struct      { return STRUCT }
 \*          { return PTR }

 double       { 
                yylval = strdup(yytext);
                return ARGTYPE
             }


 char       { 
                yylval = strdup(yytext);
                return ARGTYPE
            } 

 void       { 
                yylval = strdup(yytext);
                return ARGTYPE
            } 

 float       { 
                yylval = strdup(yytext);
                return ARGTYPE
             }

 {intprefix}{intnums} { 
                        yylval = strdup(yytext);
                        return ARGTYPE
                      }

 [a-zA-Z][a-zA-Z0-9_]*[,)] {
                        yylval = strndup(yytext, yyleng - 1);
                        return ARGNAME
                        }
  
 [a-zA-Z][a-zA-Z0-9_]*[,)] {
                        yylval = strndup(yytext, yyleng - 1);
                        return ARGTYPE
                        }



  

%%
// (int[ ]) {
//            yylval 
//          }
//
//
// [^;]\n  { putchar(yytext[0]); } ;
//
//  /* Make all white space single space */
//
// [ \t]+ { printf(" "); }
//
 //^[^(int futhark\_entry)].*;
// int futhark_entry_(*);        {
//
//}
// ^[^(int futhark\_entry)].* ;

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
