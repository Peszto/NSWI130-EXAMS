workspace {

    model {

        enterprise {

            studentPerson = person "Student"

            schoolSystem = softwareSystem "University System" {
                uiContainer = container "Student App" "Presentation of available subjects" "React" "Browser,Microsoft Azure - Static Apps,Azure"
                dbContainerSubjEnr = container "Subjects + Enrollment" "Subjects" "SQL Server" "Database,Microsoft Azure - Azure SQL,Azure"
                dbContainerRepStud = container "Reports + Student" "Student" "SQL Server" "Database,Microsoft Azure - Azure SQL,Azure"
                apiContainer = container "API" "Api container"
                
                enrollmentContainer = container "Enrollment" " Handles the business logic of enrollemnts"{
                    enrollmentHandler = component "Enrollment Handler" "Business logic for saving or deleting new enrolls" "Request handler"
                    dbContextEnrollment = component "DB Context" "ORM - Maps linq queries to the data store" "Entity Framework Core"
                }
                
                subjectContainer = container "Subject" "Handles the business logic of enrollments"{
                    subjectProvider = component "Subject Provider" "Business logic for showing subjects and filter them  by a characteristic if want" "Request handler"
                    dbContextSubject = component "DB Context" "ORM - Maps linq queries to the data store" "Entity Framework Core"
                }
                reportContainer = container "Report" "Handles the business logic of generating reports for the student"{
                    reportProvider = component "Report Handler" "Business for report creation and validation prior to persistant" "Fluent Validation"
                    dbContextReport = component "DB Context" "ORM - Maps linq queries to the data store" "Entity Framework Core"
                }
            }
            }
        

        emailSystem = softwareSystem "Email System" "Sendgrid" "External"

        # relationships between people and software systems
        studentPerson -> uiContainer "Select subject" "https"
        
        reportContainer -> emailSystem "Trigger emails" "https"
        emailSystem -> studentPerson "Delivers emails" "https"

        # relationships to/from containers
        uiContainer -> apiContainer "uses" "https"
        apiContainer -> enrollmentContainer "persists data" "https"
        apiContainer -> reportContainer "persists data" "https"
        apiContainer -> subjectContainer "persists data" "https"

        # relationships to/from components
        dbContextReport -> dbContainerRepStud "stores (or deletes) and retrieves data"
        dbContextSubject -> dbContainerSubjEnr "stores and retrieves data"
        dbContextEnrollment -> dbContainerSubjEnr "stores and retrieves data"
        apiContainer ->  reportProvider "sends query to"
        apiContainer ->  subjectProvider "sends query to"
        apiContainer ->  enrollmentHandler "sends query to"
        reportProvider -> dbContextReport "Update data in"
        subjectProvider -> dbContextSubject "Gets data from"
        enrollmentHandler -> dbContextEnrollment "Update data in"
    }

    views {

        systemContext schoolSystem "Context" {
            include * emailSystem
            autoLayout
        }

        container schoolSystem "Container" {
            include *
            autoLayout
        }

        component enrollmentContainer "EnrollmentComponent" {
            include * 
            autoLayout
        }
        
        component subjectContainer "SubjectComponent" {
            include * 
            autoLayout
        }
        
        component reportContainer "ReportComponent" {
            include *
            autoLayout
        }

        themes default "https://static.structurizr.com/themes/microsoft-azure-2021.01.26/theme.json"

        styles {
            # default overrides
            element "Azure" {
                color #ffffff
                #stroke #438dd5
            }
            element "External" {
                background #999999
                color #ffffff
            }
            element "Database" {
                shape Cylinder
            }
            element "Browser" {
                shape WebBrowser
            }
        }
    }
}