%token FNAME
%token ARGTYPE
%token ARGNAME

%%

functions:
      functions function '\n'    { printf("%d\n", $2) }
      |
      ;

function: FNAME ' ' arg_list      { printf("%s ", $1); }
        ;

arg_list: ARGTYPE ' ' ARGNAME ');'  { printf(" %s %s", $1, $3); }
          | ARGTYPE ' ' ARGNAME ',' arg_list  { printf(" %s %s", $1, $3); }
          ;

%%

int yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
  return 0;
}

int main(void) {
  yyparse();
  return 0;
}
