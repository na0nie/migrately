    public class AttorneyAddRequest
    {
        [AllowNull]
        public string PracticeName { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        public int LocationTypeId { get; set; }

        [Required]
        [MinLength(1), MaxLength(255)]
        public string LineOne { get; set; }

        [Required]
        [MinLength(1), MaxLength(255)]
        public string LineTwo { get; set; }

        [Required]
        [MinLength(1), MaxLength(255)]
        public string City { get; set; }

        [Required]
        [MinLength(1), MaxLength(50)]
        public string Zip { get; set; }

        [Required]
        [Range(1, int.MaxValue)]
        public int StateId { get; set; }

        public double Latitude { get; set; }

        public double Longitude { get; set; }

        [AllowNull]
        public string Bio { get; set; }

        [AllowNull]
        public string Phone { get; set; }

        [EmailAddress]
        [AllowNull]
        public string Email { get; set; }

        [Url]
        [AllowNull]
        public string Website { get; set; }

        public List<string> Languages { get; set; }
    }
