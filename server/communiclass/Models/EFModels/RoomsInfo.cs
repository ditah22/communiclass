using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace communiclass.Models.EFModels
{
    public class RoomsInfo
    {
        public int RoomPin { get; set; }
        
        public string AdminId { get; set; }
        
        public string RoomName { get; set; }
        
        public bool IsEnabled { get; set; }
    }
}
