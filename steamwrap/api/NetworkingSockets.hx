package steamwrap.api;

import haxe.Int32;
import steamwrap.helpers.SteamBase;
import steamwrap.helpers.Loader;
import steamwrap.api.NetworkingUtils.ESteamNetworkingAvailability;

/**
 * Wrapper for Steam NetworkingSockets API
 * @author Kenny Goff
 */
@:allow(steamwrap.api.Steam)
class NetworkingSockets extends SteamBase {

    /**
     * Initializes the relay network or checks that the initialization
     * of the relay network is complete.
     */
    public function initAuthentication():Void {
        SteamWrap_InitAuthentication();
    }
    private var SteamWrap_InitAuthentication = Loader.loadRaw("SteamWrap_InitAuthentication", 0);

    /**
     * Initializes the relay network or checks that the initialization
     * of the relay network is complete.
     */
    public function getAuthenticationStatus():ESteamNetworkingAvailability {
        return SteamWrap_GetAuthenticationStatus();
    }
    private var SteamWrap_GetAuthenticationStatus = Loader.loadRaw("SteamWrap_GetAuthenticationStatus", 0);

    /**
     * Creates a "server" socket that listens for clients to connect to.
     * The connection will be relayed through the Valve network.
     */
    public function createListenSocketP2P():HSteamListenSocket {
        return SteamWrap_CreateListenSocketP2P();
    }
    private var SteamWrap_CreateListenSocketP2P = Loader.loadRaw("SteamWrap_CreateListenSocketP2P", 0);

    /**
     * Destroy a listen socket. All the connections that were accepted
     * on the listen socket are closed ungracefully.
     */
    public function closeListenSocket(socket:HSteamListenSocket):Bool {
        return SteamWrap_CloseListenSocket(socket);
    }
    private var SteamWrap_CloseListenSocket = Loader.loadRaw("SteamWrap_CloseListenSocket", 1);

    private function new(appId:Int, customTrace:String->Void) {
		if (active) return;
		init(appId, customTrace);
	}
}

typedef HSteamListenSocket = Int32;
typedef HSteamNetConnection = Int32;
