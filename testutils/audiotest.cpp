/*
 *  Utility program to try some ALSA functions.
 *  @author namko
 *  @date   2012-02-01
 */

/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or 
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include <string.h>

extern "C" {
#include <tinyalsa/asoundlib.h>
}

int list(int argc, char **argv) {
    int nMixer = -1;

    if (argc == 3)
        nMixer = atoi(argv[2]);

    if (argc != 3 || nMixer < 0 || nMixer > 7) {
        printf("Usage: audiotest list <card number>\n"
               "where <card number> is between 0 and 7\n");
        return 0;
    }

    mixer *m = mixer_open(nMixer);

    if (m == NULL) {
        printf("Unable to open card #%d\n", nMixer);
        return 0;
    }

    int count = mixer_get_num_ctls(m);
    printf("Found %d controls:\n", count);

    for (int i = 0; i < count; i++) {
        mixer_ctl *ctl = mixer_get_ctl(m, i);
        printf("%d: %s (0x%x)\n", i, mixer_ctl_get_name(ctl), mixer_ctl_get_type(ctl));
    }

    return 0;
}

int read(int argc, char **argv) {
    int nMixer = -1, nControl = -1;
    int location = -1;

    if (argc == 5) {
        nMixer = atoi(argv[2]);
        nControl = atoi(argv[3]);
        location = atoi(argv[4]);
    }

    if (argc != 5 || nMixer < 0 || nMixer > 7 || nControl < 0 || location < 0) {
        printf("Usage: audiotest read <card number> <control number> <location>\n"
               "where <card number> is between 0 and 7\n"
               "<control number> is the control to be read\n"
               "<location> is the location to be read\n");
        return 0;
    }

    mixer *m = mixer_open(nMixer);

    if (m == NULL) {
        printf("Unable to open card #%d\n", nMixer);
        return 0;
    }

    mixer_ctl *c = mixer_get_ctl(m, nControl);

    if (c == NULL) {
        printf("Unable to open control #%d\n", nControl);
        return 0;        
    }

    printf("Control: %s\nValue: %d\nPercent: %d\n", mixer_ctl_get_name(c), 
        mixer_ctl_get_value(c, location),  mixer_ctl_get_percent(c, location));

    return 0;
}

int read_range(int argc, char **argv) {
    int nMixer = -1, nControl = -1;
    int location = -1;

    if (argc == 4) {
        nMixer = atoi(argv[2]);
        nControl = atoi(argv[3]);
    }

    if (argc != 4 || nMixer < 0 || nMixer > 7 || nControl < 0) {
        printf("Usage: audiotest read-range <card number> <control number> <location>\n"
               "where <card number> is between 0 and 7\n"
               "<control number> is the control to be read\n");
        return 0;
    }

    mixer *m = mixer_open(nMixer);

    if (m == NULL) {
        printf("Unable to open card #%d\n", nMixer);
        return 0;
    }

    mixer_ctl *c = mixer_get_ctl(m, nControl);

    if (c == NULL) {
        printf("Unable to open control #%d\n", nControl);
        return 0;        
    }

    printf("Control: %s\nMin: %d\nMax: %d\n", mixer_ctl_get_name(c), 
        mixer_ctl_get_range_min(c),  mixer_ctl_get_range_max(c));

    return 0;
}

int write(int argc, char **argv) {
    int nMixer = -1, nControl = -1;
    int location = -1, value = -1;

    if (argc == 6) {
        nMixer = atoi(argv[2]);
        nControl = atoi(argv[3]);
        location = atoi(argv[4]);
        value = atoi(argv[5]);
    }

    if (argc != 6 || nMixer < 0 || nMixer > 7 || nControl < 0 || location < 0) {
        printf("Usage: audiotest write <card number> <control number> <location> <value>\n"
               "where <card number> is between 0 and 7\n"
               "<control number> is the control to be written\n"
               "<location> is the location to be written\n"
               "<value> is the value to be written\n");
        return 0;
    }

    mixer *m = mixer_open(nMixer);

    if (m == NULL) {
        printf("Unable to open card #%d\n", nMixer);
        return 0;
    }

    mixer_ctl *c = mixer_get_ctl(m, nControl);

    if (c == NULL) {
        printf("Unable to open control #%d\n", nControl);
        return 0;        
    }

    mixer_ctl_set_value(c, location, value);
    printf("Control: %s\nValue: %d\nPercent: %d\n", mixer_ctl_get_name(c), 
        mixer_ctl_get_value(c, location),  mixer_ctl_get_percent(c, location));

    return 0;
}

