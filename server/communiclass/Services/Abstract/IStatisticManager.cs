using communiclass.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace communiclass.Services.Abstract
{
    public interface IStatisticManager
    {
        public Task UpdateUserGrade(int userId, int pin, int grade);

        public Task<double> GetCurrentAvgGrade(int pin);

        public Task<Stats[]> GetStats(int pin);
    }
}
