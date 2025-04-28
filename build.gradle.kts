plugins {
    id("java")
}

group = "login"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")

    // https://mvnrepository.com/artifact/com.zaxxer/HikariCP
    implementation("com.zaxxer:HikariCP:6.3.0")

    // https://mvnrepository.com/artifact/org.postgresql/postgresql
    implementation("org.postgresql:postgresql:42.7.5")

    // https://mvnrepository.com/artifact/com.sun.mail/jakarta.mail
    implementation("com.sun.mail:jakarta.mail:2.0.1")

    // https://mvnrepository.com/artifact/jakarta.servlet/jakarta.servlet-api
    compileOnly("jakarta.servlet:jakarta.servlet-api:6.0.0")

    // https://mvnrepository.com/artifact/org.json/json
    implementation("org.json:json:20241224")


    // Main API
    implementation("io.jsonwebtoken:jjwt-api:0.12.6")

// The actual logic for parsing, signing, etc.
    runtimeOnly("io.jsonwebtoken:jjwt-impl:0.12.6")

// JSON support — tells jjwt to use Jackson
    runtimeOnly("io.jsonwebtoken:jjwt-jackson:0.12.6")

}

tasks.test {
    useJUnitPlatform()
}