int write_percentage(int argc, char **argv) {
    int nMixer = -1, nControl = -1;
    int location = -1, value = -1;

    if (argc == 6) {
        nMixer = atoi(argv[2]);
        nControl = atoi(argv[3]);
        location = atoi(argv[4]);
        value = atoi(argv[5]);
    }

    if (argc != 6 || nMixer < 0 || nMixer > 7 || nControl < 0 || location < 0) {
        printf("Usage: audiotest write-percentage <card number> <control number> <location> <value>\n"
               "where <card number> is between 0 and 7\n"
               "<control number> is the control to be written\n"
               "<location> is the location to be written\n"
               "<value> is the value to be written\n");
        return 0;
    }

    mixer *m = mixer_open(nMixer);

    if (m == NULL) {
        printf("Unable to open card #%d\n", nMixer);
        return 0;
    }

    mixer_ctl *c = mixer_get_ctl(m, nControl);

    if (c == NULL) {
        printf("Unable to open control #%d\n", nControl);
        return 0;        
    }

    mixer_ctl_set_percent(c, location, value);
    printf("Control: %s\nPercent: %d\nValue: %d\n", mixer_ctl_get_name(c), 
        mixer_ctl_get_percent(c, location), mixer_ctl_get_value(c, location));

    return 0;
}

int play(int argc, char **argv) {
    int nMixer = -1, nDevice = -1;

    pcm_config cfg = {
        channels : 0,
        rate : 0,
        period_size : 1024,
        period_count : 4,
        format : PCM_FORMAT_S16_LE,
        start_threshold : 0,
        stop_threshold : 0,
        silence_threshold : 0,
    };

    if (argc == 6) {
        nMixer = atoi(argv[2]);
        nDevice = atoi(argv[3]);
        cfg.rate = atoi(argv[4]);
        cfg.channels = atoi(argv[5]);
    }

    if (argc != 6 || nMixer < 0 || nMixer > 7 || nDevice < 0 || 
            cfg.rate <= 0 || cfg.channels <= 0 || cfg.channels > 2) {
        printf("Usage: audiotest play <card number> <device number> <rate> <channels>\n"
               "where <card number> is between 0 and 7\n"
               "<device number> is the device to play on\n"
               "<rate> is the sampling rate\n"
               "<channels> is either 1 or 2\n"
               "NOTE The file to be played is read from stdin\n");
        return 0;
    }

    pcm *p = pcm_open(nMixer, nDevice, PCM_OUT, &cfg);

    if (!pcm_is_ready(p)) {
        printf("Device not ready. Probably due to invalid parameters.");
        pcm_close(p);
        return -1;
    }

    unsigned bufsize = pcm_get_buffer_size(p);
    char *data = new char[bufsize];

    if (!data) {
        printf("Could not allocate %d bytes.\n", bufsize);
        return -1;
    }

    while (read(0, data, bufsize) == bufsize) {
        printf(".");
        if (pcm_write(p, data, bufsize))
            break;
    }

    printf("\b.\nFinished.\n");
    delete [] data;
    pcm_close(p);
    return 0;
}

int main(int argc, char **argv) {
    if (argc >= 2) {
        if (!strcmp(argv[1], "list"))
            return list(argc, argv);
        else if (!strcmp(argv[1], "read"))
            return read(argc, argv);
        else if (!strcmp(argv[1], "read-range"))
            return read_range(argc, argv);
        else if (!strcmp(argv[1], "write"))
            return write(argc, argv);
        else if (!strcmp(argv[1], "write-percentage"))
            return write_percentage(argc, argv);
        else if (!strcmp(argv[1], "play"))
            return play(argc, argv);
    }

    printf("Usage: audiotest <command>\nwhere <command> is one of:\n"
           "list, read, read-range, write, write-percentage, play\n");
    return 0;
}

