using communiclass.Services.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace communiclass.Services.Concrete
{
    public class RoomManager : IRoomManager
    {
        public async Task<int> CreateRoom(string adminId, string roomName = null)
        {
            if (adminId == "yael")
            {
                throw new Exception("fds");
            }
            return 1;
        }

        public async Task<int> EnterRoom(int pin)
        {
            return 1;
        }

        public async Task<string> GetRoomName(int pin)
        {
            return "yael";
        }
    }
}
