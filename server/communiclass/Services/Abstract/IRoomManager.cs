using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace communiclass.Services.Abstract
{
    public interface IRoomManager
    {
        public Task<int> CreateRoom(string adminId, string roomName = null);
        
        public Task<int> EnterRoom(int pin);
        
        public Task<string> GetRoomName(int pin);
    }
}
