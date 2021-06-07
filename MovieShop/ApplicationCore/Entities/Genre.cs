using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ApplicationCore.Entities
{
    //sets the table name as given string.
    [Table("Genre")]
    public class Genre
    {
        //when there is id as a parameter it is created as primary key.
        public int Id { get; set; }

        //sets the max length of data.
        [MaxLength(64)]
        public string Name { get; set; }

    }
}
