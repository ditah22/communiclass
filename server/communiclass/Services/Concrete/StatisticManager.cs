using communiclass.Models;
using communiclass.Services.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace communiclass.Services.Concrete
{
    public class StatisticManager : IStatisticManager
    {
        public async Task UpdateUserGrade(int userId, int pin, int grade)
        {
            return;
        }

        public async Task<double> GetCurrentAvgGrade(int pin)
        {
            return Convert.ToDouble(1);
        }

        public async Task<Stats[]> GetStats(int pin)
        {
            var x = new Stats
            {
                Date = DateTime.Now,
                Avg = Convert.ToDouble(1)
            };
            return new Stats[] { x };          
        }
    }
}
