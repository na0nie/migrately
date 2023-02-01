    public interface IAttorneyService
    {
        List<Attorney> SelectAll();
        Attorney SelectByUserId(int currentUserId);
        Paged<Attorney> SelectByPage(int pageIndex, int pageSize);
        Paged<Attorney> SelectByLanguage(int pageIndex, int pageSize, string language);
        List<Attorney> SelectByBioQuery(string query);
        void Delete(int id);
        int Add(AttorneyAddRequest model, int userId);
        void Update(AttorneyUpdateRequest model, int userId);
        Attorney MapSingleAttorney(IDataReader reader, ref int startingIndex);
    }
}
