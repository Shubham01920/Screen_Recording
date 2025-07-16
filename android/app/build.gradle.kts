plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.screen_recording"
    compileSdk = 34  // Updated to support latest features
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.screen_recording"
        minSdk = 23  // Good minimum for screen recording
        targetSdk = 34  // Updated to latest
        versionCode = 1
        versionName = "1.0"
        
        // Enable multiDex for large apps
        multiDexEnabled = true
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
            minifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        debug {
            debuggable = true
        }
    }

    // Add packaging options to handle potential conflicts
    packagingOptions {
        pickFirst("**/libc++_shared.so")
        pickFirst("**/libjsc.so")
    }

    // Add lint options
    lintOptions {
        disable("InvalidPackage")
        checkReleaseBuilds = false
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Add any additional dependencies if needed
    implementation("androidx.multidex:multidex:2.0.1")
}