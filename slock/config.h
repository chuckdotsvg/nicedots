/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody"; // use "nobody" for arch

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#005577",   /* during input */
	[FAILED] = "#CC3333",   /* wrong password */
	[CAPS] =   "fabd2f",       /* CapsLock on */
};



/* insert grid pattern with scale 1:1, the size can be changed with logosize */
static const int logosize = 75;
static const int logow = 12;   /* grid width and height for right center alignment*/
static const int logoh = 6;

static XRectangle rectangles[] = {
   /* x    y   w   h */
   { 0,    3,  1,  3 },
   { 1,    3,  2,  1 },
   { 0,    5,  8,  1 },
   { 3,    0,  1,  5 },
   { 5,    3,  1,  2 },
   { 7,    3,  1,  2 },
   { 8,    3,  4,  1 },
   { 9,    4,  1,  2 },
   { 11,   4,  1,  2 },
};



/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;

/* length of time (seconds) until */
static const int timeoffset = 120;

/* should [command] be run only once? */
static const int runonce = 1;

/* command to be run after [time] has passed */
static const char *command = "test $(cat /sys/class/power_supply/AC/online) -eq 0 && systemctl suspend -i";

/* Enable blur */
#define BLUR
/* Set blur radius */
static const int blurRadius = 15;
/* Enable Pixelation */
//#define PIXELATION
/* Set pixelation radius */
static const int pixelSize = 20;


/* time in seconds before the monitor shuts down */
static const int monitortime = 60;



