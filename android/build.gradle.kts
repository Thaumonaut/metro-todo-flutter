import com.android.build.gradle.LibraryExtension

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Ensure library modules without an explicit namespace receive a default
// This addresses AGP errors for packages (like some pub-cache plugins)
// that don't declare `namespace` in their module build file.
subprojects {
    plugins.withId("com.android.library") {
        (extensions.findByName("android") as? LibraryExtension)?.let { androidExt ->
            if (androidExt.namespace.isNullOrBlank()) {
                // Provide a sane default; this won't affect published artifacts
                // but allows the project to build locally.
                androidExt.namespace = "dev.isar.fallback"
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
