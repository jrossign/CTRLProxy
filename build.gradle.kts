import org.gradle.internal.impldep.org.junit.experimental.categories.Categories.CategoryFilter.exclude
import org.gradle.internal.impldep.org.junit.experimental.categories.Categories.CategoryFilter.include


plugins {
    java
    jsonschema2pojo
    id("org.springframework.boot")
    id("org.jsonschema2pojo")
}

apply(plugin = "io.spring.dependency-management")
apply(plugin = "org.jsonschema2pojo")

group = "com.ipc"
version = ""
java.sourceCompatibility = JavaVersion.VERSION_19

configurations {
    compileOnly {
        extendsFrom(configurations.annotationProcessor.get())
    }
}

repositories {
    mavenCentral()
    maven {
        url = uri("https://maven.jumpmind.com/repo/")
    }
    flatDir {
        dirs("/Users/Jean-Yves/Data/Projets/CTRLProxy/libs/")
    }

}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter-data-jdbc")
    implementation("org.springframework.boot:spring-boot-starter-jdbc")
    implementation("org.springframework.boot:spring-boot-starter-jersey")
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-starter-webflux")
    implementation("org.apache.commons:commons-csv:1.11.0")
    implementation("com.google.code.gson:gson")
    implementation("org.jsonschema2pojo:jsonschema2pojo-core:1.2.1")
    implementation("com.squareup.okhttp3:okhttp:4.9.0")
    implementation("org.apache.poi:poi:5.2.5")
    implementation("org.apache.poi:poi-ooxml:5.2.5")
    implementation("com.google.guava:guava:33.2.0-jre")
    implementation("org.json:json:20240303")
    implementation("org.apache.commons:commons-lang3:3.14.0")

    compileOnly("org.projectlombok:lombok")
    compileOnly("io.github.paulushcgcj:helper-js2pojo:1.0.1")
    developmentOnly("org.springframework.boot:spring-boot-devtools")
    implementation(fileTree(mapOf("dir" to "libs", "include" to listOf("*.jar"))))
    annotationProcessor("org.springframework.boot:spring-boot-configuration-processor")
    annotationProcessor("org.projectlombok:lombok")


    testImplementation("com.h2database:h2")
    testImplementation("com.squareup.okhttp3:mockwebserver:4.12.0") {
        exclude(group = "com.squareup.okhttp3", module = "okhttp")
    }
    testImplementation("com.squareup.okhttp3:okhttp")
    testImplementation("org.springframework.boot:spring-boot-starter-test") {
        exclude(module = "mockito-core")
    }
    testImplementation("org.junit.jupiter:junit-jupiter-api")
    testAnnotationProcessor("org.projectlombok:lombok")
    testCompileOnly("org.projectlombok:lombok")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine")
}

tasks.test {
    useJUnitPlatform() {
        version = "5.10.2"
    }
}

jsonSchema2Pojo {
    targetDirectory = file("$projectDir/build/generated/sources/js2p/java/main")
    targetPackage = "com.ipc.ctrlproxy.model"
    generateBuilders = true
    includeAdditionalProperties = true
    setSource(files("$projectDir/src/main/resources/schema"))
    setCustomAnnotator("io.github.paulushcgcj.js2pojo.LombokAnnotator")
    //setAnnotationStyle("none")
}

