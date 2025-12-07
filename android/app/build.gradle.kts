plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.todo_project"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    // Workaround for isar_flutter_libs old manifest issue
    lint {
        checkReleaseBuilds = false
        disable.add("MissingTranslation")
    }

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.todo_project"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    // Workaround for isar_flutter_libs manifest issue with newer Gradle
    packaging {
        resources.pickFirsts.add("META-INF/proguard/androidx-*.pro")
    }

    buildFeatures {
        aidl = false
        renderScript = false
        resValues = false
        shaders = false
    }


}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
}

androidComponents {
    onVariants(selector().all()) { variant ->
        variant.packaging.resources.excludes.add("META-INF/AL2.0")
        variant.packaging.resources.excludes.add("META-INF/LGPL2.1")
    }
}
