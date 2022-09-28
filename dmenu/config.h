/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom */
static int opacity = 1;                     /* -o  option; if 0, then alpha is disabled */
static int fuzzy = 1;                       /* -F  option; if 0, dmenu doesn't use fuzzy matching */
static int center = 0;                      /* -c  option; if 0, dmenu won't be centered on the screen */
static int min_width = 500;                 /* minimum width when centered */
static const int vertpad = 10;              /* vertical padding of bar */
static const int sidepad = 10;              /* horizontal padding of bar */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] =
{
  "JetBrains Mono:size=11",
  "JoyPixels:size=11",
	"monospace:size=11"
};
static const char *prompt      = "🔍 Search:";      /* -p  option; prompt to the left of input field */

static const unsigned int baralpha = 0xff;
static const unsigned int borderalpha = OPAQUE;
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
	[SchemeBorder] = { OPAQUE, OPAQUE, OPAQUE },
	[SchemeSelHighlight] = { OPAQUE, baralpha, borderalpha },
	[SchemeNormHighlight] = { OPAQUE, baralpha, borderalpha },
};

static
const
char *colors[][2] = {
	/*               fg         bg       */
	[SchemeNorm] = { "#ebdbb2", "#282828" },
	[SchemeSel]  = { "#ebdbb2", "#98971a" },
	[SchemeOut]  = { "#ebdbb2", "#8ec07c" },
	[SchemeBorder] = { "#ebdbb2", "#98971a" },
	[SchemeSelHighlight]  = { "#cb000c", "#98971a" },
	[SchemeNormHighlight] = { "#cb000c", "#282828" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 1;

/*
 * Use prefix matching by default; can be inverted with the -x flag.
 */
static int use_prefix = 1;
