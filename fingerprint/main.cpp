/*
 * Copyright (C) 2022 The Android Open Source Project
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

#include <memory>
#include <android/binder_manager.h>
#include <android/binder_process.h>
#include "hal.h"

int main() {
    using aidl::android::hardware::biometrics::fingerprint::Hal;

    ABinderProcess_setThreadPoolMaxThreadCount(0);

    std::shared_ptr<Hal> hal = ndk::SharedRefBase::make<Hal>();
    const std::string instance = std::string(Hal::descriptor) + "/default";

    if (AServiceManager_addService(hal->asBinder().get(), instance.c_str()) == STATUS_OK) {
        ABinderProcess_joinThreadPool();
    }

    return EXIT_FAILURE;
}
