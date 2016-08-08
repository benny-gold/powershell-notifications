package powershell_notifications.vcsRoots

import jetbrains.buildServer.configs.kotlin.v10.*
import jetbrains.buildServer.configs.kotlin.v10.vcs.GitVcsRoot

object powershell_notifications_powershell_notifications : GitVcsRoot({
    uuid = "77f92c96-266f-4327-81cb-f9543426c4dc"
    extId = "powershell_notifications_powershell_notifications"
    name = "powershell_notifications"
    url = "git@github.com:benny-gold/powershell-notifications.git"
    branchSpec = "+:refs/heads/* +:refs/pull/(*/merge)"
    authMethod = customPrivateKey {
        customKeyPath = """C:\Users\ben\OneDrive\Keys\Anyteamcity.ppk"""
    }
})
