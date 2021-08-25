%token NAME
%token ARGTYPE
%token NAME
%token PTR
%token CONST
%token STRUCT
%token STRUCTTYPE

%%

functions:
      functions function '\n'    { printf("%d\n", $2) }
      |
      ;

function: type NAME '(' arg_list      { printf("%s ", $1); }
        ;

arg_list: ARGTYPE ARGNAME ')'  { printf(" %s %s", $1, $3); }
        | ARGTYPE ' ' ARGNAME ',' arg_list  { printf(" %s %s", $1, $3); }
        ;

type: STRUCT NAME PTR 
          | CONST ARGTYPE PTR
          | CONST ARGTYPE
          | ARGTYPE PTR
          | ARGTYPE
          | VOID
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
