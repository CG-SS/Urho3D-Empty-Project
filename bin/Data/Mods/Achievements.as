#include "Helpers/Helper.as"

/**
 * Entry function for the mod
 */
void Start()
{
    log.Info("Achievements.as START");
    // Function from Helpers/Helper.as file
    Test();

    log.Info("Achievements.as loaded");
    SubscribeToEvent("LevelChangingFinished", "HandleLevelLoaded");

    VariantMap data;
    data["Message"] = "Initialized achievements.as";
    SendEvent("NewAchievement", data);
}

void Stop()
{
    log.Info("Achievements.as STOP");
}

/**
 * When specific level is loaded, show achievement
 */
void HandleLevelLoaded(StringHash eventType, VariantMap& eventData)
{
    String previousLevelName = eventData["From"].GetString();
    String levelName = eventData["To"].GetString();
    if (levelName == "Level") {
        VariantMap data;
        data["Message"] = "Achievement called from Mods/Achievements.as!";
        SendEvent("NewAchievement", data);
    }
}