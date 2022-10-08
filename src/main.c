#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "cyaml/cyaml.h"

#include <argp.h>
#include <sqlite3.h>

#include "config.h"
#include "version.h"

#ifdef POSTGRESQL_SUPPORT
#include <libpq-fe.h>
#endif

const char *argp_program_version = PROJECT_VERSION;
const char *argp_program_bug_address = "<lucaszunho.pf005@academico.ifsul.edu.br>";

static char doc[] = "Privit ImageDB -- multi-purpose arqfiles manager";
static char args_doc[] = "ARG1 ARG2";

static struct argp_option options[] = {
    {
        "config", 'c', "FILE", OPTION_ARG_OPTIONAL, 
        "Define a non-default config file for privit server"
    },
    { 0 }
};

struct arguments {
    char *args[2];
    char *config_file;
};

/* Single option ARGP parser */
static error_t parse_opt(int key, char *arg, struct argp_state *state) {
    struct arguments *arguments = state->input;

    switch (key) {
        case 'c':
            arguments->config_file = arg;
            break;
        case ARGP_KEY_ARG: // "too many arguments" error
            if (state->arg_num >= 2) {
                argp_usage(state);
            }
            arguments->args[state->arg_num] = arg;
            break;
        case ARGP_KEY_END: // "not enough arguments" error
            if (state->arg_num < 2) {
                argp_usage(state);
            }
            break;
        default:
            return ARGP_ERR_UNKNOWN;
    }
    return 0;
}

// Arguments parser
static struct argp argp = { options, parse_opt, args_doc, doc };

int main(int argc, char **argv) {
    struct arguments arguments;
    cyaml_err_t yaml_err;

    // Argument parse
    arguments.config_file = "-";
    argp_parse(&argp, argc, argv, 0, 0, &arguments);

    // Config file parse
    if (!strcmp(arguments.config_file, "-")) {
        /* LOAD YAML CONFIG FILE */
    }
    return 0;
}
