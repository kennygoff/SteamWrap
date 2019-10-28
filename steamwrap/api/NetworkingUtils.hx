package steamwrap.api;

import steamwrap.helpers.SteamBase;
import steamwrap.helpers.Loader;

/**
 * Wrapper for Steam NetworkingUtils API
 * @author Kenny Goff
 */
@:allow(steamwrap.api.Steam)
class NetworkingUtils extends SteamBase {

    /**
     * Initializes the relay network or checks that the initialization
     * of the relay network is complete.
     */
    public function initRelayNetworkAccess():Void {
        SteamWrap_InitRelayNetworkAccess();
    }
    private var SteamWrap_InitRelayNetworkAccess = Loader.loadRaw("SteamWrap_InitRelayNetworkAccess", 0);

    /**
     * Initializes the relay network or checks that the initialization
     * of the relay network is complete.
     */
    public function getRelayNetworkStatus():ESteamNetworkingAvailability {
        return SteamWrap_GetRelayNetworkStatus();
    }
    private var SteamWrap_GetRelayNetworkStatus = Loader.loadRaw("SteamWrap_GetRelayNetworkStatus", 0);

    private function new(appId:Int, customTrace:String->Void) {
		if (active) return;
		init(appId, customTrace);
	}
}

@:enum abstract ESteamNetworkingAvailability(Int) {
	public var CANNOT_TRY = -102;
	public var FAILED = -101;
	public var PREVIOUSLY = -100;
	public var RETRYING = -10;
	public var NEVER_TRIED = 1;
	public var WAITING = 2;
	public var ATTEMPTING = 3;
	public var CURRENT = 100;
	public var UNKNOWN = 0;
	public var _FORCE_32_BIT = 100;
}
