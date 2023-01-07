    [Route("api/attorneys")]
    [ApiController]
    public class AttorneyApiController : BaseApiController
    {
        private IAttorneyService _attorneyService = null;
        private IAuthenticationService<int> _authService = null;

        public AttorneyApiController(IAttorneyService attorneyService
            , ILogger<AttorneyApiController> logger
            , IAuthenticationService<int> authService) : base(logger)
        {
            _attorneyService = attorneyService;
            _authService = authService;
        }

        [HttpGet("paginate")]
        public ActionResult<ItemResponse<Paged<Attorney>>> SelectAllPaginate(int pageIndex, int pageSize)
        {
            ActionResult result = null;
            try
            {
                Paged<Attorney> paged = _attorneyService.SelectAll(pageIndex, pageSize);
                if (paged == null)
                {
                    result = NotFound404(new ErrorResponse("Records Not Found"));
                }
                else
                {
                    ItemResponse<Paged<Attorney>> response = new ItemResponse<Paged<Attorney>>();
                    response.Item = paged;
                    result = Ok(response);
                }
            }
            catch (Exception ex)
            {
                Logger.LogError(ex.ToString());
                result = StatusCode(500, new ErrorResponse(ex.Message.ToString()));
            }
            return result;
        }

        [HttpGet("search")]
        public ActionResult<ItemResponse<Paged<Attorney>>> Select_ByLanguage(int pageIndex, int pageSize, string language)
        {
            ActionResult result = null;
            try
            {
                Paged<Attorney> paged = _attorneyService.SelectByLanguage(pageIndex, pageSize, language);
                if (paged == null)
                {
                    result = NotFound404(new ErrorResponse("Records Not Found"));
                }
                else
                {
                    ItemResponse<Paged<Attorney>> response = new ItemResponse<Paged<Attorney>>();
                    response.Item = paged;
                    result = Ok(response);
                }
            }
            catch (Exception ex)
            {
                Logger.LogError(ex.ToString());
                result = StatusCode(500, new ErrorResponse(ex.Message.ToString()));
            }
            return result;
        }

        [HttpPut("delete/{id:int}")]
        public ActionResult<SuccessResponse> AttorneyInactive(int id)
        {
            int code = 200;
            BaseResponse response = null;

            try
            {
                _attorneyService.Delete(id);
                response = new SuccessResponse();
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
            }


            return StatusCode(code, response);
        }

        [HttpPost]
        public ActionResult<ItemResponse<int>> Add(AttorneyAddRequest model)
        {
            int userId = _authService.GetCurrentUserId();
            ObjectResult result = null;

            try
            {
                int id = _attorneyService.Add(model, userId);
                ItemResponse<int> response = new ItemResponse<int> { Item = id };
                result = Created201(response);
            }
            catch (Exception ex)
            {
                base.Logger.LogError(ex.ToString());
                ErrorResponse response = new ErrorResponse(ex.Message);

                result = StatusCode(500, response);
            }
            return result;
        }

        [HttpPut("{id:int}")]
        public ActionResult<ItemResponse<int>> AttorneyUpdate(AttorneyUpdateRequest model)
        {
            int userId = _authService.GetCurrentUserId();
            int code = 200;
            BaseResponse response = null;

            try
            {
                _attorneyService.Update(model, userId);
                response = new SuccessResponse();
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
            }

            return StatusCode(code, response);
        }
    }
    
