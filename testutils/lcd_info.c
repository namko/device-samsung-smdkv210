#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <linux/ioctl.h>
#include <linux/fb.h>

#define FB_NAME             "/dev/graphics/fb0"

int main(const int argc, const char *argv[]) {
    int fbFD;
    struct fb_fix_screeninfo fix;
    struct fb_var_screeninfo var;

    // Open the framebuffer device in read-only mode.
    if ((fbFD = open(FB_NAME, O_RDONLY)) < 0) {
	    printf("Unable to open %s.\n", FB_NAME);
	    return 1;
    }

    // Perform ioctl to get fixed screen info.
    if (ioctl(fbFD, FBIOGET_FSCREENINFO, &fix) < 0) {
	    printf("FBIOGET_FSCREENINFO failed: %s\n", strerror(errno));
	    close(fbFD);
	    return 1;
    }

    // Perform ioctl to get variable screen info.
    if (ioctl(fbFD, FBIOGET_VSCREENINFO, &var) < 0) {
	    printf("FBIOGET_VSCREENINFO failed: %s\n", strerror(errno));
	    close(fbFD);
	    return 1;
    }

    close(fbFD);

    printf("Variable screen info:\n\nxres: %u\nyres: %u\npixclock: %u\n\
left_margin: %u\nright_margin: %u\n\
upper_margin: %u\nlower_margin: %u\n\
hsync_len: %u\nvsync_len: %u\n\
sync: %u\nvmode: %u\n", 
        var.xres, var.yres, var.pixclock, 
        var.left_margin, var.right_margin, 
        var.upper_margin, var.lower_margin, var.hsync_len, var.vsync_len, 
        var.sync, var.vmode);

    return 0;
}
