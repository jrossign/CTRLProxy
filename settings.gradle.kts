rootProject.name = "CTRLProxy"

pluginManagement {
    plugins {
        id("org.springframework.boot") version "3.2.5"
        id("io.spring.dependency-management") version "1.1.4"
        id("org.jsonschema2pojo") version "1.2.1"
    }
}

buildscript {
    repositories {
        mavenCentral()
    }
    dependencies {
        classpath("org.jsonschema2pojo:jsonschema2pojo-gradle-plugin:1.2.1")
        classpath("io.github.paulushcgcj:helper-js2pojo:1.0.1") // for adding lombok @nnotations to generated json schema files

    }
}
