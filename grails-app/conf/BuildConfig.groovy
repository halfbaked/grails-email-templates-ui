grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"

grails.project.dependency.resolution = {
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" 
    repositories {
        grailsCentral()
        mavenRepo "http://artifactory.saasplex.com/repo"
    }
    dependencies {
    }

    plugins {
        build(":tomcat:$grailsVersion",
              ":release:2.0.3",
              ":rest-client-builder:1.0.2") {
            export = false
        }
        test(":spock:0.7", ":code-coverage:1.2.5", ":build-test-data:2.0.3"){
          export = false
        }
        compile(":email-templates:0.1.3")
        runtime ":hibernate:$grailsVersion"

// For the UI. Have not yet made it platform-ui compatible.
//    compile ":platform-ui:1.0.RC3"
//    compile ":bootstrap-ui:1.0.RC4"
//    compile(":bootstrap-theme:1.0.RC3") 
//      excludes "bootstrap-ui"
//    }

    }
}

//grails.plugin.location.emailtemplates="../grails-email-templates"
