#include <stdio.h>
#include <regex.h>
#include <sys/types.h>
#include <string.h>
//gcc ./translate.c -o translate | ./translate 

static char* substr(const char*str, unsigned start, unsigned end)
{
  unsigned n = end - start;
  static char stbuf[256];
  strncpy(stbuf, str + start, n);
  stbuf[n] = 0;
  return stbuf;
}

int main(int argc, char const *argv[])
{
    printf("%s", "start\n");

    // FILE *fp;
    // char name[] = "dict.txt";

    //regular
    //const char *pattern = "(\\w+) - (\\w+)";
    const char *pattern = "([А-я]+) - ([A-z]+)";
    regex_t reg;
    int cflags = REG_EXTENDED;
    int rez = regcomp (&reg, pattern, cflags);
    printf("%d\n", rez);

    char * string = "ПрограммныйИнтерфейс - Public";
    size_t nmatch = 1;
    regmatch_t matchptr [2];
    int status;
    
    status = regexec (&reg, string, nmatch, matchptr, 0);
    printf("status=%d\n", status);

    printf("%d\n", matchptr[1].rm_eo);
    printf("%d\n", matchptr[1].rm_so);

    const char lbuf[256];

    char *s = substr(lbuf, matchptr[1].rm_so, matchptr[1].rm_eo);
    printf("%s", s);
    //  for (int x = 0; x < nmatch && matchptr[x].rm_so != -1; ++ x)
    // {
    //   if (!x) printf("%04d: %s\n", lno, matchptr);
    //   printf(" $%d='%s'\n", x, substr(matchptr, matchptr[x].rm_so, matchptr[x].rm_eo));
    // }

    char ebuf[128], lbuf[256];
    if (status!=0) {
        regerror(status, &reg, ebuf, sizeof(ebuf));
        fprintf(stderr, "%s: pattern '%s' \n", ebuf, pattern);
        return 1;
    }

    if (status=_REG_NOMATCH) {
        printf("_REG_NOMATCH\n");
    }
    if (status=_REG_NOERROR) {
        printf("_REG_NOERROR\n");
    }

    regfree(&reg);
    // if ((fp = fopen(name, "r")) == NULL)
    //     {
    //     printf("Не удалось открыть файл\n");
    //     return 0;
    // }
    
    //char line[256];
    // while((fgets(line, 256, fp))!=NULL)
    // {
    //     //printf("%s", line);

    //     //int regcomp (regex_t *compiled, const char *pattern, int cflags)
    // }    
    
    // fclose(fp);

    return 0;
}
