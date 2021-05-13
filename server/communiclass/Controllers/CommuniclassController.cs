using communiclass.Models;
using communiclass.Services.Abstract;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

namespace communiclass.Controllers
{
    [ApiController]
    [Route("communiclass")]
    public class CommuniclassController : ControllerBase
    {
      
        private readonly ILogger<CommuniclassController> _logger;
        private readonly IRoomManager _roomManager;
        private readonly IStatisticManager _statisticManager;

        public CommuniclassController(
            ILogger<CommuniclassController> logger,
            IRoomManager roomManager,
            IStatisticManager statisticManager)
        {
            _logger = logger;
            _roomManager = roomManager;
            _statisticManager = statisticManager;
        }

        [HttpPost]
        [Route("createRoom")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> CreateRoom(string adminId, string roomName = null)
        {
            try
            {
                if (string.IsNullOrEmpty(adminId))
                {
                    return BadRequest("AdminId must be provided.");
                }
                return Ok(await _roomManager.CreateRoom(adminId, roomName));
            }
            catch (Exception)
            {
                return new StatusCodeResult(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPost]
        [Route("enterRoom")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> EnterRoom(int pin)
        {
            try
            {
                return Ok(await _roomManager.EnterRoom(pin));
            }
            catch (Exception)
            {
                return new StatusCodeResult(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("getRoomName")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetRoomName(int pin)
        {
            try
            {
                return Ok(await _roomManager.GetRoomName(pin));
            }
            catch (Exception)
            {
                return new StatusCodeResult(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpPost]
        [Route("updateUserGrade")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> UpdateUserGrade(int userId, int pin, int grade)
        {
            try
            {
                if (grade < 1 || grade > 10)
                {
                    return BadRequest("the grade must be between 1 to 10.");
                }
                await _statisticManager.UpdateUserGrade(userId, pin, grade);
                return Ok();
            }
            catch (Exception)
            {
                return new StatusCodeResult(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("getCurrentAvgGrade")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetCurrentAvgGrade(int pin)
        {
            try
            {
                return Ok(await _statisticManager.GetCurrentAvgGrade(pin));
            }
            catch (Exception)
            {
                return new StatusCodeResult(StatusCodes.Status500InternalServerError);
            }
        }

        [HttpGet]
        [Route("getStats")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<ActionResult<Stats[]>> GetStats(int pin)
        {
            try
            {
                var x = await _statisticManager.GetStats(pin);
                var y = JsonConvert.SerializeObject(x);
                return new OkObjectResult(x);
            }
            catch (Exception)
            {
                return new StatusCodeResult(StatusCodes.Status500InternalServerError);
            }
        }
    }
}
