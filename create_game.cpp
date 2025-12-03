
#include "Comm/ITableGame.h"

#include "gameroot.h"
#include "gameserver.h"

using game::GameRoot;
using game::gameserver::GameServer;

extern "C"
{
    IGame *CreateGame(int iInitMode, const GameInitParam &sInitParam)
    {
        GameRoot *root = new GameRoot(iInitMode, sInitParam);
        return root->gs;
    }
};
