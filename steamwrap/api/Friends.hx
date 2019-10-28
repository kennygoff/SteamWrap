package steamwrap.api;

import steamwrap.helpers.SteamBase;
import steamwrap.helpers.Loader;

/**
 * Wrapper for Steam Friends API
 * @author Kenny Goff
 */
@:allow(steamwrap.api.Steam)
class Friends extends SteamBase {

    /**
     * Get the number of friends
     */
    public function getFriendCount():Int {
        return SteamWrap_GetFriendCount();
    }
    private var SteamWrap_GetFriendCount = Loader.loadRaw("SteamWrap_GetFriendCount", 0);

    /**
     * Get friend by index
     */
    public function getFriendByIndex(friendIndex:Int):SteamID {
        return SteamWrap_GetFriendById(friendIndex);
    }
    private var SteamWrap_GetFriendById = Loader.loadRaw("SteamWrap_GetFriendById", 1);

    /**
     * Get friend persona name
     */
    public function getFriendPersonaName(friendSteamId:SteamID):String {
        return SteamWrap_GetFriendPersonaName(friendSteamId);
    }
    private var SteamWrap_GetFriendPersonaName = Loader.loadRaw("SteamWrap_GetFriendPersonaName", 1);

    private function new(appId:Int, customTrace:String->Void) {
		if (active) return;
		init(appId, customTrace);
	}
}