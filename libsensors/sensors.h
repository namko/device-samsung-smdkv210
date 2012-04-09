/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ANDROID_SENSORS_H
#define ANDROID_SENSORS_H

#include <stdint.h>
#include <errno.h>
#include <sys/cdefs.h>
#include <sys/types.h>

#include <linux/input.h>

#include <hardware/hardware.h>
#include <hardware/sensors.h>

__BEGIN_DECLS

/*****************************************************************************/

#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))

#define ID_A  (0)
#define ID_G  (1)

/*****************************************************************************/

/*
 * The SENSORS Module
 */

/*****************************************************************************/

#define EVENT_TYPE_ACCEL_X          ABS_X
#define EVENT_TYPE_ACCEL_Y          ABS_Y
#define EVENT_TYPE_ACCEL_Z          ABS_Z

#define EVENT_TYPE_GRAVITY_X        ABS_X
#define EVENT_TYPE_GRAVITY_Y        ABS_Y
#define EVENT_TYPE_GRAVITY_Z        ABS_Z

// conversion of acceleration data to SI units (m/s^2)
// 2 * 10.5 isn't correct; however this is what is defined in the driver!
#define RANGE_A                     (21)
#define CONVERT_A                   (GRAVITY_EARTH / RANGE_A)
#define CONVERT_A_X                 (CONVERT_A)
#define CONVERT_A_Y                 (CONVERT_A)
#define CONVERT_A_Z                 (CONVERT_A)

#define RANGE_G                     (21)
#define CONVERT_G                   (GRAVITY_EARTH / RANGE_G)
#define CONVERT_G_X                 (CONVERT_G)
#define CONVERT_G_Y                 (CONVERT_G)
#define CONVERT_G_Z                 (CONVERT_G)

/*****************************************************************************/

__END_DECLS

#endif  // ANDROID_SENSORS_H
