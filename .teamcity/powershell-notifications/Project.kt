package powershell_notifications

import powershell_notifications.buildTypes.*
import powershell_notifications.vcsRoots.*
import powershell_notifications.vcsRoots.powershell_notifications_powershell_notifications
import jetbrains.buildServer.configs.kotlin.v10.*
import jetbrains.buildServer.configs.kotlin.v10.Project
import jetbrains.buildServer.configs.kotlin.v10.ProjectFeature
import jetbrains.buildServer.configs.kotlin.v10.ProjectFeature.*
import jetbrains.buildServer.configs.kotlin.v10.projectFeatures.VersionedSettings
import jetbrains.buildServer.configs.kotlin.v10.projectFeatures.VersionedSettings.*
import jetbrains.buildServer.configs.kotlin.v10.projectFeatures.versionedSettings

object Project : Project({
    uuid = "45848e0d-45a6-4bd3-b4a0-b95c95876466"
    extId = "powershell_notifications"
    parentId = "_Root"
    name = "powershell_notifications"

    vcsRoot(powershell_notifications_powershell_notifications)

    buildType(powershell_notifications_RunTests)

    features {
        feature {
            id = "PROJECT_EXT_1"
            type = "OAuthProvider"
            param("clientId", "053e397faa5637e35a56")
            param("displayName", "GitHub.com")
            param("gitHubUrl", "https://github.com/")
            param("providerType", "GitHub")
            param("secure:clientSecret", "%github.client.secret%")
        }
        feature {
            id = "PROJECT_EXT_2"
            type = "IssueTracker"
            param("authType", "anonymous")
            param("name", "GH NZB Issues")
            param("pattern", """#(\d+)""")
            param("repository", "https://github.com/benny-gold/NZB-powershell")
            param("secure:accessToken", "%github.access.key.public%")
            param("secure:password", "%github.access.key.public%")
            param("type", "GithubIssues")
            param("username", "")
        }
        versionedSettings {
            id = "PROJECT_EXT_5"
            mode = VersionedSettings.Mode.ENABLED
            buildSettingsMode = VersionedSettings.BuildSettingsMode.PREFER_SETTINGS_FROM_VCS 
            rootExtId = powershell_notifications_powershell_notifications.extId
            showChanges = true
            settingsFormat = VersionedSettings.Format.KOTLIN
        }
    }
    buildTypesOrder = arrayListOf(powershell_notifications.buildTypes.powershell_notifications_RunTests, powershell_notifications.buildTypes.powershell_notifications_PerformSearches)
})
